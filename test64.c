/*
volatile unsigned int * const UART0DR = (unsigned int *) 0x1c090000;
 
void print_uart0(const char *s) {
    while(*s != '\0') { 		// Loop until end of string 
         *UART0DR = (unsigned int)(*s); // Transmit char 
          s++;			        // Next char 
    }
}
*/
#include<stdio.h>
void main(void) {
    unsigned int r=0; 
    printf("Hello world! %d\n",r);
}
