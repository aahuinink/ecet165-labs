#include <xc.h>
#include "timer0.h"

void timerInit(void){
    T0CON0 = 0b10001001;    // tmr0 enable, 8 bit, 1:10 Postscaler
    T0CON1 = 0b10110001;    // 500 kHz, async, 1:2 prescaler
    TMR0H  = 0xF9;    // TMR0H 0 - 249 count for a period of 250
    tick_count = 0;
    
    // enable global interrupts
    INTCON0bits.GIE = 1;
            
    // TMR0 interrupt enable (set TMR0IE bit)
    PIE3bits.TMR0IE = 1;
    
    // clear timer0 interrupt flag (clear TMR0IF bit)
    PIR3bits.TMR0IF = 0;
    
    // TMR0 high priority interrupt
    IPR3bits.TMR0IP = 1; 
    
    
    void __interrupt(irq(TMR0),high_priority)tickINT(void);

    void __interrupt(irq(default),high_priority)defaultINT(void);
    return;}

void tickINT(void){
    PIR3bits.TMR0IF = 0;
    tick_count++;
    return;
}

void defaultINT(void){
    return;
}