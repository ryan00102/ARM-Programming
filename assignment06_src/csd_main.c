/*
 * csd_main.c
 *
 *  Created on: 2018. 4. 30.
 *      Author: Taeweon Suh
 */

unsigned volatile char * gpio_led = (unsigned char *) 0x41200000;

int csd_main()
{
 int count;

 for (count=0; count < 0x3C0000; count++);	// Makes 1 second time interval
 *gpio_led = 0xff;
 for (count=0; count < 0x3C0000; count++);	// Makes 1 second time interval
 *gpio_led = 0x00;


 return 0;
}
