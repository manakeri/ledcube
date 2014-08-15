#include <pic14/pic16f88.h>

//#pragma config WDT=OFF,LVP=OFF,PWT=OFF
//#pragma config OSC=INTIO2

#define CLOCKFREQ    8000000

// bit macros
#define  testbit(var, bit)   ((var) & (1 <<(bit)))
#define  setbit(var, bit)    ((var) |= (1 << (bit)))
#define  clrbit(var, bit)    ((var) &= ~(1 << (bit)))

void main(void)
{
    INTCON = 0;	// no interrupts
    TRISA = 0b00000000;
    TRISB = 0b00000000;

    PORTA = 0xFF;
    PORTB = 0xFF;

/*
    for (;;) {
        setbit(LATA, 5);
        delay_1s();
        clrbit(LATB, 5);
        delay_1s();
    }
*/
}
