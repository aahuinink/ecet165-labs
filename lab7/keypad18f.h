/********************************************************************************
 * Lab 7 - Matrix Keyboard
 * ECET165 Embedded Micro-controllers
 * keypad18f.h
 * CREATED 28 Feb 2023
 * UPDATED ***
 * v1.0
 * BY Aaron Huinink
 * Provides 4x4 matrix keypad functionality with a PIC18F uC.
 ********************************************************************************/

#ifndef KEYPAD18F_H
#define	KEYPAD18F_H

#ifdef	__cplusplus
extern "C" {
#endif

// ============================ INCLUDES/DEFINES =================================//
    
#include <xc.h>
#include "lcd18f.h"
    
#define KEY_LAT LATA
#define KEY_PORT PORTA
#define KEY_ANSEL ANSELA
#define KEY_TRIS TRISA

#define KEY_PORTEN KEY_ANSEL = 0; KEY_TRIS = 0x0F; 
    
// ============================ FUNCTION PROTOTYPES ========================== //

// ----- keyScan ----- //
/*
* Scans the column keys and returns the column and row values of the pressed key 
* ARGS: (void)
* RETURNS: [key<unsigned char> : {column, row}]
*/
extern unsigned char keyScan();

// ----- keyPrint ----- //
/*
* lookup table for key coordinates and associated lcd outputs 
* ARGS: (key<unsigned char> : the key coordinates)
* RETURNS: [void]
*/
extern void keyPrint(unsigned char key);


#ifdef	__cplusplus
}
#endif

#endif	/* KEYPAD18F_H */

