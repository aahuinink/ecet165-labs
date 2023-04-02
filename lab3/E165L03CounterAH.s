;*******************************************************************************
;Lab 3 - SWITCH COUNTER
;ECET165 Embedded Microcontrollers
;E165L03CounterAH.s
;Jan 24, 2023
;Aaron Huinink
;This program increments a counter with each press of the onboard switch.
;The switch is debounced to improve the counter accuracy.
;*******************************************************************************

    
PROCESSOR 18F57Q43
#include <xc.inc>
    
#define	BUTTON	RB4	;register b bit 4
#define LED0	RC0	;LSB
#define LED1	RC1	;
#define LED2	RC2	;
#define LED3	RC3	;
#define LED4	RC4	;
#define LED5	RC5	;
#define LED6	RC6	;
#define LED7	RC7	;MSB
    
    PSECT resetVec, class=CODE, reloc=2	
    
resetVec:
    goto main
   
    PSECT code
 
main:			; program starts here
    ;declare counter regs & set to 0 to start
    count	equ 0x02
    bcf		COUNT,f,a   ;clear count reg
    
    ;sleep setup
    bcf	    IDLEN	;enable sleep
    bsf	    WDTCPS_2	;set watch dog timer to run for 16ms
    
    ;from lab 2, set i/o ports
    BANKSEL TRISC
    bcf	    TRISC	;make port C an output port
    
    BANKSEL TRISB
    bsf	    TRISB4	;make button bit input
    
    BANKSEL ANSELC
    bcf	    ANSELC	;make led output port digital
    
    BANKSEL ANSELB
    bcf	    ANSELB4	;make button bit digital
    
    BANKSEL WPUB
    bsf	    WPUB4	;enable weak pullup for button
    
    goto    loop	;
    
loop:
    btfss   BUTTON	;is button pressed?
    call    delay	;yes - go to delay for debounce
    
    goto    loop	;no - loop again
 
delay:
    sleep		;sleep (interrupted by wdt running out)
    btfss   BUTTON	;is button pressed?
    call    count	;yes - go to count
    goto    loop	;no - go back to main loop
    
count:
    incf    count,f,a	;increment count
    movf    count,w,a	;move contents of the count reg to wreg
    movwf   portc,a	;move wreg contents to portc
    call    release	;go to release check protocol
    
release:
    btfsc   BUTTON	;has button been released?
    call    delay	;yes - go to loop
    goto    release	;no - check for release again
    
    
    

end resetVec



