/*
	Title:	rotateLED.c

Author: Aaron Huinink

Date:	07 Feb 2023

Description:	Causes one LED to be lit and then rotated through all bits of Port C. On reaching the end, it then will rotate back in the opposite direction. Program will repeat forever.

	Compiled with MPLAB XC8 compiler ver 2.40
 	and MPLAB X ver 6.05
	
*/


#include <xc.h>
#pragma config  WDTCPS = WDTCPS_7     //WDT Period selection bits (Divider ratio 1:4096 [128ms])
#pragma config  WDTE = ON             //WDT operating mode (WDT enabled regardless of sleep; SWDTEN is ignored)
/*
 * 
 */
void main() {
    // io setup
    LATC = 0x0;         // clear latch c
    ANSELC = 0x0;       // set port as digital
    TRISC = 0x0;        // set port to output
    
    // set initial voltages
    LATC = 0x1;         // set latch c bit 0 to 1
    asm("sleep");       // allow the first led lighting to be visible
    
    // main loop
    while(1){
        //rotate left
        while(!(PORTCbits.RC7)){    // while the left-most bit isn't lit
            asm("RLNCF LATC,F");    // rotate latch c one bit to the left
            asm("sleep");           // sleep until wdt times out (128ms)
        }
        //rotate right
        while(!(PORTCbits.RC0)){    // while the right most bit isn't lit
            asm("RRNCF LATC,F");    // rotate latch c one bit to the right
            asm("sleep");            // sleep until wdt times out (128ms)
        }
        
    }	    
}

