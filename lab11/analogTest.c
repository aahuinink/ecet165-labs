/********************************************************************************
 * Analog Functions Test
 * ECET165 Embedded Micro-controllers
 * analogTest.c
 * CREATED April 2, 2023
 * UPDATED ***
 * v1.0
 * BY Aaron Huinink
 * tests the functionality of the analog functions library
 ********************************************************************************/

 // ============================ INCLUDES/DEFINES =================================//

#include <xc.h>

#include "analog18f.h"
#include "lcd18f.h"

// ============================ VARIABLES & FLAGS ========================== //

// ============================ MAIN FUNCTION ========================== //
void main(void){

    // ----- setup ----- //
    LCDinit(); // initialize the LCD display

    // ----- main loop ----- //
    while(1){
        unsigned int reading = analogRead(ANSELAbits.ANSELA3, TRISAbits.TRISA3, ADC_A3);
        LCD_HOME;
        LCDprintf("%i4", reading);
        __delay_ms(1000);
    };
    return;
}