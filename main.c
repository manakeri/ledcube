#include <pic14/pic16f88.h>
#include <stdint.h>

__code uint16_t __at (_CONFIG1) cfg0 = 
 _INTRC_IO &
 _CP_OFF & 
 _WDT_OFF & 
 _BODEN_OFF & 
 _PWRTE_OFF &
 _MCLRE_ON & 
 _DEBUG_OFF &
 _LVP_OFF;

// bit macros
#define tstbit(var, bit) ((var) & (1 << (bit)))
#define setbit(var, bit) ((var) |= (1 << (bit)))
#define clrbit(var, bit) ((var) &= ~(1 << (bit)))

/* Adjust to your clock frequency (in Hz). */
#define CLOCKFREQ   (8U*1000U*1000U)
/* Instructions per millisecond. */
#define INSNS_PER_MS    (CLOCKFREQ / 4000U)
/* Delay loop is about 10 cycles per iteration. */
#define LOOPS_PER_MS    (INSNS_PER_MS / 10U)

void delay_ms(uint16_t ms) {
    uint16_t u;
    while (ms--) {
        /* Inner loop takes about 10 cycles per iteration + 4 cycles setup. */
        for (u = 0; u < LOOPS_PER_MS; u++) {
            /* Prevent this loop from being optimized away. */
            __asm nop __endasm;
        }
    }
}
void main(void)
{
    INTCON = 0;	// no interrupts
    ANSEL = 0x00; // no analog input

    TRISA = 0b00000000; // all output
    TRISB = 0b00000000; // all output

    for (;;) {
//        setbit(LATA, 5);
        PORTA = 0xFF;
        PORTB = 0xFF;
        delay_ms(100);
//        clrbit(LATB, 5);
        PORTA = 0x00;
        PORTB = 0x00;
        delay_ms(100);
    }

}
