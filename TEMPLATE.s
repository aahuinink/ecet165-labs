;*******************************************************************************
;Lab - TITLE
;ECET165 Embedded Microcontrollers
;E165L03CounterAH.s
;DATE
;Aaron Huinink
;DESCRIPTION
;*******************************************************************************
    
PROCESSOR 18F57Q43
#include <xc.inc>
  
PSECT	udata_acs ;define registers
	
	
PSECT resetVec, class=CODE, reloc=2	
    
resetVec:
    goto setup
   
    PSECT code
 
setup:			; setup board
    
    
mainLoop:		; main loop
    
    
end resetVec


