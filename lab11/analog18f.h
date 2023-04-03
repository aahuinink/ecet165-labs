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

#define ADC_A3 0x03
#define ADC_A4 0x04
// ============================ GLOBAL VARIABLES ========================== //

// ============================ FUNCTION PROTOTYPES ========================== //

// ----- analogRead ----- //
/*
* Initializes the ADC module on a pin and gets an analog reading from it. 
* ARGS: [   
 *          pin_ansel<uint32_t> : pin analog select register address;
 *          pin_tris<uint32_t>  : pin tris register address; 
 *          pin_designator<uint8_t> : 6-bit value from DS designating the pin to set up;
 *      ]
* RETURNS: [ADCval<int> : 12-bit reading from ADC module on that pin]
*/
extern unsigned int analogRead(uint32_t pin_ansel, uint32_t pin_tris, unsigned char pin_designator);

#ifdef	__cplusplus
}
#endif

#endif	/* ANALOG18F_H */

