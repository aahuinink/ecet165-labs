;*******************************************************************************
;Lab 2 - I HAVE SEEN THE LIGHT!
;ECET165 Embedded Microcontrollers
;E165L02LightAH.s
;Jan 17, 2023
;Aaron Huinink
;This program turns the onboard LED on and off with the onboard switch.
;*******************************************************************************

    
PROCESSOR 18F57Q43
#include <xc.inc>
    
#define	BUTTON	RB4	;register b bit 4
#define LED	RF3	;register f bit 3
    
    PSECT resetVec, class=CODE, reloc=2	
    
resetVec:
    goto main
   
    PSECT code
 
main:			; program starts here
    BANKSEL TRISF
    bcf	    TRISF3	;make led bit output
    
    BANKSEL TRISB
    bsf	    TRISB4	;make button bit input
    
    BANKSEL ANSELF
    bcf	    ANSELF3	;make led bit digital
    
    BANKSEL ANSELB
    bcf	    ANSELB4	;make button bit digital
    
    BANKSEL WPUB
    bsf	    WPUB4	;enable weak pullup for button
    
    bsf	    TRISB4
    bcf	    TRISF3
    
loop:
    btfss   BUTTON	;is button pressed?
    goto    ledON	;yes - go to ledON
    
    bsf	    LED		;no  - turn off led
    goto    loop	;loop again
    
ledON:
    bcf	    LED		;turn on led
    goto    loop	;loop again
end resetVec



