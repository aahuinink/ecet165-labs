/********************************************************************************
 * Lab 7 - Matrix Keyboard
 * ECET165 Embedded Micro-controllers
 * keypad18f.c
 * CREATED 27 Feb 2023
 * UPDATED ***
 * v1.0
 * BY Aaron Huinink
 * Provides 4x4 matrix keypad functionality with a PIC18F uC.
 ********************************************************************************/

// ============================ INCLUDES/DEFINES =================================//

#include <xc.h>
#include "keypad18f.h"

// ============================ PRAGMA CONFIG =================================//

// ============================ FUNCTION DEFINITIONS ========================== //

// ----- keyScan ----- //
/*
* Scans the column keys and returns the column and row values of the pressed key 
* ARGS: (void)
* RETURNS: [key<unsigned char> : {column, row}]
*/
char keyScan(){
    
    unsigned char colshift = 0x00;  // shift variable for checking columns
    unsigned char cols = 0x0;     // store row pin input
    unsigned char rowshift = 0x00; // shift variable for checking rows
    
    // char lookup table
    char lookup[4][4] = {
        {'1', '2', '3', 'A'},
        {'4', '5', '6', 'B'},
        {'7', '8', '9', 'C'},
        {'*', '0', '#', 'D'}
    };  
    
    KEY_PORTEN;  // enable the keypad port
    KEY_LAT = 0x00; // turn on column pins pins
    
    while(KEY_PORT == 0xF0); // read col pins and wait for a key press
    
    __delay_ms(15); // debounce
    
    
    while(!(cols)){ // while there's no reading on the col pins
        if(rowshift > 0x3){ // ensure rowshift is in range
            rowshift = 0x0;
        }
        
        KEY_LAT = ~(0x08>>rowshift);  // cycle a 0 through the row pins
        
        __delay_us(1);
        
        cols = (~(KEY_PORT)& 0xF0);  // read the 1s complement of the column pins
        rowshift++;  // increment colshift by one to cycle through next pin
        
    }
    
    rowshift--;  // decrement to remove additional column shift
    
    // wait for key release
    KEY_LAT = 0x00; // turn on row pins
    __delay_us(1);
    
    while(KEY_PORT != 0xF0); // wait for a 0xF reading on the col pins
    
    KEY_LAT = 0xF0;  // turn off column pins
    __delay_ms(15); // debounce
    
    // count the column pins to find the col number
    while(!(cols<<colshift & 0x80)){  // while MSB of column pins not 1
        colshift++;                     // add one to the colshift variable and shift again
    }
   
    return lookup[rowshift][colshift]; // return the keypad char
}


