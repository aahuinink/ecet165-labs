/********************************************************************************
 * Lab 7 - Matrix Keyboard
 * ECET165 Embedded Micro-controllers
 * keypad_test.c
 * CREATED 28 Feb 2023
 * UPDATED ***
 * v1.0
 * BY Aaron Huinink
 * Tests functionality of the keypad library
 ********************************************************************************/
// ============================ INCLUDES/DEFINES =================================//
#include <xc.h>
#include "keypad18f.h"
#include "C:\Users\a_hui\OneDrive - Camosun College\term2\ecet165_embedded_mc\labs\lab6\lcd18f.h"

#include "config_keypad.h"

// ============================ MAIN =================================//
void main(void){

    // ============================ SETUP =================================//
    
    // set up port c for debugging
    TRISC = 0x0; // portc output
    
    ANSELC = 0x0; // portc digital
    
    WPUC = 0x00;
    
    LATC = 0x0;
    
    // position variable to keep track of cursor position
    unsigned char pos = 0x0;
    
    // initialize lcd
    LCDinit();
    
    
    
    // ============================ MAIN LOOP =================================//
    
    while(1){
        // manage cursor position @ end of lines
        if((pos > 0x0F) & (pos < 0x40)){
            pos = 0x40;
            LCDgoto(pos);
        }
        
        if (pos > 0x4F){
            pos = 0x00;
            LCDgoto(pos);
        }
        
        // get char from keypad
        char key = keyScan();
        
        // manage key inputs
        switch (key){
            case '*':
                pos = LCDreturn(pos);
                break;
                
            case '#':
                LCD_CLEAR;
                pos=0x0;
                break;
               
            default:
                LCDprintc(key);
                pos++;
                break;
        }
        
        // for debugging
        LATC++;
        
        
        
        }
   }
