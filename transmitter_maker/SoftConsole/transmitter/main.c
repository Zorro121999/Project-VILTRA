/*
 * main.c
 *
 *  Created on: 27.01.2023
 *      Author: jan-h
 */

#include <stdint.h>
#include <string.h>
#include "transmitter_hw_platform.h"
#include "hal/CortexM3/GNU/cpu_types.h"
#include "hal/hw_reg_access.h"
#include "drivers/mss_gpio/mss_gpio.h" //GPIO functions
#include "drivers/mss_timer/mss_timer.h" //Timer function
#include "CMSIS/system_m2sxxx.h" //Startup configuration + SystemCoreClock etc.
/*==============================================================================
 Private functions.
 */
static void delay(void);
static void delayCount(uint32_t delay_count);
static uint16_t manchesterEncode(uint8_t data);
static void outputPin(uint8_t out);
static void sendPulse(uint32_t baudrate, uint8_t pulse_level);
static void delayMicroSec(uint32_t us);



volatile uint8_t timer_stopped = 0;

void Timer1_IRQHandler( void )
{
    timer_stopped = 1;
    MSS_TIM1_clear_irq();
    MSS_TIM1_stop();
}

/*==============================================================================
 * main() function.
 */
int main()
{
     /* Initialize SmartFusion MSS GPIOs.
     * Read mss_gpio.h for a thorough explanation.*/
     MSS_GPIO_init();
     /* Configure MSS GPIOs.*/
     MSS_GPIO_config( MSS_GPIO_0 , MSS_GPIO_OUTPUT_MODE );

     // configure baudrate (pulses per second) because we use manchester encoding the bitrate~=baudrate/2
     uint32_t baudrate = 2000;

     // Init variable that carries data to transmit
     uint8_t data = 0;
     int_fast8_t shift = 0;
     uint32_t mask = 0;
     uint32_t value = 0;
     uint32_t read_value = 0;

     HW_set_32bit_reg(TRANS_SLAVE_NOHAM_2, 200);
     HW_set_32bit_reg(TRANS_SLAVE_NOHAM_2 + 4, 200);

     for (int i = 0; i < 64; i++)
         {
             HW_set_32bit_reg(TRANS_SLAVE_NOHAM_2 + i * 4, 200);
             read_value = HW_get_32bit_reg(TRANS_SLAVE_NOHAM_2 + i * 4);
             value = value + 1;
         }

     /* Infinite loop. */
     for(;;)
     {
         // Manchester encode the data
         uint16_t data_enc;
         data_enc = manchesterEncode(data);

         // Send data to FPGA that displays it on its LEDs
         HW_set_32bit_reg(TRANS_SLAVE_NOHAM_2, data);
         HW_set_32bit_reg(TRANS_SLAVE_NOHAM_2 + 4, data); // It has to be sent twice because the Bus only reads the data when the adress is changed

        /* send frame */

        // Send sync pulses "1110"
        for (uint8_t i=0; i<3; i++)
        {
            sendPulse(baudrate, 1);
        }
        sendPulse(baudrate, 0);

        // Send manchester encoded data
        for (uint8_t i=0; i<16; i++)
        {
            uint8_t bit = (data_enc & ( 1 << i )) >> i;  //get the i-th bit of data_enc
            sendPulse(baudrate, bit);
        }

        //set Signal to low after one frame has been sent
        outputPin(0);

        uint32_t t = 500 * 1000;
        //delayMicroSec(t); //wait for 10000 pulses until next byte is sent

        // Increment number that is sent out
        data++;

     }
     return 0;
}





/*==============================================================================
 Delay
 */
static void delay(void)
{
     volatile uint32_t delay_count = SystemCoreClock / 17u;
     while(delay_count > 0u)
     {
         --delay_count;
     }
}

static void delayCount(uint32_t delay_count)
{
     while(delay_count > 0u)
     {
         --delay_count;
     }
}

static void delayMicroSec(uint32_t us)
{
    // Delay function that uses the integrated interrupt timer
    MSS_TIM1_init(MSS_TIMER_ONE_SHOT_MODE);
    uint32_t load = us * (SystemCoreClock / 1000000);
    MSS_TIM1_load_immediate(load);
    timer_stopped = 0;
    MSS_TIM1_enable_irq();
    MSS_TIM1_start();
    // Wait for interrupt function to set global variable to 1
    while(timer_stopped == 0)
    {
        //uint32_t time = MSS_TIM1_get_current_value();
    }
}

static uint16_t manchesterEncode(uint8_t data)
{
    uint16_t data_enc = 0; //39593;
    uint8_t pulse1_pos = 0;
    uint8_t pulse2_pos = 0;

    for (uint8_t i=0; i<8; i++)
            {
                uint8_t bit = (data & ( 1 << i )) >> i;  //get the i-th bit of data_enc
                pulse1_pos = 2*i;
                pulse2_pos = (2*i)+1;

                if (bit == 0)
                {
                    //Clear first pulse to low and Set second pulse to high
                    data_enc &= ~(1UL << pulse1_pos);                           //Clear bit at position pulse1_pos
                    data_enc |= 1UL << pulse2_pos;                              // Set bit at position pulse2_pos
                }
                else if (bit == 1)
                {
                    //Set first pulse to high and clear second pulse to low
                    data_enc |= 1UL << pulse1_pos;                              // Set bit at position pulse1_pos
                    data_enc &= ~(1UL << pulse2_pos);                           //Clear bit at position pulse2_pos
                }
                else
                {
                    // If one bit in data has an error send an invalid bit sequence (signal always low)
                    data_enc = 0;
                    return data_enc;
                }
            }
    return data_enc;
}

static void outputPin(uint8_t out)
{
    uint32_t gpio_outputs;

    if (out==1)
    {
        //Set GPIO 0 output (Pin 93) high without affecting other GPIO outputs.
        gpio_outputs = MSS_GPIO_get_outputs();
        gpio_outputs |= MSS_GPIO_0_MASK;
        MSS_GPIO_set_outputs(  gpio_outputs );
    }
    else
    {
        //Set GPIO 0 output (Pin 93) low without affecting other GPIO outputs.
        gpio_outputs = MSS_GPIO_get_outputs();
        gpio_outputs &= ~(MSS_GPIO_0_MASK);
        MSS_GPIO_set_outputs(  gpio_outputs );
    }
}
static void sendPulse(uint32_t baudrate, uint8_t pulse_level)
{
    // Send 1 Pulse (high or low)
    volatile uint32_t delay_us = (1000000 / baudrate);
    outputPin(pulse_level);
    delayMicroSec(delay_us);
    return;
}
