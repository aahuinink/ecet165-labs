/* 
 * File:   config18fkeypad.h
 * Author: a_hui
 *
 * Created on March 6, 2023, 10:53 PM
 */

#ifndef CONFIG18FKEYPAD_H
#define	CONFIG18FKEYPAD_H

#ifdef	__cplusplus
extern "C" {
#endif



// PIC18F57Q43 Configuration Bit Settings

// 'C' source line config statements

// CONFIG1
#pragma config FEXTOSC = OFF    // External Oscillator Selection (Oscillator not enabled)
#pragma config RSTOSC = HFINTOSC_64MHZ// Reset Oscillator Selection (HFINTOSC 64Mhz)

// CONFIG2
#pragma config CLKOUTEN = ON    // Clock out Enable bit (CLKOUT function is enabled)
#pragma config PR1WAY = OFF     // PRLOCKED One-Way Set Enable bit (PRLOCKED bit can be set and cleared repeatedly)
#pragma config CSWEN = OFF      // Clock Switch Enable bit (The NOSC and NDIV bits cannot be changed by user software)
#pragma config FCMEN = ON       // Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor enabled)

// CONFIG3
#pragma config MCLRE = EXTMCLR  // MCLR Enable bit (If LVP = 0, MCLR pin is MCLR; If LVP = 1, RE3 pin function is MCLR )
#pragma config PWRTS = PWRT_OFF // Power-up timer selection bits (PWRT is disabled)
#pragma config MVECEN = OFF     // Multi-vector enable bit (Interrupt contoller does not use vector table to prioritze interrupts)
#pragma config IVT1WAY = OFF    // IVTLOCK bit One-way set enable bit (IVTLOCKED bit can be cleared and set repeatedly)
#pragma config LPBOREN = ON     // Low Power BOR Enable bit (Low-Power BOR enabled)
#pragma config BOREN = ON       // Brown-out Reset Enable bits (Brown-out Reset enabled according to SBOREN)

// CONFIG4
#pragma config BORV = VBOR_2P85 // Brown-out Reset Voltage Selection bits (Brown-out Reset Voltage (VBOR) set to 2.8V)
#pragma config ZCD = ON         // ZCD Disable bit (ZCD module is always enabled; ZCDMD and ZCDSEN bits are ignored)
#pragma config PPS1WAY = OFF    // PPSLOCK bit One-Way Set Enable bit (PPSLOCKED bit can be set and cleared repeatedly (subject to the unlock sequence))
#pragma config STVREN = OFF     // Stack Full/Underflow Reset Enable bit (Stack full/underflow will not cause Reset)
#pragma config LVP = OFF        // Low Voltage Programming Enable bit (HV on MCLR/VPP must be used for programming)
#pragma config XINST = OFF      // Extended Instruction Set Enable bit (Extended Instruction Set and Indexed Addressing Mode disabled)

// CONFIG5
#pragma config WDTCPS = WDTCPS_31// WDT Period selection bits (Divider ratio 1:65536; software control of WDTPS)
#pragma config WDTE = OFF       // WDT operating mode (WDT Disabled; SWDTEN is ignored)

// CONFIG6
#pragma config WDTCWS = WDTCWS_0// WDT Window Select bits (window delay = 87.5; no software control; keyed access required)
#pragma config WDTCCS = LFINTOSC// WDT input clock selector (WDT reference clock is the 31.0 kHz LFINTOSC)

// CONFIG7
#pragma config BBSIZE = BBSIZE_512// Boot Block Size selection bits (Boot Block size is 512 words)
#pragma config BBEN = OFF       // Boot Block enable bit (Boot block disabled)
#pragma config SAFEN = OFF      // Storage Area Flash enable bit (SAF disabled)
#pragma config DEBUG = OFF      // Background Debugger (Background Debugger disabled)

// CONFIG8
#pragma config WRTB = OFF       // Boot Block Write Protection bit (Boot Block not Write protected)
#pragma config WRTC = OFF       // Configuration Register Write Protection bit (Configuration registers not Write protected)
#pragma config WRTD = OFF       // Data EEPROM Write Protection bit (Data EEPROM not Write protected)
#pragma config WRTSAF = OFF     // SAF Write protection bit (SAF not Write Protected)
#pragma config WRTAPP = OFF     // Application Block write protection bit (Application Block not write protected)

// CONFIG10
#pragma config CP = ON          // PFM and Data EEPROM Code Protection bit (PFM and Data EEPROM code protection enabled)

// #pragma config statements should precede project file includes.
// Use project enums instead of #define for ON and OFF.

#include <xc.h>






#ifdef	__cplusplus
}
#endif

#endif	/* CONFIG18FKEYPAD_H */

