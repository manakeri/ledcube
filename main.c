#define NO_ADDR_DEFINES 1

#include <pic14/pic16f88.h>
#include <stdint.h>

__code uint16_t __at (_CONFIG1) cfg0 =
 _FOSC_INTOSCIO &
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
#define LAYER3 RA4
#define LAYER2 RA3
#define LAYER1 RA2

#define LED1 RB1
#define LED2 RB0
#define LED3 RA6
#define LED4 RB2
#define LED5 RB7
#define LED6 RB6
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
            __asm nop __endasm;
        }
    }
}

struct layer {
	uint8_t led1 : 1;
	uint8_t led2 : 1;
	uint8_t led3 : 1;
	uint8_t led4 : 1;
	uint8_t led5 : 1;
	uint8_t led6 : 1;
	uint8_t led7 : 1;
	uint8_t led8 : 1;
	uint8_t led9 : 1;
};

struct frame {
	struct layer layer1;
	struct layer layer2;
	struct layer layer3;
	uint16_t delay;
};

#define ALL_ON  {1,1,1,1,1,1,1,1,1}
#define ALL_OFF {0,0,0, 0,0,0, 0,0,0}

const struct frame pattern[] = {
 { ALL_ON,	ALL_OFF,	ALL_ON, 	10000 }, 
 { ALL_OFF,	ALL_ON,		ALL_OFF, 	10000 }, 

 { ALL_ON,	ALL_ON,		ALL_ON, 	100 }, 
 { ALL_ON,	ALL_ON,		ALL_OFF, 	100 }, 
 { ALL_ON,	ALL_OFF,	ALL_OFF, 	100 }, 
 { {0,0,0, 0,0,0, 0,0,0}, {0,0,0, 0,0,0, 0,0,0}, {0,0,0, 0,0,0, 0,0,0}, 0 }, 
};

void leds_on(struct layer *p)
{
	LED1 = p->led1;
	LED2 = p->led2;
	LED3 = p->led3;
	LED4 = p->led4;
	LED5 = p->led5;
	LED6 = p->led6;
	LED7 = p->led7;
	LED8 = p->led8;
	LED9 = p->led9;
}

void leds_off(void)
{
}

void main(void)
{
	unsigned char f = 0;
	unsigned char l = 0;
	unsigned int cnt = 0;

	INTCON = 0;

//	TMR0IE = 1;
//	GIE = 1;

	IRCF0 = 1;
	IRCF1 = 1;
	IRCF2 = 1;

	ANSEL = 0;
	TRISA = 0b00000000;
	TRISB = 0b00000000;

	for (;;) {
		do {
		for (l=0;l<3;l++) {
			LED1 = 0;
			LED2 = 0;
			LED3 = 0;
			LED4 = 0;
			LED5 = 0;
			LED6 = 0;
			LED7 = 0;
			LED8 = 0;
			LED9 = 0;
			LAYER1 = 0;
			LAYER2 = 0;
			LAYER3 = 0;
			switch (l) {
				case 0:
					LAYER1 = 1;
					leds_on( &pattern[f].layer1 );
					break;
				case 1:
					LAYER2 = 1;
					leds_on( &pattern[f].layer2 );
					break;
				case 2:
					LAYER3 = 1;
					leds_on( &pattern[f].layer3 );
					break;
			} // switch
		} // for layer
		cnt++;
		} while (cnt<100000);

		cnt = 0;
		delay_ms( pattern[f].delay );

		f++;
		if ( pattern[f].delay == 0 )
			f = 0;
    	}

}


