/**************************************************
Student Name:     Aaron Huinink
File Name: RealTimeClock.c
Description: Implements a real time clock on the lcd display
Demo Date:	March 14, 2023

Marking Check List
Good Comments: 
Good Modular Code: 
Unsigned Char used correctly: 
Format HH:MM:SS Xm  correct: 
Increments each Second: 
10ms Tick correct: 
Only valid characters are display: 
Clock is accurate: 
Am/pm roll over is correct: 
Hours per day correct: 
Bugs:
Mark:
**************************************************/
#include "RealTimeClock.h"

// ----- RTCinit ----- //
/*
* initializes the real time clock
* ARGS: [void]
* RETURNS: [void]
*/
void RTCinit(void) {
    // set nSetRTC
    nSetRTC = 1;
    // initialize timer0
    timerInit();
    
    // initialize RB4 as input
    TRISBbits.TRISB4 = 1;  // set RB4 to input
    ANSELBbits.ANSELB4 = 0; // set RB4 to digital input
    WPUBbits.WPUB4 = 1;     // set weak pullup on RB4
    
    // while timerInit enables INTCON0.GIE, IPEN bit must be enabled to prevent
    // interrupt conflicts with timer0
    INTCON0bits.IPEN = 1;
    
    // attach negative-edge IOC to RB4 button
    PIE0bits.IOCIE = 1;     // enable interrupt on change
    IOCBN4 = 1;             // enable negative edge interrupt on RB4
    IOCBF = 0x00;           // clear port b ioc flags.
    
    void __interrupt(irq(IOC),high_priority)setINT(void); // attach IOC
};

// ----- RTCupdate ----- //
/*
* updates and displays the realtime clock 
* ARGS: [
 *          current_time<*time> : pointer to time variable containing the time to begin at;
 *      ]
* RETURNS: [void]
*/
void RTCupdate(time* current_time){
    LCDinstruct(0x0C); // cursor & blink off
    if(tick_count > 99){ // if a second has past
        tick_count -= 100; // remove 100 10ms cycles from the count
        (current_time)->seconds++; // increment seconds
        if((current_time)->seconds > 59){ // if a minute has past
            (current_time)->seconds = 0; // rollover seconds
            (current_time)->minutes++;  // increment minutes
            if((current_time)->minutes>59){ // if an hour has past
                (current_time)->minutes = 0; // rollover minutes
                (current_time)->hours++; // increment hours
                if((current_time)->hours>11){ // if it's past 11am or 11pm
                    if((current_time)->hours >12){ // if it's past midnight or noon
                        (current_time)->hours = 1; // rollover hours
                    }else{                 // if its midnight or noon 
                    (current_time)->meridian = (   // toggle am/pm
                            ((current_time)->meridian == 'a')? 'p' : // if am then pm
                                'a'                          // otherwise am
                            );
                    }
                }
            }
        };
        LCD_HOME;
        LCDprintf("%i2:%i2:%i2 %cm", current_time->hours, current_time->minutes, current_time->seconds, current_time->meridian);
    }
}

// ----- RTCset ----- //
/*
* uses the keypad to set the current_time variable 
* ARGS: [
 *          current_time<*time> : pointer to time variable containing the time to begin at;
 *      ]
* RETURNS: [void]
*/
void RTCset(time* current_time){
    // ---- VARIABLES ---- //
    // indexer array
    char index[12] = "HH:MM:SS Xm";
    // position variable
    unsigned char pos;
    // keypad variable
    char key;
    
    // initialize position and cursor
    pos = 0;
    LCDinstruct(0x0F);
    
    // while setting
    while(!nSetRTC){
        key = keyScan(); // retrieve key value;
        
        // manage keypad inputs
        switch (key) {
            case 'A':
                LCDgoto(++pos); // move cursor right;
                break;
            case 'B':
                (pos != 0)? LCDgoto(--pos) : LCDgoto(0x0);
                break;
            case 'C':
                current_time->hours = 12;
                current_time->minutes = 0;
                current_time->seconds = 0;
                current_time->meridian = 'a';
                nSetRTC = 1; // reset to midnight and de-assert nSetRTC
                break;
            case 'D':
                nSetRTC = 1;
                break;
            case '*':
                current_time->meridian = (current_time->meridian == 'a')? 'p' : 'a';
                LCDgoto(0x09);  // go to am/pm
                LCDprintc(current_time->meridian); // put the new value to the display
                LCDgoto(pos); // go back to original cursor position
                break; 
            default:    // an integer
                // match cursor position to attribute
                switch(index[pos]){
                    case 'H':   // if hours position
                        if ((pos % 3)==0){  // if tens digit
                            current_time->hours = (current_time->hours % 10) + 10*(key-'0');
                        }else{
                            current_time->hours -= current_time->hours % 10; // remove ones
                            current_time->hours += key - '0'; // add key
                        };
                        current_time->hours = (current_time->hours - 1) % 12 + 1;
                        LCDprintc(key); // put the new value to the display
                        pos++;     // increase the pos tracker
                        break;
                    case 'M':   // if minutes pos
                        if ((pos % 3)==0){  // if tens digit
                            current_time->minutes = (current_time->minutes % 10) + 10*(key-'0');
                        }else{
                            current_time->minutes -= current_time->minutes % 10; // remove ones
                            current_time->minutes += key - '0'; // add key value
                        }; 
                        current_time->minutes = current_time->minutes % 60; // prevent illegal states
                        LCDprintc(key); // put the new value to the display
                        pos++;     // increase the pos tracker
                        break;
                    case 'S':   // if seconds pos
                        if ((pos % 3)==0){  // if tens digit
                            current_time->seconds = (current_time->seconds % 10) + 10*(key-'0');
                        }else{
                            current_time->seconds -= current_time->seconds % 10; // remove ones
                            current_time->seconds += key - '0'; // add key
                        };
                        current_time->seconds = current_time->seconds % 60;  // prevent illegal states
                        LCDprintc(key); // put the new value to the display
                        pos++;     // increase the pos tracker
                        break;
                    case ':':
                        LCDgoto(++pos);
                        break;
                    case ' ':
                        LCDgoto(++pos);
                        break;
                    default:
                        break;
                }
                break;                   
            }
        LCD_HOME;
        LCDprintf("%i2:%i2:%i2 %cm", current_time->hours, current_time->minutes, current_time->seconds, current_time->meridian);
        }
    }

// IOC service routine
void setINT(void){
    IOCBN4 = 0; // disable RB4 edge interrupt because of switch bounce
    IOCBF4 = 0; // clear rb4 ioc flags
    T0CON0bits.EN = 0; // disable timer0 interrupt
    nSetRTC = 0;  // set nSet variable to 0 to break while loop
    return;    
}
