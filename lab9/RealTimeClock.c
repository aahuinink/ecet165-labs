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
        LCDprintf("%i2:&i2:%i2 %cm", current_time->hours, current_time->minutes, current_time->seconds, current_time->meridian);
    }
}


void setINT(void){
    IOCBN4 = 0; // disable RB4 edge interrupt because of switch bounce
    IOCBF4 = 0; // clear rb4 ioc flags
    T0CON0bits.EN = 0; // disable timer0 interrupt
    nSetRTC = 0;  // set nSet variable to 0 to break while loop
    return;    
}
