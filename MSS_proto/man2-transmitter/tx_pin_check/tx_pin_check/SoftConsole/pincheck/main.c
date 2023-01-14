/*
 * main.c
 *
 *  Created on: 14.01.2023
 *      Author: jan-h
 */

/*
 * main.c
 * Clock Counting example code.
 * Created on: Aug 30, 2018
 * Author: Christopher Mandla
 */
#include "drivers/mss_gpio/mss_gpio.h" //GPIO functions
#include "CMSIS/system_m2sxxx.h" //Startup configuration + SystemCoreClock etc.
/*==============================================================================
 Private functions.
 */
static void delay(void);
static void delayCount(uint32_t delay_count);
static uint16_t manchesterEncode(uint8_t data);
static void outputPin81(uint8_t out);
static void sendPulse(uint32_t baudrate, uint8_t pulse_level);
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
     MSS_GPIO_config( MSS_GPIO_1 , MSS_GPIO_OUTPUT_MODE );
     MSS_GPIO_config( MSS_GPIO_2 , MSS_GPIO_OUTPUT_MODE );
     MSS_GPIO_config( MSS_GPIO_3 , MSS_GPIO_OUTPUT_MODE );
     MSS_GPIO_config( MSS_GPIO_4 , MSS_GPIO_OUTPUT_MODE );
     MSS_GPIO_config( MSS_GPIO_5 , MSS_GPIO_OUTPUT_MODE );
     MSS_GPIO_config( MSS_GPIO_6 , MSS_GPIO_OUTPUT_MODE );
     MSS_GPIO_config( MSS_GPIO_7 , MSS_GPIO_OUTPUT_MODE );
     MSS_GPIO_config( MSS_GPIO_8 , MSS_GPIO_OUTPUT_MODE );
     MSS_GPIO_config( MSS_GPIO_9 , MSS_GPIO_OUTPUT_MODE );

     // configure baudrate (pulses per second) because we use manchester encoding the bitrate~=baudrate/2
     uint32_t baudrate = 1000;

     /* Infinite loop. */
     for(;;)
     {
         /*uint32_t gpio_pattern;
         // Decrement delay counter.
         delay();
         // Count pattern bits with ones.
         // Invert number to get normal bit count with ~
         gpio_pattern = (~MSS_GPIO_get_outputs());
         gpio_pattern = gpio_pattern + 0x00000001;
         if(gpio_pattern == 0x00000100){
             // If GPIO count is maximum 256-1 ->set to 0
             gpio_pattern = 0x00000000;
         }
         // Invert number again to properly display output (0 -> LED on)
         MSS_GPIO_set_outputs( ~gpio_pattern );


         //Set GPIOs outputs 8 and 9 low without affecting other GPIO outputs.
         uint32_t gpio_outputs;
         gpio_outputs = MSS_GPIO_get_outputs();
         gpio_outputs &= ~( MSS_GPIO_8_MASK | MSS_GPIO_9_MASK );
         MSS_GPIO_set_outputs(  gpio_outputs );

         delay();

         //Set GPIOs outputs 8 and 9 high without affecting other GPIO outputs.
         gpio_outputs = MSS_GPIO_get_outputs();
         gpio_outputs |= ( MSS_GPIO_8_MASK | MSS_GPIO_9_MASK );
         MSS_GPIO_set_outputs(  gpio_outputs );
         */

         // Data to transmit
         uint8_t data;
         data = 0x00;

         // Manchester encoded data
         uint16_t data_enc;
         data_enc = manchesterEncode(data);

        // send bitstream
        for (uint32_t i=0; i<5000; i++)
        {
            sendPulse(baudrate, (i%3));
        }

        //delay();



     }
     return 0;
     MSS_GPIO_set_outputs( 0x00000000 );
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

static uint16_t manchesterEncode(uint8_t data)
{
    return 0x00000000;
}

static void outputPin81(uint8_t out)
{
    uint32_t gpio_outputs;

    if (out==1)
    {
        //Set GPIOs output 8 (Pin 81) high without affecting other GPIO outputs.
        gpio_outputs = MSS_GPIO_get_outputs();
        gpio_outputs |= MSS_GPIO_8_MASK;
        MSS_GPIO_set_outputs(  gpio_outputs );
    }
    else
    {
        //Set GPIOs output 8 (Pin 81) low without affecting other GPIO outputs.
        gpio_outputs = MSS_GPIO_get_outputs();
        gpio_outputs &= ~(MSS_GPIO_8_MASK);
        MSS_GPIO_set_outputs(  gpio_outputs );
    }
}
static void sendPulse(uint32_t baudrate, uint8_t pulse_level)
{
    // Send 1 Pulse (high or low)
    volatile uint32_t delay_count = (SystemCoreClock / baudrate) / 18u;  //1 is the adjustment factor to correct baudrate
    outputPin81(pulse_level);
    delayCount(delay_count);
    return;
}
