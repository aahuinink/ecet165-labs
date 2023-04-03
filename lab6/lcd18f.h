 /********************************************************************************
 * lcd18f.h
 * ECET165 Embedded Micro-controllers
 * Created: 13 Feb 2023
 * Aaron Huinink
 * Provides functionality for pic18f micro-controllers to connect to an lcd on
 * port d.
********************************************************************************/

#ifndef LCD18F_H
#define	LCD18F_H

#ifdef	__cplusplus
extern "C" {
#endif

#include <xc.h>
#define LCD_PORT PORTD
#define LCD_LAT LATD
#define LCD_TRIS TRISD
#define LCD_ANSEL ANSELD
#define LCD_WPU WPUD
#define LCD_K LATDbits.LATD7
#define LCD_EN LATDbits.LATD6
#define LCD_RW LATDbits.LATD5
#define LCD_RS LATDbits.LATD4
#define LCD_BF PORTDbits.RD3
 
#define LCD_STROBE  LCD_EN = 1; __delay_us(1); LCD_EN = 0
#define LCD_PORTEN  LCD_ANSEL = 0x0; LCD_TRIS = 0x0; LCD_WPU = 0xFF; LCD_K = 1; __delay_us(1)
#define LCD_CLEAR   LCDinstruct(0x01)
#define LCD_HOME    LCDinstruct(0x02)
#define LCD_CURSORBLINK LCDinstruct(0x0F)

#ifndef _XTAL_FREQ
#define _XTAL_FREQ 64000000
#endif


// ============================ FUNCTION PROTOTYPES ========================== //
    
// ----- instruct ----- //
/*
* sends an instruction to the instruction register
* ARGS: (instr<unsigned char> : the 2 byte instruction to be sent to the lcd)
* RETURNS: [void]
*/
extern void LCDinstruct(unsigned char instr);

// ----- LCDinit ----- //
/*
* initializes an LCD display in 4 bit, 2 line display mode
* ARGS: (void)
* RETURNS: [void]
*/
extern void LCDinit(void);

// ----- LCDprint ----- //
/*
* prints a character to the lcd
* ARGS: (c<char>   :  the character to print to the lcd)
* RETURNS: [void]
*/
extern void LCDprintc(char c);

// ----- LCDprint ----- //
/*
* prints a string of chars to the lcd
* ARGS: (*c<char>   :  the string to print to the lcd)
* RETURNS: [void]
*/
extern void LCDprints(char *c);

// ----- LCDgoto ----- //
/*
* goes to an address in DDRAM
* ARGS: (pos<unsigned char> : the position to go to in DDRAM)
* RETURNS: [address<unsigned char> : the current address in the address counter]
*/
extern void LCDgoto(unsigned char pos);

// ----- LCDreturn ----- //
/*
* goes to next line of lcd display and clears it
* ARGS: (void)
* RETURNS: [void]
*/
extern unsigned char LCDreturn(unsigned char pos);

// ----- toString ----- //
/*
* converts an integer into a string
* ARGS: [
 *      number<unsigned char> : the number to convert to a string;
 *      length<unsigned char> : the number of digits in the number;
* RETURNS: [string<char*> : the address of the string containing the integer]
*/
extern char* toString(unsigned int number, unsigned char length);

// ----- LCDprintf ----- //
/*
* printf function for the LCD display
* ARGS: [
 *          shell<char*> : string to format variables into;
 *          inputs<char**> : array of pointers to the addresses of the variables to input into shell string;
 *      ]
* RETURNS: [void]
*/
extern void LCDprintf(char* shell, char* inputs[]);

#ifdef	__cplusplus
}
#endif

#endif	/* LCD18F_H */

