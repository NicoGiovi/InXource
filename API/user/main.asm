;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9516 (MINGW64)
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f4550
	radix	dec


;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global	__currline
	global	__initialized
	global	__displaymode
	global	__rw_pin
	global	__cpu_clock_
	global	_ep_bdt
	global	_TXBuffer
	global	_RXbuffer
	global	_usbrx
	global	_usbwp
	global	_usbrp
	global	_ep2_num_bytes_to_send
	global	_ep2_source_data
	global	__rs_pin
	global	__enable_pin
	global	__data_pins
	global	__displayfunction
	global	__displaycontrol
	global	__numlines
	global	_receivedbyte
	global	_buffer
	global	_usb_init
	global	_usbavailable
	global	_epapin_init
	global	_prepare_ep2_in
	global	_usbsend
	global	_epap_in
	global	_usbread
	global	_usbreceive
	global	_epap_out
	global	_epapout_init
	global	_usb_interrupt
	global	_usbputs
	global	_usbgets
	global	_BULK_write
	global	_BULK_read
	global	_BULK_available
	global	_pinmode
	global	_System_readFlashMemory
	global	_System_getCpuFrequency
	global	_Delayms
	global	_Delayus
	global	_digitalwrite
	global	_lcd_pulseEnable
	global	_lcd_write4bits
	global	_lcd_write8bits
	global	_lcd_send
	global	_lcd_write
	global	_lcd_command
	global	_lcd_setCursor
	global	_lcd_print
	global	_lcd_clear
	global	_lcd_noDisplay
	global	_lcd_display
	global	_lcd_blink
	global	_lcd_begin
	global	_lcd_init
	global	_lcd_pins
	global	_IO_init
	global	_IO_digital
	global	_setup
	global	_loop
	global	_pinguino_main
	global	_high_priority_isr
	global	_low_priority_isr
	global	_mask
	global	_port

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern	__gptrput1
	extern	__gptrget1
	extern	_SPPCFGbits
	extern	_SPPEPSbits
	extern	_SPPCONbits
	extern	_UFRMLbits
	extern	_UFRMHbits
	extern	_UIRbits
	extern	_UIEbits
	extern	_UEIRbits
	extern	_UEIEbits
	extern	_USTATbits
	extern	_UCONbits
	extern	_UADDRbits
	extern	_UCFGbits
	extern	_UEP0bits
	extern	_UEP1bits
	extern	_UEP2bits
	extern	_UEP3bits
	extern	_UEP4bits
	extern	_UEP5bits
	extern	_UEP6bits
	extern	_UEP7bits
	extern	_UEP8bits
	extern	_UEP9bits
	extern	_UEP10bits
	extern	_UEP11bits
	extern	_UEP12bits
	extern	_UEP13bits
	extern	_UEP14bits
	extern	_UEP15bits
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_PORTCbits
	extern	_PORTDbits
	extern	_PORTEbits
	extern	_LATAbits
	extern	_LATBbits
	extern	_LATCbits
	extern	_LATDbits
	extern	_LATEbits
	extern	_DDRAbits
	extern	_TRISAbits
	extern	_DDRBbits
	extern	_TRISBbits
	extern	_DDRCbits
	extern	_TRISCbits
	extern	_DDRDbits
	extern	_TRISDbits
	extern	_DDREbits
	extern	_TRISEbits
	extern	_OSCTUNEbits
	extern	_PIE1bits
	extern	_PIR1bits
	extern	_IPR1bits
	extern	_PIE2bits
	extern	_PIR2bits
	extern	_IPR2bits
	extern	_EECON1bits
	extern	_RCSTAbits
	extern	_TXSTAbits
	extern	_T3CONbits
	extern	_CMCONbits
	extern	_CVRCONbits
	extern	_CCP1ASbits
	extern	_ECCP1ASbits
	extern	_CCP1DELbits
	extern	_ECCP1DELbits
	extern	_BAUDCONbits
	extern	_BAUDCTLbits
	extern	_CCP2CONbits
	extern	_CCP1CONbits
	extern	_ECCP1CONbits
	extern	_ADCON2bits
	extern	_ADCON1bits
	extern	_ADCON0bits
	extern	_SSPCON2bits
	extern	_SSPCON1bits
	extern	_SSPSTATbits
	extern	_T2CONbits
	extern	_T1CONbits
	extern	_RCONbits
	extern	_WDTCONbits
	extern	_HLVDCONbits
	extern	_LVDCONbits
	extern	_OSCCONbits
	extern	_T0CONbits
	extern	_STATUSbits
	extern	_INTCON3bits
	extern	_INTCON2bits
	extern	_INTCONbits
	extern	_STKPTRbits
	extern	_SPPDATA
	extern	_SPPCFG
	extern	_SPPEPS
	extern	_SPPCON
	extern	_UFRM
	extern	_UFRML
	extern	_UFRMH
	extern	_UIR
	extern	_UIE
	extern	_UEIR
	extern	_UEIE
	extern	_USTAT
	extern	_UCON
	extern	_UADDR
	extern	_UCFG
	extern	_UEP0
	extern	_UEP1
	extern	_UEP2
	extern	_UEP3
	extern	_UEP4
	extern	_UEP5
	extern	_UEP6
	extern	_UEP7
	extern	_UEP8
	extern	_UEP9
	extern	_UEP10
	extern	_UEP11
	extern	_UEP12
	extern	_UEP13
	extern	_UEP14
	extern	_UEP15
	extern	_PORTA
	extern	_PORTB
	extern	_PORTC
	extern	_PORTD
	extern	_PORTE
	extern	_LATA
	extern	_LATB
	extern	_LATC
	extern	_LATD
	extern	_LATE
	extern	_DDRA
	extern	_TRISA
	extern	_DDRB
	extern	_TRISB
	extern	_DDRC
	extern	_TRISC
	extern	_DDRD
	extern	_TRISD
	extern	_DDRE
	extern	_TRISE
	extern	_OSCTUNE
	extern	_PIE1
	extern	_PIR1
	extern	_IPR1
	extern	_PIE2
	extern	_PIR2
	extern	_IPR2
	extern	_EECON1
	extern	_EECON2
	extern	_EEDATA
	extern	_EEADR
	extern	_RCSTA
	extern	_TXSTA
	extern	_TXREG
	extern	_RCREG
	extern	_SPBRG
	extern	_SPBRGH
	extern	_T3CON
	extern	_TMR3
	extern	_TMR3L
	extern	_TMR3H
	extern	_CMCON
	extern	_CVRCON
	extern	_CCP1AS
	extern	_ECCP1AS
	extern	_CCP1DEL
	extern	_ECCP1DEL
	extern	_BAUDCON
	extern	_BAUDCTL
	extern	_CCP2CON
	extern	_CCPR2
	extern	_CCPR2L
	extern	_CCPR2H
	extern	_CCP1CON
	extern	_ECCP1CON
	extern	_CCPR1
	extern	_CCPR1L
	extern	_CCPR1H
	extern	_ADCON2
	extern	_ADCON1
	extern	_ADCON0
	extern	_ADRES
	extern	_ADRESL
	extern	_ADRESH
	extern	_SSPCON2
	extern	_SSPCON1
	extern	_SSPSTAT
	extern	_SSPADD
	extern	_SSPBUF
	extern	_T2CON
	extern	_PR2
	extern	_TMR2
	extern	_T1CON
	extern	_TMR1
	extern	_TMR1L
	extern	_TMR1H
	extern	_RCON
	extern	_WDTCON
	extern	_HLVDCON
	extern	_LVDCON
	extern	_OSCCON
	extern	_T0CON
	extern	_TMR0
	extern	_TMR0L
	extern	_TMR0H
	extern	_STATUS
	extern	_FSR2L
	extern	_FSR2H
	extern	_PLUSW2
	extern	_PREINC2
	extern	_POSTDEC2
	extern	_POSTINC2
	extern	_INDF2
	extern	_BSR
	extern	_FSR1L
	extern	_FSR1H
	extern	_PLUSW1
	extern	_PREINC1
	extern	_POSTDEC1
	extern	_POSTINC1
	extern	_INDF1
	extern	_WREG
	extern	_FSR0L
	extern	_FSR0H
	extern	_PLUSW0
	extern	_PREINC0
	extern	_POSTDEC0
	extern	_POSTINC0
	extern	_INDF0
	extern	_INTCON3
	extern	_INTCON2
	extern	_INTCON
	extern	_PROD
	extern	_PRODL
	extern	_PRODH
	extern	_TABLAT
	extern	_TBLPTR
	extern	_TBLPTRL
	extern	_TBLPTRH
	extern	_TBLPTRU
	extern	_PC
	extern	_PCL
	extern	_PCLATH
	extern	_PCLATU
	extern	_STKPTR
	extern	_TOS
	extern	_TOSL
	extern	_TOSH
	extern	_TOSU
	extern	_dispatch_usb_event
	extern	_fill_in_buffer
	extern	__divslong
	extern	__divulong
	extern	__mulint
	extern	_delay100tcy

;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
PCL	equ	0xff9
PCLATH	equ	0xffa
PCLATU	equ	0xffb
WREG	equ	0xfe8
BSR	equ	0xfe0
TBLPTRL	equ	0xff6
TBLPTRH	equ	0xff7
TBLPTRU	equ	0xff8
TABLAT	equ	0xff5
FSR0L	equ	0xfe9
FSR0H	equ	0xfea
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
INDF0	equ	0xfef
POSTINC1	equ	0xfe6
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb
PRODL	equ	0xff3
PRODH	equ	0xff4


	idata
__rs_pin	db	0x08
__rw_pin	db	0xff
__enable_pin	db	0x09


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1
r0x02	res	1
r0x03	res	1
r0x04	res	1
r0x05	res	1
r0x06	res	1
r0x07	res	1
r0x08	res	1
r0x09	res	1
r0x0a	res	1
r0x0b	res	1
r0x0c	res	1
r0x0d	res	1


usb_buf	udata
_TXBuffer	res	64
_RXbuffer	res	64

udata_main_0	udata
_last_send_was_null	res	1

udata_main_1	udata
__cpu_clock_	res	4

udata_main_2	udata
__displaymode	res	1

udata_main_3	udata
__initialized	res	1

udata_main_4	udata
__currline	res	1

udata_main_5	udata
_usbwp	res	1

udata_main_6	udata
_usbrp	res	1

udata_main_7	udata
_ep2_num_bytes_to_send	res	2

udata_main_8	udata
_ep2_source_data	res	3

udata_main_9	udata
_usbrx	res	64

udata_main_10	udata
__data_pins	res	8

udata_main_11	udata
__displayfunction	res	1

udata_main_12	udata
_lcd_setCursor_row_offsets_1_104	res	4

udata_main_13	udata
__numlines	res	1

udata_main_14	udata
__displaycontrol	res	1

udata_main_15	udata
_receivedbyte	res	1

udata_main_16	udata
_buffer	res	64


ustat_main_00	udata	0X0400
_ep_bdt        	res	128

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; ; Starting pCode block
S_main__high_priority_isr	code	0X002020
_high_priority_isr:
;	.line	438; F:\OneDrive\API_PINGUINO_18F4550\API\user\main.c	void high_priority_isr(void) __interrupt 1
	MOVFF	STATUS, POSTDEC1
	MOVFF	BSR, POSTDEC1
	MOVWF	POSTDEC1
	MOVFF	PRODL, POSTDEC1
	MOVFF	PRODH, POSTDEC1
	MOVFF	FSR0L, POSTDEC1
	MOVFF	FSR0H, POSTDEC1
	MOVFF	PCLATH, POSTDEC1
	MOVFF	PCLATU, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	_TBLPTRL, POSTDEC1
	MOVFF	_TBLPTRH, POSTDEC1
	MOVFF	_TBLPTRU, POSTDEC1
	MOVFF	_TABLAT, POSTDEC1
	
;	.line	459; F:\OneDrive\API_PINGUINO_18F4550\API\user\main.c	usb_interrupt();
	CALL	_usb_interrupt
	MOVFF	PREINC1, _TABLAT
	MOVFF	PREINC1, _TBLPTRU
	MOVFF	PREINC1, _TBLPTRH
	MOVFF	PREINC1, _TBLPTRL
	
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, PCLATU
	MOVFF	PREINC1, PCLATH
	MOVFF	PREINC1, FSR0H
	MOVFF	PREINC1, FSR0L
	MOVFF	PREINC1, PRODH
	MOVFF	PREINC1, PRODL
	MOVF	PREINC1, W
	MOVFF	PREINC1, BSR
	MOVFF	PREINC1, STATUS
	RETFIE	

; ; Starting pCode block for absolute section
; ;-----------------------------------------
S_main_ivec_0x1_high_priority_isr	code	0X000008
ivec_0x1_high_priority_isr:
	GOTO	_high_priority_isr

; ; Starting pCode block
S_main__low_priority_isr	code	0X004000
_low_priority_isr:
;	.line	535; F:\OneDrive\API_PINGUINO_18F4550\API\user\main.c	void low_priority_isr(void) __interrupt 2
	MOVFF	STATUS, POSTDEC1
	MOVFF	BSR, POSTDEC1
	MOVWF	POSTDEC1
	MOVFF	PRODL, POSTDEC1
	MOVFF	PRODH, POSTDEC1
	MOVFF	FSR0L, POSTDEC1
	MOVFF	FSR0H, POSTDEC1
	MOVFF	PCLATH, POSTDEC1
	MOVFF	PCLATU, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	_TBLPTRL, POSTDEC1
	MOVFF	_TBLPTRH, POSTDEC1
	MOVFF	_TBLPTRU, POSTDEC1
	MOVFF	_TABLAT, POSTDEC1
	
	MOVFF	PREINC1, _TABLAT
	MOVFF	PREINC1, _TBLPTRU
	MOVFF	PREINC1, _TBLPTRH
	MOVFF	PREINC1, _TBLPTRL
	
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, PCLATU
	MOVFF	PREINC1, PCLATH
	MOVFF	PREINC1, FSR0H
	MOVFF	PREINC1, FSR0L
	MOVFF	PREINC1, PRODH
	MOVFF	PREINC1, PRODL
	MOVF	PREINC1, W
	MOVFF	PREINC1, BSR
	MOVFF	PREINC1, STATUS
	RETFIE	

; ; Starting pCode block for absolute section
; ;-----------------------------------------
S_main_ivec_0x2_low_priority_isr	code	0X000018
ivec_0x2_low_priority_isr:
	GOTO	_low_priority_isr

; I code from now on!
; ; Starting pCode block
S_main__pinguino_main	code
_pinguino_main:
;	.line	149; F:\OneDrive\API_PINGUINO_18F4550\API\user\main.c	if (RCONbits.NOT_POR == 0)
	BTFSC	_RCONbits, 1
	BRA	_00673_DS_
;	.line	151; F:\OneDrive\API_PINGUINO_18F4550\API\user\main.c	RCON |= 0b10010011;         // set all reset flag
	MOVLW	0x93
	IORWF	_RCON, F
_00673_DS_:
;	.line	197; F:\OneDrive\API_PINGUINO_18F4550\API\user\main.c	if (OSCCONbits.SCS > 0x01)
	MOVF	_OSCCONbits, W
	ANDLW	0x03
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	ADDLW	0x80
	ADDLW	0x7e
	BNC	_00678_DS_
_00674_DS_:
;	.line	199; F:\OneDrive\API_PINGUINO_18F4550\API\user\main.c	while (!OSCCONbits.IOFS);
	BTFSS	_OSCCONbits, 2
	BRA	_00674_DS_
_00678_DS_:
;	.line	243; F:\OneDrive\API_PINGUINO_18F4550\API\user\main.c	IO_init();
	CALL	_IO_init
;	.line	244; F:\OneDrive\API_PINGUINO_18F4550\API\user\main.c	IO_digital();
	CALL	_IO_digital
;	.line	260; F:\OneDrive\API_PINGUINO_18F4550\API\user\main.c	usb_init();
	CALL	_usb_init
;	.line	300; F:\OneDrive\API_PINGUINO_18F4550\API\user\main.c	setup();
	CALL	_setup
_00680_DS_:
;	.line	327; F:\OneDrive\API_PINGUINO_18F4550\API\user\main.c	loop();
	CALL	_loop
	BRA	_00680_DS_
	RETURN	

; ; Starting pCode block
S_main__loop	code
_loop:
;	.line	19; F:\OneDrive\API_PINGUINO_18F4550\API\user\/user.c	void loop()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	BANKSEL	_receivedbyte
;	.line	21; F:\OneDrive\API_PINGUINO_18F4550\API\user\/user.c	receivedbyte=0;
	CLRF	_receivedbyte, B
;	.line	22; F:\OneDrive\API_PINGUINO_18F4550\API\user\/user.c	if(BULK_available())
	CALL	_BULK_available
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_00667_DS_
;	.line	24; F:\OneDrive\API_PINGUINO_18F4550\API\user\/user.c	receivedbyte =BULK_read(buffer);
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_buffer)
	MOVWF	POSTDEC1
	MOVLW	LOW(_buffer)
	MOVWF	POSTDEC1
	CALL	_BULK_read
	BANKSEL	_receivedbyte
	MOVWF	_receivedbyte, B
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	25; F:\OneDrive\API_PINGUINO_18F4550\API\user\/user.c	buffer[receivedbyte] = 0;
	MOVLW	LOW(_buffer)
; removed redundant BANKSEL
	ADDWF	_receivedbyte, W, B
	MOVWF	r0x00
	CLRF	r0x01
	MOVLW	HIGH(_buffer)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	CLRF	INDF0
; removed redundant BANKSEL
;	.line	26; F:\OneDrive\API_PINGUINO_18F4550\API\user\/user.c	if (receivedbyte > 0)
	MOVF	_receivedbyte, W, B
	BZ	_00667_DS_
;	.line	28; F:\OneDrive\API_PINGUINO_18F4550\API\user\/user.c	lcd_clear();
	CALL	_lcd_clear
;	.line	29; F:\OneDrive\API_PINGUINO_18F4550\API\user\/user.c	lcd_print(buffer);
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_buffer)
	MOVWF	POSTDEC1
	MOVLW	LOW(_buffer)
	MOVWF	POSTDEC1
	CALL	_lcd_print
	MOVLW	0x03
	ADDWF	FSR1L, F
_00667_DS_:
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__setup	code
_setup:
;	.line	5; F:\OneDrive\API_PINGUINO_18F4550\API\user\/user.c	lcd_pins(0, 1, 2, 3, 4, 5, 0, 0, 0, 0); 
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x05
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	_lcd_pins
	MOVLW	0x0a
	ADDWF	FSR1L, F
;	.line	6; F:\OneDrive\API_PINGUINO_18F4550\API\user\/user.c	lcd_begin(16, 2);
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	_lcd_begin
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	8; F:\OneDrive\API_PINGUINO_18F4550\API\user\/user.c	pinmode(13, OUTPUT);
	CLRF	POSTDEC1
	MOVLW	0x0d
	MOVWF	POSTDEC1
	CALL	_pinmode
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	10; F:\OneDrive\API_PINGUINO_18F4550\API\user\/user.c	lcd_noDisplay();
	CALL	_lcd_noDisplay
;	.line	11; F:\OneDrive\API_PINGUINO_18F4550\API\user\/user.c	lcd_display();
	CALL	_lcd_display
;	.line	12; F:\OneDrive\API_PINGUINO_18F4550\API\user\/user.c	lcd_setCursor(0,4);
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	_lcd_setCursor
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	13; F:\OneDrive\API_PINGUINO_18F4550\API\user\/user.c	lcd_print("InXource");
	MOVLW	UPPER(___str_0)
	MOVWF	POSTDEC1
	MOVLW	HIGH(___str_0)
	MOVWF	POSTDEC1
	MOVLW	LOW(___str_0)
	MOVWF	POSTDEC1
	CALL	_lcd_print
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	14; F:\OneDrive\API_PINGUINO_18F4550\API\user\/user.c	lcd_setCursor(2,1);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_lcd_setCursor
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	15; F:\OneDrive\API_PINGUINO_18F4550\API\user\/user.c	lcd_print("Prueba.....");
	MOVLW	UPPER(___str_1)
	MOVWF	POSTDEC1
	MOVLW	HIGH(___str_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(___str_1)
	MOVWF	POSTDEC1
	CALL	_lcd_print
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	16; F:\OneDrive\API_PINGUINO_18F4550\API\user\/user.c	lcd_blink();
	CALL	_lcd_blink
	RETURN	

; ; Starting pCode block
S_main__IO_digital	code
_IO_digital:
;	.line	123; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	ADCON1 = 0x0F;				// AN0 to AN12 Digital I/O
	MOVLW	0x0f
	MOVWF	_ADCON1
;	.line	124; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	CMCON = 0x07;               // Comparators as Digital I/O
	MOVLW	0x07
	MOVWF	_CMCON
	RETURN	

; ; Starting pCode block
S_main__IO_init	code
_IO_init:
;	.line	53; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	LATA  = 0x00;
	CLRF	_LATA
;	.line	54; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	LATB  = 0x00;
	CLRF	_LATB
;	.line	72; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	LATC  = 0x00;
	CLRF	_LATC
;	.line	79; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	LATD  = 0x00; 
	CLRF	_LATD
;	.line	80; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	LATE  = 0x00; 
	CLRF	_LATE
;	.line	83; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	TRISA = 0x00;
	CLRF	_TRISA
;	.line	85; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	TRISB = 0x00;
	CLRF	_TRISB
;	.line	91; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	TRISCbits.TRISC0 = 0x00;
	BCF	_TRISCbits, 0
;	.line	92; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	TRISCbits.TRISC1 = 0x00;
	BCF	_TRISCbits, 1
;	.line	93; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	TRISCbits.TRISC2 = 0x00;
	BCF	_TRISCbits, 2
;	.line	94; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	TRISCbits.TRISC6 = 0x00;
	BCF	_TRISCbits, 6
;	.line	95; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	TRISCbits.TRISC7 = 0x00;
	BCF	_TRISCbits, 7
;	.line	101; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	TRISD = 0x00; 
	CLRF	_TRISD
;	.line	102; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	TRISE = 0x00; 
	CLRF	_TRISE
;	.line	106; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	PORTA  = 0x00;
	CLRF	_PORTA
;	.line	107; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	PORTB  = 0x00;
	CLRF	_PORTB
;	.line	108; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	PORTC  = 0x00;
	CLRF	_PORTC
;	.line	112; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	PORTD  = 0x00; 
	CLRF	_PORTD
;	.line	113; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	PORTE  = 0x00; 
	CLRF	_PORTE
	RETURN	

; ; Starting pCode block
S_main__lcd_pins	code
_lcd_pins:
;	.line	443; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	void lcd_pins(u8 rs, u8 enable, u8 d0, u8 d1, u8 d2, u8 d3, u8 d4, u8 d5, u8 d6, u8 d7)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
	MOVLW	0x08
	MOVFF	PLUSW2, r0x06
	MOVLW	0x09
	MOVFF	PLUSW2, r0x07
	MOVLW	0x0a
	MOVFF	PLUSW2, r0x08
	MOVLW	0x0b
	MOVFF	PLUSW2, r0x09
;	.line	445; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	lcd_init(((d4 + d5 + d6 + d7)==0), rs, -1, enable, d0, d1, d2, d3, d4, d5, d6, d7);
	MOVFF	r0x06, r0x0a
	CLRF	r0x0b
	MOVFF	r0x07, r0x0c
	CLRF	r0x0d
	MOVF	r0x0c, W
	ADDWF	r0x0a, F
	MOVF	r0x0d, W
	ADDWFC	r0x0b, F
	MOVFF	r0x08, r0x0c
	MOVF	r0x0c, W
	ADDWF	r0x0a, F
	MOVF	r0x0d, W
	ADDWFC	r0x0b, F
	MOVFF	r0x09, r0x0c
	MOVF	r0x0c, W
	ADDWF	r0x0a, F
	MOVF	r0x0d, W
	ADDWFC	r0x0b, F
	MOVF	r0x0a, W
	BNZ	_00642_DS_
	MOVF	r0x0b, W
	BNZ	_00642_DS_
	CLRF	r0x0a
	INCF	r0x0a, F
	BRA	_00643_DS_
_00642_DS_:
	CLRF	r0x0a
_00643_DS_:
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	SETF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	CALL	_lcd_init
	MOVLW	0x0c
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__lcd_init	code
_lcd_init:
;	.line	405; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	void lcd_init(u8 fourbitmode, u8 rs, u8 rw, u8 enable, 
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, __rs_pin
	MOVLW	0x04
	MOVFF	PLUSW2, __rw_pin
	MOVLW	0x05
	MOVFF	PLUSW2, __enable_pin
	MOVLW	0x06
	MOVFF	PLUSW2, r0x01
	MOVLW	0x07
	MOVFF	PLUSW2, r0x02
	MOVLW	0x08
	MOVFF	PLUSW2, r0x03
	MOVLW	0x09
	MOVFF	PLUSW2, r0x04
	MOVLW	0x0a
	MOVFF	PLUSW2, r0x05
	MOVLW	0x0b
	MOVFF	PLUSW2, r0x06
	MOVLW	0x0c
	MOVFF	PLUSW2, r0x07
	MOVLW	0x0d
	MOVFF	PLUSW2, r0x08
;	.line	415; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	_data_pins[0] = d0;
	MOVF	r0x01, W
	BANKSEL	__data_pins
	MOVWF	__data_pins, B
;	.line	416; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	_data_pins[1] = d1;
	MOVF	r0x02, W
; removed redundant BANKSEL
	MOVWF	(__data_pins + 1), B
;	.line	417; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	_data_pins[2] = d2;
	MOVF	r0x03, W
; removed redundant BANKSEL
	MOVWF	(__data_pins + 2), B
;	.line	418; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	_data_pins[3] = d3; 
	MOVF	r0x04, W
; removed redundant BANKSEL
	MOVWF	(__data_pins + 3), B
;	.line	419; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	_data_pins[4] = d4;
	MOVF	r0x05, W
; removed redundant BANKSEL
	MOVWF	(__data_pins + 4), B
;	.line	420; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	_data_pins[5] = d5;
	MOVF	r0x06, W
; removed redundant BANKSEL
	MOVWF	(__data_pins + 5), B
;	.line	421; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	_data_pins[6] = d6;
	MOVF	r0x07, W
; removed redundant BANKSEL
	MOVWF	(__data_pins + 6), B
;	.line	422; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	_data_pins[7] = d7; 
	MOVF	r0x08, W
; removed redundant BANKSEL
	MOVWF	(__data_pins + 7), B
;	.line	424; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	pinmode(_rs_pin, OUTPUT);
	CLRF	POSTDEC1
	BANKSEL	__rs_pin
	MOVF	__rs_pin, W, B
	MOVWF	POSTDEC1
	CALL	_pinmode
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	426; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	pinmode(_enable_pin, OUTPUT);
	CLRF	POSTDEC1
	BANKSEL	__enable_pin
	MOVF	__enable_pin, W, B
	MOVWF	POSTDEC1
	CALL	_pinmode
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	428; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	if (fourbitmode)
	MOVF	r0x00, W
	BZ	_00612_DS_
	BANKSEL	__displayfunction
;	.line	430; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	_displayfunction = LCD_4BITMODE | LCD_1LINE | LCD_5x8DOTS;
	CLRF	__displayfunction, B
;	.line	431; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	for (i = 0; i < 4; i++)
	CLRF	r0x00
_00614_DS_:
;	.line	432; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	pinmode(_data_pins[i], OUTPUT);
	MOVLW	LOW(__data_pins)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(__data_pins)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	INDF0, r0x01
	CLRF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_pinmode
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	431; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	for (i = 0; i < 4; i++)
	INCF	r0x00, F
	MOVLW	0x04
	SUBWF	r0x00, W
	BNC	_00614_DS_
	BRA	_00618_DS_
_00612_DS_:
;	.line	436; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	_displayfunction = LCD_8BITMODE | LCD_1LINE | LCD_5x8DOTS;
	MOVLW	0x10
	BANKSEL	__displayfunction
	MOVWF	__displayfunction, B
;	.line	437; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	for (i = 0; i < 8; i++)
	CLRF	r0x00
_00616_DS_:
;	.line	438; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	pinmode(_data_pins[i], OUTPUT);
	MOVLW	LOW(__data_pins)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(__data_pins)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	INDF0, r0x01
	CLRF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_pinmode
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	437; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	for (i = 0; i < 8; i++)
	INCF	r0x00, F
	MOVLW	0x08
	SUBWF	r0x00, W
	BNC	_00616_DS_
_00618_DS_:
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__lcd_begin	code
_lcd_begin:
;	.line	330; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	void lcd_begin(u8 lines, u8 dotsize)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	332; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	if (lines > 1)
	MOVLW	0x02
; #	SUBWF	r0x00, W
; #	BTFSS	STATUS, 0
; #	GOTO	_00578_DS_
; #	BSF	__displayfunction, 3, B
; #	MOVFF	r0x00, __numlines
;	.line	333; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	_displayfunction |= LCD_2LINE;
	SUBWF	r0x00, W
;	.line	335; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	_numlines = lines;
	BNC	_10704_DS_
	BANKSEL	__displayfunction
	BSF	__displayfunction, 3, B
_10704_DS_:
	MOVFF	r0x00, __numlines
	BANKSEL	__currline
;	.line	336; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	_currline = 0;
	CLRF	__currline, B
;	.line	339; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	if ((dotsize != 0) && (lines == 1))
	MOVF	r0x01, W
	BZ	_00580_DS_
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00580_DS_
_00602_DS_:
	BANKSEL	__displayfunction
;	.line	340; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	_displayfunction |= LCD_5x10DOTS;
	BSF	__displayfunction, 2, B
_00580_DS_:
;	.line	342; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	Delayms(15);								// Wait more than 15 ms after VDD rises to 4.5V
	CLRF	POSTDEC1
	MOVLW	0x0f
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	345; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	digitalwrite(_rs_pin, LOW);
	CLRF	POSTDEC1
	BANKSEL	__rs_pin
	MOVF	__rs_pin, W, B
	MOVWF	POSTDEC1
	CALL	_digitalwrite
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	346; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	digitalwrite(_enable_pin, LOW);
	CLRF	POSTDEC1
	BANKSEL	__enable_pin
	MOVF	__enable_pin, W, B
	MOVWF	POSTDEC1
	CALL	_digitalwrite
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	BANKSEL	__displayfunction
;	.line	349; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	if (! (_displayfunction & LCD_8BITMODE) )
	BTFSC	__displayfunction, 4, B
	BRA	_00583_DS_
;	.line	354; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	lcd_write4bits(0x03);
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_lcd_write4bits
	MOVF	POSTINC1, F
;	.line	355; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	Delayms(5);									// Wait for more than 4.1 ms
	CLRF	POSTDEC1
	MOVLW	0x05
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	357; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	lcd_write4bits(0x03);
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_lcd_write4bits
	MOVF	POSTINC1, F
;	.line	358; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	Delayus(150);								// Wait more than 100 μs
	CLRF	POSTDEC1
	MOVLW	0x96
	MOVWF	POSTDEC1
	CALL	_Delayus
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	360; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	lcd_write4bits(0x03); 
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_lcd_write4bits
	MOVF	POSTINC1, F
;	.line	361; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	Delayus(150);								// Wait more than 100 μs
	CLRF	POSTDEC1
	MOVLW	0x96
	MOVWF	POSTDEC1
	CALL	_Delayus
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	363; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	lcd_write4bits(0x02); 
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_lcd_write4bits
	MOVF	POSTINC1, F
	BRA	_00584_DS_
_00583_DS_:
;	.line	371; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	lcd_command(LCD_FUNCTIONSET | _displayfunction);
	MOVLW	0x20
	BANKSEL	__displayfunction
	IORWF	__displayfunction, W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_lcd_command
	MOVF	POSTINC1, F
;	.line	372; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	Delayms(5);									// Wait for more than 4.1 ms
	CLRF	POSTDEC1
	MOVLW	0x05
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	375; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	lcd_command(LCD_FUNCTIONSET | _displayfunction);
	MOVLW	0x20
	BANKSEL	__displayfunction
	IORWF	__displayfunction, W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_lcd_command
	MOVF	POSTINC1, F
;	.line	376; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	Delayms(5);									// Wait for more than 4.1 ms
	CLRF	POSTDEC1
	MOVLW	0x05
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	380; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	lcd_command(LCD_FUNCTIONSET | _displayfunction);
	MOVLW	0x20
	BANKSEL	__displayfunction
	IORWF	__displayfunction, W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_lcd_command
	MOVF	POSTINC1, F
_00584_DS_:
;	.line	384; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	lcd_command(LCD_FUNCTIONSET | _displayfunction);  
	MOVLW	0x20
	BANKSEL	__displayfunction
	IORWF	__displayfunction, W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_lcd_command
	MOVF	POSTINC1, F
;	.line	387; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	_displaycontrol = LCD_DISPLAYON | LCD_CURSOROFF | LCD_BLINKOFF;  
	MOVLW	0x04
	BANKSEL	__displaycontrol
	MOVWF	__displaycontrol, B
;	.line	388; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	lcd_command(LCD_DISPLAYCONTROL | _displaycontrol);
	MOVLW	0x0c
	MOVWF	POSTDEC1
	CALL	_lcd_command
	MOVF	POSTINC1, F
;	.line	391; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	lcd_command(LCD_CLEARDISPLAY);  // clear display, set cursor position to zero
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_lcd_command
	MOVF	POSTINC1, F
;	.line	392; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	Delayms(2);
	CLRF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	395; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	_displaymode = LCD_ENTRYLEFT | LCD_ENTRYSHIFTDECREMENT;
	MOVLW	0x02
	BANKSEL	__displaymode
	MOVWF	__displaymode, B
;	.line	397; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	lcd_command(LCD_ENTRYMODESET | _displaymode);
	MOVLW	0x06
	MOVWF	POSTDEC1
	CALL	_lcd_command
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__lcd_blink	code
_lcd_blink:
	BANKSEL	__displaycontrol
;	.line	275; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	_displaycontrol |= LCD_BLINKON;
	BSF	__displaycontrol, 0, B
;	.line	276; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	lcd_command(LCD_DISPLAYCONTROL | _displaycontrol);
	MOVLW	0x08
; removed redundant BANKSEL
	IORWF	__displaycontrol, W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_lcd_command
	MOVF	POSTINC1, F
	RETURN	

; ; Starting pCode block
S_main__lcd_display	code
_lcd_display:
	BANKSEL	__displaycontrol
;	.line	241; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	_displaycontrol |= LCD_DISPLAYON;
	BSF	__displaycontrol, 2, B
;	.line	242; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	lcd_command(LCD_DISPLAYCONTROL | _displaycontrol);
	MOVLW	0x08
; removed redundant BANKSEL
	IORWF	__displaycontrol, W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_lcd_command
	MOVF	POSTINC1, F
	RETURN	

; ; Starting pCode block
S_main__lcd_noDisplay	code
_lcd_noDisplay:
;	.line	231; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	void lcd_noDisplay()
	MOVFF	r0x00, POSTDEC1
	BANKSEL	__displaycontrol
;	.line	233; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	_displaycontrol &= ~LCD_DISPLAYON;
	MOVF	__displaycontrol, W, B
	MOVWF	r0x00
	MOVLW	0xfb
	ANDWF	r0x00, W
; removed redundant BANKSEL
	MOVWF	__displaycontrol, B
;	.line	234; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	lcd_command(LCD_DISPLAYCONTROL | _displaycontrol);
	MOVLW	0x08
; removed redundant BANKSEL
	IORWF	__displaycontrol, W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_lcd_command
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__lcd_clear	code
_lcd_clear:
;	.line	223; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	lcd_command(LCD_CLEARDISPLAY);  // clear display, set cursor position to zero
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_lcd_command
	MOVF	POSTINC1, F
;	.line	224; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	Delayms(2);									// Wait for more than 4.1 ms
	CLRF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	RETURN	

; ; Starting pCode block
S_main__lcd_print	code
_lcd_print:
;	.line	122; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	void lcd_print(char *string)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
;	.line	125; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	for( i=0; string[i]; i++)
	CLRF	r0x03
_00550_DS_:
	MOVF	r0x03, W
	ADDWF	r0x00, W
	MOVWF	r0x04
	CLRF	WREG
	ADDWFC	r0x01, W
	MOVWF	r0x05
	CLRF	WREG
	ADDWFC	r0x02, W
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	CALL	__gptrget1
	MOVWF	r0x04
	MOVF	r0x04, W
	BZ	_00552_DS_
;	.line	126; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	lcd_write(string[i]);
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	_lcd_write
	MOVF	POSTINC1, F
;	.line	125; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	for( i=0; string[i]; i++)
	INCF	r0x03, F
	BRA	_00550_DS_
_00552_DS_:
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__lcd_setCursor	code
_lcd_setCursor:
;	.line	97; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	void lcd_setCursor(u8 col, u8 row)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	BANKSEL	_lcd_setCursor_row_offsets_1_104
;	.line	99; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	u8 row_offsets[] = { 0x00, 0x40, 0x14, 0x54 };
	CLRF	_lcd_setCursor_row_offsets_1_104, B
	MOVLW	0x40
; removed redundant BANKSEL
	MOVWF	(_lcd_setCursor_row_offsets_1_104 + 1), B
	MOVLW	0x14
; removed redundant BANKSEL
	MOVWF	(_lcd_setCursor_row_offsets_1_104 + 2), B
	MOVLW	0x54
; removed redundant BANKSEL
	MOVWF	(_lcd_setCursor_row_offsets_1_104 + 3), B
	BANKSEL	__numlines
;	.line	106; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	if (_numlines==1) {
	MOVF	__numlines, W, B
	XORLW	0x01
	BNZ	_00536_DS_
;	.line	107; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	row_offsets[1] = 0x14;
	MOVLW	0x14
	BANKSEL	(_lcd_setCursor_row_offsets_1_104 + 1)
	MOVWF	(_lcd_setCursor_row_offsets_1_104 + 1), B
;	.line	108; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	row_offsets[2] = 0x28;
	MOVLW	0x28
; removed redundant BANKSEL
	MOVWF	(_lcd_setCursor_row_offsets_1_104 + 2), B
;	.line	109; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	row_offsets[3] = 0x3C;
	MOVLW	0x3c
; removed redundant BANKSEL
	MOVWF	(_lcd_setCursor_row_offsets_1_104 + 3), B
_00536_DS_:
;	.line	116; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	lcd_command(LCD_SETDDRAMADDR | (col + row_offsets[row]));
	CLRF	r0x02
	MOVLW	LOW(_lcd_setCursor_row_offsets_1_104)
	ADDWF	r0x01, F
	MOVLW	HIGH(_lcd_setCursor_row_offsets_1_104)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	INDF0, r0x01
	MOVF	r0x01, W
	ADDWF	r0x00, F
	BSF	r0x00, 7
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_lcd_command
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__lcd_command	code
_lcd_command:
;	.line	90; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	void lcd_command(u8 value)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	92; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	lcd_send(value, LOW);
	CLRF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_lcd_send
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__lcd_write	code
_lcd_write:
;	.line	84; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	void lcd_write(u8 value)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	86; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	lcd_send(value, HIGH);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_lcd_send
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__lcd_send	code
_lcd_send:
;	.line	68; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	void lcd_send(u8 value, u8 mode)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	70; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	digitalwrite(_rs_pin, mode);
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	BANKSEL	__rs_pin
	MOVF	__rs_pin, W, B
	MOVWF	POSTDEC1
	CALL	_digitalwrite
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	BANKSEL	__displayfunction
;	.line	72; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	if (_displayfunction & LCD_8BITMODE)
	BTFSS	__displayfunction, 4, B
	BRA	_00513_DS_
;	.line	74; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	lcd_write8bits(value); 
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_lcd_write8bits
	MOVF	POSTINC1, F
	BRA	_00515_DS_
_00513_DS_:
;	.line	78; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	lcd_write4bits(value >> 4);	// Upper 4 bits first
	SWAPF	r0x00, W
	ANDLW	0x0f
; #	MOVWF	r0x01
; #	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_lcd_write4bits
	MOVF	POSTINC1, F
;	.line	79; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	lcd_write4bits(value);	    // Lower 4 bits second
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_lcd_write4bits
	MOVF	POSTINC1, F
_00515_DS_:
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__lcd_write8bits	code
_lcd_write8bits:
;	.line	59; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	void lcd_write8bits(u8 value)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	62; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	for (i = 0; i < 8; i++)
	CLRF	r0x01
_00493_DS_:
;	.line	63; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	digitalwrite(_data_pins[i], (value >> i) & 0x01);
	MOVLW	LOW(__data_pins)
	ADDWF	r0x01, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(__data_pins)
	ADDWFC	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	INDF0, r0x02
	MOVFF	r0x00, r0x03
	MOVF	r0x01, W
	BZ	_00504_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00505_DS_:
	RRCF	r0x03, F
	ADDLW	0x01
	BNC	_00505_DS_
_00504_DS_:
	MOVLW	0x01
	ANDWF	r0x03, F
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_digitalwrite
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	62; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	for (i = 0; i < 8; i++)
	INCF	r0x01, F
	MOVLW	0x08
	SUBWF	r0x01, W
	BNC	_00493_DS_
;	.line	64; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	lcd_pulseEnable();
	CALL	_lcd_pulseEnable
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__lcd_write4bits	code
_lcd_write4bits:
;	.line	50; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	void lcd_write4bits(u8 value)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	53; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	for (i = 0; i < 4; i++)
	CLRF	r0x01
_00473_DS_:
;	.line	54; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	digitalwrite(_data_pins[i], (value >> i) & 0x01);
	MOVLW	LOW(__data_pins)
	ADDWF	r0x01, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(__data_pins)
	ADDWFC	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	INDF0, r0x02
	MOVFF	r0x00, r0x03
	MOVF	r0x01, W
	BZ	_00484_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00485_DS_:
	RRCF	r0x03, F
	ADDLW	0x01
	BNC	_00485_DS_
_00484_DS_:
	MOVLW	0x01
	ANDWF	r0x03, F
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_digitalwrite
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	53; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	for (i = 0; i < 4; i++)
	INCF	r0x01, F
	MOVLW	0x04
	SUBWF	r0x01, W
	BNC	_00473_DS_
;	.line	55; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	lcd_pulseEnable();
	CALL	_lcd_pulseEnable
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__lcd_pulseEnable	code
_lcd_pulseEnable:
;	.line	43; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	digitalwrite(_enable_pin, HIGH);
	MOVLW	0x01
	MOVWF	POSTDEC1
	BANKSEL	__enable_pin
	MOVF	__enable_pin, W, B
	MOVWF	POSTDEC1
	CALL	_digitalwrite
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	45; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/lcdlib.c	digitalwrite(_enable_pin, LOW);
	CLRF	POSTDEC1
	BANKSEL	__enable_pin
	MOVF	__enable_pin, W, B
	MOVWF	POSTDEC1
	CALL	_digitalwrite
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	RETURN	

; ; Starting pCode block
S_main__digitalwrite	code
_digitalwrite:
;	.line	48; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	void digitalwrite(u8 pin, u8 state)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	54; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	switch (port[pin])
	MOVLW	LOW(_port)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_port)
	ADDWFC	r0x03, F
	CLRF	r0x04
	MOVLW	UPPER(_port)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	MOVLW	0x05
	SUBWF	r0x02, W
	BTFSC	STATUS, 0
	BRA	_00441_DS_
	CLRF	PCLATH
	CLRF	PCLATU
	RLCF	r0x02, W
	RLCF	PCLATH, F
	RLCF	WREG, W
	RLCF	PCLATH, F
	ANDLW	0xfc
	ADDLW	LOW(_00462_DS_)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_00462_DS_)
	ADDWFC	PCLATH, F
	MOVLW	UPPER(_00462_DS_)
	ADDWFC	PCLATU, F
	MOVF	PREINC1, W
	MOVWF	PCL
_00462_DS_:
	GOTO	_00420_DS_
	GOTO	_00424_DS_
	GOTO	_00428_DS_
	GOTO	_00432_DS_
	GOTO	_00436_DS_
_00420_DS_:
;	.line	57; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	if (state) LATA=LATA | mask[pin];
	MOVF	r0x01, W
	BZ	_00422_DS_
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_mask)
	ADDWFC	r0x03, F
	CLRF	r0x04
	MOVLW	UPPER(_mask)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	MOVF	r0x02, W
	IORWF	_LATA, F
	BRA	_00441_DS_
_00422_DS_:
;	.line	58; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	else LATA=LATA & (255-mask[pin]);
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_mask)
	ADDWFC	r0x03, F
	CLRF	r0x04
	MOVLW	UPPER(_mask)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	MOVF	r0x02, W
	SUBLW	0xff
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	ANDWF	_LATA, F
;	.line	59; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	break;
	BRA	_00441_DS_
_00424_DS_:
;	.line	61; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	if (state) LATB=LATB | mask[pin]; 
	MOVF	r0x01, W
	BZ	_00426_DS_
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_mask)
	ADDWFC	r0x03, F
	CLRF	r0x04
	MOVLW	UPPER(_mask)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	MOVF	r0x02, W
	IORWF	_LATB, F
	BRA	_00441_DS_
_00426_DS_:
;	.line	62; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	else LATB=LATB & (255-mask[pin]);
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_mask)
	ADDWFC	r0x03, F
	CLRF	r0x04
	MOVLW	UPPER(_mask)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	MOVF	r0x02, W
	SUBLW	0xff
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	ANDWF	_LATB, F
;	.line	63; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	break;
	BRA	_00441_DS_
_00428_DS_:
;	.line	65; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	if (state) LATC=LATC | mask[pin];
	MOVF	r0x01, W
	BZ	_00430_DS_
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_mask)
	ADDWFC	r0x03, F
	CLRF	r0x04
	MOVLW	UPPER(_mask)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	MOVF	r0x02, W
	IORWF	_LATC, F
	BRA	_00441_DS_
_00430_DS_:
;	.line	66; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	else LATC=LATC & (255-mask[pin]);
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_mask)
	ADDWFC	r0x03, F
	CLRF	r0x04
	MOVLW	UPPER(_mask)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	MOVF	r0x02, W
	SUBLW	0xff
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	ANDWF	_LATC, F
;	.line	67; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	break;
	BRA	_00441_DS_
_00432_DS_:
;	.line	72; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	if (state) LATD=LATD | mask[pin]; 
	MOVF	r0x01, W
	BZ	_00434_DS_
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_mask)
	ADDWFC	r0x03, F
	CLRF	r0x04
	MOVLW	UPPER(_mask)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	MOVF	r0x02, W
	IORWF	_LATD, F
	BRA	_00441_DS_
_00434_DS_:
;	.line	73; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	else LATD=LATD & (255-mask[pin]);
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_mask)
	ADDWFC	r0x03, F
	CLRF	r0x04
	MOVLW	UPPER(_mask)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	MOVF	r0x02, W
	SUBLW	0xff
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	ANDWF	_LATD, F
;	.line	74; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	break;
	BRA	_00441_DS_
_00436_DS_:
;	.line	76; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	if (state) LATE=LATE | mask[pin]; 
	MOVF	r0x01, W
	BZ	_00438_DS_
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_mask)
	ADDWFC	r0x02, F
	CLRF	r0x03
	MOVLW	UPPER(_mask)
	ADDWFC	r0x03, F
	MOVFF	r0x01, TBLPTRL
	MOVFF	r0x02, TBLPTRH
	MOVFF	r0x03, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x01
	MOVF	r0x01, W
	IORWF	_LATE, F
	BRA	_00441_DS_
_00438_DS_:
;	.line	77; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	else LATE=LATE & (255-mask[pin]);
	CLRF	r0x01
	CLRF	r0x02
	MOVLW	LOW(_mask)
	ADDWF	r0x00, F
	MOVLW	HIGH(_mask)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_mask)
	ADDWFC	r0x02, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	MOVF	r0x00, W
	SUBLW	0xff
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	ANDWF	_LATE, F
_00441_DS_:
;	.line	80; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	}
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__Delayus	code
_Delayus:
;	.line	69; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/delayus.c	void Delayus(unsigned int microseconds)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	73; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/delayus.c	for (i=0; i<microseconds; i++)
	CLRF	r0x02
	CLRF	r0x03
_00404_DS_:
	MOVF	r0x01, W
	SUBWF	r0x03, W
	BNZ	_00415_DS_
	MOVF	r0x00, W
	SUBWF	r0x02, W
_00415_DS_:
	BC	_00406_DS_
	INFSNZ	r0x02, F
	INCF	r0x03, F
	BRA	_00404_DS_
_00406_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__Delayms	code
_Delayms:
;	.line	93; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/delayms.c	void Delayms(u16 milliseconds)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	100; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/delayms.c	u16 n100tcy = System_getPeripheralFrequency() / 100000;
	CALL	_System_getCpuFrequency
	MOVWF	r0x02
	MOVFF	PRODL, r0x03
	MOVFF	PRODH, r0x04
	MOVFF	FSR0L, r0x05
	BCF	STATUS, 0
	RRCF	r0x05, F
	RRCF	r0x04, F
	RRCF	r0x03, F
	RRCF	r0x02, F
	BCF	STATUS, 0
	RRCF	r0x05, F
	RRCF	r0x04, F
	RRCF	r0x03, F
	RRCF	r0x02, F
	CLRF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x86
	MOVWF	POSTDEC1
	MOVLW	0xa0
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	__divulong
	MOVWF	r0x02
	MOVLW	0x08
	ADDWF	FSR1L, F
_00394_DS_:
;	.line	101; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/delayms.c	while (milliseconds--)
	MOVFF	r0x00, r0x04
	MOVFF	r0x01, r0x05
	MOVLW	0xff
	ADDWF	r0x00, F
	ADDWFC	r0x01, F
	MOVF	r0x04, W
	IORWF	r0x05, W
	BZ	_00397_DS_
;	.line	102; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/delayms.c	delay100tcy(n100tcy-3);
	MOVF	r0x02, W
	MOVWF	r0x04
	MOVLW	0xfd
	ADDWF	r0x04, F
	MOVF	r0x04, W
	CALL	_delay100tcy
	BRA	_00394_DS_
_00397_DS_:
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__System_getCpuFrequency	code
_System_getCpuFrequency:
;	.line	227; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	u32 System_getCpuFrequency() 
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
;	.line	242; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	if (OSCCONbits.SCS == 0)
	MOVF	_OSCCONbits, W
	ANDLW	0x03
	MOVWF	r0x00
	MOVF	r0x00, W
	BTFSS	STATUS, 2
	BRA	_00359_DS_
;	.line	268; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	CPUDIV  = ( System_readFlashMemory(__CONFIG1L) & 0b00011000 ) >> 3;
	CLRF	POSTDEC1
	MOVLW	0x30
	MOVWF	POSTDEC1
	MOVLW	0x00
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CALL	_System_readFlashMemory
	MOVWF	r0x00
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVLW	0x18
	ANDWF	r0x00, F
	CLRF	r0x01
	BCF	STATUS, 0
	RRCF	r0x01, F
	RRCF	r0x00, F
	BCF	STATUS, 0
	RRCF	r0x01, F
	RRCF	r0x00, F
	BCF	STATUS, 0
	RRCF	r0x01, F
	RRCF	r0x00, F
;	.line	269; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	CPUDIV_XTAL = cpudiv_xtal[CPUDIV];
	MOVLW	LOW(_cpudiv_xtal)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_cpudiv_xtal)
	ADDWFC	r0x02, F
	CLRF	r0x03
	MOVLW	UPPER(_cpudiv_xtal)
	ADDWFC	r0x03, F
	MOVFF	r0x01, TBLPTRL
	MOVFF	r0x02, TBLPTRH
	MOVFF	r0x03, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x01
;	.line	270; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	fosc  = System_readFlashMemory(__CONFIG1H) & 0b00001111;
	CLRF	POSTDEC1
	MOVLW	0x30
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_System_readFlashMemory
	MOVWF	r0x02
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVLW	0x0f
	ANDWF	r0x02, F
;	.line	284; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	CPUDIV = cpudiv[CPUDIV];
	MOVLW	LOW(_cpudiv)
	ADDWF	r0x00, W
	MOVWF	r0x03
	CLRF	r0x04
	MOVLW	HIGH(_cpudiv)
	ADDWFC	r0x04, F
	CLRF	r0x05
	MOVLW	UPPER(_cpudiv)
	ADDWFC	r0x05, F
	MOVFF	r0x03, TBLPTRL
	MOVFF	r0x04, TBLPTRH
	MOVFF	r0x05, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
;	.line	292; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	fosc >>=1;
	BCF	STATUS, 0
	RRCF	r0x02, F
;	.line	293; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	if( (fosc==0) || (fosc==2) || (fosc==6) )
	MOVF	r0x02, W
	BZ	_00353_DS_
	MOVF	r0x02, W
	XORLW	0x02
	BZ	_00353_DS_
	MOVF	r0x02, W
	XORLW	0x06
	BNZ	_00354_DS_
_00353_DS_:
;	.line	295; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	return CRYSTAL / CPUDIV_XTAL;
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x7a
	MOVWF	POSTDEC1
	MOVLW	0x12
	MOVWF	POSTDEC1
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	__divslong
	MOVWF	r0x01
	MOVFF	PRODL, r0x02
	MOVFF	PRODH, r0x03
	MOVFF	FSR0L, r0x04
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVFF	r0x04, FSR0L
	MOVFF	r0x03, PRODH
	MOVFF	r0x02, PRODL
	MOVF	r0x01, W
	BRA	_00364_DS_
_00354_DS_:
;	.line	299; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	return 96000000UL / CPUDIV;
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x05
	MOVWF	POSTDEC1
	MOVLW	0xb8
	MOVWF	POSTDEC1
	MOVLW	0xd8
	MOVWF	POSTDEC1
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	__divulong
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00364_DS_
_00359_DS_:
;	.line	312; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	if (OSCCONbits.SCS == 1)
	MOVF	_OSCCONbits, W
	ANDLW	0x03
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00361_DS_
;	.line	313; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	return 32768;
	CLRF	FSR0L
	CLRF	PRODH
	MOVLW	0x80
	MOVWF	PRODL
	CLRF	WREG
	BRA	_00364_DS_
_00361_DS_:
;	.line	316; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	if (OSCCONbits.SCS >= 2)
	MOVF	_OSCCONbits, W
	ANDLW	0x03
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	ADDLW	0x80
	ADDLW	0x7e
	BNC	_00363_DS_
;	.line	317; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	return ircf[OSCCONbits.IRCF];
	MOVF	_OSCCONbits, W
	SWAPF	WREG, W
	ANDLW	0x07
	CLRF	POSTDEC1
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x04
	ADDWF	FSR1L, F
	CLRF	r0x02
	MOVLW	LOW(_ircf)
	ADDWF	r0x00, F
	MOVLW	HIGH(_ircf)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_ircf)
	ADDWFC	r0x02, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	TBLRD*+	
	MOVFF	TABLAT, r0x01
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	TBLRD*+	
	MOVFF	TABLAT, r0x03
	MOVFF	r0x03, FSR0L
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00364_DS_
_00363_DS_:
;	.line	319; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	return 0;
	CLRF	FSR0L
	CLRF	PRODH
	CLRF	PRODL
	CLRF	WREG
_00364_DS_:
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__System_readFlashMemory	code
_System_readFlashMemory:
;	.line	190; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	u16 System_readFlashMemory(u32 address)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	194; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	TBLPTRU = address >> 16;
	MOVF	r0x02, W
	MOVWF	r0x04
	MOVF	r0x03, W
	MOVWF	r0x05
	CLRF	r0x06
	CLRF	r0x07
	MOVF	r0x04, W
	MOVWF	_TBLPTRU
;	.line	195; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	TBLPTRH = address >> 8;
	MOVF	r0x01, W
	MOVWF	r0x04
	MOVF	r0x02, W
	MOVWF	r0x05
	MOVF	r0x03, W
	MOVWF	r0x06
	CLRF	r0x07
	MOVF	r0x04, W
	MOVWF	_TBLPTRH
;	.line	196; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	TBLPTRL = address;
	MOVF	r0x00, W
	MOVWF	_TBLPTRL
	tblrd*+
;	.line	198; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	l8 = TABLAT;
	MOVFF	_TABLAT, r0x00
	tblrd*+
;	.line	200; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	h8 = TABLAT;
	MOVFF	_TABLAT, r0x01
;	.line	202; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	return ((h8 << 8) + l8);
	CLRF	r0x02
	MOVF	r0x01, W
	MOVWF	r0x04
	CLRF	r0x03
	CLRF	r0x05
	MOVF	r0x00, W
	ADDWF	r0x03, F
	MOVF	r0x05, W
	ADDWFC	r0x04, F
	MOVFF	r0x04, PRODL
	MOVF	r0x03, W
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__pinmode	code
_pinmode:
;	.line	44; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	void pinmode(u8 pin, u8 state)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	46; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	switch (port[pin])
	MOVLW	LOW(_port)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_port)
	ADDWFC	r0x03, F
	CLRF	r0x04
	MOVLW	UPPER(_port)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	MOVLW	0x05
	SUBWF	r0x02, W
	BTFSC	STATUS, 0
	BRA	_00322_DS_
	CLRF	PCLATH
	CLRF	PCLATU
	RLCF	r0x02, W
	RLCF	PCLATH, F
	RLCF	WREG, W
	RLCF	PCLATH, F
	ANDLW	0xfc
	ADDLW	LOW(_00343_DS_)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_00343_DS_)
	ADDWFC	PCLATH, F
	MOVLW	UPPER(_00343_DS_)
	ADDWFC	PCLATU, F
	MOVF	PREINC1, W
	MOVWF	PCL
_00343_DS_:
	GOTO	_00301_DS_
	GOTO	_00305_DS_
	GOTO	_00309_DS_
	GOTO	_00313_DS_
	GOTO	_00317_DS_
_00301_DS_:
;	.line	49; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	if (state) TRISA=TRISA | mask[pin];
	MOVF	r0x01, W
	BZ	_00303_DS_
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_mask)
	ADDWFC	r0x03, F
	CLRF	r0x04
	MOVLW	UPPER(_mask)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	MOVF	r0x02, W
	IORWF	_TRISA, F
	BRA	_00322_DS_
_00303_DS_:
;	.line	50; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	else TRISA=TRISA & (255-mask[pin]);
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_mask)
	ADDWFC	r0x03, F
	CLRF	r0x04
	MOVLW	UPPER(_mask)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	MOVF	r0x02, W
	SUBLW	0xff
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	ANDWF	_TRISA, F
;	.line	51; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	break;
	BRA	_00322_DS_
_00305_DS_:
;	.line	53; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	if (state) TRISB=TRISB | mask[pin];
	MOVF	r0x01, W
	BZ	_00307_DS_
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_mask)
	ADDWFC	r0x03, F
	CLRF	r0x04
	MOVLW	UPPER(_mask)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	MOVF	r0x02, W
	IORWF	_TRISB, F
	BRA	_00322_DS_
_00307_DS_:
;	.line	54; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	else TRISB=TRISB & (255-mask[pin]);
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_mask)
	ADDWFC	r0x03, F
	CLRF	r0x04
	MOVLW	UPPER(_mask)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	MOVF	r0x02, W
	SUBLW	0xff
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	ANDWF	_TRISB, F
;	.line	55; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	break;
	BRA	_00322_DS_
_00309_DS_:
;	.line	57; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	if (state) TRISC=TRISC | mask[pin];
	MOVF	r0x01, W
	BZ	_00311_DS_
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_mask)
	ADDWFC	r0x03, F
	CLRF	r0x04
	MOVLW	UPPER(_mask)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	MOVF	r0x02, W
	IORWF	_TRISC, F
	BRA	_00322_DS_
_00311_DS_:
;	.line	58; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	else TRISC=TRISC & (255-mask[pin]);
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_mask)
	ADDWFC	r0x03, F
	CLRF	r0x04
	MOVLW	UPPER(_mask)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	MOVF	r0x02, W
	SUBLW	0xff
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	ANDWF	_TRISC, F
;	.line	59; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	break;
	BRA	_00322_DS_
_00313_DS_:
;	.line	64; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	if (state) TRISD=TRISD | mask[pin];
	MOVF	r0x01, W
	BZ	_00315_DS_
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_mask)
	ADDWFC	r0x03, F
	CLRF	r0x04
	MOVLW	UPPER(_mask)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	MOVF	r0x02, W
	IORWF	_TRISD, F
	BRA	_00322_DS_
_00315_DS_:
;	.line	65; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	else TRISD=TRISD & (255-mask[pin]);
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_mask)
	ADDWFC	r0x03, F
	CLRF	r0x04
	MOVLW	UPPER(_mask)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	MOVF	r0x02, W
	SUBLW	0xff
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	ANDWF	_TRISD, F
;	.line	66; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	break;
	BRA	_00322_DS_
_00317_DS_:
;	.line	68; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	if (state) TRISE=TRISE | mask[pin];
	MOVF	r0x01, W
	BZ	_00319_DS_
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_mask)
	ADDWFC	r0x02, F
	CLRF	r0x03
	MOVLW	UPPER(_mask)
	ADDWFC	r0x03, F
	MOVFF	r0x01, TBLPTRL
	MOVFF	r0x02, TBLPTRH
	MOVFF	r0x03, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x01
	MOVF	r0x01, W
	IORWF	_TRISE, F
	BRA	_00322_DS_
_00319_DS_:
;	.line	69; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	else TRISE=TRISE & (255-mask[pin]);
	CLRF	r0x01
	CLRF	r0x02
	MOVLW	LOW(_mask)
	ADDWF	r0x00, F
	MOVLW	HIGH(_mask)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_mask)
	ADDWFC	r0x02, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	MOVF	r0x00, W
	SUBLW	0xff
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	ANDWF	_TRISE, F
_00322_DS_:
;	.line	72; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	}
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__BULK_available	code
_BULK_available:
;	.line	145; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/__bulk.c	return(usbavailable());
	CALL	_usbavailable
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
; #; info ==> [localregs] exit begin

	RETURN	

; ; Starting pCode block
S_main__BULK_read	code
_BULK_read:
;	.line	138; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/__bulk.c	u8 BULK_read(u8 *rxpointer)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
;	.line	140; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/__bulk.c	return(usbreceive(rxpointer)); // one only character is returned
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_usbreceive
	MOVWF	r0x00
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__BULK_write	code
_BULK_write:
;	.line	133; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/__bulk.c	void BULK_write(u8 *txpointer, u8 length)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	135; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/__bulk.c	usbsend(txpointer,length);
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_usbsend
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__usbgets	code
_usbgets:
;	.line	235; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	return(usbread()); // one only character is returned
	CALL	_usbread
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
; #; info ==> [localregs] exit begin

	RETURN	

; ; Starting pCode block
S_main__usbputs	code
_usbputs:
;	.line	228; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	void usbputs(u8 *txpointer, u8 length)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	230; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	usbsend(txpointer, length);
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_usbsend
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__usb_interrupt	code
_usb_interrupt:
;	.line	217; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	if(PIR2bits.USBIF)
	BTFSS	_PIR2bits, 5
	BRA	_00271_DS_
;	.line	220; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	dispatch_usb_event();
	CALL	_dispatch_usb_event
;	.line	221; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	UIRbits.SOFIF = 0;
	BCF	_UIRbits, 6
;	.line	222; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	UIRbits.URSTIF = 0;
	BCF	_UIRbits, 0
;	.line	223; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	PIR2bits.USBIF = 0;
	BCF	_PIR2bits, 5
;	.line	224; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	UEIR = 0;
	CLRF	_UEIR
_00271_DS_:
	RETURN	

; ; Starting pCode block
S_main__epapout_init	code
_epapout_init:
;	.line	204; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	EP_OUT_BD(1).Cnt = EP1_BUFFER_SIZE;
	MOVLW	0x40
	BANKSEL	(_ep_bdt + 9)
	MOVWF	(_ep_bdt + 9), B
;	.line	205; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	EP_OUT_BD(1).ADR = (u8 __data *)&RXbuffer;
	MOVLW	LOW(_RXbuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 10), B
	MOVLW	HIGH(_RXbuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 11), B
;	.line	206; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	EP_OUT_BD(1).Stat.uc = BDS_USIE | BDS_DAT0 | BDS_DTSEN;
	MOVLW	0x88
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 8), B
;	.line	207; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	UEP1 = EPHSHK_EN | EPOUTEN_EN | EPCONDIS_EN;       	// Init EPAPPLI as an OUT EP
	MOVLW	0x1c
	MOVWF	_UEP1
; #	MOVLW	0x01
; #	MOVWF	_usbwp, B
; #	MOVLW	0x01
;	.line	208; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	usbwp=1;						// init pointer for rx buffer pinguino
	MOVLW	0x01
	BANKSEL	_usbwp
;	.line	209; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	usbrp=1;
	MOVWF	_usbwp, B
	BANKSEL	_usbrp
	MOVWF	_usbrp, B
	RETURN	

; ; Starting pCode block
S_main__epap_out	code
_epap_out:
;	.line	168; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	void epap_out(void)
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
;	.line	174; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	if((EP_OUT_BD(1).Cnt >= 1) && ( EP_OUT_BD(1).Cnt<EP1_BUFFER_SIZE))
	MOVLW	0x01
	BANKSEL	(_ep_bdt + 9)
	SUBWF	(_ep_bdt + 9), W, B
	BTFSS	STATUS, 0
	BRA	_00218_DS_
	MOVLW	0x40
; removed redundant BANKSEL
	SUBWF	(_ep_bdt + 9), W, B
	BTFSC	STATUS, 0
	BRA	_00218_DS_
;	.line	176; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	for (cpt=0;cpt<EP_OUT_BD(1).Cnt;cpt++)
	CLRF	r0x00
_00222_DS_:
	BANKSEL	(_ep_bdt + 9)
	MOVF	(_ep_bdt + 9), W, B
	SUBWF	r0x00, W
	BC	_00213_DS_
;	.line	178; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	caractere=RXbuffer[cpt];
	MOVLW	LOW(_RXbuffer)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_RXbuffer)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	INDF0, r0x01
	BANKSEL	_usbwp
;	.line	179; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	if (usbwp!=USBRXSIZE-1) newusbwp=usbwp+1;               
	MOVF	_usbwp, W, B
	XORLW	0x3f
	BZ	_00207_DS_
_00255_DS_:
	BANKSEL	_usbwp
	INCF	_usbwp, W, B
	MOVWF	r0x02
	BRA	_00208_DS_
_00207_DS_:
;	.line	180; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	else newusbwp=1;
	MOVLW	0x01
	MOVWF	r0x02
_00208_DS_:
	BANKSEL	_usbrp
;	.line	181; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	if (usbrp!=newusbwp) usbrx[usbwp++]=caractere;
	MOVF	_usbrp, W, B
	XORWF	r0x02, W
	BZ	_00210_DS_
	MOVFF	_usbwp, r0x02
	BANKSEL	_usbwp
	INCF	_usbwp, F, B
	CLRF	r0x03
	MOVLW	LOW(_usbrx)
	ADDWF	r0x02, F
	MOVLW	HIGH(_usbrx)
	ADDWFC	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x01, INDF0
_00210_DS_:
	BANKSEL	_usbwp
;	.line	182; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	if (usbwp==USBRXSIZE) usbwp=1;
	MOVF	_usbwp, W, B
	XORLW	0x40
	BNZ	_00223_DS_
	MOVLW	0x01
	BANKSEL	_usbwp
	MOVWF	_usbwp, B
_00223_DS_:
;	.line	176; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	for (cpt=0;cpt<EP_OUT_BD(1).Cnt;cpt++)
	INCF	r0x00, F
	BRA	_00222_DS_
_00213_DS_:
;	.line	184; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	EP_OUT_BD(1).Cnt = EP1_BUFFER_SIZE;
	MOVLW	0x40
	BANKSEL	(_ep_bdt + 9)
	MOVWF	(_ep_bdt + 9), B
; removed redundant BANKSEL
;	.line	185; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	if(EP_OUT_BD(1).Stat.DTS == 0)
	BTFSC	(_ep_bdt + 8), 6, B
	BRA	_00215_DS_
;	.line	187; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	EP_OUT_BD(1).Stat.uc = BDS_USIE | BDS_DAT1 | BDS_DTSEN;
	MOVLW	0xc8
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 8), B
	BRA	_00224_DS_
_00215_DS_:
;	.line	191; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	EP_OUT_BD(1).Stat.uc = BDS_USIE | BDS_DAT0 | BDS_DTSEN;
	MOVLW	0x88
	BANKSEL	(_ep_bdt + 8)
	MOVWF	(_ep_bdt + 8), B
	BRA	_00224_DS_
_00218_DS_:
;	.line	196; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	EP_OUT_BD(1).Cnt = EP1_BUFFER_SIZE;
	MOVLW	0x40
	BANKSEL	(_ep_bdt + 9)
	MOVWF	(_ep_bdt + 9), B
;	.line	197; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	EP_OUT_BD(1).ADR = (u8 __data *)&RXbuffer;
	MOVLW	LOW(_RXbuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 10), B
	MOVLW	HIGH(_RXbuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 11), B
;	.line	198; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	EP_OUT_BD(1).Stat.uc = BDS_USIE | BDS_BSTALL;
	MOVLW	0x84
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 8), B
_00224_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__usbreceive	code
_usbreceive:
;	.line	156; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	u8 usbreceive(u8 *rxpointer)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
;	.line	159; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	while (usbavailable())
	CLRF	r0x03
_00185_DS_:
	CALL	_usbavailable
	MOVWF	r0x04
	MOVF	r0x04, W
	BZ	_00187_DS_
;	.line	161; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	rxpointer[rp++]= usbrx[usbrp++];
	MOVFF	r0x03, r0x04
	INCF	r0x03, F
	CLRF	r0x05
	CLRF	r0x06
	MOVF	r0x00, W
	ADDWF	r0x04, F
	MOVF	r0x01, W
	ADDWFC	r0x05, F
	MOVF	r0x02, W
	ADDWFC	r0x06, F
	MOVFF	_usbrp, r0x07
	BANKSEL	_usbrp
	INCF	_usbrp, F, B
	CLRF	r0x08
	MOVLW	LOW(_usbrx)
	ADDWF	r0x07, F
	MOVLW	HIGH(_usbrx)
	ADDWFC	r0x08, F
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, FSR0H
	MOVFF	INDF0, r0x07
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrput1
	BANKSEL	_usbrp
;	.line	162; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	if (usbrp==USBRXSIZE)
	MOVF	_usbrp, W, B
	XORLW	0x40
	BNZ	_00185_DS_
;	.line	163; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	usbrp=1;
	MOVLW	0x01
	BANKSEL	_usbrp
	MOVWF	_usbrp, B
	BRA	_00185_DS_
_00187_DS_:
;	.line	165; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	return(rp);
	MOVF	r0x03, W
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__usbread	code
_usbread:
;	.line	143; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	u8 usbread()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	145; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	u8 caractere=0;
	CLRF	r0x00
;	.line	147; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	if (usbavailable)
	MOVF	LOW(_usbavailable), W
	IORWF	HIGH(_usbavailable), W
	IORWF	UPPER(_usbavailable), W
	BZ	_00168_DS_
;	.line	149; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	caractere=usbrx[usbrp++];
	MOVFF	_usbrp, r0x01
	BANKSEL	_usbrp
	INCF	_usbrp, F, B
	CLRF	r0x02
	MOVLW	LOW(_usbrx)
	ADDWF	r0x01, F
	MOVLW	HIGH(_usbrx)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	INDF0, r0x00
; removed redundant BANKSEL
;	.line	150; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	if (usbrp==USBRXSIZE)
	MOVF	_usbrp, W, B
	XORLW	0x40
	BNZ	_00168_DS_
;	.line	151; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	usbrp=1;
	MOVLW	0x01
	BANKSEL	_usbrp
	MOVWF	_usbrp, B
_00168_DS_:
;	.line	153; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	return(caractere);
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__epap_in	code
_epap_in:
	BANKSEL	_ep2_num_bytes_to_send
;	.line	121; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	if((ep2_num_bytes_to_send == 0) && last_send_was_null)
	MOVF	_ep2_num_bytes_to_send, W, B
; removed redundant BANKSEL
	IORWF	(_ep2_num_bytes_to_send + 1), W, B
	BNZ	_00143_DS_
; #	MOVF	_last_send_was_null, W, B
; #	BTFSC	STATUS, 2
; #	GOTO	_00143_DS_
; #	GOTO	_00148_DS_
; #	MOVLW	0x00
	BANKSEL	_last_send_was_null
;	.line	123; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	return;
	MOVF	_last_send_was_null, W, B
;	.line	125; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	last_send_was_null = (ep2_num_bytes_to_send < EP2_BUFFER_SIZE);
	BNZ	_00148_DS_
_00143_DS_:
	MOVLW	0x00
	BANKSEL	(_ep2_num_bytes_to_send + 1)
	SUBWF	(_ep2_num_bytes_to_send + 1), W, B
	BNZ	_00160_DS_
	MOVLW	0x40
; removed redundant BANKSEL
	SUBWF	_ep2_num_bytes_to_send, W, B
_00160_DS_:
	BTG	STATUS, 0
	BANKSEL	_last_send_was_null
	CLRF	_last_send_was_null, B
	RLCF	_last_send_was_null, F, B
; #	MOVF	_ep2_num_bytes_to_send, W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	BANKSEL	_ep2_num_bytes_to_send
;	.line	126; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	EP_IN_BD(2).Cnt = ep2_num_bytes_to_send;
	MOVF	_ep2_num_bytes_to_send, W, B
	BANKSEL	(_ep_bdt + 21)
	MOVWF	(_ep_bdt + 21), B
;	.line	129; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	fill_in_buffer(2, &ep2_source_data, EP2_BUFFER_SIZE, &ep2_num_bytes_to_send);
	MOVLW	0x80
; #	MOVWF	r0x05
; #	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_ep2_num_bytes_to_send)
	MOVWF	POSTDEC1
	MOVLW	LOW(_ep2_num_bytes_to_send)
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x40
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVLW	HIGH(_ep2_source_data)
	MOVWF	POSTDEC1
	MOVLW	LOW(_ep2_source_data)
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_fill_in_buffer
	MOVLW	0x09
	ADDWF	FSR1L, F
	BANKSEL	(_ep_bdt + 20)
;	.line	131; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	if(EP_IN_BD(2).Stat.DTS == 0)
	BTFSC	(_ep_bdt + 20), 6, B
	BRA	_00146_DS_
;	.line	133; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	EP_IN_BD(2).Stat.uc = BDS_USIE | BDS_DAT1 | BDS_DTSEN;
	MOVLW	0xc8
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 20), B
	BRA	_00148_DS_
_00146_DS_:
;	.line	137; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	EP_IN_BD(2).Stat.uc = BDS_USIE | BDS_DAT0 | BDS_DTSEN;
	MOVLW	0x88
	BANKSEL	(_ep_bdt + 20)
	MOVWF	(_ep_bdt + 20), B
_00148_DS_:
	RETURN	

; ; Starting pCode block
S_main__usbsend	code
_usbsend:
;	.line	102; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	void usbsend(u8 *txpointer, u8 length)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, _ep2_source_data
	MOVLW	0x03
	MOVFF	PLUSW2, (_ep2_source_data + 1)
	MOVLW	0x04
	MOVFF	PLUSW2, (_ep2_source_data + 2)
	MOVLW	0x05
	MOVFF	PLUSW2, r0x00
;	.line	105; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	ep2_num_bytes_to_send=length;
	MOVFF	r0x00, _ep2_num_bytes_to_send
	BANKSEL	(_ep2_num_bytes_to_send + 1)
	CLRF	(_ep2_num_bytes_to_send + 1), B
;	.line	106; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	prepare_ep2_in();
	CALL	_prepare_ep2_in
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__prepare_ep2_in	code
_prepare_ep2_in:
;	.line	88; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	last_send_was_null = (ep2_num_bytes_to_send < EP2_BUFFER_SIZE);
	MOVLW	0x00
	BANKSEL	(_ep2_num_bytes_to_send + 1)
	SUBWF	(_ep2_num_bytes_to_send + 1), W, B
	BNZ	_00132_DS_
	MOVLW	0x40
; removed redundant BANKSEL
	SUBWF	_ep2_num_bytes_to_send, W, B
_00132_DS_:
	BTG	STATUS, 0
	BANKSEL	_last_send_was_null
	CLRF	_last_send_was_null, B
	RLCF	_last_send_was_null, F, B
; #	MOVF	_ep2_num_bytes_to_send, W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	BANKSEL	_ep2_num_bytes_to_send
;	.line	89; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	EP_IN_BD(2).Cnt = ep2_num_bytes_to_send;
	MOVF	_ep2_num_bytes_to_send, W, B
	BANKSEL	(_ep_bdt + 21)
	MOVWF	(_ep_bdt + 21), B
;	.line	90; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	EP_IN_BD(2).ADR = (u8 __data *)&TXBuffer;
	MOVLW	LOW(_TXBuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 22), B
	MOVLW	HIGH(_TXBuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 23), B
;	.line	91; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	fill_in_buffer(2, &ep2_source_data, EP2_BUFFER_SIZE, &ep2_num_bytes_to_send);
	MOVLW	0x80
; #	MOVWF	r0x05
; #	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_ep2_num_bytes_to_send)
	MOVWF	POSTDEC1
	MOVLW	LOW(_ep2_num_bytes_to_send)
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x40
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVLW	HIGH(_ep2_source_data)
	MOVWF	POSTDEC1
	MOVLW	LOW(_ep2_source_data)
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_fill_in_buffer
	MOVLW	0x09
	ADDWF	FSR1L, F
	BANKSEL	(_ep_bdt + 20)
;	.line	92; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	if(EP_IN_BD(2).Stat.DTS == 0)
	BTFSC	(_ep_bdt + 20), 6, B
	BRA	_00124_DS_
;	.line	94; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	EP_IN_BD(2).Stat.uc = BDS_USIE | BDS_DAT1 | BDS_DTSEN;
	MOVLW	0xc8
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 20), B
	BRA	_00126_DS_
_00124_DS_:
;	.line	98; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	EP_IN_BD(2).Stat.uc = BDS_USIE | BDS_DAT0 | BDS_DTSEN;
	MOVLW	0x88
	BANKSEL	(_ep_bdt + 20)
	MOVWF	(_ep_bdt + 20), B
_00126_DS_:
	RETURN	

; ; Starting pCode block
S_main__epapin_init	code
_epapin_init:
;	.line	82; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	EP_IN_BD(2).Stat.uc = BDS_UCPU | BDS_DAT1 | BDS_DTSEN;
	MOVLW	0x48
	BANKSEL	(_ep_bdt + 20)
	MOVWF	(_ep_bdt + 20), B
;	.line	83; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	UEP2 = EPHSHK_EN | EPINEN_EN |  EPCONDIS_EN;
	MOVLW	0x1a
	MOVWF	_UEP2
	RETURN	

; ; Starting pCode block
S_main__usbavailable	code
_usbavailable:
;	.line	73; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	u8 usbavailable(void)
	MOVFF	r0x00, POSTDEC1
;	.line	75; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	return (usbwp!=usbrp);
	CLRF	r0x00
	BANKSEL	_usbwp
	MOVF	_usbwp, W, B
	BANKSEL	_usbrp
	XORWF	_usbrp, W, B
	BNZ	_00113_DS_
	INCF	r0x00, F
_00113_DS_:
	MOVF	r0x00, W
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	CLRF	r0x00
	RLCF	r0x00, F
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__usb_init	code
_usb_init:
;	.line	65; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	PIR2bits.USBIF = 0;     // clear usb interrupt flag
	BCF	_PIR2bits, 5
;	.line	66; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	PIE2bits.USBIE = 1;     // enable usb interrupt
	BSF	_PIE2bits, 5
;	.line	67; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	IPR2bits.USBIP = 1;     // high priority interrupt
	BSF	_IPR2bits, 5
;	.line	69; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	INTCONbits.GIEH = 1;   // Enable global HP interrupts
	BSF	_INTCONbits, 7
;	.line	70; F:/OneDrive/API_PINGUINO_18F4550/API/pinguino/libraries/usb.c	INTCONbits.GIEL = 1;   // Enable global LP interrupts
	BSF	_INTCONbits, 6
	RETURN	

; ; Starting pCode block for Ival
	code
_mask:
	DB	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x40, 0x80, 0x01, 0x02
	DB	0x04, 0x01, 0x02, 0x04, 0x08, 0x20, 0x01, 0x02, 0x04, 0x01, 0x02, 0x04
	DB	0x08, 0x10, 0x20, 0x40, 0x80, 0x10
; ; Starting pCode block for Ival
_port:
	DB	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x02, 0x02, 0x02
	DB	0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x04, 0x04, 0x03, 0x03, 0x03
	DB	0x03, 0x03, 0x03, 0x03, 0x03, 0x00
; ; Starting pCode block for Ival
_cpudiv:
	DB	0x02, 0x03, 0x04, 0x06
; ; Starting pCode block for Ival
_cpudiv_xtal:
	DB	0x01, 0x02, 0x03, 0x04
; ; Starting pCode block for Ival
_ircf:
	DB	0x12, 0x7a, 0x00, 0x00, 0x48, 0xe8, 0x01, 0x00, 0x90, 0xd0, 0x03, 0x00
	DB	0x20, 0xa1, 0x07, 0x00, 0x40, 0x42, 0x0f, 0x00, 0x80, 0x84, 0x1e, 0x00
	DB	0x00, 0x09, 0x3d, 0x00, 0x00, 0x12, 0x7a, 0x00
; ; Starting pCode block
___str_0:
	DB	0x49, 0x6e, 0x58, 0x6f, 0x75, 0x72, 0x63, 0x65, 0x00
; ; Starting pCode block
___str_1:
	DB	0x50, 0x72, 0x75, 0x65, 0x62, 0x61, 0x2e, 0x2e, 0x2e, 0x2e, 0x2e, 0x00


; Statistics:
; code size:	 5698 (0x1642) bytes ( 4.35%)
;           	 2849 (0x0b21) words
; udata size:	  415 (0x019f) bytes (23.16%)
; access size:	   14 (0x000e) bytes


	end
