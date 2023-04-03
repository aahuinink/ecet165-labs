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

#define POT_READ analogRead(ANSELAbits.ANSELA3, TRISAbits.TRISA3, ADC_A3)
#define LUX_READ analogRead(ANSELAbits.ANSELA4, TRISAbits.TRISA4, ADC_A4)

// ============================ VARIABLES & FLAGS ========================== //

// ============================ MAIN FUNCTION ========================== //
void main(void){

    // ----- hardware init ----- //
    LCDinit(); // initialize the LCD display
    
    // ----- local variables ----- //
    double pot_voltage;
    
    // ----- main loop ----- //
    while(1){
        LCD_HOME;
        pot_voltage = analogMap(POT_READ, 4000, 0, 5.00, 0.00);
        LCDprintf("%1f2", pot_voltage);
        __delay_ms(1000);
    };
    return;
}