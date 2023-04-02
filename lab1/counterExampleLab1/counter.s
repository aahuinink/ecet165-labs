;*******************************************************************************
;Lab 1 first program and simulation
;ECET165 Embedded Microcontrollers
;counter.s
;Jan 10,2023
;Aaron Huinink
;This program adds 1 to the working register in an infinite loop
;*******************************************************************************
;
    
PROCESSOR 18F57Q43
#include <xc.inc>
    
    PSECT resetVec, class=CODE, reloc=2	
resetVec:
    goto main
   
    PSECT code
main:  ; program starts here
	clrf WREG, A	; clear the 'working' W register
loop:	incf WREG, F, A ; adds  to the W register puts back in the file reg W
	goto loop	; loop back to do it again
	end resetVec