/* 
 * File:   timer0.h
 * Author: a_hui
 *
 * Created on March 14, 2023, 10:44 AM
 */

#ifndef TIMER0_H
#define	TIMER0_H

#ifdef	__cplusplus
extern "C" {
#endif

#include <xc.h>
#define LEDbit RF3

// global variable for isr
volatile unsigned char tick_count = 0;

// prototypes
extern void timerInit(void);

extern void tickINT(void);

extern void defaultINT(void);

extern void __interrupt(irq(TMR0),high_priority)tickINT(void);

extern void __interrupt(irq(default),high_priority)defaultINT(void);


#ifdef	__cplusplus
}
#endif

#endif	/* TIMER0_H */

