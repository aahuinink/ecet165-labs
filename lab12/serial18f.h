/********************************************************************************
 * Serial Interfacing for PIC18F uC
 * ECET165 Embedded Micro-controllers
 * serial18f.h
 * CREATED April 4, 2023
 * UPDATED ***
 * v1.0
 * BY Aaron Huinink
 * Provides serial interface functionality for a PIC18F microcontroller.
 ********************************************************************************/

#ifndef SERIAL18F_H
#define	SERIAL18F_H

#ifdef	__cplusplus
extern "C" {
#endif

 // ============================ INCLUDES/DEFINES =================================//

#include <xc.h>

// ============================ GLOBAL VARIABLES ========================== //

// ============================ FUNCTION PROTOTYPES ========================== //

// ----- UART5init ----- //
/*
* Initializes the UART
* ARGS: []
* RETURNS: []
*/
extern void UART5init(void);

// ----- UART5init ----- //
/*
* Initializes the UART
* ARGS: []
* RETURNS: [U5RXIF<unsigned char> : the status of the recieve interrupt flag]
*/    
extern unsigned char UART5RXready(void);
  
// ----- UART5TXready ----- //
/*
* Initializes the UART
* ARGS: []
* RETURNS: [TX_flag<unsigned char> : the status of the transmit interrupt flag]
*/    
extern unsigned char UART5TXready(void);

// ----- UART5write ----- //
/*
* Initializes the UART
* ARGS: [txData<unsigned char> : the data to write to the serial port]
* RETURNS: []
*/
extern void UART5write(unsigned char txData);

#ifdef	__cplusplus
}
#endif

#endif	/* SERIAL18F_H */

