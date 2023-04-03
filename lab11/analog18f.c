/********************************************************************************
 * ADC Functions for PIC18F
 * ECET165 Embedded Micro-controllers
 * analog18f.c
 * CREATED April 2, 2023
 * UPDATED ***
 * v1.0
 * BY Aaron Huinink
 * ADC modules for pic18f uCs.
 ********************************************************************************/

 // ============================ INCLUDES/DEFINES =================================//

#include <xc.h>

#include "analog18f.h"

// ============================ FUNCTION DEFINITIONS ========================== //

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
unsigned int analogRead(uint32_t pin_ansel, uint32_t pin_tris, unsigned char pin_designation){
     //Setup ADC
     ADCON0bits.FM = 1; //right justify
     ADCON0bits.CS = 1; //ADCRC Clock
     ADPCH = pin_designation; // io analog channel
     pin_tris = 1; //Set pin to input
     pin_ansel = 1; //Set pin to analog
     ADCON0bits.ON = 1; //Turn ADC On 
     
     ADCON0bits.GO = 1; // start conversion
     while(ADCON0bits.GO)
     {};        // wait for conversion to finish
     return ((ADRESH<<8)+ADRESL); // return the adc value
}

// ----- analogMap ----- //
/*
* converts an analog reading to a voltage
* ARGS: [
 *          analog_reading<unsigned int> : the analog reading from the sensor;
 *          analog_max<unsigned int> : the maximum possible analog reading;
 *          analog_min<unsigned int> : the minimum possible analog reading;
 *          sensor_max<double> : the maximum sensor measurement;
 *          sensor_min<double> : the minimum readable voltage;
 *      ]
* RETURNS: [sensor_value<double> : the output value of the sensor]
*/
double analogMap(
            unsigned int analog_reading,
            unsigned int analog_max,
            unsigned int analog_min,
            double sensor_max,
            double sensor_min)
    {
    return (sensor_min + ((analog_reading-analog_min)/((double)(analog_max-analog_min)))*(sensor_max-sensor_min));
    }