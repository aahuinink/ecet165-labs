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
#include "analogconfigpic18f.h"


// ============================ VARIABLES & FLAGS ========================== //

// ============================ MAIN FUNCTION ========================== //
void main(void){

    // ----- hardware init ----- //
    LCDinit(); // initialize the LCD display
    
    // ----- local variables ----- //
    float pot_voltage;
    
    // ----- main loop ----- //
    while(1){
        LCD_HOME;
        pot_voltage = analogMap(LUX_READ, 4095, 0, 0, 100);
        LCDprintf("Pot voltage: ");
        LCDgoto(0x40);
        LCDprintf("%5f0 V", pot_voltage);
        __delay_ms(1000);
    };
    return;
}