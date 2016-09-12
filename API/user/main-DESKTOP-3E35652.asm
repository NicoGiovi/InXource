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
	global	__cpu_clock_
	global	_System_readFlashMemory
	global	_System_getCpuFrequency
	global	_Delayms
	global	_pinmode
	global	_digitalwrite
	global	_digitalread
	global	_toggle
	global	_IO_init
	global	_IO_digital
	global	_setup
	global	_loop
	global	_epap_in
	global	_epap_out
	global	_epapin_init
	global	_epapout_init
	global	_pinguino_main
	global	_mask
	global	_port

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
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
TBLPTRL	equ	0xff6
TBLPTRH	equ	0xff7
TBLPTRU	equ	0xff8
TABLAT	equ	0xff5
FSR0L	equ	0xfe9
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
POSTINC1	equ	0xfe6
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb
PRODL	equ	0xff3
PRODH	equ	0xff4


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

udata_main_0	udata
__cpu_clock_	res	4

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_main__pinguino_main	code
_pinguino_main:
;	.line	149; D:\OneDrive\API_PINGUINO_18F4550\API\user\main.c	if (RCONbits.NOT_POR == 0)
	BTFSC	_RCONbits, 1
	BRA	_00341_DS_
;	.line	151; D:\OneDrive\API_PINGUINO_18F4550\API\user\main.c	RCON |= 0b10010011;         // set all reset flag
	MOVLW	0x93
	IORWF	_RCON, F
_00341_DS_:
;	.line	197; D:\OneDrive\API_PINGUINO_18F4550\API\user\main.c	if (OSCCONbits.SCS > 0x01)
	MOVF	_OSCCONbits, W
	ANDLW	0x03
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	ADDLW	0x80
	ADDLW	0x7e
	BNC	_00346_DS_
_00342_DS_:
;	.line	199; D:\OneDrive\API_PINGUINO_18F4550\API\user\main.c	while (!OSCCONbits.IOFS);
	BTFSS	_OSCCONbits, 2
	BRA	_00342_DS_
_00346_DS_:
;	.line	243; D:\OneDrive\API_PINGUINO_18F4550\API\user\main.c	IO_init();
	CALL	_IO_init
;	.line	244; D:\OneDrive\API_PINGUINO_18F4550\API\user\main.c	IO_digital();
	CALL	_IO_digital
;	.line	300; D:\OneDrive\API_PINGUINO_18F4550\API\user\main.c	setup();
	CALL	_setup
_00348_DS_:
;	.line	327; D:\OneDrive\API_PINGUINO_18F4550\API\user\main.c	loop();
	CALL	_loop
	BRA	_00348_DS_
	RETURN	

; ; Starting pCode block
S_main__epapout_init	code
_epapout_init:
;	.line	99; D:\OneDrive\API_PINGUINO_18F4550\API\user\main.c	void epapout_init() { return; }
	RETURN	

; ; Starting pCode block
S_main__epapin_init	code
_epapin_init:
;	.line	98; D:\OneDrive\API_PINGUINO_18F4550\API\user\main.c	void epapin_init()  { return; }
	RETURN	

; ; Starting pCode block
S_main__epap_out	code
_epap_out:
;	.line	97; D:\OneDrive\API_PINGUINO_18F4550\API\user\main.c	void epap_out()     { return; }
	RETURN	

; ; Starting pCode block
S_main__epap_in	code
_epap_in:
;	.line	96; D:\OneDrive\API_PINGUINO_18F4550\API\user\main.c	void epap_in()      { return; }
	RETURN	

; ; Starting pCode block
S_main__loop	code
_loop:
;	.line	13; D:\OneDrive\API_PINGUINO_18F4550\API\user\/user.c	toggle(USERLED);    
	MOVLW	0x1d
	MOVWF	POSTDEC1
	CALL	_toggle
	MOVF	POSTINC1, F
;	.line	14; D:\OneDrive\API_PINGUINO_18F4550\API\user\/user.c	Delayms(200);        
	CLRF	POSTDEC1
	MOVLW	0xc8
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	RETURN	

; ; Starting pCode block
S_main__setup	code
_setup:
;	.line	8; D:\OneDrive\API_PINGUINO_18F4550\API\user\/user.c	pinmode(USERLED, OUTPUT);   
	CLRF	POSTDEC1
	MOVLW	0x1d
	MOVWF	POSTDEC1
	CALL	_pinmode
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	RETURN	

; ; Starting pCode block
S_main__IO_digital	code
_IO_digital:
;	.line	123; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	ADCON1 = 0x0F;				// AN0 to AN12 Digital I/O
	MOVLW	0x0f
	MOVWF	_ADCON1
;	.line	124; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	CMCON = 0x07;               // Comparators as Digital I/O
	MOVLW	0x07
	MOVWF	_CMCON
	RETURN	

; ; Starting pCode block
S_main__IO_init	code
_IO_init:
;	.line	53; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	LATA  = 0x00;
	CLRF	_LATA
;	.line	54; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	LATB  = 0x00;
	CLRF	_LATB
;	.line	72; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	LATC  = 0x00;
	CLRF	_LATC
;	.line	79; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	LATD  = 0x00; 
	CLRF	_LATD
;	.line	80; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	LATE  = 0x00; 
	CLRF	_LATE
;	.line	83; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	TRISA = 0x00;
	CLRF	_TRISA
;	.line	85; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	TRISB = 0x00;
	CLRF	_TRISB
;	.line	91; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	TRISCbits.TRISC0 = 0x00;
	BCF	_TRISCbits, 0
;	.line	92; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	TRISCbits.TRISC1 = 0x00;
	BCF	_TRISCbits, 1
;	.line	93; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	TRISCbits.TRISC2 = 0x00;
	BCF	_TRISCbits, 2
;	.line	94; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	TRISCbits.TRISC6 = 0x00;
	BCF	_TRISCbits, 6
;	.line	95; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	TRISCbits.TRISC7 = 0x00;
	BCF	_TRISCbits, 7
;	.line	101; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	TRISD = 0x00; 
	CLRF	_TRISD
;	.line	102; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	TRISE = 0x00; 
	CLRF	_TRISE
;	.line	106; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	PORTA  = 0x00;
	CLRF	_PORTA
;	.line	107; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	PORTB  = 0x00;
	CLRF	_PORTB
;	.line	108; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	PORTC  = 0x00;
	CLRF	_PORTC
;	.line	112; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	PORTD  = 0x00; 
	CLRF	_PORTD
;	.line	113; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/io.c	PORTE  = 0x00; 
	CLRF	_PORTE
	RETURN	

; ; Starting pCode block
S_main__toggle	code
_toggle:
;	.line	47; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalt.c	void toggle(u8 pin)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	50; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalt.c	state = digitalread(pin);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_digitalread
	MOVWF	r0x01
	MOVF	POSTINC1, F
;	.line	51; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalt.c	digitalwrite(pin, state^1);
	BTG	r0x01, 0
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_digitalwrite
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__digitalread	code
_digitalread:
;	.line	48; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalr.c	u8 digitalread(u8 pin)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	54; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalr.c	switch (port[pin])
	MOVLW	LOW(_port)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_port)
	ADDWFC	r0x02, F
	CLRF	r0x03
	MOVLW	UPPER(_port)
	ADDWFC	r0x03, F
	MOVFF	r0x01, TBLPTRL
	MOVFF	r0x02, TBLPTRH
	MOVFF	r0x03, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x01
	MOVLW	0x05
	SUBWF	r0x01, W
	BTFSC	STATUS, 0
	BRA	_00258_DS_
	CLRF	PCLATH
	CLRF	PCLATU
	RLCF	r0x01, W
	RLCF	PCLATH, F
	RLCF	WREG, W
	RLCF	PCLATH, F
	ANDLW	0xfc
	ADDLW	LOW(_00290_DS_)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_00290_DS_)
	ADDWFC	PCLATH, F
	MOVLW	UPPER(_00290_DS_)
	ADDWFC	PCLATU, F
	MOVF	PREINC1, W
	MOVWF	PCL
_00290_DS_:
	GOTO	_00253_DS_
	GOTO	_00254_DS_
	GOTO	_00255_DS_
	GOTO	_00256_DS_
	GOTO	_00257_DS_
_00253_DS_:
;	.line	57; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalr.c	return ((PORTA & mask[pin])!=0);
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
	MOVF	_PORTA, W
	ANDWF	r0x01, F
	MOVF	r0x01, W
	BZ	_00261_DS_
	MOVLW	0x01
	MOVWF	r0x01
	BRA	_00262_DS_
_00261_DS_:
	CLRF	r0x01
_00262_DS_:
	MOVF	r0x01, W
	BRA	_00259_DS_
_00254_DS_:
;	.line	60; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalr.c	return ((PORTB & mask[pin])!=0);
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
	MOVF	_PORTB, W
	ANDWF	r0x01, F
	MOVF	r0x01, W
	BZ	_00263_DS_
	MOVLW	0x01
	MOVWF	r0x01
	BRA	_00264_DS_
_00263_DS_:
	CLRF	r0x01
_00264_DS_:
	MOVF	r0x01, W
	BRA	_00259_DS_
_00255_DS_:
;	.line	63; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalr.c	return ((PORTC & mask[pin])!=0);
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
	MOVF	_PORTC, W
	ANDWF	r0x01, F
	MOVF	r0x01, W
	BZ	_00265_DS_
	MOVLW	0x01
	MOVWF	r0x01
	BRA	_00266_DS_
_00265_DS_:
	CLRF	r0x01
_00266_DS_:
	MOVF	r0x01, W
	BRA	_00259_DS_
_00256_DS_:
;	.line	70; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalr.c	return ((PORTD & mask[pin])!=0);
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
	MOVF	_PORTD, W
	ANDWF	r0x01, F
	MOVF	r0x01, W
	BZ	_00267_DS_
	MOVLW	0x01
	MOVWF	r0x01
	BRA	_00268_DS_
_00267_DS_:
	CLRF	r0x01
_00268_DS_:
	MOVF	r0x01, W
	BRA	_00259_DS_
_00257_DS_:
;	.line	73; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalr.c	return ((PORTE & mask[pin])!=0);
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
	MOVF	_PORTE, W
	ANDWF	r0x00, F
	MOVF	r0x00, W
	BZ	_00269_DS_
	MOVLW	0x01
	MOVWF	r0x00
	BRA	_00270_DS_
_00269_DS_:
	CLRF	r0x00
_00270_DS_:
	MOVF	r0x00, W
	BRA	_00259_DS_
_00258_DS_:
;	.line	77; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalr.c	return 0;
	CLRF	WREG
_00259_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__digitalwrite	code
_digitalwrite:
;	.line	48; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	void digitalwrite(u8 pin, u8 state)
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
;	.line	54; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	switch (port[pin])
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
	BRA	_00227_DS_
	CLRF	PCLATH
	CLRF	PCLATU
	RLCF	r0x02, W
	RLCF	PCLATH, F
	RLCF	WREG, W
	RLCF	PCLATH, F
	ANDLW	0xfc
	ADDLW	LOW(_00248_DS_)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_00248_DS_)
	ADDWFC	PCLATH, F
	MOVLW	UPPER(_00248_DS_)
	ADDWFC	PCLATU, F
	MOVF	PREINC1, W
	MOVWF	PCL
_00248_DS_:
	GOTO	_00206_DS_
	GOTO	_00210_DS_
	GOTO	_00214_DS_
	GOTO	_00218_DS_
	GOTO	_00222_DS_
_00206_DS_:
;	.line	57; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	if (state) LATA=LATA | mask[pin];
	MOVF	r0x01, W
	BZ	_00208_DS_
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
	BRA	_00227_DS_
_00208_DS_:
;	.line	58; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	else LATA=LATA & (255-mask[pin]);
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
;	.line	59; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	break;
	BRA	_00227_DS_
_00210_DS_:
;	.line	61; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	if (state) LATB=LATB | mask[pin]; 
	MOVF	r0x01, W
	BZ	_00212_DS_
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
	BRA	_00227_DS_
_00212_DS_:
;	.line	62; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	else LATB=LATB & (255-mask[pin]);
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
;	.line	63; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	break;
	BRA	_00227_DS_
_00214_DS_:
;	.line	65; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	if (state) LATC=LATC | mask[pin];
	MOVF	r0x01, W
	BZ	_00216_DS_
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
	BRA	_00227_DS_
_00216_DS_:
;	.line	66; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	else LATC=LATC & (255-mask[pin]);
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
;	.line	67; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	break;
	BRA	_00227_DS_
_00218_DS_:
;	.line	72; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	if (state) LATD=LATD | mask[pin]; 
	MOVF	r0x01, W
	BZ	_00220_DS_
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
	BRA	_00227_DS_
_00220_DS_:
;	.line	73; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	else LATD=LATD & (255-mask[pin]);
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
;	.line	74; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	break;
	BRA	_00227_DS_
_00222_DS_:
;	.line	76; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	if (state) LATE=LATE | mask[pin]; 
	MOVF	r0x01, W
	BZ	_00224_DS_
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
	BRA	_00227_DS_
_00224_DS_:
;	.line	77; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	else LATE=LATE & (255-mask[pin]);
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
_00227_DS_:
;	.line	80; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalw.c	}
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
;	.line	44; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	void pinmode(u8 pin, u8 state)
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
;	.line	46; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	switch (port[pin])
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
	BRA	_00180_DS_
	CLRF	PCLATH
	CLRF	PCLATU
	RLCF	r0x02, W
	RLCF	PCLATH, F
	RLCF	WREG, W
	RLCF	PCLATH, F
	ANDLW	0xfc
	ADDLW	LOW(_00201_DS_)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_00201_DS_)
	ADDWFC	PCLATH, F
	MOVLW	UPPER(_00201_DS_)
	ADDWFC	PCLATU, F
	MOVF	PREINC1, W
	MOVWF	PCL
_00201_DS_:
	GOTO	_00159_DS_
	GOTO	_00163_DS_
	GOTO	_00167_DS_
	GOTO	_00171_DS_
	GOTO	_00175_DS_
_00159_DS_:
;	.line	49; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	if (state) TRISA=TRISA | mask[pin];
	MOVF	r0x01, W
	BZ	_00161_DS_
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
	BRA	_00180_DS_
_00161_DS_:
;	.line	50; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	else TRISA=TRISA & (255-mask[pin]);
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
;	.line	51; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	break;
	BRA	_00180_DS_
_00163_DS_:
;	.line	53; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	if (state) TRISB=TRISB | mask[pin];
	MOVF	r0x01, W
	BZ	_00165_DS_
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
	BRA	_00180_DS_
_00165_DS_:
;	.line	54; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	else TRISB=TRISB & (255-mask[pin]);
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
;	.line	55; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	break;
	BRA	_00180_DS_
_00167_DS_:
;	.line	57; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	if (state) TRISC=TRISC | mask[pin];
	MOVF	r0x01, W
	BZ	_00169_DS_
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
	BRA	_00180_DS_
_00169_DS_:
;	.line	58; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	else TRISC=TRISC & (255-mask[pin]);
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
;	.line	59; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	break;
	BRA	_00180_DS_
_00171_DS_:
;	.line	64; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	if (state) TRISD=TRISD | mask[pin];
	MOVF	r0x01, W
	BZ	_00173_DS_
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
	BRA	_00180_DS_
_00173_DS_:
;	.line	65; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	else TRISD=TRISD & (255-mask[pin]);
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
;	.line	66; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	break;
	BRA	_00180_DS_
_00175_DS_:
;	.line	68; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	if (state) TRISE=TRISE | mask[pin];
	MOVF	r0x01, W
	BZ	_00177_DS_
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
	BRA	_00180_DS_
_00177_DS_:
;	.line	69; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	else TRISE=TRISE & (255-mask[pin]);
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
_00180_DS_:
;	.line	72; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/digitalp.c	}
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__Delayms	code
_Delayms:
;	.line	93; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/delayms.c	void Delayms(u16 milliseconds)
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
;	.line	100; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/delayms.c	u16 n100tcy = System_getPeripheralFrequency() / 100000;
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
_00151_DS_:
;	.line	101; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/delayms.c	while (milliseconds--)
	MOVFF	r0x00, r0x04
	MOVFF	r0x01, r0x05
	MOVLW	0xff
	ADDWF	r0x00, F
	ADDWFC	r0x01, F
	MOVF	r0x04, W
	IORWF	r0x05, W
	BZ	_00154_DS_
;	.line	102; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/delayms.c	delay100tcy(n100tcy-3);
	MOVF	r0x02, W
	MOVWF	r0x04
	MOVLW	0xfd
	ADDWF	r0x04, F
	MOVF	r0x04, W
	CALL	_delay100tcy
	BRA	_00151_DS_
_00154_DS_:
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
;	.line	227; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	u32 System_getCpuFrequency() 
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
;	.line	242; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	if (OSCCONbits.SCS == 0)
	MOVF	_OSCCONbits, W
	ANDLW	0x03
	MOVWF	r0x00
	MOVF	r0x00, W
	BTFSS	STATUS, 2
	BRA	_00116_DS_
;	.line	268; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	CPUDIV  = ( System_readFlashMemory(__CONFIG1L) & 0b00011000 ) >> 3;
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
;	.line	269; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	CPUDIV_XTAL = cpudiv_xtal[CPUDIV];
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
;	.line	270; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	fosc  = System_readFlashMemory(__CONFIG1H) & 0b00001111;
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
;	.line	284; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	CPUDIV = cpudiv[CPUDIV];
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
;	.line	292; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	fosc >>=1;
	BCF	STATUS, 0
	RRCF	r0x02, F
;	.line	293; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	if( (fosc==0) || (fosc==2) || (fosc==6) )
	MOVF	r0x02, W
	BZ	_00110_DS_
	MOVF	r0x02, W
	XORLW	0x02
	BZ	_00110_DS_
	MOVF	r0x02, W
	XORLW	0x06
	BNZ	_00111_DS_
_00110_DS_:
;	.line	295; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	return CRYSTAL / CPUDIV_XTAL;
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
	BRA	_00121_DS_
_00111_DS_:
;	.line	299; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	return 96000000UL / CPUDIV;
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
	BRA	_00121_DS_
_00116_DS_:
;	.line	312; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	if (OSCCONbits.SCS == 1)
	MOVF	_OSCCONbits, W
	ANDLW	0x03
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00118_DS_
;	.line	313; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	return 32768;
	CLRF	FSR0L
	CLRF	PRODH
	MOVLW	0x80
	MOVWF	PRODL
	CLRF	WREG
	BRA	_00121_DS_
_00118_DS_:
;	.line	316; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	if (OSCCONbits.SCS >= 2)
	MOVF	_OSCCONbits, W
	ANDLW	0x03
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	ADDLW	0x80
	ADDLW	0x7e
	BNC	_00120_DS_
;	.line	317; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	return ircf[OSCCONbits.IRCF];
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
	BRA	_00121_DS_
_00120_DS_:
;	.line	319; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	return 0;
	CLRF	FSR0L
	CLRF	PRODH
	CLRF	PRODL
	CLRF	WREG
_00121_DS_:
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
;	.line	190; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	u16 System_readFlashMemory(u32 address)
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
;	.line	194; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	TBLPTRU = address >> 16;
	MOVF	r0x02, W
	MOVWF	r0x04
	MOVF	r0x03, W
	MOVWF	r0x05
	CLRF	r0x06
	CLRF	r0x07
	MOVF	r0x04, W
	MOVWF	_TBLPTRU
;	.line	195; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	TBLPTRH = address >> 8;
	MOVF	r0x01, W
	MOVWF	r0x04
	MOVF	r0x02, W
	MOVWF	r0x05
	MOVF	r0x03, W
	MOVWF	r0x06
	CLRF	r0x07
	MOVF	r0x04, W
	MOVWF	_TBLPTRH
;	.line	196; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	TBLPTRL = address;
	MOVF	r0x00, W
	MOVWF	_TBLPTRL
	tblrd*+
;	.line	198; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	l8 = TABLAT;
	MOVFF	_TABLAT, r0x00
	tblrd*+
;	.line	200; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	h8 = TABLAT;
	MOVFF	_TABLAT, r0x01
;	.line	202; D:/OneDrive/API_PINGUINO_18F4550/API/pinguino/core/oscillator.c	return ((h8 << 8) + l8);
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

; ; Starting pCode block for Ival
	code
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
; ; Starting pCode block for Ival
_mask:
	DB	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x40, 0x80, 0x01, 0x02
	DB	0x04, 0x01, 0x02, 0x04, 0x08, 0x20, 0x01, 0x02, 0x04, 0x01, 0x02, 0x04
	DB	0x08, 0x10, 0x20, 0x40, 0x80, 0x10
; ; Starting pCode block for Ival
_port:
	DB	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x02, 0x02, 0x02
	DB	0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x04, 0x04, 0x03, 0x03, 0x03
	DB	0x03, 0x03, 0x03, 0x03, 0x03, 0x00


; Statistics:
; code size:	 2720 (0x0aa0) bytes ( 2.08%)
;           	 1360 (0x0550) words
; udata size:	    4 (0x0004) bytes ( 0.22%)
; access size:	    8 (0x0008) bytes


	end
