;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.2.1 #8447 (Jul 12 2013) (Linux)
; This file was generated Fri Jan 13 11:36:10 2017
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f26k22
	radix	dec


;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global	_EEdeclareChar
	global	_EEdeclareInt
	global	_EEdeclareLong
	global	_EEwriteMain
	global	_EEreadMain
	global	_eeaddress
	global	_eeoperation
	global	_EELoadChar
	global	_EELoadInt
	global	_EELoadLong
	global	_EESaveChar
	global	_EESaveInt
	global	_EESaveLong

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern	__gptrput1
	extern	__gptrget1
	extern	__gptrput2
	extern	__gptrget2
	extern	__gptrput4
	extern	__gptrget4
	extern	_ANSELAbits
	extern	_ANSELBbits
	extern	_ANSELCbits
	extern	_PMD2bits
	extern	_PMD1bits
	extern	_PMD0bits
	extern	_DACCON1bits
	extern	_VREFCON2bits
	extern	_DACCON0bits
	extern	_VREFCON1bits
	extern	_FVRCONbits
	extern	_VREFCON0bits
	extern	_CTMUICONbits
	extern	_CTMUICONHbits
	extern	_CTMUCON1bits
	extern	_CTMUCONLbits
	extern	_CTMUCON0bits
	extern	_CTMUCONHbits
	extern	_SRCON1bits
	extern	_SRCON0bits
	extern	_CCPTMRS1bits
	extern	_CCPTMRS0bits
	extern	_T6CONbits
	extern	_T5GCONbits
	extern	_T5CONbits
	extern	_T4CONbits
	extern	_CCP5CONbits
	extern	_CCP4CONbits
	extern	_PSTR3CONbits
	extern	_CCP3ASbits
	extern	_ECCP3ASbits
	extern	_PWM3CONbits
	extern	_CCP3CONbits
	extern	_SLRCONbits
	extern	_WPUBbits
	extern	_IOCBbits
	extern	_PSTR2CONbits
	extern	_CCP2ASbits
	extern	_ECCP2ASbits
	extern	_PWM2CONbits
	extern	_CCP2CONbits
	extern	_SSP2CON3bits
	extern	_SSP2MSKbits
	extern	_SSP2CON2bits
	extern	_SSP2CON1bits
	extern	_SSP2STATbits
	extern	_BAUD2CONbits
	extern	_BAUDCON2bits
	extern	_RC2STAbits
	extern	_RCSTA2bits
	extern	_TX2STAbits
	extern	_TXSTA2bits
	extern	_CM12CONbits
	extern	_CM2CON1bits
	extern	_CM2CONbits
	extern	_CM2CON0bits
	extern	_CM1CONbits
	extern	_CM1CON0bits
	extern	_PIE4bits
	extern	_PIR4bits
	extern	_IPR4bits
	extern	_PIE5bits
	extern	_PIR5bits
	extern	_IPR5bits
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_PORTCbits
	extern	_PORTEbits
	extern	_LATAbits
	extern	_LATBbits
	extern	_LATCbits
	extern	_DDRAbits
	extern	_TRISAbits
	extern	_DDRBbits
	extern	_TRISBbits
	extern	_DDRCbits
	extern	_TRISCbits
	extern	_TRISEbits
	extern	_OSCTUNEbits
	extern	_HLVDCONbits
	extern	_LVDCONbits
	extern	_PIE1bits
	extern	_PIR1bits
	extern	_IPR1bits
	extern	_PIE2bits
	extern	_PIR2bits
	extern	_IPR2bits
	extern	_PIE3bits
	extern	_PIR3bits
	extern	_IPR3bits
	extern	_EECON1bits
	extern	_EEADRbits
	extern	_EEADRHbits
	extern	_RC1STAbits
	extern	_RCSTAbits
	extern	_RCSTA1bits
	extern	_TX1STAbits
	extern	_TXSTAbits
	extern	_TXSTA1bits
	extern	_T3CONbits
	extern	_T3GCONbits
	extern	_ECCP1ASbits
	extern	_ECCPASbits
	extern	_PWM1CONbits
	extern	_PWMCONbits
	extern	_BAUD1CONbits
	extern	_BAUDCONbits
	extern	_BAUDCON1bits
	extern	_BAUDCTLbits
	extern	_PSTR1CONbits
	extern	_PSTRCONbits
	extern	_T2CONbits
	extern	_CCP1CONbits
	extern	_ADCON2bits
	extern	_ADCON1bits
	extern	_ADCON0bits
	extern	_SSP1CON2bits
	extern	_SSPCON2bits
	extern	_SSP1CON1bits
	extern	_SSPCON1bits
	extern	_SSP1STATbits
	extern	_SSPSTATbits
	extern	_SSP1MSKbits
	extern	_SSPMSKbits
	extern	_SSP1CON3bits
	extern	_SSPCON3bits
	extern	_T1GCONbits
	extern	_T1CONbits
	extern	_RCONbits
	extern	_WDTCONbits
	extern	_OSCCON2bits
	extern	_OSCCONbits
	extern	_T0CONbits
	extern	_STATUSbits
	extern	_INTCON3bits
	extern	_INTCON2bits
	extern	_INTCONbits
	extern	_STKPTRbits
	extern	_stdin
	extern	_stdout
	extern	_Now
	extern	_PORTZ
	extern	_PORTZbits
	extern	_LATZ
	extern	_LATZbits
	extern	_TRICZ
	extern	_TRISZbits
	extern	_ANSELZ
	extern	_ANSELZbits
	extern	_ANSELA
	extern	_ANSELB
	extern	_ANSELC
	extern	_PMD2
	extern	_PMD1
	extern	_PMD0
	extern	_DACCON1
	extern	_VREFCON2
	extern	_DACCON0
	extern	_VREFCON1
	extern	_FVRCON
	extern	_VREFCON0
	extern	_CTMUICON
	extern	_CTMUICONH
	extern	_CTMUCON1
	extern	_CTMUCONL
	extern	_CTMUCON0
	extern	_CTMUCONH
	extern	_SRCON1
	extern	_SRCON0
	extern	_CCPTMRS1
	extern	_CCPTMRS0
	extern	_T6CON
	extern	_PR6
	extern	_TMR6
	extern	_T5GCON
	extern	_T5CON
	extern	_TMR5
	extern	_TMR5L
	extern	_TMR5H
	extern	_T4CON
	extern	_PR4
	extern	_TMR4
	extern	_CCP5CON
	extern	_CCPR5
	extern	_CCPR5L
	extern	_CCPR5H
	extern	_CCP4CON
	extern	_CCPR4
	extern	_CCPR4L
	extern	_CCPR4H
	extern	_PSTR3CON
	extern	_CCP3AS
	extern	_ECCP3AS
	extern	_PWM3CON
	extern	_CCP3CON
	extern	_CCPR3
	extern	_CCPR3L
	extern	_CCPR3H
	extern	_SLRCON
	extern	_WPUB
	extern	_IOCB
	extern	_PSTR2CON
	extern	_CCP2AS
	extern	_ECCP2AS
	extern	_PWM2CON
	extern	_CCP2CON
	extern	_CCPR2
	extern	_CCPR2L
	extern	_CCPR2H
	extern	_SSP2CON3
	extern	_SSP2MSK
	extern	_SSP2CON2
	extern	_SSP2CON1
	extern	_SSP2STAT
	extern	_SSP2ADD
	extern	_SSP2BUF
	extern	_BAUD2CON
	extern	_BAUDCON2
	extern	_RC2STA
	extern	_RCSTA2
	extern	_TX2STA
	extern	_TXSTA2
	extern	_TX2REG
	extern	_TXREG2
	extern	_RC2REG
	extern	_RCREG2
	extern	_SP2BRG
	extern	_SPBRG2
	extern	_SP2BRGH
	extern	_SPBRGH2
	extern	_CM12CON
	extern	_CM2CON1
	extern	_CM2CON
	extern	_CM2CON0
	extern	_CM1CON
	extern	_CM1CON0
	extern	_PIE4
	extern	_PIR4
	extern	_IPR4
	extern	_PIE5
	extern	_PIR5
	extern	_IPR5
	extern	_PORTA
	extern	_PORTB
	extern	_PORTC
	extern	_PORTE
	extern	_LATA
	extern	_LATB
	extern	_LATC
	extern	_DDRA
	extern	_TRISA
	extern	_DDRB
	extern	_TRISB
	extern	_DDRC
	extern	_TRISC
	extern	_TRISE
	extern	_OSCTUNE
	extern	_HLVDCON
	extern	_LVDCON
	extern	_PIE1
	extern	_PIR1
	extern	_IPR1
	extern	_PIE2
	extern	_PIR2
	extern	_IPR2
	extern	_PIE3
	extern	_PIR3
	extern	_IPR3
	extern	_EECON1
	extern	_EECON2
	extern	_EEDATA
	extern	_EEADR
	extern	_EEADRH
	extern	_RC1STA
	extern	_RCSTA
	extern	_RCSTA1
	extern	_TX1STA
	extern	_TXSTA
	extern	_TXSTA1
	extern	_TX1REG
	extern	_TXREG
	extern	_TXREG1
	extern	_RC1REG
	extern	_RCREG
	extern	_RCREG1
	extern	_SP1BRG
	extern	_SPBRG
	extern	_SPBRG1
	extern	_SP1BRGH
	extern	_SPBRGH
	extern	_SPBRGH1
	extern	_T3CON
	extern	_TMR3
	extern	_TMR3L
	extern	_TMR3H
	extern	_T3GCON
	extern	_ECCP1AS
	extern	_ECCPAS
	extern	_PWM1CON
	extern	_PWMCON
	extern	_BAUD1CON
	extern	_BAUDCON
	extern	_BAUDCON1
	extern	_BAUDCTL
	extern	_PSTR1CON
	extern	_PSTRCON
	extern	_T2CON
	extern	_PR2
	extern	_TMR2
	extern	_CCP1CON
	extern	_CCPR1
	extern	_CCPR1L
	extern	_CCPR1H
	extern	_ADCON2
	extern	_ADCON1
	extern	_ADCON0
	extern	_ADRES
	extern	_ADRESL
	extern	_ADRESH
	extern	_SSP1CON2
	extern	_SSPCON2
	extern	_SSP1CON1
	extern	_SSPCON1
	extern	_SSP1STAT
	extern	_SSPSTAT
	extern	_SSP1ADD
	extern	_SSPADD
	extern	_SSP1BUF
	extern	_SSPBUF
	extern	_SSP1MSK
	extern	_SSPMSK
	extern	_SSP1CON3
	extern	_SSPCON3
	extern	_T1GCON
	extern	_T1CON
	extern	_TMR1
	extern	_TMR1L
	extern	_TMR1H
	extern	_RCON
	extern	_WDTCON
	extern	_OSCCON2
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
	extern	_eeWriteByte
	extern	_eeReadByte

;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
WREG	equ	0xfe8
TBLPTRL	equ	0xff6
TBLPTRH	equ	0xff7
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
r0x08	res	1
r0x09	res	1
r0x0a	res	1
r0x0b	res	1

udata_eeparams_0	udata
_eeaddress	res	2

udata_eeparams_1	udata
_eeoperation	res	1

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_eeparams__EEreadMain	code
_EEreadMain:
	BANKSEL	_eeoperation
;	.line	112; /home/arsene/pd-externals/Fraise/eeparams/eeparams.c	eeoperation=EE_RD;
	CLRF	_eeoperation, B
;	.line	113; /home/arsene/pd-externals/Fraise/eeparams/eeparams.c	eeaddress=EEUSER;
	MOVLW	0x1c
	BANKSEL	_eeaddress
	MOVWF	_eeaddress, B
; removed redundant BANKSEL
	CLRF	(_eeaddress + 1), B
	RETURN	

; ; Starting pCode block
S_eeparams__EEwriteMain	code
_EEwriteMain:
;	.line	103; /home/arsene/pd-externals/Fraise/eeparams/eeparams.c	eeoperation=EE_WR;
	MOVLW	0x01
	BANKSEL	_eeoperation
	MOVWF	_eeoperation, B
;	.line	104; /home/arsene/pd-externals/Fraise/eeparams/eeparams.c	eeaddress=EEUSER;
	MOVLW	0x1c
	BANKSEL	_eeaddress
	MOVWF	_eeaddress, B
; removed redundant BANKSEL
	CLRF	(_eeaddress + 1), B
	RETURN	

; ; Starting pCode block
S_eeparams__EEdeclareLong	code
_EEdeclareLong:
;	.line	92; /home/arsene/pd-externals/Fraise/eeparams/eeparams.c	void EEdeclareLong(unsigned long *data)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	BANKSEL	_eeoperation
;	.line	94; /home/arsene/pd-externals/Fraise/eeparams/eeparams.c	if(eeoperation==EE_RD) *data=EELoadLong();
	MOVF	_eeoperation, W, B
	BNZ	_00176_DS_
	CALL	_EELoadLong
	MOVWF	r0x03
	MOVFF	PRODL, r0x04
	MOVFF	PRODH, r0x05
	MOVFF	FSR0L, r0x06
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, PRODH
	MOVFF	r0x05, TBLPTRL
	MOVFF	r0x06, TBLPTRH
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput4
	BRA	_00178_DS_
_00176_DS_:
	BANKSEL	_eeoperation
;	.line	95; /home/arsene/pd-externals/Fraise/eeparams/eeparams.c	else if(eeoperation==EE_WR) EESaveLong(*data);
	MOVF	_eeoperation, W, B
	XORLW	0x01
	BNZ	_00178_DS_
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget4
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_EESaveLong
	MOVLW	0x04
	ADDWF	FSR1L, F
_00178_DS_:
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
S_eeparams__EEdeclareInt	code
_EEdeclareInt:
;	.line	86; /home/arsene/pd-externals/Fraise/eeparams/eeparams.c	void EEdeclareInt(unsigned int *data)
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
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	BANKSEL	_eeoperation
;	.line	88; /home/arsene/pd-externals/Fraise/eeparams/eeparams.c	if(eeoperation==EE_RD) *data=EELoadInt();
	MOVF	_eeoperation, W, B
	BNZ	_00157_DS_
	CALL	_EELoadInt
	MOVWF	r0x03
	MOVFF	PRODL, r0x04
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, PRODH
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput2
	BRA	_00159_DS_
_00157_DS_:
	BANKSEL	_eeoperation
;	.line	89; /home/arsene/pd-externals/Fraise/eeparams/eeparams.c	else if(eeoperation==EE_WR) EESaveInt(*data);
	MOVF	_eeoperation, W, B
	XORLW	0x01
	BNZ	_00159_DS_
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget2
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_EESaveInt
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
_00159_DS_:
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_eeparams__EEdeclareChar	code
_EEdeclareChar:
;	.line	80; /home/arsene/pd-externals/Fraise/eeparams/eeparams.c	void EEdeclareChar(unsigned char *data)
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
	BANKSEL	_eeoperation
;	.line	82; /home/arsene/pd-externals/Fraise/eeparams/eeparams.c	if(eeoperation==EE_RD) *data=EELoadChar();
	MOVF	_eeoperation, W, B
	BNZ	_00138_DS_
	CALL	_EELoadChar
	MOVWF	r0x03
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
	BRA	_00140_DS_
_00138_DS_:
	BANKSEL	_eeoperation
;	.line	83; /home/arsene/pd-externals/Fraise/eeparams/eeparams.c	else if(eeoperation==EE_WR) EESaveChar(*data);
	MOVF	_eeoperation, W, B
	XORLW	0x01
	BNZ	_00140_DS_
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_EESaveChar
	MOVF	POSTINC1, F
_00140_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_eeparams__EESaveLong	code
_EESaveLong:
;	.line	69; /home/arsene/pd-externals/Fraise/eeparams/eeparams.c	void EESaveLong(long data) //untested
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
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	71; /home/arsene/pd-externals/Fraise/eeparams/eeparams.c	EE_WRITEBYTE_NEXT(data>>24);
	MOVFF	_eeaddress, r0x04
	MOVFF	(_eeaddress + 1), r0x05
	BANKSEL	_eeaddress
	INCFSZ	_eeaddress, F, B
	BRA	_10197_DS_
; removed redundant BANKSEL
	INCF	(_eeaddress + 1), F, B
_10197_DS_:
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	_eeWriteByte
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	72; /home/arsene/pd-externals/Fraise/eeparams/eeparams.c	EE_WRITEBYTE_NEXT(data>>16);
	MOVFF	_eeaddress, r0x04
	MOVFF	(_eeaddress + 1), r0x05
	BANKSEL	_eeaddress
	INCFSZ	_eeaddress, F, B
	BRA	_20198_DS_
; removed redundant BANKSEL
	INCF	(_eeaddress + 1), F, B
_20198_DS_:
; #	MOVF	r0x02, W
; #	MOVWF	r0x05
; #	MOVF	r0x05, W
	MOVF	r0x02, W
	MOVWF	r0x05
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	_eeWriteByte
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	73; /home/arsene/pd-externals/Fraise/eeparams/eeparams.c	EE_WRITEBYTE_NEXT(data>>8);
	MOVFF	_eeaddress, r0x04
	MOVFF	(_eeaddress + 1), r0x05
	BANKSEL	_eeaddress
	INCFSZ	_eeaddress, F, B
	BRA	_30199_DS_
; removed redundant BANKSEL
	INCF	(_eeaddress + 1), F, B
_30199_DS_:
; #	MOVF	r0x01, W
; #	MOVWF	r0x05
; #	MOVF	r0x05, W
	MOVF	r0x01, W
	MOVWF	r0x05
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	_eeWriteByte
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	74; /home/arsene/pd-externals/Fraise/eeparams/eeparams.c	EE_WRITEBYTE_NEXT(data);
	MOVFF	_eeaddress, r0x04
	MOVFF	(_eeaddress + 1), r0x05
	BANKSEL	_eeaddress
	INCFSZ	_eeaddress, F, B
	BRA	_40200_DS_
; removed redundant BANKSEL
	INCF	(_eeaddress + 1), F, B
_40200_DS_:
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	_eeWriteByte
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_eeparams__EESaveInt	code
_EESaveInt:
;	.line	63; /home/arsene/pd-externals/Fraise/eeparams/eeparams.c	void EESaveInt(int data)
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
;	.line	65; /home/arsene/pd-externals/Fraise/eeparams/eeparams.c	EE_WRITEBYTE_NEXT(data>>8);
	MOVFF	_eeaddress, r0x02
	MOVFF	(_eeaddress + 1), r0x03
	BANKSEL	_eeaddress
	INCFSZ	_eeaddress, F, B
	BRA	_50201_DS_
; removed redundant BANKSEL
	INCF	(_eeaddress + 1), F, B
_50201_DS_:
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_eeWriteByte
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	66; /home/arsene/pd-externals/Fraise/eeparams/eeparams.c	EE_WRITEBYTE_NEXT(data&255);
	MOVFF	_eeaddress, r0x02
	MOVFF	(_eeaddress + 1), r0x03
	BANKSEL	_eeaddress
	INCFSZ	_eeaddress, F, B
	BRA	_60202_DS_
; removed redundant BANKSEL
	INCF	(_eeaddress + 1), F, B
_60202_DS_:
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_eeWriteByte
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_eeparams__EESaveChar	code
_EESaveChar:
;	.line	58; /home/arsene/pd-externals/Fraise/eeparams/eeparams.c	void EESaveChar(unsigned char data)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	60; /home/arsene/pd-externals/Fraise/eeparams/eeparams.c	EE_WRITEBYTE_NEXT(data);
	MOVFF	_eeaddress, r0x01
	MOVFF	(_eeaddress + 1), r0x02
	BANKSEL	_eeaddress
	INCFSZ	_eeaddress, F, B
	BRA	_70203_DS_
; removed redundant BANKSEL
	INCF	(_eeaddress + 1), F, B
_70203_DS_:
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_eeWriteByte
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_eeparams__EELoadLong	code
_EELoadLong:
;	.line	50; /home/arsene/pd-externals/Fraise/eeparams/eeparams.c	long EELoadLong() //untested
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
;	.line	52; /home/arsene/pd-externals/Fraise/eeparams/eeparams.c	return ((unsigned long)EE_READBYTE_NEXT()<<24)|((unsigned long)EE_READBYTE_NEXT()<<16)|(EE_READBYTE_NEXT()<<8)|EE_READBYTE_NEXT();
	MOVFF	_eeaddress, r0x00
	MOVFF	(_eeaddress + 1), r0x01
	BANKSEL	_eeaddress
	INCFSZ	_eeaddress, F, B
	BRA	_80204_DS_
; removed redundant BANKSEL
	INCF	(_eeaddress + 1), F, B
_80204_DS_:
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_eeReadByte
	MOVF	POSTINC1, F
	MOVWF	r0x07
	CLRF	r0x04
	CLRF	r0x05
	CLRF	r0x06
	MOVFF	_eeaddress, r0x00
	MOVFF	(_eeaddress + 1), r0x01
	BANKSEL	_eeaddress
	INCFSZ	_eeaddress, F, B
	BRA	_90205_DS_
; removed redundant BANKSEL
	INCF	(_eeaddress + 1), F, B
_90205_DS_:
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_eeReadByte
	MOVF	POSTINC1, F
	CLRF	r0x0b
	MOVWF	r0x0a
	CLRF	r0x08
	MOVF	r0x08, W
	IORWF	r0x04, F
	IORWF	r0x05, F
	MOVF	r0x0a, W
	IORWF	r0x06, F
	MOVF	r0x0b, W
	IORWF	r0x07, F
	MOVFF	_eeaddress, r0x00
	MOVFF	(_eeaddress + 1), r0x01
	BANKSEL	_eeaddress
	INCFSZ	_eeaddress, F, B
	BRA	_100206_DS_
; removed redundant BANKSEL
	INCF	(_eeaddress + 1), F, B
_100206_DS_:
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_eeReadByte
	MOVF	POSTINC1, F
	MOVWF	r0x03
; =DF= MOVFF: replaced by CRLF/SETF
	CLRF	r0x00
	MOVFF	r0x03, r0x01
	CLRF	WREG
	BTFSC	r0x03, 7
	MOVLW	0xff
	MOVWF	r0x08
	MOVWF	r0x09
	MOVF	r0x00, W
	IORWF	r0x04, F
	MOVF	r0x01, W
	IORWF	r0x05, F
	MOVF	r0x08, W
	IORWF	r0x06, F
	MOVF	r0x09, W
	IORWF	r0x07, F
	MOVFF	_eeaddress, r0x00
	MOVFF	(_eeaddress + 1), r0x01
	BANKSEL	_eeaddress
	INCFSZ	_eeaddress, F, B
	BRA	_110207_DS_
; removed redundant BANKSEL
	INCF	(_eeaddress + 1), F, B
_110207_DS_:
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_eeReadByte
	MOVF	POSTINC1, F
	CLRF	r0x01
	IORWF	r0x04, F
	MOVF	r0x01, W
	IORWF	r0x05, F
	IORWF	r0x06, F
	IORWF	r0x07, F
	MOVFF	r0x07, FSR0L
	MOVFF	r0x06, PRODH
	MOVFF	r0x05, PRODL
	MOVF	r0x04, W
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_eeparams__EELoadInt	code
_EELoadInt:
;	.line	45; /home/arsene/pd-externals/Fraise/eeparams/eeparams.c	int EELoadInt()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
;	.line	47; /home/arsene/pd-externals/Fraise/eeparams/eeparams.c	return (EE_READBYTE_NEXT()<<8)|EE_READBYTE_NEXT();
	MOVFF	_eeaddress, r0x00
	MOVFF	(_eeaddress + 1), r0x01
	BANKSEL	_eeaddress
	INCFSZ	_eeaddress, F, B
	BRA	_120208_DS_
; removed redundant BANKSEL
	INCF	(_eeaddress + 1), F, B
_120208_DS_:
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_eeReadByte
	MOVF	POSTINC1, F
	MOVWF	r0x03
	CLRF	r0x02
	MOVFF	_eeaddress, r0x00
	MOVFF	(_eeaddress + 1), r0x01
	BANKSEL	_eeaddress
	INCFSZ	_eeaddress, F, B
	BRA	_130209_DS_
; removed redundant BANKSEL
	INCF	(_eeaddress + 1), F, B
_130209_DS_:
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_eeReadByte
	MOVF	POSTINC1, F
	CLRF	r0x01
	IORWF	r0x02, F
	MOVF	r0x01, W
	IORWF	r0x03, F
	MOVFF	r0x03, PRODL
	MOVF	r0x02, W
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_eeparams__EELoadChar	code
_EELoadChar:
;	.line	40; /home/arsene/pd-externals/Fraise/eeparams/eeparams.c	char EELoadChar()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
;	.line	42; /home/arsene/pd-externals/Fraise/eeparams/eeparams.c	return EE_READBYTE_NEXT();
	MOVFF	_eeaddress, r0x00
	MOVFF	(_eeaddress + 1), r0x01
	BANKSEL	_eeaddress
	INCFSZ	_eeaddress, F, B
	BRA	_140210_DS_
; removed redundant BANKSEL
	INCF	(_eeaddress + 1), F, B
_140210_DS_:
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_eeReadByte
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	



; Statistics:
; code size:	 1362 (0x0552) bytes ( 1.04%)
;           	  681 (0x02a9) words
; udata size:	    3 (0x0003) bytes ( 0.08%)
; access size:	   12 (0x000c) bytes


	end
