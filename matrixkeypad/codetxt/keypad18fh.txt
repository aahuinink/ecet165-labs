/********************************************************************************
 * Lab 7 - Matrix Keyboard
 * ECET165 Embedded Micro-controllers
 * keypad18f.h
 * CREATED 28 Feb 2023
 * UPDATED ***
 * v1.0
 * BY Aaron Huinink
 * Provides 4x4 matrix keypad functionality with a PIC18F uC.
 * Keypad is wired to port f.
 ********************************************************************************/

#ifndef KEYPAD18F_H
#define	KEYPAD18F_H

#ifdef	__cplusplus
extern "C" {
#endif

// ============================ INCLUDES/DEFINES =================================//
    
#include <xc.h>
    
#ifndef _XTAL_FREQ
#define _XTAL_FREQ 64000000
#endif
    
#define KEY_LAT LATF
#define KEY_PORT PORTF
#define KEY_ANSEL ANSELF
#define KEY_TRIS TRISF
#define KEY_WPU WPUF

#define KEY_PORTEN KEY_ANSEL = 0x00; KEY_TRIS = 0xF0; KEY_WPU = 0xF0; __delay_us(1);
    
// ============================ FUNCTION PROTOTYPES ========================== //

// ----- keyScan ----- //
/*
* Scans the column keys and returns the column and row values of the pressed key 
* ARGS: (void)
* RETURNS: [key<unsigned char> : (column | row)]
*/
extern char keyScan();


#ifdef	__cplusplus
}
#endif

#endif	/* KEYPAD18F_H */

