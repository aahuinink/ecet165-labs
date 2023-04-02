;*******************************************************************************
;Lab - CYCLON
;ECET165 Embedded Microcontrollers
;E165L03CounterAH.s
;31 Jan 2023
;Aaron Huinink
;Creates a cyclon effect on port C
;*******************************************************************************
    
	
PROCESSOR 18F57Q43
	
; CONFIG1
  CONFIG  FEXTOSC = ECH         ; External Oscillator Selection (EC (external clock) above 8 MHz)
  CONFIG  RSTOSC = EXTOSC       ; Reset Oscillator Selection (EXTOSC operating per FEXTOSC bits (device manufacturing default))

; CONFIG2
  CONFIG  CLKOUTEN = OFF        ; Clock out Enable bit (CLKOUT function is disabled)
  CONFIG  PR1WAY = ON           ; PRLOCKED One-Way Set Enable bit (PRLOCKED bit can be cleared and set only once)
  CONFIG  CSWEN = ON            ; Clock Switch Enable bit (Writing to NOSC and NDIV is allowed)
  CONFIG  FCMEN = ON            ; Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor enabled)

; CONFIG3
  CONFIG  MCLRE = EXTMCLR       ; MCLR Enable bit (If LVP = 0, MCLR pin is MCLR; If LVP = 1, RE3 pin function is MCLR )
  CONFIG  PWRTS = PWRT_OFF      ; Power-up timer selection bits (PWRT is disabled)
  CONFIG  MVECEN = ON           ; Multi-vector enable bit (Multi-vector enabled, Vector table used for interrupts)
  CONFIG  IVT1WAY = ON          ; IVTLOCK bit One-way set enable bit (IVTLOCKED bit can be cleared and set only once)
  CONFIG  LPBOREN = OFF         ; Low Power BOR Enable bit (Low-Power BOR disabled)
  CONFIG  BOREN = SBORDIS       ; Brown-out Reset Enable bits (Brown-out Reset enabled , SBOREN bit is ignored)

; CONFIG4
  CONFIG  BORV = VBOR_1P9       ; Brown-out Reset Voltage Selection bits (Brown-out Reset Voltage (VBOR) set to 1.9V)
  CONFIG  ZCD = OFF             ; ZCD Disable bit (ZCD module is disabled. ZCD can be enabled by setting the ZCDSEN bit of ZCDCON)
  CONFIG  PPS1WAY = ON          ; PPSLOCK bit One-Way Set Enable bit (PPSLOCKED bit can be cleared and set only once; PPS registers remain locked after one clear/set cycle)
  CONFIG  STVREN = ON           ; Stack Full/Underflow Reset Enable bit (Stack full/underflow will cause Reset)
  CONFIG  LVP = ON              ; Low Voltage Programming Enable bit (Low voltage programming enabled. MCLR/VPP pin function is MCLR. MCLRE configuration bit is ignored)
  CONFIG  XINST = OFF           ; Extended Instruction Set Enable bit (Extended Instruction Set and Indexed Addressing Mode disabled)

; CONFIG5
  CONFIG  WDTCPS = WDTCPS_7     ; WDT Period selection bits (Divider ratio 1:4096)
  CONFIG  WDTE = ON             ; WDT operating mode (WDT enabled regardless of sleep; SWDTEN is ignored)

; CONFIG6
  CONFIG  WDTCWS = WDTCWS_7     ; WDT Window Select bits (window always open (100%); software control; keyed access not required)
  CONFIG  WDTCCS = SC           ; WDT input clock selector (Software Control)

; CONFIG7
  CONFIG  BBSIZE = BBSIZE_512   ; Boot Block Size selection bits (Boot Block size is 512 words)
  CONFIG  BBEN = OFF            ; Boot Block enable bit (Boot block disabled)
  CONFIG  SAFEN = OFF           ; Storage Area Flash enable bit (SAF disabled)
  CONFIG  DEBUG = OFF           ; Background Debugger (Background Debugger disabled)

; CONFIG8
  CONFIG  WRTB = OFF            ; Boot Block Write Protection bit (Boot Block not Write protected)
  CONFIG  WRTC = OFF            ; Configuration Register Write Protection bit (Configuration registers not Write protected)
  CONFIG  WRTD = OFF            ; Data EEPROM Write Protection bit (Data EEPROM not Write protected)
  CONFIG  WRTSAF = OFF          ; SAF Write protection bit (SAF not Write Protected)
  CONFIG  WRTAPP = OFF          ; Application Block write protection bit (Application Block not write protected)

; CONFIG10
  CONFIG  CP = OFF              ; PFM and Data EEPROM Code Protection bit (PFM and Data EEPROM code protection disabled)
  
#include <xc.inc>
  
PSECT	udata_acs ;define registers
	
	
PSECT resetVec, class=CODE, reloc=2	
    
resetVec:
    goto setup
   
    PSECT code
 
setup:			; setup board using code from datasheet
    BANKSEL PORTC	;
    CLRF    PORTC	;Clear PORTC
    BANKSEL LATC	;
    CLRF    LATC	;Clear Data Latch
    BANKSEL ANSELC	;
    CLRF    ANSELC	;Enable digital drivers
    BANKSEL TRISC	;
    MOVLW   0b00000000	;Set RC as input
    MOVWF   TRISC	;
    
    ;set initial voltages
    MOVLW   0b00000001	;turn on right most led
    MOVWF   LATC

    
    
mainLoop:
moveLeft:		; moves on led from right to left
    
    BTFSC   LATC7	; is the far left led on?
    goto    moveRight	; yes - go moveRight routine
    SLEEP		; no - sleep 128ms using WDT
    RLNCF   LATC	; rotate bits one bit to the left
    goto    moveLeft	; go back to move left
    
moveRight:		; moves leds from left to right
    
    BTFSC   LATC0	; is the far right led on?
    goto    moveLeft	; yes - go to moveLeft routine
    SLEEP		; no - sleep 128ms using WDT
    RRNCF   LATC	; rotate bits one bit to the right
    goto    moveRight	; continue to move left
    
end resetVec








