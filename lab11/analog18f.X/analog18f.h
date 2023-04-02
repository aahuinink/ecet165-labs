/********************************************************************************
 * ADC Implementation - Lab 11
 * ECET165 Embedded Micro-controllers
 * analog18f.h
 * CREATED 27/03/23
 * UPDATED ***
 * v1.0
 * BY Aaron Huinink
 * DESCRIPTION: ADC functionality for a pic18f uC.
 ********************************************************************************/

#ifndef ANALOG18F_H
#define	ANALOG18F_H

#ifdef	__cplusplus
extern "C" {
#endif

 // ============================ INCLUDES/DEFINES =================================//

#include <xc.h>
#include "pic18f57q43.h"

#define PIN_A3 0b000011
#define PIN_A4 0b000100
// ============================ GLOBAL VARIABLES ========================== //

// ============================ FUNCTION PROTOTYPES ========================== //

// ----- ADCinit ----- //
/*
* Initializes the ADC module. 
* ARGS: [pin<unsigned char> : 6-bit value from DS designating the pin to set up]
* RETURNS: [void]
*/
void ADCinit(unsigned char pin);

#ifdef	__cplusplus
}
#endif

#endif	/* ANALOG18F_H */

