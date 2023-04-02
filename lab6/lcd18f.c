 /********************************************************************************
 * lcd18f.c
 * ECET165 Embedded Micro-controllers
 * Created: 13 Feb 2023
 * Aaron Huinink
 * Provides functionality for pic18f micro-controllers to connect to a 4bit
 * 1 line 5x8 font lcd on port d. 
********************************************************************************/

// ============================ INCLUDES/DEFINES =================================//
#include <xc.h>
#include "lcd18f.h"  

// ============================ FUNCTION DEFS =================================//
void LCDinstruct(unsigned char instr){
    
    LCD_PORTEN; // enable LCD port
    
    // set rs to instruction register, write mode
    LCD_RW = 0;
    LCD_RS = 0;
        
    // send instruction
    LCD_LAT = (LCD_LAT & 0xF0)| (instr >> 4 & 0x0F);   // send MSnibble
    LCD_STROBE;   
    __delay_us(1);
    LCD_LAT = (LCD_LAT & 0xF0)|(instr & 0x0F);   // send LSnibble
    LCD_STROBE;
    __delay_ms(5); // allow busy flag to clear
    return;
};


void LCDinit(void){
    __delay_ms(50); // wait for powerup
    
    LCD_PORTEN;
    
    LCD_RS = 0;
    LCD_RW = 0;
    
    __delay_us(1);
    
    // send the function set instruction 3 times
    LCD_LAT = (LCD_LAT & 0xF0) | 0x03; 
    LCD_STROBE;
    __delay_ms(5);
    
    LCD_LAT = (LCD_LAT & 0xF0) | 0x03; 
    LCD_STROBE;
    __delay_ms(5);
    
    LCD_LAT = (LCD_LAT & 0xF0) | 0x03; 
    LCD_STROBE;
    __delay_ms(5);
    
    //set 4 bit mode
    LCD_LAT = (LCD_LAT & 0xF0) | 0x02;
    LCD_STROBE;
    __delay_ms(5);
    
    // run setup functions    
    LCDinstruct(0x28);      // set  4 bit mode, 2 line display, 5x8 font
    LCDinstruct(0x08);      // display off
    LCDinstruct(0x0F);      // display on, cursor on, blink on
    LCDinstruct(0x01);      // display clear
    LCDinstruct(0x06);      // entry mode set
    return;
};

void LCDprintc(char c){
    LCD_PORTEN;
    LCD_RS = 1;
    LCD_RW = 0;
    
    // print character to lcd
    LCD_LAT = (LCD_LAT & 0xF0)|(c>>4);   // send MSnibble
    __delay_us(1);
    LCD_STROBE; 
    LCD_LAT = (LCD_LAT & 0xF0)|(c & 0x0F);   // send LSnibble
    __delay_us(1);
    LCD_STROBE;
    __delay_ms(5);  // allow busy flag to clear
    return;
}
void LCDprints(char *c){
    
    LCD_PORTEN;  // enable the lcd port
    
    // set rs to data register, r/w to write mode
    LCD_RS = 1;
    LCD_RW = 0; 
    
    __delay_us(1);
    
    

    while(*c != 0x0){ // while there are valid chars in the string
        // print character from c, increment c
        LCDprintc(*c++);
    };
    return;
};



void LCDgoto(unsigned char pos){
    LCDinstruct(0x80+pos);
    return;
}


unsigned char LCDreturn(unsigned char pos){
    LCD_PORTEN;     // enable the LCD port

    unsigned char next_line = 0x40;       // next line begin address variable
    
    if (pos > 0x0F){
        next_line = 0x00;
    }
    LCDgoto(next_line);     // go to the beginning of the next line on the lcd
    
    for(unsigned char i = 0; i < 40; i++){
        LCDprintc(' ');
    }
    
    LCDgoto(next_line);
    
    return next_line;
    
}

char* toString(unsigned char number, unsigned char length){
    char string[4] = ""; // max number is 255, so max string length is 3 + \0
    unsigned char copy_num = number; // copy number for processing
    
    for(signed char i = length-1; i > -1; i--){
        string[i] = (copy_num % 10) + '0';
        copy_num /= 10;
    };
    return &string;
}

void LCDprintf(char* shell, char* inputs[]){
    while(*shell != 0x0){
        // if %s
        if((*shell == '%') & (*(shell+1) == 's')){
            // deref inputs, pass pointer, increment inputs
            LCDprints(*inputs++);
            shell+=2; //skip "%s"
        }
        // if %id, where d is the length of the integer to print
        else if((*shell == '%') & (*(shell+1) == 'i')){
            // deref inputs, deref pointer, convert to string, increment inputs
            LCDprints(toString(**inputs++, (*(shell+2)-'0')));
            shell+=3; // skip "%id"
        // if %c
        }else if((*shell == '%') & (*(shell+1) == 'c')){
            // deref inputs, deref char pointer, 
            LCDprintc(**inputs++); 
            shell+=2; // skip "%c"
        }else{
            // print the char in shell and increment shell
            LCDprintc(*shell++);
        }
    }
    return;
}
