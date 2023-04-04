/********************************************************************************
 * Analog Functions Test
 * ECET165 Embedded Micro-controllers
 * analogTest.c
 * CREATED April 2, 2023
 * UPDATED ***
 * v1.0
 * BY Aaron Huinink
 * tests the functionality of the analog functions library
 ********************************************************************************/

 // ============================ INCLUDES/DEFINES =================================//

#include <xc.h>
#include "analog18f.h"
#include "RealTimeClock.h"

// ============================ MAIN =================================//
void main(void){

    // ============================ SETUP =================================//
    // ---- VARIABLES ---- //
    // time variable to store the current time
    time current_time;
    current_time.hours = 12;
    current_time.minutes = 0;
    current_time.seconds = 0;
    current_time.meridian = 'a';
    
    // position variable to store the current position
    unsigned char position = 0;
    
    // indexer array for indexing cursor position
    char indexer[12] = "HH:MM:SS Xm";
    
    // key variable to store key inputs
    char key;
    
    // lux variable to store illumination values
    unsigned char lux;
    
    // pot voltage variable
    float pot_voltage;
    // ---- HARDWARE INIT ---- //
    // make sure portf outputs are on LATxy
    RF0PPS = 0x00;
    RF1PPS = 0x00;
    // initialize LCD 
    LCDinit();
    
    // initialize RTC run flag
    nSetRTC = 1;
    
    // ============================ MAIN LOOP =================================//
    while(1){
        RTCinit();
        
        // when the nSetRTC flag is de-asserted
        while(nSetRTC){
            switch(tick_count){
                case 10:
                    lux = analogMap(LUX_READ, 2600, 0, 0, 100);
                    break;
                case 20:
                    pot_voltage = analogMap(POT_READ, 4095, 0, 5.00, 0.00);
                    break;
                case 30:
                    LCDgoto(0x40);
                    LCDprintf("P:%1f2V ", pot_voltage);
                    break;
                case 40:
                    LCDgoto(0x49);
                    LCDprintf("L:%i3%", lux);
                    break;
                default:
                    RTCupdate(&current_time);
                    break;
            }
        };
        
        // transition state
        LCD_HOME;
        position = 0;
        
        // if the interrupt on RB4 occurs
        RTCset(&current_time);            
    }
}


