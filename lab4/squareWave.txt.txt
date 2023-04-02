;*******************************************************************************
;Lab - SQUARE WAVE
;ECET165 Embedded Microcontrollers
;E165L03CounterAH.s
;31 JAN 2023
;Aaron Huinink
;Produces three square waves on pins RC0-2, all with a 120deg phase shift
;*******************************************************************************
    
PROCESSOR 18F57Q43
#include <xc.inc>
  
#define waveA	LATC0
#define waveB	LATC1
#define waveC	LATC2
	
PSECT resetVec, class=CODE, reloc=2	
    
resetVec:
    goto setup
   
    PSECT code
 
setup:			; set up ports
    BANKSEL PORTC	;
    CLRF    PORTC	;Clear PORTC
    BANKSEL LATC	;
    CLRF    LATC	;Clear Data Latch
    BANKSEL ANSELC	;
    CLRF    ANSELC	;Enable digital drivers
    BANKSEL TRISC	;
    MOVLW   0b00000000	;Set RC as input
    MOVWF   TRISC	;

mainLoop:
    ; set initial voltages
    MOVLW   0b00000100	; turn on RC2 and all others off
    MOVWF   LATC
    
squareWave:
    BSF	    waveA	; turn on waveA 1 cycle
    NOP			; wait 2 cycles
    NOP	
    BCF	    waveC	; waveC to 0
    NOP			; wait 2 cycles
    NOP		
    BSF	    waveB	; waveB to 1
    NOP			; wait 2 cycles
    NOP		
    BCF	    waveA	; waveA to 0
    NOP			; wait 2 cycles
    NOP	
    BSF	    waveC	; waveC to 1
    NOP			; wait 2 cycles
    NOP	
    BCF	    waveB	; waveB to 0
    goto    squareWave	; start wave routine again (2 cycles)
    
end resetVec





