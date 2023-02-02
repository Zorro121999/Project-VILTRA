
/*
 * main.c
 *
 * RECEIVER C-Code for Project VILTRA
 *
 *  Created on: 14.01.2023
 *      Author: jan-h
 */

#include <stdint.h>
#include <string.h>
#include "receiver_hw_platform.h"
#include "hal/CortexM3/GNU/cpu_types.h"
#include "hal/hw_reg_access.h"
#include "drivers/mss_gpio/mss_gpio.h" //GPIO functions
#include "drivers/mss_timer/mss_timer.h" //Timer function
#include "CMSIS/system_m2sxxx.h" //Startup configuration + SystemCoreClock etc.
/*==============================================================================
 Private functions.
 */
volatile uint8_t timer_stopped = 0;


static void delayMicroSec(uint32_t us);

static uint8_t manchesterDecode(uint16_t data_enc);
static uint8_t getSignal(uint8_t input_gpio_pin);


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
    // configure baudrate (pulses per second) because we use manchester encoding the bitrate~=baudrate/2
    uint32_t baudrate = 2000;     //max ca. 2000baud/s --> ca. 800kbit/s

    uint8_t input_pin = 0;


     /* Initialize SmartFusion MSS GPIOs.
     * Read mss_gpio.h for a thorough explanation.*/
     MSS_GPIO_init();
     /* Configure MSS GPIOs.*/
     MSS_GPIO_config( MSS_GPIO_0 , MSS_GPIO_INPUT_MODE );


     // Init variable that carries data to transmit
     uint8_t data = 0;


     // Calculate pulselength in microseconds based on baudrate
     uint32_t pulse_length_us = 1000000/baudrate;

     /* Infinite loop. */
     for(;;)
     {
         ////////////////////////////////
         // Find Synchronization pulses
         ////////////////////////////////
         uint32_t gpio_state;
         uint8_t sync_found = 0;
         uint8_t input;
         while (sync_found == 0)
         {
             // poll input signal as fast as possible to detect high signal
             input = getSignal(input_pin);  //get the input state of the gpio input pin
             if (input == 1)
             {
                 //check if input is high for 2.5 pulse-lengths or more
                 // by sampling with 10 times oversampling
                 uint8_t sync_valid = 1;
                 for (uint8_t i=0; i<25; i++)
                 {
                     delayMicroSec(pulse_length_us/10);
                     input = getSignal(input_pin);  //get the input state of the gpio input pin
                     if (input == 0)
                     {
                         sync_valid = 0;
                         break;
                     }
                 }
                 // if input was high for 2.5 pulse-lengths or more
                 if (sync_valid == 1)
                 {
                     //wait for falling edge
                     while(1)
                     {
                         input = getSignal(input_pin);  //get the input state of the gpio input pin
                         if (input == 0) break;
                     }
                     sync_found = 1;
                 }
             }
         }

         // When 3 high sync pulses were found wait 1 pulse until data starts
         delayMicroSec(pulse_length_us);

         ////////////////////////////////
         // Start reading in data
         ////////////////////////////////
         /*MSS_TIM2_init(MSS_TIMER_PERIODIC_MODE);
         uint32_t load = us * (SystemCoreClock / 1000000);
         MSS_TIM2_load_immediate(load);
         MSS_TIM2_enable_irq();
         MSS_TIM2_start();*/

         uint16_t data_enc = 0;
         delayMicroSec(pulse_length_us/2);
         for (uint8_t i=0; i<16; i++)
         {
             uint8_t input = getSignal(input_pin);
             if (input == 0)
             {
                 data_enc &= ~(1UL << i);                           //Clear bit at position pulse2_pos
             }
             else if(input == 1)
             {
                 data_enc |= 1UL << i;                              // Set bit at position pulse1_pos
             }

             //wait until we are in the middle of the next pulse
             delayMicroSec(pulse_length_us);
         }


         // Decode manchester encoded data
         data = manchesterDecode(data_enc);


         //Send 8bit data to FPGA that displays them on the LEDs
         HW_set_32bit_reg(TRANS_SLAVE_NOHAM_0, data);
         HW_set_32bit_reg(TRANS_SLAVE_NOHAM_0 + 4, data); // It has to be sent twice because the Bus only reads the data when the adress is changed


     }
     return 0;
}





/*==============================================================================
 Helper Functions
 */

static uint8_t getSignal(uint8_t input_gpio_pin)
{
    uint32_t gpio_state = MSS_GPIO_get_inputs();
    uint8_t input = (gpio_state & ( 1 << input_gpio_pin )) >> input_gpio_pin;  //get the input state of the gpio input pin

    return input;
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

static uint8_t manchesterDecode(uint16_t data_enc)
{
    uint16_t data = 0;
    uint8_t pulse1_pos = 0;
    uint8_t pulse2_pos = 0;

    for (uint8_t i=0; i<8; i++)
            {
                pulse1_pos = 2*i;
                pulse2_pos = (2*i)+1;

                uint8_t bit_p1 = (data_enc & ( 1 << pulse1_pos )) >> pulse1_pos;  //get the first pulse of the i-th bit of data_enc
                uint8_t bit_p2 = (data_enc & ( 1 << pulse2_pos )) >> pulse2_pos;  //get the first pulse of the i-th bit of data_enc

                if (bit_p1 == 1 && bit_p2 == 0)
                {
                    //Manchester encoded 1
                    data |= 1UL << i;                              // Set bit at position i
                }
                else
                {
                    // Manchester encoded 0 (0,1) or error
                    data &= ~(1UL << i);                           //Clear bit at position i
                }
            }
    return data;
}








