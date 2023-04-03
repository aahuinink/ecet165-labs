/********************************************************************************
 * TITLE
 * ECET165 Embedded Micro-controllers
 * XXX.c
 * CREATED ***
 * UPDATED ***
 * v1.0
 * BY Aaron Huinink
 * DESCRIPTION
 ********************************************************************************/

 // ============================ INCLUDES/DEFINES =================================//

#include <xc.h>

#include "analog18f.h"
#include "lcd18f.h"

// ============================ VARIABLES & FLAGS ========================== //

// ============================ MAIN FUNCTION ========================== //
void main(void){

    // ----- setup ----- //
    ANSELA = 0x00;
    TRISC = 0x00;
    ANSELC = 0x00;
    
    LCDinit(); // initialize lcd
    // ----- main loop ----- //
    while(1){
        LCD_HOME;
        unsigned int reading = analogRead(ANSELAbits.ANSELA3, TRISAbits.TRISA3, ADC_A3);
        char* adc_string = toString(reading, 4);
        char* buffer[1] = {adc_string};
        LCDprintf("%s", buffer);
        __delay_ms(1000);
    };
    return;
}