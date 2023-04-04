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
#include "keypad18f.h"
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
        while(!nSetRTC){    // while the nSet flag is asserted
            key = keyScan();  // get a key press from the keypad
            
            // deal with keypad inputs
            switch (key) {
                case 'A':   // "Advance cursor"
                    LCDgoto(++position); // move cursor right
                    break;
                case 'B':   // "Backspace cursor"
                    if(position != 0){
                        LCDgoto(--position); // move cursor left if not at pos 0
                    }
                    break;
                case 'C':   // clear
                    current_time.hours = 12;
                    current_time.minutes = 0;
                    current_time.seconds = 0;
                    current_time.meridian = 'a'; // reset to midnight
                    nSetRTC = 1;                 // de-assert nSet
                    break;  
                case 'D':   // enter
                    nSetRTC = 1;                // de-assert nSet;
                    break;
                case '#':
                    break;
                case '*':       // toggle am/pm
                    current_time.meridian = (current_time.meridian == 'a')? 'p' : 'a';
                    LCDgoto(0x09);  // go to am/pm
                    LCDprintc(current_time.meridian); // put the new value to the display
                    LCDgoto(position); // go back to original cursor position
                    break;
                default:    // an integer
                    // match cursor position to attribute
                    switch(indexer[position]){
                        case 'H':   // if hours position
                            if ((position % 3)==0){  // if tens digit
                                current_time.hours = (current_time.hours % 10) + 10*(key-'0');
                            }else{
                                current_time.hours -= current_time.hours % 10; // remove ones
                                current_time.hours += key - '0'; // add key
                            };
                            current_time.hours = (current_time.hours - 1) % 12 + 1;
                            LCDprintc(key); // put the new value to the display
                            position++;     // increase the position tracker
                            break;
                        case 'M':   // if minutes position
                            if ((position % 3)==0){  // if tens digit
                                current_time.minutes = (current_time.minutes % 10) + 10*(key-'0');
                            }else{
                                current_time.minutes -= current_time.minutes % 10; // remove ones
                                current_time.minutes += key - '0'; // add key value
                            }; 
                            current_time.minutes = current_time.minutes % 60; // prevent illegal states
                            LCDprintc(key); // put the new value to the display
                            position++;     // increase the position tracker
                            break;
                        case 'S':   // if seconds position
                            if ((position % 3)==0){  // if tens digit
                                current_time.seconds = (current_time.seconds % 10) + 10*(key-'0');
                            }else{
                                current_time.seconds -= current_time.seconds % 10; // remove ones
                                current_time.seconds += key - '0'; // add key
                            };
                            current_time.seconds = current_time.seconds % 60;  // prevent illegal states
                            LCDprintc(key); // put the new value to the display
                            position++;     // increase the position tracker
                            break;
                        default:
                            break;
                    }
                    break;                   
            }
            
        }             
    }
}


