;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Aug  6 2014) (Linux)
; This file was generated Thu Sep 18 14:33:45 2014
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"main.c"
	list	p=16f88
	radix dec
	include "p16f88.inc"
;--------------------------------------------------------
; config word(s)
;--------------------------------------------------------
	__config _CONFIG1, 0x3f30
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	__mulint
	extern	_STATUSbits
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_INTCONbits
	extern	_PIR1bits
	extern	_PIR2bits
	extern	_T1CONbits
	extern	_T2CONbits
	extern	_SSPCONbits
	extern	_CCP1CONbits
	extern	_RCSTAbits
	extern	_ADCON0bits
	extern	_OPTION_REGbits
	extern	_TRISAbits
	extern	_TRISBbits
	extern	_PIE1bits
	extern	_PIE2bits
	extern	_PCONbits
	extern	_OSCCONbits
	extern	_OSCTUNEbits
	extern	_SSPSTATbits
	extern	_TXSTAbits
	extern	_ANSELbits
	extern	_CMCONbits
	extern	_CVRCONbits
	extern	_ADCON1bits
	extern	_WDTCONbits
	extern	_EECON1bits
	extern	_INDF
	extern	_TMR0
	extern	_PCL
	extern	_STATUS
	extern	_FSR
	extern	_PORTA
	extern	_PORTB
	extern	_PCLATH
	extern	_INTCON
	extern	_PIR1
	extern	_PIR2
	extern	_TMR1
	extern	_TMR1L
	extern	_TMR1H
	extern	_T1CON
	extern	_TMR2
	extern	_T2CON
	extern	_SSPBUF
	extern	_SSPCON
	extern	_CCPR1
	extern	_CCPR1L
	extern	_CCPR1H
	extern	_CCP1CON
	extern	_RCSTA
	extern	_TXREG
	extern	_RCREG
	extern	_ADRESH
	extern	_ADCON0
	extern	_OPTION_REG
	extern	_TRISA
	extern	_TRISB
	extern	_PIE1
	extern	_PIE2
	extern	_PCON
	extern	_OSCCON
	extern	_OSCTUNE
	extern	_PR2
	extern	_SSPADD
	extern	_SSPSTAT
	extern	_TXSTA
	extern	_SPBRG
	extern	_ANSEL
	extern	_CMCON
	extern	_CVRCON
	extern	_ADRESL
	extern	_ADCON1
	extern	_WDTCON
	extern	_EEDATA
	extern	_EEADR
	extern	_EEDATH
	extern	_EEADRH
	extern	_EECON1
	extern	_EECON2
	extern	___sdcc_saved_fsr
	extern	__gptrget2
	extern	__gptrget1
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_timer_isr
	global	_main
	global	_p1
	global	_p2
	global	_p3
	global	_pattern

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0070
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_main_0	udata
r0x1010	res	1
r0x100F	res	1
r0x1012	res	1
r0x1011	res	1
r0x1013	res	1
r0x1014	res	1
r0x1015	res	1
r0x1016	res	1
r0x1017	res	1
r0x1018	res	1
r0x100D	res	1
r0x100E	res	1
_timer_isr_cnt_t0_1_2	res	2
_timer_isr_frame_1_2	res	2
_timer_isr_delay_1_2	res	2
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

ID_main_0	idata
_p1
	db	0x00, 0x00


ID_main_1	idata
_p2
	db	0x00, 0x00


ID_main_2	idata
_p3
	db	0x00, 0x00


ID_main_3	code
_pattern
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x32
	retlw 0x00
	retlw 0xff
	retlw 0x01
	retlw 0xff
	retlw 0x01
	retlw 0xff
	retlw 0x01
	retlw 0x32
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x32
	retlw 0x00
	retlw 0xff
	retlw 0x01
	retlw 0xff
	retlw 0x01
	retlw 0xff
	retlw 0x01
	retlw 0x32
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x32
	retlw 0x00
	retlw 0xff
	retlw 0x01
	retlw 0xff
	retlw 0x01
	retlw 0xff
	retlw 0x01
	retlw 0x32
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0xf4
	retlw 0x01
	retlw 0xff
	retlw 0x01
	retlw 0xff
	retlw 0x01
	retlw 0xff
	retlw 0x01
	retlw 0xf4
	retlw 0x01
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0xf4
	retlw 0x01
	retlw 0xff
	retlw 0x01
	retlw 0xff
	retlw 0x01
	retlw 0xff
	retlw 0x01
	retlw 0xf4
	retlw 0x01
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0xe8
	retlw 0x03
	retlw 0xff
	retlw 0x01
	retlw 0xff
	retlw 0x01
	retlw 0xff
	retlw 0x01
	retlw 0xe8
	retlw 0x03
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0xe8
	retlw 0x03
	retlw 0xff
	retlw 0x01
	retlw 0xff
	retlw 0x01
	retlw 0xff
	retlw 0x01
	retlw 0xe8
	retlw 0x03
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0xff
	retlw 0x01
	retlw 0xe8
	retlw 0x03
	retlw 0x00
	retlw 0x00
	retlw 0xff
	retlw 0x01
	retlw 0xff
	retlw 0x01
	retlw 0xe8
	retlw 0x03
	retlw 0xff
	retlw 0x01
	retlw 0xff
	retlw 0x01
	retlw 0xff
	retlw 0x01
	retlw 0xe8
	retlw 0x03
	retlw 0xff
	retlw 0x01
	retlw 0xff
	retlw 0x01
	retlw 0xef
	retlw 0x01
	retlw 0x64
	retlw 0x00
	retlw 0xff
	retlw 0x01
	retlw 0xef
	retlw 0x01
	retlw 0xef
	retlw 0x01
	retlw 0x64
	retlw 0x00
	retlw 0xef
	retlw 0x01
	retlw 0xef
	retlw 0x01
	retlw 0xef
	retlw 0x01
	retlw 0x64
	retlw 0x00
	retlw 0xef
	retlw 0x01
	retlw 0xef
	retlw 0x01
	retlw 0xcf
	retlw 0x01
	retlw 0x64
	retlw 0x00
	retlw 0xef
	retlw 0x01
	retlw 0xcf
	retlw 0x01
	retlw 0xcf
	retlw 0x01
	retlw 0x64
	retlw 0x00
	retlw 0xcf
	retlw 0x01
	retlw 0xcf
	retlw 0x01
	retlw 0xcf
	retlw 0x01
	retlw 0x64
	retlw 0x00
	retlw 0xcf
	retlw 0x01
	retlw 0xcf
	retlw 0x01
	retlw 0xc7
	retlw 0x01
	retlw 0x64
	retlw 0x00
	retlw 0xcf
	retlw 0x01
	retlw 0xc7
	retlw 0x01
	retlw 0xc7
	retlw 0x01
	retlw 0x64
	retlw 0x00
	retlw 0xc7
	retlw 0x01
	retlw 0xc7
	retlw 0x01
	retlw 0xc7
	retlw 0x01
	retlw 0x64
	retlw 0x00
	retlw 0xc7
	retlw 0x01
	retlw 0xc7
	retlw 0x01
	retlw 0x87
	retlw 0x01
	retlw 0x64
	retlw 0x00
	retlw 0xc7
	retlw 0x01
	retlw 0x87
	retlw 0x01
	retlw 0x87
	retlw 0x01
	retlw 0x64
	retlw 0x00
	retlw 0x87
	retlw 0x01
	retlw 0x87
	retlw 0x01
	retlw 0x87
	retlw 0x01
	retlw 0x64
	retlw 0x00
	retlw 0x87
	retlw 0x01
	retlw 0x87
	retlw 0x01
	retlw 0x83
	retlw 0x01
	retlw 0x64
	retlw 0x00
	retlw 0x87
	retlw 0x01
	retlw 0x83
	retlw 0x01
	retlw 0x83
	retlw 0x01
	retlw 0x64
	retlw 0x00
	retlw 0x83
	retlw 0x01
	retlw 0x83
	retlw 0x01
	retlw 0x83
	retlw 0x01
	retlw 0x64
	retlw 0x00
	retlw 0x83
	retlw 0x01
	retlw 0x83
	retlw 0x01
	retlw 0x03
	retlw 0x01
	retlw 0x64
	retlw 0x00
	retlw 0x83
	retlw 0x01
	retlw 0x03
	retlw 0x01
	retlw 0x03
	retlw 0x01
	retlw 0x64
	retlw 0x00
	retlw 0x03
	retlw 0x01
	retlw 0x03
	retlw 0x01
	retlw 0x03
	retlw 0x01
	retlw 0x64
	retlw 0x00
	retlw 0x03
	retlw 0x01
	retlw 0x03
	retlw 0x01
	retlw 0x01
	retlw 0x01
	retlw 0x64
	retlw 0x00
	retlw 0x03
	retlw 0x01
	retlw 0x01
	retlw 0x01
	retlw 0x01
	retlw 0x01
	retlw 0x64
	retlw 0x00
	retlw 0x01
	retlw 0x01
	retlw 0x01
	retlw 0x01
	retlw 0x01
	retlw 0x01
	retlw 0x64
	retlw 0x00
	retlw 0x01
	retlw 0x01
	retlw 0x01
	retlw 0x01
	retlw 0x01
	retlw 0x00
	retlw 0x64
	retlw 0x00
	retlw 0x01
	retlw 0x01
	retlw 0x01
	retlw 0x00
	retlw 0x01
	retlw 0x00
	retlw 0x64
	retlw 0x00
	retlw 0x01
	retlw 0x00
	retlw 0x01
	retlw 0x00
	retlw 0x01
	retlw 0x00
	retlw 0xe8
	retlw 0x03
	retlw 0x02
	retlw 0x00
	retlw 0x02
	retlw 0x00
	retlw 0x02
	retlw 0x00
	retlw 0xf4
	retlw 0x01
	retlw 0x04
	retlw 0x00
	retlw 0x04
	retlw 0x00
	retlw 0x04
	retlw 0x00
	retlw 0xf4
	retlw 0x01
	retlw 0x08
	retlw 0x00
	retlw 0x08
	retlw 0x00
	retlw 0x08
	retlw 0x00
	retlw 0xf4
	retlw 0x01
	retlw 0x10
	retlw 0x00
	retlw 0x10
	retlw 0x00
	retlw 0x10
	retlw 0x00
	retlw 0xf4
	retlw 0x01
	retlw 0x20
	retlw 0x00
	retlw 0x20
	retlw 0x00
	retlw 0x20
	retlw 0x00
	retlw 0xf4
	retlw 0x01
	retlw 0x40
	retlw 0x00
	retlw 0x40
	retlw 0x00
	retlw 0x40
	retlw 0x00
	retlw 0xf4
	retlw 0x01
	retlw 0x80
	retlw 0x00
	retlw 0x80
	retlw 0x00
	retlw 0x80
	retlw 0x00
	retlw 0xf4
	retlw 0x01
	retlw 0x00
	retlw 0x01
	retlw 0x00
	retlw 0x01
	retlw 0x00
	retlw 0x01
	retlw 0xf4
	retlw 0x01
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00
	retlw 0x00

;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; interrupt and initialization code
;--------------------------------------------------------
c_interrupt	code	0x4
__sdcc_interrupt
;***
;  pBlock Stats: dbName = I
;***
;entry:  _timer_isr	;Function start
; 0 exit points
;functions called:
;   __mulint
;   __gptrget2
;   __mulint
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget2
;   __mulint
;   __gptrget2
;   __mulint
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget2
;13 compiler assigned registers:
;   STK02
;   STK01
;   STK00
;   r0x100F
;   r0x1010
;   r0x1011
;   r0x1012
;   r0x1013
;   r0x1014
;   r0x1015
;   r0x1016
;   r0x1017
;   r0x1018
;; Starting pCode block
_timer_isr	;Function start
; 0 exit points
;	.line	125; "main.c"	void timer_isr (void) __interrupt(0)
	MOVWF	WSAVE
	SWAPF	STATUS,W
	CLRF	STATUS
	MOVWF	SSAVE
	MOVF	PCLATH,W
	CLRF	PCLATH
	MOVWF	PSAVE
	MOVF	FSR,W
	BANKSEL	___sdcc_saved_fsr
	MOVWF	___sdcc_saved_fsr
;	.line	131; "main.c"	++cnt_t0;
	BANKSEL	_timer_isr_cnt_t0_1_2
	INCF	_timer_isr_cnt_t0_1_2,F
	BTFSC	STATUS,2
	INCF	(_timer_isr_cnt_t0_1_2 + 1),F
;	.line	132; "main.c"	if (cnt_t0 >= delay) {
	BANKSEL	_timer_isr_delay_1_2
	MOVF	(_timer_isr_delay_1_2 + 1),W
	BANKSEL	_timer_isr_cnt_t0_1_2
	SUBWF	(_timer_isr_cnt_t0_1_2 + 1),W
	BTFSS	STATUS,2
	GOTO	_00117_DS_
	BANKSEL	_timer_isr_delay_1_2
	MOVF	_timer_isr_delay_1_2,W
	BANKSEL	_timer_isr_cnt_t0_1_2
	SUBWF	_timer_isr_cnt_t0_1_2,W
_00117_DS_
	BTFSS	STATUS,0
	GOTO	_00108_DS_
;;genSkipc:3247: created from rifx:0x7fff5a8b0dc0
;	.line	133; "main.c"	++frame;
	BANKSEL	_timer_isr_frame_1_2
	INCF	_timer_isr_frame_1_2,F
	BTFSC	STATUS,2
	INCF	(_timer_isr_frame_1_2 + 1),F
;	.line	134; "main.c"	if (pattern[frame].delay == 0) {
	MOVF	_timer_isr_frame_1_2,W
	MOVWF	STK02
	MOVF	(_timer_isr_frame_1_2 + 1),W
	MOVWF	STK01
	MOVLW	0x08
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	__mulint
	CALL	__mulint
	PAGESEL	$
	BANKSEL	r0x100F
	MOVWF	r0x100F
	MOVF	STK00,W
	MOVWF	r0x1010
	ADDLW	(_pattern + 0)
	MOVWF	r0x1010
	MOVF	r0x100F,W
	BTFSC	STATUS,0
	INCFSZ	r0x100F,W
	ADDLW	high (_pattern + 0)
	MOVWF	r0x100F
	MOVLW	0x06
	ADDWF	r0x1010,F
	BTFSC	STATUS,0
	INCF	r0x100F,F
	MOVF	r0x1010,W
	MOVWF	STK01
	MOVF	r0x100F,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget2
	CALL	__gptrget2
	PAGESEL	$
	BANKSEL	r0x1011
	MOVWF	r0x1011
	MOVF	STK00,W
	MOVWF	r0x1012
	IORWF	r0x1011,W
	BTFSS	STATUS,2
	GOTO	_00106_DS_
;	.line	135; "main.c"	frame = 0;
	BANKSEL	_timer_isr_frame_1_2
	CLRF	_timer_isr_frame_1_2
	CLRF	(_timer_isr_frame_1_2 + 1)
_00106_DS_
;	.line	140; "main.c"	p1 = pattern[frame].layer1.led1 | 
	BANKSEL	_timer_isr_frame_1_2
	MOVF	_timer_isr_frame_1_2,W
	MOVWF	STK02
	MOVF	(_timer_isr_frame_1_2 + 1),W
	MOVWF	STK01
	MOVLW	0x08
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	__mulint
	CALL	__mulint
	PAGESEL	$
	BANKSEL	r0x100F
	MOVWF	r0x100F
	MOVF	STK00,W
	MOVWF	r0x1010
	ADDLW	(_pattern + 0)
	MOVWF	r0x1012
	MOVLW	high (_pattern + 0)
	MOVWF	r0x1011
	MOVF	r0x100F,W
	BTFSC	STATUS,0
	INCFSZ	r0x100F,W
	ADDWF	r0x1011,F
;;136	MOVF	r0x1012,W
	MOVF	r0x1011,W
	MOVWF	r0x1014
	CLRF	r0x1015
;;135	MOVF	r0x1013,W
	MOVF	r0x1012,W
	MOVWF	r0x1013
	MOVWF	STK01
	MOVF	r0x1014,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	ANDLW	0x01
	BTFSC	STATUS,2
	GOTO	_00055_DS_
	BANKSEL	r0x1015
	INCF	r0x1015,F
_00055_DS_
;	.line	141; "main.c"	pattern[frame].layer1.led2 << 1 | 
	BANKSEL	r0x1012
;;132	MOVF	r0x1012,W
	MOVF	r0x1011,W
	MOVWF	r0x1014
	CLRF	r0x1016
;;131	MOVF	r0x1013,W
	MOVF	r0x1012,W
	MOVWF	r0x1013
	MOVWF	STK01
	MOVF	r0x1014,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	ANDLW	0x02
	BTFSC	STATUS,2
	GOTO	_00056_DS_
	BANKSEL	r0x1016
	INCF	r0x1016,F
_00056_DS_
	BANKSEL	r0x1016
	MOVF	r0x1016,W
	MOVWF	r0x1013
	CLRF	r0x1014
	BCF	STATUS,0
	RLF	r0x1013,W
	MOVWF	r0x1016
	RLF	r0x1014,W
	MOVWF	r0x1018
	MOVWF	r0x1017
	MOVF	r0x1015,W
	MOVWF	r0x1013
	IORWF	r0x1016,W
	MOVWF	r0x1015
;;139	MOVF	r0x1017,W
;;138	IORWF	r0x1014,W
;;128	MOVF	r0x1012,W
;;134	MOVF	r0x1011,W
;	.line	142; "main.c"	pattern[frame].layer1.led3 << 2 |
	CLRF	r0x1016
;;127	MOVF	r0x1013,W
	MOVF	r0x1012,W
	MOVWF	r0x1013
	MOVWF	STK01
;;133	MOVF	r0x1014,W
	MOVF	r0x1011,W
	MOVWF	r0x1014
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	ANDLW	0x04
	BTFSC	STATUS,2
	GOTO	_00057_DS_
	BANKSEL	r0x1016
	INCF	r0x1016,F
_00057_DS_
	BANKSEL	r0x1016
	MOVF	r0x1016,W
	MOVWF	r0x1013
	CLRF	r0x1014
	BCF	STATUS,0
	RLF	r0x1013,W
	MOVWF	r0x1016
	RLF	r0x1014,W
	MOVWF	r0x1017
	BCF	STATUS,0
	RLF	r0x1016,F
	RLF	r0x1017,F
	MOVF	r0x1016,W
	IORWF	r0x1015,F
	MOVF	r0x1017,W
	IORWF	r0x1018,F
;;124	MOVF	r0x1012,W
;;130	MOVF	r0x1011,W
;	.line	143; "main.c"	pattern[frame].layer1.led4 << 3 | 
	CLRF	r0x1016
;;123	MOVF	r0x1013,W
	MOVF	r0x1012,W
	MOVWF	r0x1013
	MOVWF	STK01
;;129	MOVF	r0x1014,W
	MOVF	r0x1011,W
	MOVWF	r0x1014
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	ANDLW	0x08
	BTFSC	STATUS,2
	GOTO	_00058_DS_
	BANKSEL	r0x1016
	INCF	r0x1016,F
_00058_DS_
	BANKSEL	r0x1016
	MOVF	r0x1016,W
	MOVWF	r0x1013
	CLRF	r0x1014
	BCF	STATUS,0
	RLF	r0x1013,W
	MOVWF	r0x1016
	RLF	r0x1014,W
	MOVWF	r0x1017
	BCF	STATUS,0
	RLF	r0x1016,F
	RLF	r0x1017,F
	BCF	STATUS,0
	RLF	r0x1016,F
	RLF	r0x1017,F
	MOVF	r0x1016,W
	IORWF	r0x1015,F
	MOVF	r0x1017,W
	IORWF	r0x1018,F
;;120	MOVF	r0x1012,W
;;126	MOVF	r0x1011,W
;	.line	144; "main.c"	pattern[frame].layer1.led5 << 4 | 
	CLRF	r0x1016
;;119	MOVF	r0x1013,W
	MOVF	r0x1012,W
	MOVWF	r0x1013
	MOVWF	STK01
;;125	MOVF	r0x1014,W
	MOVF	r0x1011,W
	MOVWF	r0x1014
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	ANDLW	0x10
	BTFSC	STATUS,2
	GOTO	_00059_DS_
	BANKSEL	r0x1016
	INCF	r0x1016,F
_00059_DS_
	BANKSEL	r0x1016
	MOVF	r0x1016,W
	MOVWF	r0x1013
	CLRF	r0x1014
	SWAPF	r0x1014,W
	ANDLW	0xf0
	MOVWF	r0x1017
	SWAPF	r0x1013,W
	MOVWF	r0x1016
	ANDLW	0x0f
	IORWF	r0x1017,F
	XORWF	r0x1016,F
	MOVF	r0x1016,W
	IORWF	r0x1015,F
	MOVF	r0x1017,W
	IORWF	r0x1018,F
;;116	MOVF	r0x1012,W
;;122	MOVF	r0x1011,W
;	.line	145; "main.c"	pattern[frame].layer1.led6 << 5 |
	CLRF	r0x1016
;;115	MOVF	r0x1013,W
	MOVF	r0x1012,W
	MOVWF	r0x1013
	MOVWF	STK01
;;121	MOVF	r0x1014,W
	MOVF	r0x1011,W
	MOVWF	r0x1014
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	ANDLW	0x20
	BTFSC	STATUS,2
	GOTO	_00060_DS_
	BANKSEL	r0x1016
	INCF	r0x1016,F
_00060_DS_
	BANKSEL	r0x1016
	MOVF	r0x1016,W
	MOVWF	r0x1013
	CLRF	r0x1014
	SWAPF	r0x1014,W
	ANDLW	0xf0
	MOVWF	r0x1017
	SWAPF	r0x1013,W
	MOVWF	r0x1016
	ANDLW	0x0f
	IORWF	r0x1017,F
	XORWF	r0x1016,F
	BCF	STATUS,0
	RLF	r0x1016,F
	RLF	r0x1017,F
	MOVF	r0x1016,W
	IORWF	r0x1015,F
	MOVF	r0x1017,W
	IORWF	r0x1018,F
;;111	MOVF	r0x1012,W
;;118	MOVF	r0x1011,W
;	.line	146; "main.c"	pattern[frame].layer1.led7 << 6 | 
	CLRF	r0x1016
;;110	MOVF	r0x1013,W
	MOVF	r0x1012,W
	MOVWF	r0x1013
	MOVWF	STK01
;;117	MOVF	r0x1014,W
	MOVF	r0x1011,W
	MOVWF	r0x1014
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	ANDLW	0x40
	BTFSC	STATUS,2
	GOTO	_00061_DS_
	BANKSEL	r0x1016
	INCF	r0x1016,F
_00061_DS_
	BANKSEL	r0x1016
	MOVF	r0x1016,W
	MOVWF	r0x1013
	CLRF	r0x1014
	SWAPF	r0x1014,W
	ANDLW	0xf0
	MOVWF	r0x1017
	SWAPF	r0x1013,W
	MOVWF	r0x1016
	ANDLW	0x0f
	IORWF	r0x1017,F
	XORWF	r0x1016,F
	BCF	STATUS,0
	RLF	r0x1016,F
	RLF	r0x1017,F
	BCF	STATUS,0
	RLF	r0x1016,F
	RLF	r0x1017,F
	MOVF	r0x1016,W
	IORWF	r0x1015,F
	MOVF	r0x1017,W
	IORWF	r0x1018,F
;;103	MOVF	r0x1012,W
;;113	MOVF	r0x1011,W
;	.line	147; "main.c"	pattern[frame].layer1.led8 << 7 | 
	CLRF	r0x1016
;;102	MOVF	r0x1013,W
	MOVF	r0x1012,W
	MOVWF	r0x1013
	MOVWF	STK01
;;112	MOVF	r0x1014,W
	MOVF	r0x1011,W
	MOVWF	r0x1014
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	ANDLW	0x80
	BTFSC	STATUS,2
	GOTO	_00062_DS_
	BANKSEL	r0x1016
	INCF	r0x1016,F
_00062_DS_
	BANKSEL	r0x1016
	MOVF	r0x1016,W
	MOVWF	r0x1013
	CLRF	r0x1014
	RRF	r0x1014,W
	RRF	r0x1013,W
	MOVWF	r0x1017
	CLRF	r0x1016
	RRF	r0x1016,F
	MOVF	r0x1016,W
	IORWF	r0x1015,F
	MOVF	r0x1017,W
	IORWF	r0x1018,F
;	.line	148; "main.c"	pattern[frame].layer1.led9 << 8;
	INCF	r0x1012,F
	BTFSC	STATUS,2
	INCF	r0x1011,F
	CLRF	r0x1013
	MOVF	r0x1012,W
	MOVWF	STK01
	MOVF	r0x1011,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	ANDLW	0x01
	BTFSC	STATUS,2
	GOTO	_00063_DS_
	BANKSEL	r0x1013
	INCF	r0x1013,F
_00063_DS_
	BANKSEL	r0x1013
	MOVF	r0x1013,W
	MOVWF	r0x1012
	CLRF	r0x1011
;;105	MOVF	r0x1012,W
	CLRF	r0x1013
	MOVF	r0x1015,W
	BANKSEL	_p1
	MOVWF	_p1
;;104	MOVF	r0x1014,W
	BANKSEL	r0x1012
	MOVF	r0x1012,W
	MOVWF	r0x1014
	IORWF	r0x1018,W
	BANKSEL	_p1
	MOVWF	(_p1 + 1)
;	.line	151; "main.c"	p2 = pattern[frame].layer2.led1 |
	BANKSEL	r0x1010
	MOVF	r0x1010,W
	ADDLW	(_pattern + 0)
	MOVWF	r0x1010
	MOVF	r0x100F,W
	BTFSC	STATUS,0
	INCFSZ	r0x100F,W
	ADDLW	high (_pattern + 0)
	MOVWF	r0x100F
	MOVLW	0x02
	ADDWF	r0x1010,W
	MOVWF	r0x1012
	CLRF	r0x1011
	RLF	r0x1011,F
	MOVF	r0x100F,W
	ADDWF	r0x1011,F
	CLRF	r0x1013
	MOVF	r0x1012,W
	MOVWF	STK01
	MOVF	r0x1011,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	ANDLW	0x01
	BTFSC	STATUS,2
	GOTO	_00064_DS_
	BANKSEL	r0x1013
	INCF	r0x1013,F
_00064_DS_
;	.line	152; "main.c"	pattern[frame].layer2.led2 << 1 |
	MOVLW	0x02
	BANKSEL	r0x1010
	ADDWF	r0x1010,W
	MOVWF	r0x1012
	CLRF	r0x1011
	RLF	r0x1011,F
	MOVF	r0x100F,W
	ADDWF	r0x1011,F
	CLRF	r0x1014
	MOVF	r0x1012,W
	MOVWF	STK01
	MOVF	r0x1011,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	ANDLW	0x02
	BTFSC	STATUS,2
	GOTO	_00065_DS_
	BANKSEL	r0x1014
	INCF	r0x1014,F
_00065_DS_
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	MOVWF	r0x1012
	CLRF	r0x1011
	BCF	STATUS,0
	RLF	r0x1012,W
	MOVWF	r0x1014
	RLF	r0x1011,W
	MOVWF	r0x1016
	MOVWF	r0x1015
	MOVF	r0x1013,W
	MOVWF	r0x1012
	IORWF	r0x1014,W
	MOVWF	r0x1013
;;114	MOVF	r0x1015,W
;;109	IORWF	r0x1011,W
;	.line	153; "main.c"	pattern[frame].layer2.led3 << 2 |
	MOVLW	0x02
	ADDWF	r0x1010,W
	MOVWF	r0x1012
	CLRF	r0x1011
	RLF	r0x1011,F
	MOVF	r0x100F,W
	ADDWF	r0x1011,F
	CLRF	r0x1014
	MOVF	r0x1012,W
	MOVWF	STK01
	MOVF	r0x1011,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	ANDLW	0x04
	BTFSC	STATUS,2
	GOTO	_00066_DS_
	BANKSEL	r0x1014
	INCF	r0x1014,F
_00066_DS_
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	MOVWF	r0x1012
	CLRF	r0x1011
	BCF	STATUS,0
	RLF	r0x1012,W
	MOVWF	r0x1014
	RLF	r0x1011,W
	MOVWF	r0x1015
	BCF	STATUS,0
	RLF	r0x1014,F
	RLF	r0x1015,F
	MOVF	r0x1014,W
	IORWF	r0x1013,F
	MOVF	r0x1015,W
	IORWF	r0x1016,F
;	.line	154; "main.c"	pattern[frame].layer2.led4 << 3 |
	MOVLW	0x02
	ADDWF	r0x1010,W
	MOVWF	r0x1012
	CLRF	r0x1011
	RLF	r0x1011,F
	MOVF	r0x100F,W
	ADDWF	r0x1011,F
	CLRF	r0x1014
	MOVF	r0x1012,W
	MOVWF	STK01
	MOVF	r0x1011,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	ANDLW	0x08
	BTFSC	STATUS,2
	GOTO	_00067_DS_
	BANKSEL	r0x1014
	INCF	r0x1014,F
_00067_DS_
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	MOVWF	r0x1012
	CLRF	r0x1011
	BCF	STATUS,0
	RLF	r0x1012,W
	MOVWF	r0x1014
	RLF	r0x1011,W
	MOVWF	r0x1015
	BCF	STATUS,0
	RLF	r0x1014,F
	RLF	r0x1015,F
	BCF	STATUS,0
	RLF	r0x1014,F
	RLF	r0x1015,F
	MOVF	r0x1014,W
	IORWF	r0x1013,F
	MOVF	r0x1015,W
	IORWF	r0x1016,F
;	.line	155; "main.c"	pattern[frame].layer2.led5 << 4 |
	MOVLW	0x02
	ADDWF	r0x1010,W
	MOVWF	r0x1012
	CLRF	r0x1011
	RLF	r0x1011,F
	MOVF	r0x100F,W
	ADDWF	r0x1011,F
	CLRF	r0x1014
	MOVF	r0x1012,W
	MOVWF	STK01
	MOVF	r0x1011,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	ANDLW	0x10
	BTFSC	STATUS,2
	GOTO	_00068_DS_
	BANKSEL	r0x1014
	INCF	r0x1014,F
_00068_DS_
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	MOVWF	r0x1012
	CLRF	r0x1011
	SWAPF	r0x1011,W
	ANDLW	0xf0
	MOVWF	r0x1015
	SWAPF	r0x1012,W
	MOVWF	r0x1014
	ANDLW	0x0f
	IORWF	r0x1015,F
	XORWF	r0x1014,F
	MOVF	r0x1014,W
	IORWF	r0x1013,F
	MOVF	r0x1015,W
	IORWF	r0x1016,F
;	.line	156; "main.c"	pattern[frame].layer2.led6 << 5 |
	MOVLW	0x02
	ADDWF	r0x1010,W
	MOVWF	r0x1012
	CLRF	r0x1011
	RLF	r0x1011,F
	MOVF	r0x100F,W
	ADDWF	r0x1011,F
	CLRF	r0x1014
	MOVF	r0x1012,W
	MOVWF	STK01
	MOVF	r0x1011,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	ANDLW	0x20
	BTFSC	STATUS,2
	GOTO	_00069_DS_
	BANKSEL	r0x1014
	INCF	r0x1014,F
_00069_DS_
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	MOVWF	r0x1012
	CLRF	r0x1011
	SWAPF	r0x1011,W
	ANDLW	0xf0
	MOVWF	r0x1015
	SWAPF	r0x1012,W
	MOVWF	r0x1014
	ANDLW	0x0f
	IORWF	r0x1015,F
	XORWF	r0x1014,F
	BCF	STATUS,0
	RLF	r0x1014,F
	RLF	r0x1015,F
	MOVF	r0x1014,W
	IORWF	r0x1013,F
	MOVF	r0x1015,W
	IORWF	r0x1016,F
;	.line	157; "main.c"	pattern[frame].layer2.led7 << 6 |
	MOVLW	0x02
	ADDWF	r0x1010,W
	MOVWF	r0x1012
	CLRF	r0x1011
	RLF	r0x1011,F
	MOVF	r0x100F,W
	ADDWF	r0x1011,F
	CLRF	r0x1014
	MOVF	r0x1012,W
	MOVWF	STK01
	MOVF	r0x1011,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	ANDLW	0x40
	BTFSC	STATUS,2
	GOTO	_00070_DS_
	BANKSEL	r0x1014
	INCF	r0x1014,F
_00070_DS_
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	MOVWF	r0x1012
	CLRF	r0x1011
	SWAPF	r0x1011,W
	ANDLW	0xf0
	MOVWF	r0x1015
	SWAPF	r0x1012,W
	MOVWF	r0x1014
	ANDLW	0x0f
	IORWF	r0x1015,F
	XORWF	r0x1014,F
	BCF	STATUS,0
	RLF	r0x1014,F
	RLF	r0x1015,F
	BCF	STATUS,0
	RLF	r0x1014,F
	RLF	r0x1015,F
	MOVF	r0x1014,W
	IORWF	r0x1013,F
	MOVF	r0x1015,W
	IORWF	r0x1016,F
;	.line	158; "main.c"	pattern[frame].layer2.led8 << 7 |
	MOVLW	0x02
	ADDWF	r0x1010,W
	MOVWF	r0x1012
	CLRF	r0x1011
	RLF	r0x1011,F
	MOVF	r0x100F,W
	ADDWF	r0x1011,F
	CLRF	r0x1014
	MOVF	r0x1012,W
	MOVWF	STK01
	MOVF	r0x1011,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	ANDLW	0x80
	BTFSC	STATUS,2
	GOTO	_00071_DS_
	BANKSEL	r0x1014
	INCF	r0x1014,F
_00071_DS_
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	MOVWF	r0x1012
	CLRF	r0x1011
	RRF	r0x1011,W
	RRF	r0x1012,W
	MOVWF	r0x1015
	CLRF	r0x1014
	RRF	r0x1014,F
	MOVF	r0x1014,W
	IORWF	r0x1013,F
	MOVF	r0x1015,W
	IORWF	r0x1016,F
;	.line	159; "main.c"	pattern[frame].layer2.led9 << 8;
	MOVLW	0x03
	ADDWF	r0x1010,W
	MOVWF	r0x1012
	CLRF	r0x1011
	RLF	r0x1011,F
	MOVF	r0x100F,W
	ADDWF	r0x1011,F
	CLRF	r0x1014
	MOVF	r0x1012,W
	MOVWF	STK01
	MOVF	r0x1011,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	ANDLW	0x01
	BTFSC	STATUS,2
	GOTO	_00072_DS_
	BANKSEL	r0x1014
	INCF	r0x1014,F
_00072_DS_
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	MOVWF	r0x1015
	MOVWF	r0x1012
	CLRF	r0x1011
;;107	MOVF	r0x1012,W
	CLRF	r0x1014
	MOVF	r0x1013,W
	BANKSEL	_p2
	MOVWF	_p2
	BANKSEL	r0x1015
	MOVF	r0x1015,W
	IORWF	r0x1016,W
	BANKSEL	_p2
	MOVWF	(_p2 + 1)
;	.line	162; "main.c"	p3 = pattern[frame].layer3.led1 | 
	MOVLW	0x04
	BANKSEL	r0x1010
	ADDWF	r0x1010,W
	MOVWF	r0x1012
	CLRF	r0x1011
	RLF	r0x1011,F
	MOVF	r0x100F,W
	ADDWF	r0x1011,F
	CLRF	r0x1013
	MOVF	r0x1012,W
	MOVWF	STK01
	MOVF	r0x1011,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	ANDLW	0x01
	BTFSC	STATUS,2
	GOTO	_00073_DS_
	BANKSEL	r0x1013
	INCF	r0x1013,F
_00073_DS_
;	.line	163; "main.c"	pattern[frame].layer3.led2 << 1 | 
	MOVLW	0x04
	BANKSEL	r0x1010
	ADDWF	r0x1010,W
	MOVWF	r0x1012
	CLRF	r0x1011
	RLF	r0x1011,F
	MOVF	r0x100F,W
	ADDWF	r0x1011,F
	CLRF	r0x1014
	MOVF	r0x1012,W
	MOVWF	STK01
	MOVF	r0x1011,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	ANDLW	0x02
	BTFSC	STATUS,2
	GOTO	_00074_DS_
	BANKSEL	r0x1014
	INCF	r0x1014,F
_00074_DS_
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	MOVWF	r0x1012
	CLRF	r0x1011
	BCF	STATUS,0
	RLF	r0x1012,W
	MOVWF	r0x1014
	RLF	r0x1011,W
	MOVWF	r0x1016
	MOVWF	r0x1015
	MOVF	r0x1013,W
	MOVWF	r0x1012
	IORWF	r0x1014,W
	MOVWF	r0x1013
;;106	MOVF	r0x1015,W
;;101	IORWF	r0x1011,W
;	.line	164; "main.c"	pattern[frame].layer3.led3 << 2 |
	MOVLW	0x04
	ADDWF	r0x1010,W
	MOVWF	r0x1012
	CLRF	r0x1011
	RLF	r0x1011,F
	MOVF	r0x100F,W
	ADDWF	r0x1011,F
	CLRF	r0x1014
	MOVF	r0x1012,W
	MOVWF	STK01
	MOVF	r0x1011,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	ANDLW	0x04
	BTFSC	STATUS,2
	GOTO	_00075_DS_
	BANKSEL	r0x1014
	INCF	r0x1014,F
_00075_DS_
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	MOVWF	r0x1012
	CLRF	r0x1011
	BCF	STATUS,0
	RLF	r0x1012,W
	MOVWF	r0x1014
	RLF	r0x1011,W
	MOVWF	r0x1015
	BCF	STATUS,0
	RLF	r0x1014,F
	RLF	r0x1015,F
	MOVF	r0x1014,W
	IORWF	r0x1013,F
	MOVF	r0x1015,W
	IORWF	r0x1016,F
;	.line	165; "main.c"	pattern[frame].layer3.led4 << 3 | 
	MOVLW	0x04
	ADDWF	r0x1010,W
	MOVWF	r0x1012
	CLRF	r0x1011
	RLF	r0x1011,F
	MOVF	r0x100F,W
	ADDWF	r0x1011,F
	CLRF	r0x1014
	MOVF	r0x1012,W
	MOVWF	STK01
	MOVF	r0x1011,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	ANDLW	0x08
	BTFSC	STATUS,2
	GOTO	_00076_DS_
	BANKSEL	r0x1014
	INCF	r0x1014,F
_00076_DS_
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	MOVWF	r0x1012
	CLRF	r0x1011
	BCF	STATUS,0
	RLF	r0x1012,W
	MOVWF	r0x1014
	RLF	r0x1011,W
	MOVWF	r0x1015
	BCF	STATUS,0
	RLF	r0x1014,F
	RLF	r0x1015,F
	BCF	STATUS,0
	RLF	r0x1014,F
	RLF	r0x1015,F
	MOVF	r0x1014,W
	IORWF	r0x1013,F
	MOVF	r0x1015,W
	IORWF	r0x1016,F
;	.line	166; "main.c"	pattern[frame].layer3.led5 << 4 | 
	MOVLW	0x04
	ADDWF	r0x1010,W
	MOVWF	r0x1012
	CLRF	r0x1011
	RLF	r0x1011,F
	MOVF	r0x100F,W
	ADDWF	r0x1011,F
	CLRF	r0x1014
	MOVF	r0x1012,W
	MOVWF	STK01
	MOVF	r0x1011,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	ANDLW	0x10
	BTFSC	STATUS,2
	GOTO	_00077_DS_
	BANKSEL	r0x1014
	INCF	r0x1014,F
_00077_DS_
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	MOVWF	r0x1012
	CLRF	r0x1011
	SWAPF	r0x1011,W
	ANDLW	0xf0
	MOVWF	r0x1015
	SWAPF	r0x1012,W
	MOVWF	r0x1014
	ANDLW	0x0f
	IORWF	r0x1015,F
	XORWF	r0x1014,F
	MOVF	r0x1014,W
	IORWF	r0x1013,F
	MOVF	r0x1015,W
	IORWF	r0x1016,F
;	.line	167; "main.c"	pattern[frame].layer3.led6 << 5 |
	MOVLW	0x04
	ADDWF	r0x1010,W
	MOVWF	r0x1012
	CLRF	r0x1011
	RLF	r0x1011,F
	MOVF	r0x100F,W
	ADDWF	r0x1011,F
	CLRF	r0x1014
	MOVF	r0x1012,W
	MOVWF	STK01
	MOVF	r0x1011,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	ANDLW	0x20
	BTFSC	STATUS,2
	GOTO	_00078_DS_
	BANKSEL	r0x1014
	INCF	r0x1014,F
_00078_DS_
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	MOVWF	r0x1012
	CLRF	r0x1011
	SWAPF	r0x1011,W
	ANDLW	0xf0
	MOVWF	r0x1015
	SWAPF	r0x1012,W
	MOVWF	r0x1014
	ANDLW	0x0f
	IORWF	r0x1015,F
	XORWF	r0x1014,F
	BCF	STATUS,0
	RLF	r0x1014,F
	RLF	r0x1015,F
	MOVF	r0x1014,W
	IORWF	r0x1013,F
	MOVF	r0x1015,W
	IORWF	r0x1016,F
;	.line	168; "main.c"	pattern[frame].layer3.led7 << 6 | 
	MOVLW	0x04
	ADDWF	r0x1010,W
	MOVWF	r0x1012
	CLRF	r0x1011
	RLF	r0x1011,F
	MOVF	r0x100F,W
	ADDWF	r0x1011,F
	CLRF	r0x1014
	MOVF	r0x1012,W
	MOVWF	STK01
	MOVF	r0x1011,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	ANDLW	0x40
	BTFSC	STATUS,2
	GOTO	_00079_DS_
	BANKSEL	r0x1014
	INCF	r0x1014,F
_00079_DS_
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	MOVWF	r0x1012
	CLRF	r0x1011
	SWAPF	r0x1011,W
	ANDLW	0xf0
	MOVWF	r0x1015
	SWAPF	r0x1012,W
	MOVWF	r0x1014
	ANDLW	0x0f
	IORWF	r0x1015,F
	XORWF	r0x1014,F
	BCF	STATUS,0
	RLF	r0x1014,F
	RLF	r0x1015,F
	BCF	STATUS,0
	RLF	r0x1014,F
	RLF	r0x1015,F
	MOVF	r0x1014,W
	IORWF	r0x1013,F
	MOVF	r0x1015,W
	IORWF	r0x1016,F
;	.line	169; "main.c"	pattern[frame].layer3.led8 << 7 | 
	MOVLW	0x04
	ADDWF	r0x1010,W
	MOVWF	r0x1012
	CLRF	r0x1011
	RLF	r0x1011,F
	MOVF	r0x100F,W
	ADDWF	r0x1011,F
	CLRF	r0x1014
	MOVF	r0x1012,W
	MOVWF	STK01
	MOVF	r0x1011,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	ANDLW	0x80
	BTFSC	STATUS,2
	GOTO	_00080_DS_
	BANKSEL	r0x1014
	INCF	r0x1014,F
_00080_DS_
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	MOVWF	r0x1012
	CLRF	r0x1011
	RRF	r0x1011,W
	RRF	r0x1012,W
	MOVWF	r0x1015
	CLRF	r0x1014
	RRF	r0x1014,F
	MOVF	r0x1014,W
	IORWF	r0x1013,F
	MOVF	r0x1015,W
	IORWF	r0x1016,F
;	.line	170; "main.c"	pattern[frame].layer3.led9 << 8;
	MOVLW	0x05
	ADDWF	r0x1010,W
	MOVWF	r0x1012
	CLRF	r0x1011
	RLF	r0x1011,F
	MOVF	r0x100F,W
	ADDWF	r0x1011,F
	CLRF	r0x1014
	MOVF	r0x1012,W
	MOVWF	STK01
	MOVF	r0x1011,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	ANDLW	0x01
	BTFSC	STATUS,2
	GOTO	_00081_DS_
	BANKSEL	r0x1014
	INCF	r0x1014,F
_00081_DS_
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	MOVWF	r0x1015
	MOVWF	r0x1012
	CLRF	r0x1011
;;99	MOVF	r0x1012,W
	CLRF	r0x1014
	MOVF	r0x1013,W
	BANKSEL	_p3
	MOVWF	_p3
	BANKSEL	r0x1015
	MOVF	r0x1015,W
	IORWF	r0x1016,W
	BANKSEL	_p3
	MOVWF	(_p3 + 1)
;	.line	172; "main.c"	delay = pattern[frame].delay;
	MOVLW	0x06
	BANKSEL	r0x1010
	ADDWF	r0x1010,F
	BTFSC	STATUS,0
	INCF	r0x100F,F
	MOVF	r0x1010,W
	MOVWF	STK01
	MOVF	r0x100F,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget2
	CALL	__gptrget2
	PAGESEL	$
	BANKSEL	_timer_isr_delay_1_2
	MOVWF	(_timer_isr_delay_1_2 + 1)
	MOVF	STK00,W
	MOVWF	_timer_isr_delay_1_2
;	.line	173; "main.c"	cnt_t0 = 0;
	BANKSEL	_timer_isr_cnt_t0_1_2
	CLRF	_timer_isr_cnt_t0_1_2
	CLRF	(_timer_isr_cnt_t0_1_2 + 1)
_00108_DS_
;	.line	175; "main.c"	TMR0IF = 0; // clear the flag
	BANKSEL	_INTCONbits
	BCF	_INTCONbits,2
;	.line	176; "main.c"	TMR0IE = 1; // reenable the interrupt
	BSF	_INTCONbits,5
;	.line	177; "main.c"	TMR0 = 6; // reset the timer preset count
	MOVLW	0x06
	MOVWF	_TMR0
	BANKSEL	___sdcc_saved_fsr
	MOVF	___sdcc_saved_fsr,W
	BANKSEL	FSR
	MOVWF	FSR
	MOVF	PSAVE,W
	MOVWF	PCLATH
	CLRF	STATUS
	SWAPF	SSAVE,W
	MOVWF	STATUS
	SWAPF	WSAVE,F
	SWAPF	WSAVE,W
END_OF_INTERRUPT
	RETFIE	

;--------------------------------------------------------
; code
;--------------------------------------------------------
code_main	code
;***
;  pBlock Stats: dbName = M
;***
;entry:  _main	;Function start
; 2 exit points
;has an exit
;2 compiler assigned registers:
;   r0x100D
;   r0x100E
;; Starting pCode block
_main	;Function start
; 2 exit points
;	.line	184; "main.c"	IRCF0 = 1; // 8 MHz internal clock
	BANKSEL	_OSCCONbits
	BSF	_OSCCONbits,4
;	.line	185; "main.c"	IRCF1 = 1;
	BSF	_OSCCONbits,5
;	.line	186; "main.c"	IRCF2 = 1;
	BSF	_OSCCONbits,6
;	.line	189; "main.c"	T0CS = 0; // bit 5 TMR0 Clock Source Select bit...0 = Internal Clock (CLKO) 1 = Transition on T0CKI pin
	BCF	_OPTION_REGbits,5
;	.line	190; "main.c"	T0SE = 0; // bit 4 TMR0 Source Edge Select bit 0 = low/high 1 = high/low
	BCF	_OPTION_REGbits,4
;	.line	191; "main.c"	PSA = 0; // bit 3  Prescaler Assignment bit...0 = Prescaler is assigned to the Timer0
	BCF	_OPTION_REGbits,3
;	.line	192; "main.c"	PS2 = 0; // bits 2-0  PS2:PS0: Prescaler Rate Select bits
	BCF	_OPTION_REGbits,2
;	.line	193; "main.c"	PS1 = 1;
	BSF	_OPTION_REGbits,1
;	.line	194; "main.c"	PS0 = 0;
	BCF	_OPTION_REGbits,0
;	.line	195; "main.c"	TMR0 = 6; // preset for timer register
	MOVLW	0x06
	BANKSEL	_TMR0
	MOVWF	_TMR0
;	.line	198; "main.c"	INTCON = 0; // clear the interrupt control register
	CLRF	_INTCON
;	.line	199; "main.c"	TMR0IE = 1; // bit5 TMR0 Overflow Interrupt Enable bit...1 = Enables the TMR0 interrupt
	BSF	_INTCONbits,5
;	.line	200; "main.c"	TMR0IF = 0; // bit2 clear timer 0 interrupt flag
	BCF	_INTCONbits,2
;	.line	201; "main.c"	GIE = 1; // bit7 global interrupt enable
	BSF	_INTCONbits,7
;	.line	203; "main.c"	ANSEL = 0; // digital io
	BANKSEL	_ANSEL
	CLRF	_ANSEL
;	.line	204; "main.c"	TRISA = 0b00000000; // all output
	CLRF	_TRISA
;	.line	205; "main.c"	TRISB = 0b00000000; // all output
	CLRF	_TRISB
;	.line	207; "main.c"	LED1 = 0;
	BANKSEL	_PORTBbits
	BCF	_PORTBbits,1
;	.line	208; "main.c"	LED2 = 0;
	BCF	_PORTBbits,0
;	.line	209; "main.c"	LED4 = 0;
	BCF	_PORTBbits,2
;	.line	210; "main.c"	LED5 = 0;
	BCF	_PORTBbits,7
;	.line	211; "main.c"	LED6 = 0;
	BCF	_PORTBbits,6
;	.line	212; "main.c"	LED7 = 0;
	BCF	_PORTBbits,3
;	.line	213; "main.c"	LED8 = 0;
	BCF	_PORTBbits,4
;	.line	214; "main.c"	LED9 = 0;
	BCF	_PORTBbits,5
;	.line	215; "main.c"	LED3 = 0;
	BCF	_PORTAbits,6
;	.line	216; "main.c"	LAYER1 = 0;
	BCF	_PORTAbits,2
;	.line	217; "main.c"	LAYER2 = 0;
	BCF	_PORTAbits,3
;	.line	218; "main.c"	LAYER3 = 0;
	BCF	_PORTAbits,4
_00123_DS_
;	.line	235; "main.c"	LAYER1 = 1;
	BANKSEL	_PORTAbits
	BSF	_PORTAbits,2
;	.line	236; "main.c"	LAYER2 = 0;
	BCF	_PORTAbits,3
;	.line	237; "main.c"	LAYER3 = 0;
	BCF	_PORTAbits,4
;	.line	238; "main.c"	LED1 = BIT_IS_SET(p1,0);
	BANKSEL	_p1
	MOVF	_p1,W
	ANDLW	0x01
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVWF	r0x100E
	RRF	r0x100E,W
	BTFSC	STATUS,0
	GOTO	_00001_DS_
	BANKSEL	_PORTBbits
	BCF	_PORTBbits,1
_00001_DS_
	BTFSS	STATUS,0
	GOTO	_00002_DS_
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,1
_00002_DS_
;	.line	239; "main.c"	LED2 = BIT_IS_SET(p1,1);
	BANKSEL	_p1
	MOVF	_p1,W
	ANDLW	0x02
	BTFSS	STATUS,2
	MOVLW	0x01
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVWF	r0x100E
	RRF	r0x100E,W
	BTFSC	STATUS,0
	GOTO	_00003_DS_
	BANKSEL	_PORTBbits
	BCF	_PORTBbits,0
_00003_DS_
	BTFSS	STATUS,0
	GOTO	_00004_DS_
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,0
_00004_DS_
;	.line	240; "main.c"	LED3 = BIT_IS_SET(p1,2);
	BANKSEL	_p1
	MOVF	_p1,W
	ANDLW	0x04
	BTFSS	STATUS,2
	MOVLW	0x01
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVWF	r0x100E
	RRF	r0x100E,W
	BTFSC	STATUS,0
	GOTO	_00005_DS_
	BANKSEL	_PORTAbits
	BCF	_PORTAbits,6
_00005_DS_
	BTFSS	STATUS,0
	GOTO	_00006_DS_
	BANKSEL	_PORTAbits
	BSF	_PORTAbits,6
_00006_DS_
;	.line	241; "main.c"	LED4 = BIT_IS_SET(p1,3);
	BANKSEL	_p1
	MOVF	_p1,W
	ANDLW	0x08
	BTFSS	STATUS,2
	MOVLW	0x01
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVWF	r0x100E
	RRF	r0x100E,W
	BTFSC	STATUS,0
	GOTO	_00007_DS_
	BANKSEL	_PORTBbits
	BCF	_PORTBbits,2
_00007_DS_
	BTFSS	STATUS,0
	GOTO	_00008_DS_
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,2
_00008_DS_
;	.line	242; "main.c"	LED5 = BIT_IS_SET(p1,4);
	BANKSEL	_p1
	MOVF	_p1,W
	ANDLW	0x10
	BTFSS	STATUS,2
	MOVLW	0x01
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVWF	r0x100E
	RRF	r0x100E,W
	BTFSC	STATUS,0
	GOTO	_00009_DS_
	BANKSEL	_PORTBbits
	BCF	_PORTBbits,7
_00009_DS_
	BTFSS	STATUS,0
	GOTO	_00010_DS_
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,7
_00010_DS_
;	.line	243; "main.c"	LED6 = BIT_IS_SET(p1,5);
	BANKSEL	_p1
	MOVF	_p1,W
	ANDLW	0x20
	BTFSS	STATUS,2
	MOVLW	0x01
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVWF	r0x100E
	RRF	r0x100E,W
	BTFSC	STATUS,0
	GOTO	_00011_DS_
	BANKSEL	_PORTBbits
	BCF	_PORTBbits,6
_00011_DS_
	BTFSS	STATUS,0
	GOTO	_00012_DS_
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,6
_00012_DS_
;	.line	244; "main.c"	LED7 = BIT_IS_SET(p1,6);
	BANKSEL	_p1
	MOVF	_p1,W
	ANDLW	0x40
	BTFSS	STATUS,2
	MOVLW	0x01
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVWF	r0x100E
	RRF	r0x100E,W
	BTFSC	STATUS,0
	GOTO	_00013_DS_
	BANKSEL	_PORTBbits
	BCF	_PORTBbits,3
_00013_DS_
	BTFSS	STATUS,0
	GOTO	_00014_DS_
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,3
_00014_DS_
;	.line	245; "main.c"	LED8 = BIT_IS_SET(p1,7);
	BANKSEL	_p1
	MOVF	_p1,W
	ANDLW	0x80
	BTFSS	STATUS,2
	MOVLW	0x01
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVWF	r0x100E
	RRF	r0x100E,W
	BTFSC	STATUS,0
	GOTO	_00015_DS_
	BANKSEL	_PORTBbits
	BCF	_PORTBbits,4
_00015_DS_
	BTFSS	STATUS,0
	GOTO	_00016_DS_
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,4
_00016_DS_
;	.line	246; "main.c"	LED9 = BIT_IS_SET(p1,8);
	BANKSEL	_p1
	MOVF	(_p1 + 1),W
	ANDLW	0x01
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVWF	r0x100E
	RRF	r0x100E,W
	BTFSC	STATUS,0
	GOTO	_00017_DS_
	BANKSEL	_PORTBbits
	BCF	_PORTBbits,5
_00017_DS_
	BTFSS	STATUS,0
	GOTO	_00018_DS_
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,5
_00018_DS_
;	.line	248; "main.c"	LAYER1 = 0;
	BANKSEL	_PORTAbits
	BCF	_PORTAbits,2
;	.line	249; "main.c"	LAYER2 = 1;
	BSF	_PORTAbits,3
;	.line	250; "main.c"	LAYER3 = 0;
	BCF	_PORTAbits,4
;	.line	251; "main.c"	LED1 = BIT_IS_SET(p2,0);
	BANKSEL	_p2
	MOVF	_p2,W
	ANDLW	0x01
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVWF	r0x100E
	RRF	r0x100E,W
	BTFSC	STATUS,0
	GOTO	_00019_DS_
	BANKSEL	_PORTBbits
	BCF	_PORTBbits,1
_00019_DS_
	BTFSS	STATUS,0
	GOTO	_00020_DS_
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,1
_00020_DS_
;	.line	252; "main.c"	LED2 = BIT_IS_SET(p2,1);
	BANKSEL	_p2
	MOVF	_p2,W
	ANDLW	0x02
	BTFSS	STATUS,2
	MOVLW	0x01
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVWF	r0x100E
	RRF	r0x100E,W
	BTFSC	STATUS,0
	GOTO	_00021_DS_
	BANKSEL	_PORTBbits
	BCF	_PORTBbits,0
_00021_DS_
	BTFSS	STATUS,0
	GOTO	_00022_DS_
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,0
_00022_DS_
;	.line	253; "main.c"	LED3 = BIT_IS_SET(p2,2);
	BANKSEL	_p2
	MOVF	_p2,W
	ANDLW	0x04
	BTFSS	STATUS,2
	MOVLW	0x01
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVWF	r0x100E
	RRF	r0x100E,W
	BTFSC	STATUS,0
	GOTO	_00023_DS_
	BANKSEL	_PORTAbits
	BCF	_PORTAbits,6
_00023_DS_
	BTFSS	STATUS,0
	GOTO	_00024_DS_
	BANKSEL	_PORTAbits
	BSF	_PORTAbits,6
_00024_DS_
;	.line	254; "main.c"	LED4 = BIT_IS_SET(p2,3);
	BANKSEL	_p2
	MOVF	_p2,W
	ANDLW	0x08
	BTFSS	STATUS,2
	MOVLW	0x01
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVWF	r0x100E
	RRF	r0x100E,W
	BTFSC	STATUS,0
	GOTO	_00025_DS_
	BANKSEL	_PORTBbits
	BCF	_PORTBbits,2
_00025_DS_
	BTFSS	STATUS,0
	GOTO	_00026_DS_
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,2
_00026_DS_
;	.line	255; "main.c"	LED5 = BIT_IS_SET(p2,4);
	BANKSEL	_p2
	MOVF	_p2,W
	ANDLW	0x10
	BTFSS	STATUS,2
	MOVLW	0x01
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVWF	r0x100E
	RRF	r0x100E,W
	BTFSC	STATUS,0
	GOTO	_00027_DS_
	BANKSEL	_PORTBbits
	BCF	_PORTBbits,7
_00027_DS_
	BTFSS	STATUS,0
	GOTO	_00028_DS_
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,7
_00028_DS_
;	.line	256; "main.c"	LED6 = BIT_IS_SET(p2,5);
	BANKSEL	_p2
	MOVF	_p2,W
	ANDLW	0x20
	BTFSS	STATUS,2
	MOVLW	0x01
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVWF	r0x100E
	RRF	r0x100E,W
	BTFSC	STATUS,0
	GOTO	_00029_DS_
	BANKSEL	_PORTBbits
	BCF	_PORTBbits,6
_00029_DS_
	BTFSS	STATUS,0
	GOTO	_00030_DS_
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,6
_00030_DS_
;	.line	257; "main.c"	LED7 = BIT_IS_SET(p2,6);
	BANKSEL	_p2
	MOVF	_p2,W
	ANDLW	0x40
	BTFSS	STATUS,2
	MOVLW	0x01
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVWF	r0x100E
	RRF	r0x100E,W
	BTFSC	STATUS,0
	GOTO	_00031_DS_
	BANKSEL	_PORTBbits
	BCF	_PORTBbits,3
_00031_DS_
	BTFSS	STATUS,0
	GOTO	_00032_DS_
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,3
_00032_DS_
;	.line	258; "main.c"	LED8 = BIT_IS_SET(p2,7);
	BANKSEL	_p2
	MOVF	_p2,W
	ANDLW	0x80
	BTFSS	STATUS,2
	MOVLW	0x01
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVWF	r0x100E
	RRF	r0x100E,W
	BTFSC	STATUS,0
	GOTO	_00033_DS_
	BANKSEL	_PORTBbits
	BCF	_PORTBbits,4
_00033_DS_
	BTFSS	STATUS,0
	GOTO	_00034_DS_
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,4
_00034_DS_
;	.line	259; "main.c"	LED9 = BIT_IS_SET(p2,8);
	BANKSEL	_p2
	MOVF	(_p2 + 1),W
	ANDLW	0x01
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVWF	r0x100E
	RRF	r0x100E,W
	BTFSC	STATUS,0
	GOTO	_00035_DS_
	BANKSEL	_PORTBbits
	BCF	_PORTBbits,5
_00035_DS_
	BTFSS	STATUS,0
	GOTO	_00036_DS_
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,5
_00036_DS_
;	.line	261; "main.c"	LAYER1 = 0;
	BANKSEL	_PORTAbits
	BCF	_PORTAbits,2
;	.line	262; "main.c"	LAYER2 = 0;
	BCF	_PORTAbits,3
;	.line	263; "main.c"	LAYER3 = 1;
	BSF	_PORTAbits,4
;	.line	264; "main.c"	LED1 = BIT_IS_SET(p3,0);
	BANKSEL	_p3
	MOVF	_p3,W
	ANDLW	0x01
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVWF	r0x100E
	RRF	r0x100E,W
	BTFSC	STATUS,0
	GOTO	_00037_DS_
	BANKSEL	_PORTBbits
	BCF	_PORTBbits,1
_00037_DS_
	BTFSS	STATUS,0
	GOTO	_00038_DS_
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,1
_00038_DS_
;	.line	265; "main.c"	LED2 = BIT_IS_SET(p3,1);
	BANKSEL	_p3
	MOVF	_p3,W
	ANDLW	0x02
	BTFSS	STATUS,2
	MOVLW	0x01
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVWF	r0x100E
	RRF	r0x100E,W
	BTFSC	STATUS,0
	GOTO	_00039_DS_
	BANKSEL	_PORTBbits
	BCF	_PORTBbits,0
_00039_DS_
	BTFSS	STATUS,0
	GOTO	_00040_DS_
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,0
_00040_DS_
;	.line	266; "main.c"	LED3 = BIT_IS_SET(p3,2);
	BANKSEL	_p3
	MOVF	_p3,W
	ANDLW	0x04
	BTFSS	STATUS,2
	MOVLW	0x01
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVWF	r0x100E
	RRF	r0x100E,W
	BTFSC	STATUS,0
	GOTO	_00041_DS_
	BANKSEL	_PORTAbits
	BCF	_PORTAbits,6
_00041_DS_
	BTFSS	STATUS,0
	GOTO	_00042_DS_
	BANKSEL	_PORTAbits
	BSF	_PORTAbits,6
_00042_DS_
;	.line	267; "main.c"	LED4 = BIT_IS_SET(p3,3);
	BANKSEL	_p3
	MOVF	_p3,W
	ANDLW	0x08
	BTFSS	STATUS,2
	MOVLW	0x01
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVWF	r0x100E
	RRF	r0x100E,W
	BTFSC	STATUS,0
	GOTO	_00043_DS_
	BANKSEL	_PORTBbits
	BCF	_PORTBbits,2
_00043_DS_
	BTFSS	STATUS,0
	GOTO	_00044_DS_
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,2
_00044_DS_
;	.line	268; "main.c"	LED5 = BIT_IS_SET(p3,4);
	BANKSEL	_p3
	MOVF	_p3,W
	ANDLW	0x10
	BTFSS	STATUS,2
	MOVLW	0x01
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVWF	r0x100E
	RRF	r0x100E,W
	BTFSC	STATUS,0
	GOTO	_00045_DS_
	BANKSEL	_PORTBbits
	BCF	_PORTBbits,7
_00045_DS_
	BTFSS	STATUS,0
	GOTO	_00046_DS_
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,7
_00046_DS_
;	.line	269; "main.c"	LED6 = BIT_IS_SET(p3,5);
	BANKSEL	_p3
	MOVF	_p3,W
	ANDLW	0x20
	BTFSS	STATUS,2
	MOVLW	0x01
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVWF	r0x100E
	RRF	r0x100E,W
	BTFSC	STATUS,0
	GOTO	_00047_DS_
	BANKSEL	_PORTBbits
	BCF	_PORTBbits,6
_00047_DS_
	BTFSS	STATUS,0
	GOTO	_00048_DS_
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,6
_00048_DS_
;	.line	270; "main.c"	LED7 = BIT_IS_SET(p3,6);
	BANKSEL	_p3
	MOVF	_p3,W
	ANDLW	0x40
	BTFSS	STATUS,2
	MOVLW	0x01
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVWF	r0x100E
	RRF	r0x100E,W
	BTFSC	STATUS,0
	GOTO	_00049_DS_
	BANKSEL	_PORTBbits
	BCF	_PORTBbits,3
_00049_DS_
	BTFSS	STATUS,0
	GOTO	_00050_DS_
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,3
_00050_DS_
;	.line	271; "main.c"	LED8 = BIT_IS_SET(p3,7);
	BANKSEL	_p3
	MOVF	_p3,W
	ANDLW	0x80
	BTFSS	STATUS,2
	MOVLW	0x01
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVWF	r0x100E
	RRF	r0x100E,W
	BTFSC	STATUS,0
	GOTO	_00051_DS_
	BANKSEL	_PORTBbits
	BCF	_PORTBbits,4
_00051_DS_
	BTFSS	STATUS,0
	GOTO	_00052_DS_
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,4
_00052_DS_
;	.line	272; "main.c"	LED9 = BIT_IS_SET(p3,8);
	BANKSEL	_p3
	MOVF	(_p3 + 1),W
	ANDLW	0x01
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVWF	r0x100E
	RRF	r0x100E,W
	BTFSC	STATUS,0
	GOTO	_00053_DS_
	BANKSEL	_PORTBbits
	BCF	_PORTBbits,5
_00053_DS_
	BTFSS	STATUS,0
	GOTO	_00054_DS_
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,5
_00054_DS_
	GOTO	_00123_DS_
	RETURN	
; exit point of _main


;	code size estimation:
;	 1305+  260 =  1565 instructions ( 3650 byte)

	end
