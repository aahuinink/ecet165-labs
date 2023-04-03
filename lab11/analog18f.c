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
unsigned int analogRead(uint32_t pin_ansel, uint32_t pin_tris, unsigned char pin_designator){

     ADCON0bits.FM = 1; //right justify
     ADCON0bits.CS = 1; //ADCRC Clock (600kHz)
     ADPCH = pin_designator; // set pin to analog channel
     pin_tris = 1; //Set pin to input
     pin_ansel = 1; //Set pin to analog
     ADCON0bits.ON = 1; //Turn ADC On
     ADCON0bits.GO = 1; //Start conversion
     while (ADCON0bits.GO)
     {} ; //Wait for conversion done
     return (ADRESH<<8)+ADRESL;
}
