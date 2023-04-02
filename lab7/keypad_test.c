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
#include <keypad18f.h>

// ============================ PRAGMA CONFIG =================================//
#pragma config WDTE = OFF               // Watchdog timer enable off
#pragma config FEXTOSC = OFF            // External oscillator off
#pragma config RSTOSC = HFINTOSC_64MHZ  // Set reset oscillator to high freq internal osc at 64MHz


// ============================ MAIN =================================//
void main(void){

    // ============================ SETUP =================================//
    KEY_PORTEN; // enable the keypad port
    
    LCDinit(); // initialize the LCD
    
    
    
    
    
    // ============================ MAIN LOOP =================================//
    
    while(1){

        unsigned char key_coord = keyScan();  // get a key press
            
        keyPrint(key_coord);                  // print it to the display
        
        }
   }
