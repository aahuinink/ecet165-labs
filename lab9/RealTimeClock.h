/* 
 * File:   RealTimeClock.h
 * Author: a_hui
 *
 * Created on March 20, 2023, 6:31 PM
 */

#ifndef REALTIMECLOCK_H
#define	REALTIMECLOCK_H

#ifdef	__cplusplus
extern "C" {
#endif
#include <xc.h>
#include <pic18f57q43.h>
    
#include "timer0.h"
#include "lcd18f.h"
#include "timer0config.h"

    unsigned char nSetRTC = 1;
    
    // typedef struct for time variables
typedef struct realtime{
    char hours;
    char minutes;
    char seconds;
    char meridian;
}time;

// ----- RTCinit ----- //
/*
* initializes the real time clock
* ARGS: [void]
* RETURNS: [void]
*/

void RTCinit(void);

// ----- RTCupdate ----- //
/*
* updates and displays the realtime clock 
* ARGS: [
 *          start_time<*time> : pointer to time variable containing the time to begin at;
 *      ]
* RETURNS: [void]
*/
void RTCupdate(time* current_time);

// ----- setINT ----- //
/*
* attaches an interrupt to pin RB4 that allows you to set the RTC clock
* ARGS: [void]
* RETURNS: [void]
*/

// interrupt attach prototype
void __interrupt(irq(IOC),low_priority)setINT(void);

// interrupt service routine protoype
void setINT(void);

#ifdef	__cplusplus
}
#endif

#endif	/* REALTIMECLOCK_H */

