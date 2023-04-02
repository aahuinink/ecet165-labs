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
    
/*
 * 
 */
void RTCinit(time start_time) {
    
    // array of pointers for printf statement
    char* current_time[4] = {&start_time.hours, &start_time.minutes, &start_time.seconds, &start_time.meridian};
    
    // initialize timer0
    timerInit();
    
    // main loop
    while(1){
        // check 10ms timer0 interrupt variable
        if(tick_count > 99){ // if a second has past
            tick_count -= 100; // remove 100 10ms cycles from the count
            start_time.seconds++; // increment seconds
            if(start_time.seconds > 59){ // if a minute has past
                start_time.seconds = 0; // rollover seconds
                start_time.minutes++;  // increment minutes
                if(start_time.minutes>59){ // if an hour has past
                    start_time.minutes = 0; // rollover minutes
                    start_time.hours++; // increment hours
                    if(start_time.hours>11){ // if it's past 11am or 11pm
                        if(start_time.hours >12){ // if it's past midnight or noon
                            start_time.hours = 1; // rollover hours
                        }else{                 // if its midnight or noon 
                        start_time.meridian = (   // toggle am/pm
                                (start_time.meridian == 'a')? 'p' : // if am then pm
                                    'a'                          // otherwise am
                                );
                    }
                }
            }
        };
        // print time to lcd
        LCD_HOME;            
        LCDprintf("%i2:%i2:%i2 %cm", current_time);
        
        
        
        
        
    }
};
};

