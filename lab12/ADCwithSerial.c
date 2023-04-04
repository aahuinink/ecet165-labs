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
    unsigned int pot_value;
    float pot_voltage;
    unsigned int lux_value;
    unsigned int lux_percent;
    
    // ----- hardware init ----- //
    LCDinit();
    UART5init();
    
    LCDprints("Analog readings");
    
    // ----- main loop ----- //
    while(1){
        UART5write(0x03); // header for data visualizer ~1 ms
        pot_value = POT_READ; // 30 us
        UART5write(pot_value & 0x00FF); //~1ms
        pot_voltage = analogMap(pot_value, 4095, 0, 5.00, 0.00); //~us
        LCDgoto(0x40);    // ~80 us    
        UART5write(pot_value>>8); //~1ms
        LCDprintf("P:%1f2V", pot_voltage); // ~600us
        lux_value = LUX_READ; //~30us
        UART5write(lux_value & 0x00FF); //~1ms
        lux_percent = analogMap(lux_value, 4095, 0, 0, 100); // ~us
        LCDprintf(" L:%i2%", lux_percent); //~480us
        UART5write(lux_value>>8);
        UART5write(0xFC); // trailer for data visualizer
    };
    return;
}