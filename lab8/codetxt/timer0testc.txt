/* 
 * File:   timer0test.c
 * Author: a_hui
 *
 * Created on March 14, 2023, 10:43 AM
 */

#include <xc.h>
#include "C:\Users\a_hui\OneDrive - Camosun College\term2\ecet165_embedded_mc\labs\lab6\lcd18f.h"
#include "timer0config.h"
#include "timer0.h"

/*
 * 
 */
int main(int argc, char** argv) {
    signed int secondCount = 990;
    signed int tmp_secondCount = 0;
    char mod = 0;
    char seconds[4] = "000";
    
        
    // set up port F
    TRISF = 0x00;
    ANSELF = 0x00;
    PORTF = 0x00; // turn off led
    
    TRISC = 0x00;
    ANSELC = 0x00;
    LATC= 0x00;
    
    // initialize LCD
    LCDinit();
    
    // initialize timer0 interrupt
    timerInit();
    LCDprints(seconds);
    
    // main loop
    while(1){
        LATC = tick_count;
        if(tick_count == 50){
            LEDbit = 0; // turn on LED
        }
        
        if(tick_count > 99){
            tick_count -= 100;
            secondCount++;
            LEDbit = 1; // turn off LED  
            
            if(secondCount > 999){ // secondCount rollover
                secondCount = 0;
            }; 
            
            tmp_secondCount = secondCount; // copy second count for processing
                 
            // convert each digit in secondCount to ASCII
            for(signed char i = 2; i > -1; i--){
                mod = tmp_secondCount % 10;
                seconds[i] = mod + '0'; // convert to ascii
                tmp_secondCount /= 10; // get next digit
            }
            
            
            // display second count on LCD
            LCD_HOME; // rewrite lcd
            LCDprints(seconds); // print the seconds to the lcd
        }
        
                    
    }  
    return (EXIT_SUCCESS);
}

