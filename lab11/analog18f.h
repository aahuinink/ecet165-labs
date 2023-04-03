/********************************************************************************
 * ADC Functions for PIC18F
 * ECET165 Embedded Micro-controllers
 * analog18f.h
 * CREATED April 2, 2023
 * UPDATED ***
 * v1.0
 * BY Aaron Huinink
 * ADC modules for pic18f uCs.
 ********************************************************************************/

#ifndef ANALOG18F_H
#define	ANALOG18F_H

#ifdef	__cplusplus
extern "C" {
#endif

 // ============================ INCLUDES/DEFINES =================================//

#include <xc.h>

#define ADC_A3 0x03
#define ADC_A4 0x04

// ============================ GLOBAL VARIABLES ========================== //

// ============================ FUNCTION PROTOTYPES ========================== //

// ----- analogRead ----- //
/*
* retrieves an analog reading from the specified io pin
* ARGS: [
 *          pin_ansel<uint32_t> : the ansel bit of the io pin;
 *          pin_tris<uint32_t>  : the tris bit of the io pin;
 *          pin_designation<unsigned char> : the 6-bit ADPCH value from the DS;
 *      ]
* RETURNS: [ADCval<unsigned int> : 12 bit analog reading from the pin]
*/
unsigned int analogRead(uint32_t pin_ansel, uint32_t pin_tris, unsigned char pin_designation);

#ifdef	__cplusplus
}
#endif

#endif	/* ANALOG18F_H */