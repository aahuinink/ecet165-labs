/********************************************************************************
 * Analog with Serial
 * ECET165 Embedded Micro-controllers
 * ADCwithSerial.c
 * CREATED April 4, 2023
 * UPDATED ***
 * v1.0
 * BY Aaron Huinink
 * Demonstrates the functionality of the serial18f functions
 ********************************************************************************/

 // ============================ INCLUDES/DEFINES =================================//

#include <xc.h>
#include "serial18f.h"
#include "analog18f.h"
#include "lcd18f.h"

// ============================ VARIABLES & FLAGS ========================== //

// ============================ MAIN FUNCTION ========================== //
void main(void){
    // ----- local variables ----- //
    unsigned int pot_voltage;
    unsigned int lux_reading;
    
    // ----- hardware init ----- //
    LCDinit();
    UART5init();
    
    LCDprints("Analog readings");
    
    // ----- main loop ----- //
    while(1){
        UART5write(0x03); // header for data visualizer
        pot_voltage = POT_READ;
        LCDgoto(0x40);
        LCDprintf("P:%1f2V", pot_voltage);
        
    };
    return;
}