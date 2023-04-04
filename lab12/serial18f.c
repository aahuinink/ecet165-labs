
/********************************************************************************
 * Serial Interfacing for PIC18F uC
 * ECET165 Embedded Micro-controllers
 * serial18f.c
 * CREATED April 4, 2023
 * UPDATED ***
 * v1.0
 * BY Aaron Huinink
 * Provides serial interface functionality for a PIC18F microcontroller.
 ********************************************************************************/

 // ============================ INCLUDES/DEFINES =================================//

#include <xc.h>
#include "serial18f.h"
// ============================ FUNCTION DEFINITIONS ========================== //

// ----- UART5init ----- //
/*
* Initializes the UART
* ARGS: []
* RETURNS: []
*/
void UART5init(void){
    TRISF0 = 1; // set RF0 to output for TX
    ANSELF0 = 0; // set RF0 to digital
    TRISF1 = 1; // set RF1 to input
    ANSELF1 = 0; // set RF1 to digital
    U5RXPPS = 0x29; // RF1->UART5:RX5
    RF0PPS = 0x2C; // RF0->UART5:TX5
    //normal baud, transmit enable, receive enable, async 8bit mode
    U5CON0 = 0b00110000;
    // enable serial port, default everything else
    U5CON1 = 0b10000000; // serial port enabled
    // baud rate
    // low byte
    U5BRGL = 0xA0; // BRG = 416 = 0x01A0
    U5BRGH = 0x01;
    
}

// ----- UART5RXready ----- //
/*
* Initializes the UART
* ARGS: []
* RETURNS: [U5RXIF<unsigned char> : the status of the receive interrupt flag]
*/    
unsigned char UART5RXready(void){
    return (unsigned char)(U5RXIF);
}

// ----- UART5TXready ----- //
/*
* Initializes the UART
* ARGS: []
* RETURNS: [U5TXIF<unsigned char> : the status of the transmit interrupt flag]
*/    
unsigned char UART5TXready(void){
    return (unsigned char)(U5TXIF);
}

// ----- UART5write ----- //
/*
* Initializes the UART
* ARGS: [txData<unsigned char> : the data to write to the serial port]
* RETURNS: []
*/
void UART5write(unsigned char txData){
    while(!U5TXIF)
    {}; // wait for the transmit buffer to be empty
    U5TXB = txData; // write txData to the transmit buffer
}