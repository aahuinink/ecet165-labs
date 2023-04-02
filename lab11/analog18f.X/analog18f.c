/********************************************************************************
 * ADC Implementation - Lab 11
 * ECET165 Embedded Micro-controllers
 * analog18f.c
 * CREATED 27/03/23
 * UPDATED ***
 * v1.0
 * BY Aaron Huinink
 * DESCRIPTION: ADC functionality for a pic18f uC.
 ********************************************************************************/

 // ============================ INCLUDES/DEFINES =================================//

#include <xc.h>
#include "pic18f57q43.h"

#include "analog18f.h"

// ============================ FUNCTION DEFINITIONS ========================== //

// ----- ADCinit ----- //
/*
* Initializes the ADC module. 
* ARGS: [pin<unsigned char> : 6-bit value from DS designating the pin to set up]
* RETURNS: [void]
*/
void ADCinit(unsigned char pin){
    ADCON0bits.FM = 1;
    
}
