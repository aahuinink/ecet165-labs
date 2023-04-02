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

#include "keypad18f.h"

// ============================ PRAGMA CONFIG =================================//

// ============================ FUNCTION DEFINITIONS ========================== //

// ----- keyScan ----- //
/*
* Scans the column keys and returns the column and row values of the pressed key 
* ARGS: (void)
* RETURNS: [key<unsigned char> : the character pressed]
*/
unsigned char keyScan(){
    KEY_PORTEN;                  // enable the key port
    KEY_LAT = 0xF0; // set 1s on all column pins
    unsigned char column = 0x80; // use this to check each column
    

    // once there is a key press
    __delay_ms(30); // delay 30ms to debounce
        

    unsigned char row = 0x0;       // row variable to catch row value
    unsigned char key = 0x37;
    for(unsigned char i = 0; i < 4; i++){
        KEY_LAT = (column & 0xF0); // turn on a column pin
        
        LATC = (column & 0xF0);
        __delay_ms(1000);
        
        row = (KEY_PORT & 0x0F);    // read the row pins
        
        if(row){                    // if there is a non-zero row value
            key = (column | row);   // unsigned char containing column & row pins
            break;
        };
        
        column = (column>>1)        // if row value is zero, rotate column 1 bit right
                
    }
    
    return key;
    
//    switch (key){
//        case 0x88:     // 1
//            return "1"
//            break;
//        case 0x48:     // 2
//            LCDprint("2"); // print 2 to the LCD
//            break;
//        case 0x28:     // 3
//            LCDprint("3"); // print 3 to the LCD
//            break;
//        case 0x84:     // 4
//            LCDprint("4"); // print 4 to the LCD
//            break;
//        case 0x44:     // 5
//            LCDprint("5"); // print 5 to the LCD
//            break;
//        case 0x24:     // 6
//            LCDprint("6"); // print 6 to the LCD
//            break;
//        case 0x82:     // 7
//            LCDprint("7"); // print 7 to the LCD
//            break;
//        case 0x42:     // 8
//            LCDprint("8"); // print 8 to the LCD
//            break;
//        case 0x22:     // 9
//            LCDprint("9"); // print 9 to the LCD
//            break;
//        case 0x41:     // 0
//            LCDprint("0"); // print 0 to the LCD
//            break;
//        case 0x18:     // A
//            LCD_CLEAR; // clear the LCD
//            break;
//        case 0x14:     // B
//            LCDreturn(); // use return function
//            break;
//        case 0x12:     // C
//            break;
//        case 0x11:     // D
//            break;
//        case 0x21:     // #
//            LCDprint("#"); // print # to the LCD
//            break;
//        case 0x81:     // *
//            LCDprint("*"); // print * to the LCD
//            break;
//            
//        }
}




