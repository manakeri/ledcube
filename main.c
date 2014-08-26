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

#define LAYER1 RA4
#define LAYER2 RA3
#define LAYER3 RA2
#define LED1 RB1
#define LED2 RB0
#define LED3 RA6
#define LED4 RB2
#define LED5 RB6
#define LED6 RB7
#define LED7 RB3
#define LED8 RB4
#define LED9 RB5

struct pattern {
	unsigned char f1:3,f2:3,f3:3;
	unsigned char m1:3,m2:3,m3:3;
	unsigned char b1:3,b2:3,b3:3;
};

const struct pattern imageTab[] = {
 { 0b111, 0b111, 0b111, 0b000, 0b000, 0b000, 0b000, 0b000, 0b000 }, 
 { 0b000, 0b000, 0b000, 0b111, 0b111, 0b111, 0b000, 0b000, 0b000 }, 
 { 0b000, 0b000, 0b000, 0b000, 0b000, 0b000, 0b111, 0b111, 0b111 }
};

void leds_on()
{
    LED1 = 1;
    LED2 = 1;
    LED3 = 1;
    LED4 = 1;
    LED5 = 1;
    LED6 = 1;
    LED7 = 1;
    LED8 = 1;
    LED9 = 1;
}

void leds_off()
{
    LED1 = 0;
    LED2 = 0;
    LED3 = 0;
    LED4 = 0;
    LED5 = 0;
    LED6 = 0;
    LED7 = 0;
    LED8 = 0;
    LED9 = 0;
}

void main(void)
{
    unsigned char l;
    INTCON = 0;	// no interrupts
    ANSEL = 0x00; // no analog input
    TRISA = 0b00000000; // all output
    TRISB = 0b00000000; // all output
    PORTA = 0x00;

    leds_on();

    for (;;) {
        LAYER1 = 1;
        delay_ms(1000);
	LAYER1 = 0;
        delay_ms(1000);

        LAYER2 = 1;
        delay_ms(1000);
	LAYER2 = 0;
        delay_ms(1000);

        LAYER3 = 1;
        delay_ms(1000);
	LAYER3 = 0;
        delay_ms(1000);

    }

}
