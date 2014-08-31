#include <pic14/pic16f88.h>
#include <stdint.h>

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

__code uint16_t __at (_CONFIG1) cfg0 =
 _FOSC_INTOSCIO &
 _CP_OFF &
 _WDT_OFF &
 _BODEN_OFF &
 _PWRTE_ON &
 _MCLRE_ON &
 _DEBUG_OFF &
 _LVP_OFF;


#define BIT_IS_SET(val, bitIndex) ((val) & (1 << bitIndex))

typedef union {
	struct layer {
		uint8_t led123 : 3;
		uint8_t led456 : 3;
		uint8_t led789 : 3;
//		uint8_t unused : 7;
	};
	uint16_t value;
} layer_t;

typedef	struct frame {
	layer_t layer1;
	layer_t layer2;
	layer_t layer3;
	uint16_t delay;
} frame_t;

const struct frame pattern[] = {
//	top	middle		bottom
 { {0b000, 0b000, 0b000}, {0b000, 0b000, 0b000}, {0b000, 0b000, 0b000}, 500 },
/*
 { 0b000000000,	0b000000000, 0b000000000, 500 },
 { 0b000000000,	0b000000000, 0b111111111, 500 },
 { 0b000000000,	0b111111111, 0b111111111, 500 },
 { 0b111111111, 0b111111111, 0b111111111, 1000 },
//1
 { 0b111111111,	0b111111111, 0b111101111, 100 },
 { 0b111111111,	0b111101111, 0b111101111, 100 },
 { 0b111101111,	0b111101111, 0b111101111, 100 },
//2
 { 0b111101111,	0b111101111, 0b111100111, 100 },
 { 0b111101111,	0b111100111, 0b111100111, 100 },
 { 0b111100111,	0b111100111, 0b111100111, 100 },
//3
 { 0b111100111,	0b111100111, 0b111000111, 100 },
 { 0b111100111,	0b111000111, 0b111000111, 100 },
 { 0b111000111,	0b111000111, 0b111000111, 100 },
//4
 { 0b111000111,	0b111000111, 0b111000011, 100 },
 { 0b111000111,	0b111000011, 0b111000011, 100 },
 { 0b111000011,	0b111000011, 0b111000011, 100 },
//5
 { 0b111000011,	0b111000011, 0b110000011, 100 },
 { 0b111000011,	0b110000011, 0b110000011, 100 },
 { 0b110000011,	0b110000011, 0b110000011, 100 },
//6
 { 0b110000011,	0b110000011, 0b110000001, 100 },
 { 0b110000011,	0b110000001, 0b110000001, 100 },
 { 0b110000001,	0b110000001, 0b110000001, 100 },
//7
 { 0b110000001,	0b110000001, 0b100000001, 100 },
 { 0b110000001,	0b100000001, 0b100000001, 100 },
 { 0b100000001,	0b100000001, 0b100000001, 100 },
//8
 { 0b100000001,	0b100000001, 0b100000000, 100 },
 { 0b100000001,	0b100000000, 0b100000000, 100 },
 { 0b100000000,	0b100000000, 0b100000000, 1000 },
//9
 { 0b010000000,	0b010000000, 0b010000000, 500 },
 { 0b001000000,	0b001000000, 0b001000000, 500 },
 { 0b000100000,	0b000100000, 0b000100000, 500 },
 { 0b000010000,	0b000010000, 0b000010000, 500 },
 { 0b000001000,	0b000001000, 0b000001000, 500 },
 { 0b000000100,	0b000000100, 0b000000100, 500 },
 { 0b000000010,	0b000000010, 0b000000010, 500 },
 { 0b000000001,	0b000000001, 0b000000001, 500 },
*/
 { {0,0,0},{0,0,0},{0,0,0},0 },
};


volatile uint16_t p1 = 0,p2 = 0,p3 = 0;

void timer_isr (void) __interrupt(0)
{
	static uint16_t cnt_t0 = 0;
	static uint16_t delay = 0;
	static uint8_t frame = 0;
	++cnt_t0;
	if (cnt_t0 >= delay) {
		++frame;
		if (pattern[frame].delay == 0) {
			frame = 0;
		}
		p1 = pattern[frame].layer1.value;
		p2 = pattern[frame].layer2.value;
		p3 = pattern[frame].layer3.value;
		delay = pattern[frame].delay;
		cnt_t0 = 0;
	}
	TMR0IF = 0; // clear the flag
	TMR0IE = 1; // reenable the interrupt
	TMR0 = 6; // reset the timer preset count
}

void main(void)
{
	uint8_t l = 0;

	IRCF0 = 1; // 8 MHz internal clock
	IRCF1 = 1;
	IRCF2 = 1;

	// Timer0 Interrupt - Freq = 1000.00 Hz - Period = 0.001 seconds
	T0CS = 0; // bit 5 TMR0 Clock Source Select bit...0 = Internal Clock (CLKO) 1 = Transition on T0CKI pin
	T0SE = 0; // bit 4 TMR0 Source Edge Select bit 0 = low/high 1 = high/low
	PSA = 0; // bit 3  Prescaler Assignment bit...0 = Prescaler is assigned to the Timer0
	PS2 = 0; // bits 2-0  PS2:PS0: Prescaler Rate Select bits
	PS1 = 1;
	PS0 = 0;
	TMR0 = 6; // preset for timer register

	// Interrupt Registers
	INTCON = 0; // clear the interrupt control register
	TMR0IE = 1; // bit5 TMR0 Overflow Interrupt Enable bit...1 = Enables the TMR0 interrupt
	TMR0IF = 0; // bit2 clear timer 0 interrupt flag
	GIE = 1; // bit7 global interrupt enable

	ANSEL = 0; // digital io
	TRISA = 0b00000000; // all output
	TRISB = 0b00000000; // all output

	LED1 = 0;
	LED2 = 0;
	LED4 = 0;
	LED5 = 0;
	LED6 = 0;
	LED7 = 0;
	LED8 = 0;
	LED9 = 0;
	LED3 = 0;
	LAYER1 = 0;
	LAYER2 = 0;
	LAYER3 = 0;

	for (;;) {
		LED1 = BIT_IS_SET(p1,0);
		LED2 = BIT_IS_SET(p1,1);
		LED3 = BIT_IS_SET(p1,2);
		LED4 = BIT_IS_SET(p1,3);
		LED5 = BIT_IS_SET(p1,4);
		LED6 = BIT_IS_SET(p1,5);
		LED7 = BIT_IS_SET(p1,6);
		LED8 = BIT_IS_SET(p1,7);
		LED9 = BIT_IS_SET(p1,8);
		LAYER1 = 1;
		LAYER2 = 0;
		LAYER3 = 0;

		LED1 = BIT_IS_SET(p2,0);
		LED2 = BIT_IS_SET(p2,1);
		LED3 = BIT_IS_SET(p2,2);
		LED4 = BIT_IS_SET(p2,3);
		LED5 = BIT_IS_SET(p2,4);
		LED6 = BIT_IS_SET(p2,5);
		LED7 = BIT_IS_SET(p2,6);
		LED8 = BIT_IS_SET(p2,7);
		LED9 = BIT_IS_SET(p2,8);
		LAYER1 = 0;
		LAYER2 = 1;
		LAYER3 = 0;

		LED1 = BIT_IS_SET(p3,0);
		LED2 = BIT_IS_SET(p3,1);
		LED3 = BIT_IS_SET(p3,2);
		LED4 = BIT_IS_SET(p3,3);
		LED5 = BIT_IS_SET(p3,4);
		LED6 = BIT_IS_SET(p3,5);
		LED7 = BIT_IS_SET(p3,6);
		LED8 = BIT_IS_SET(p3,7);
		LED9 = BIT_IS_SET(p3,8);
		LAYER1 = 0;
		LAYER2 = 0;
		LAYER3 = 1;
    	}
}


