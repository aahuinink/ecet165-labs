 /********************************************************************************
 * lcdtest.c
 * ECET165 Embedded Micro-controllers
 * Created: 13 Feb 2023
 * Aaron Huinink
 * Demonstrates functionality of the lcd18f library for an LCD on port d.
********************************************************************************/

#include "lcd18f.h"
#include <xc.h>


// ============================ PRAGMA CONFIG =================================//
#pragma config WDTE = OFF               // Watchdog timer enable off
#pragma config FEXTOSC = OFF            // External oscillator off
#pragma config RSTOSC = HFINTOSC_64MHZ  // Set reset oscillator to high freq internal osc at 64MHz

// ============================ MAIN LOOP =================================//

void main(void) {
    
    LCDinit(); // initialize lcd
    
    // string variables to print
    char *intro = "My name is";
    char *name = "Aaron Huinink";
    
    LCDprints(intro); // print intro string
    LCDgoto(0x40); // go to next line
    LCDprints(name); // print my name
    while(1){}; // main loop
}