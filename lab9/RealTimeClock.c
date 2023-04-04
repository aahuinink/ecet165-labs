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

void RTCrun(time *start_time) {
    // enable RTC to run
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
    
    // main loop
    while(nSetRTC){
        // check 10ms timer0 interrupt variable
        if(tick_count > 99){ // if a second has past
            tick_count -= 100; // remove 100 10ms cycles from the count
            (start_time)->seconds++; // increment seconds
            if((start_time)->seconds > 59){ // if a minute has past
                (start_time)->seconds = 0; // rollover seconds
                (start_time)->minutes++;  // increment minutes
                if((start_time)->minutes>59){ // if an hour has past
                    (start_time)->minutes = 0; // rollover minutes
                    (start_time)->hours++; // increment hours
                    if((start_time)->hours>11){ // if it's past 11am or 11pm
                        if((start_time)->hours >12){ // if it's past midnight or noon
                            (start_time)->hours = 1; // rollover hours
                        }else{                 // if its midnight or noon 
                        (start_time)->meridian = (   // toggle am/pm
                                ((start_time)->meridian == 'a')? 'p' : // if am then pm
                                    'a'                          // otherwise am
                                );
                    }
                }
            }
        };
        // print time to lcd
        LCD_HOME;            
        LCDprintf("%i2:%i2:%i2 %cm", start_time->hours, start_time->minutes, start_time->seconds, start_time->meridian);  
        }
    };
};


void setINT(void){
    IOCBN4 = 0; // disable RB4 edge interrupt because of switch bounce
    IOCBF4 = 0; // clear rb4 ioc flags
    T0CON0bits.EN = 0; // disable timer0 interrupt
    nSetRTC = 0;  // set nSet variable to 0 to break while loop
    return;    
}
