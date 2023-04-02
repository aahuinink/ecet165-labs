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
    
#include "C:\Users\a_hui\OneDrive - Camosun College\term2\ecet165_embedded_mc\labs\lab8\timer0.h"
#include "C:\Users\a_hui\OneDrive - Camosun College\term2\ecet165_embedded_mc\labs\lab6\lcd18f.h"
#include "C:\Users\a_hui\OneDrive - Camosun College\term2\ecet165_embedded_mc\labs\lab8\timer0config.h"

    unsigned char nSetRTC = 1;
    
    // typedef struct for time variables
typedef struct realtime{
    char hours;
    char minutes;
    char seconds;
    char meridian;
}time;

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

// ----- RTCinit ----- //
/*
* initializes a real time clock 
* ARGS: [
 *          start_time<*time> : pointer to time variable containing the time to begin at;
 *      ]
* RETURNS: [void]
*/
void RTCrun(time *start_time);

#ifdef	__cplusplus
}
#endif

#endif	/* REALTIMECLOCK_H */

