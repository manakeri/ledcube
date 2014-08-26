#define NO_ADDR_DEFINES 1

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

#define SET_BIT(val, bitIndex)    ((val) |=  (1 << bitIndex) )
#define CLEAR_BIT(val, bitIndex)  ((val) &= ~(1 << bitIndex) )
#define TOGGLE_BIT(val, bitIndex) ((val) ^=  (1 << bitIndex) )
#define BIT_IS_SET(val, bitIndex) ((val) &   (1 << bitIndex) )

/* Port definitions */
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

struct frame {
	unsigned char f1 : 3;
	unsigned char f2 : 3;
        unsigned char f3 : 3;
        unsigned char m1 : 3;
        unsigned char m2 : 3;
        unsigned char m3 : 3;
        unsigned char b1 : 3;
        unsigned char b2 : 3;
        unsigned char b3 : 3;
	unsigned char delay;
};

const struct frame pattern[] = {
 { 0b111, 0b000, 0b000, 0b000, 0b000, 0b000, 0b000, 0b000, 0b000, 1000 }, 
 { 0b000, 0b000, 0b000, 0b000, 0b111, 0b000, 0b000, 0b000, 0b000, 1000 }, 
 { 0b000, 0b000, 0b000, 0b000, 0b000, 0b000, 0b000, 0b000, 0b111, 1000 }, 
 { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
};

void leds_on(unsigned char p, unsigned char layer)
{
	LED1 = BIT_IS_SET(pattern[p].f1, layer);
	LED2 = BIT_IS_SET(pattern[p].f2, layer);
	LED3 = BIT_IS_SET(pattern[p].f3, layer);
	LED4 = BIT_IS_SET(pattern[p].m1, layer);
	LED5 = BIT_IS_SET(pattern[p].m2, layer);
	LED6 = BIT_IS_SET(pattern[p].m3, layer);
	LED7 = BIT_IS_SET(pattern[p].b1, layer);
	LED8 = BIT_IS_SET(pattern[p].b2, layer);
	LED9 = BIT_IS_SET(pattern[p].b3, layer);
}
void main(void)
{
	unsigned char f = 0;
	unsigned char l = 0;
	INTCON = 0;
	TRISA = 0b00000000;
	TRISB = 0b00000000;
	for (;;) {
		for (l=0;l<3;l++) {
			leds_on(f,l);
			delay_ms( pattern[f].delay );
		}
		f++;
		if ( pattern[f].delay==0 ) 
			f = 0;
    	}
}
