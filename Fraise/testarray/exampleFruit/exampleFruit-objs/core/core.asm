;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.9 #10186 (Linux)
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f26k22
	radix	dec
	CONFIG	XINST=OFF


;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global	_eeWriteByte
	global	_eeReadByte
	global	_coreInit
	global	_time
	global	_TMR0U
	global	_Now
	global	_PORTZ
	global	_PORTZbits
	global	_LATZ
	global	_LATZbits
	global	_TRICZ
	global	_TRISZbits
	global	_ANSELZ
	global	_ANSELZbits
	global	_main
	global	_high_ISR
	global	_low_ISR

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
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
	extern	_setup
	extern	_loop
	extern	_highInterrupts
	extern	_Setup
	extern	_fraiseISR

;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
PCLATH	equ	0xffa
PCLATU	equ	0xffb
WREG	equ	0xfe8
BSR	equ	0xfe0
FSR0L	equ	0xfe9
FSR0H	equ	0xfea
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb
PRODL	equ	0xff3
PRODH	equ	0xff4


	idata
_TMR0U	db	0x00, 0x00


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1

udata_core_0	udata
_Now	res	4

udata_core_1	udata
_time_now_1_76	res	4


ustat_core_00	udata	0X0438
_ANSELZ        
_ANSELZbits    	res	1


ustat_core_01	udata	0X0480
_PORTZ         
_PORTZbits     	res	1


ustat_core_02	udata	0X0489
_LATZ          
_LATZbits      	res	1


ustat_core_03	udata	0X0492
_TRICZ         
_TRISZbits     	res	1

;--------------------------------------------------------
; interrupt vector
;--------------------------------------------------------

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; ; Starting pCode block for absolute section
; ;-----------------------------------------
S_core_ivec_0x1_high_ISR	code	0X000008
ivec_0x1_high_ISR:
	GOTO	_high_ISR

; ; Starting pCode block for absolute section
; ;-----------------------------------------
S_core_ivec_0x2_low_ISR	code	0X000018
ivec_0x2_low_ISR:
	GOTO	_low_ISR

; I code from now on!
; ; Starting pCode block
S_core__main	code
_main:
;	.line	112; /home/arsene/pd-externals/Fraise/core/core.c	setup();
	CALL	_setup
_00124_DS_:
;	.line	116; /home/arsene/pd-externals/Fraise/core/core.c	while(1) loop();
	CALL	_loop
	BRA	_00124_DS_
;	.line	118; /home/arsene/pd-externals/Fraise/core/core.c	}
	RETURN	

; ; Starting pCode block
S_core__time	code
_time:
	BANKSEL	_TMR0U
;	.line	175; /home/arsene/pd-externals/Fraise/core/core.c	now.word1= TMR0U;
	MOVF	_TMR0U, W, B
	BANKSEL	(_time_now_1_76 + 2)
	MOVWF	(_time_now_1_76 + 2), B
	BANKSEL	(_TMR0U + 1)
	MOVF	(_TMR0U + 1), W, B
	BANKSEL	(_time_now_1_76 + 3)
	MOVWF	(_time_now_1_76 + 3), B
;	.line	177; /home/arsene/pd-externals/Fraise/core/core.c	LOWER_LSB(now)=TMR0L;
	MOVF	_TMR0L, W
; removed redundant BANKSEL
	MOVWF	_time_now_1_76, B
;	.line	178; /home/arsene/pd-externals/Fraise/core/core.c	LOWER_MSB(now)=TMR0H;
	MOVF	_TMR0H, W
; removed redundant BANKSEL
	MOVWF	(_time_now_1_76 + 1), B
; removed redundant BANKSEL
;	.line	180; /home/arsene/pd-externals/Fraise/core/core.c	if(now.word1 != TMR0U) { //a rollover occured : do read again
	MOVF	(_time_now_1_76 + 2), W, B
	BANKSEL	_TMR0U
	XORWF	_TMR0U, W, B
	BNZ	_00151_DS_
	BANKSEL	(_time_now_1_76 + 3)
	MOVF	(_time_now_1_76 + 3), W, B
	BANKSEL	(_TMR0U + 1)
	XORWF	(_TMR0U + 1), W, B
	BZ	_00144_DS_
_00151_DS_:
	BANKSEL	_TMR0U
;	.line	181; /home/arsene/pd-externals/Fraise/core/core.c	now.word1= TMR0U;
	MOVF	_TMR0U, W, B
	BANKSEL	(_time_now_1_76 + 2)
	MOVWF	(_time_now_1_76 + 2), B
	BANKSEL	(_TMR0U + 1)
	MOVF	(_TMR0U + 1), W, B
	BANKSEL	(_time_now_1_76 + 3)
	MOVWF	(_time_now_1_76 + 3), B
;	.line	182; /home/arsene/pd-externals/Fraise/core/core.c	LOWER_LSB(now)=TMR0L;
	MOVF	_TMR0L, W
; removed redundant BANKSEL
	MOVWF	_time_now_1_76, B
;	.line	183; /home/arsene/pd-externals/Fraise/core/core.c	LOWER_MSB(now)=TMR0H;
	MOVF	_TMR0H, W
; removed redundant BANKSEL
	MOVWF	(_time_now_1_76 + 1), B
_00144_DS_:
;	.line	186; /home/arsene/pd-externals/Fraise/core/core.c	return now._dword;
	MOVFF	(_time_now_1_76 + 3), FSR0L
	MOVFF	(_time_now_1_76 + 2), PRODH
	MOVFF	(_time_now_1_76 + 1), PRODL
	BANKSEL	_time_now_1_76
	MOVF	_time_now_1_76, W, B
;	.line	187; /home/arsene/pd-externals/Fraise/core/core.c	}
	RETURN	

; ; Starting pCode block
S_core__low_ISR	code
_low_ISR:
;	.line	154; /home/arsene/pd-externals/Fraise/core/core.c	void low_ISR(void) 
	MOVFF	STATUS, POSTDEC1
	MOVFF	BSR, POSTDEC1
	MOVWF	POSTDEC1
	MOVFF	PRODL, POSTDEC1
	MOVFF	PRODH, POSTDEC1
	MOVFF	FSR0L, POSTDEC1
	MOVFF	FSR0H, POSTDEC1
	MOVFF	PCLATH, POSTDEC1
	MOVFF	PCLATU, POSTDEC1
;	.line	159; /home/arsene/pd-externals/Fraise/core/core.c	SAVETBLPRT();
	MOVFF	_TBLPTR, _POSTDEC1
	MOVFF	_TBLPTRL, _POSTDEC1
	MOVFF	_TBLPTRH, _POSTDEC1
	MOVFF	_TBLPTRU, _POSTDEC1
	MOVFF	_TABLAT, _POSTDEC1
;	.line	160; /home/arsene/pd-externals/Fraise/core/core.c	fraiseISR();
	CALL	_fraiseISR
;	.line	165; /home/arsene/pd-externals/Fraise/core/core.c	RESTORETBLPRT();
	MOVFF	_PREINC1, _TABLAT
	MOVFF	_PREINC1, _TBLPTRU
	MOVFF	_PREINC1, _TBLPTRH
	MOVFF	_PREINC1, _TBLPTRL
	MOVFF	_PREINC1, _TBLPTR
;	.line	166; /home/arsene/pd-externals/Fraise/core/core.c	}
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

; ; Starting pCode block
S_core__high_ISR	code
_high_ISR:
;	.line	127; /home/arsene/pd-externals/Fraise/core/core.c	void high_ISR(void)
	MOVFF	PRODL, POSTDEC1
	MOVFF	PRODH, POSTDEC1
	MOVFF	FSR0L, POSTDEC1
	MOVFF	FSR0H, POSTDEC1
	MOVFF	PCLATH, POSTDEC1
	MOVFF	PCLATU, POSTDEC1
;	.line	132; /home/arsene/pd-externals/Fraise/core/core.c	SAVETBLPRT();
	MOVFF	_TBLPTR, _POSTDEC1
	MOVFF	_TBLPTRL, _POSTDEC1
	MOVFF	_TBLPTRH, _POSTDEC1
	MOVFF	_TBLPTRU, _POSTDEC1
	MOVFF	_TABLAT, _POSTDEC1
	BANKSEL	_TMR0U
;	.line	134; /home/arsene/pd-externals/Fraise/core/core.c	Now.word1= TMR0U;
	MOVF	_TMR0U, W, B
	BANKSEL	(_Now + 2)
	MOVWF	(_Now + 2), B
	BANKSEL	(_TMR0U + 1)
	MOVF	(_TMR0U + 1), W, B
	BANKSEL	(_Now + 3)
	MOVWF	(_Now + 3), B
;	.line	135; /home/arsene/pd-externals/Fraise/core/core.c	LOWER_LSB(Now)=TMR0L;
	MOVF	_TMR0L, W
; removed redundant BANKSEL
	MOVWF	_Now, B
;	.line	136; /home/arsene/pd-externals/Fraise/core/core.c	LOWER_MSB(Now)=TMR0H;
	MOVF	_TMR0H, W
; removed redundant BANKSEL
	MOVWF	(_Now + 1), B
;	.line	138; /home/arsene/pd-externals/Fraise/core/core.c	if(INTCONbits.TMR0IF) {
	BTFSS	_INTCONbits, 2
	BRA	_00132_DS_
	BANKSEL	_TMR0U
;	.line	139; /home/arsene/pd-externals/Fraise/core/core.c	TMR0U++;
	INCFSZ	_TMR0U, F, B
	BRA	_10143_DS_
; removed redundant BANKSEL
	INCF	(_TMR0U + 1), F, B
_10143_DS_:
;	.line	140; /home/arsene/pd-externals/Fraise/core/core.c	INTCONbits.TMR0IF=0;
	BCF	_INTCONbits, 2
	BANKSEL	_TMR0U
;	.line	141; /home/arsene/pd-externals/Fraise/core/core.c	Now.word1= TMR0U;
	MOVF	_TMR0U, W, B
	BANKSEL	(_Now + 2)
	MOVWF	(_Now + 2), B
	BANKSEL	(_TMR0U + 1)
	MOVF	(_TMR0U + 1), W, B
	BANKSEL	(_Now + 3)
	MOVWF	(_Now + 3), B
;	.line	142; /home/arsene/pd-externals/Fraise/core/core.c	LOWER_LSB(Now)=TMR0L;
	MOVF	_TMR0L, W
; removed redundant BANKSEL
	MOVWF	_Now, B
;	.line	143; /home/arsene/pd-externals/Fraise/core/core.c	LOWER_MSB(Now)=TMR0H;
	MOVF	_TMR0H, W
; removed redundant BANKSEL
	MOVWF	(_Now + 1), B
_00132_DS_:
;	.line	147; /home/arsene/pd-externals/Fraise/core/core.c	highInterrupts();
	CALL	_highInterrupts
;	.line	149; /home/arsene/pd-externals/Fraise/core/core.c	RESTORETBLPRT();
	MOVFF	_PREINC1, _TABLAT
	MOVFF	_PREINC1, _TBLPTRU
	MOVFF	_PREINC1, _TBLPTRH
	MOVFF	_PREINC1, _TBLPTRL
	MOVFF	_PREINC1, _TBLPTR
;	.line	150; /home/arsene/pd-externals/Fraise/core/core.c	}
	MOVFF	PREINC1, PCLATU
	MOVFF	PREINC1, PCLATH
	MOVFF	PREINC1, FSR0H
	MOVFF	PREINC1, FSR0L
	MOVFF	PREINC1, PRODH
	MOVFF	PREINC1, PRODL
	RETFIE	0x01

; ; Starting pCode block
S_core__coreInit	code
_coreInit:
;	.line	72; /home/arsene/pd-externals/Fraise/core/core.c	void coreInit(void)
	MOVFF	r0x00, POSTDEC1
;	.line	75; /home/arsene/pd-externals/Fraise/core/core.c	Setup();
	CALL	_Setup
	BANKSEL	_LATZ
;	.line	79; /home/arsene/pd-externals/Fraise/core/core.c	PORTZ = LATZ = 0;
	CLRF	_LATZ, B
; removed redundant BANKSEL
	CLRF	_PORTZ, B
; removed redundant BANKSEL
;	.line	80; /home/arsene/pd-externals/Fraise/core/core.c	PORTZbits.RZ1 = LATZbits.LATZ1 = 1;	
	BSF	_LATZbits, 1, B
	CLRF	r0x00
; removed redundant BANKSEL
	BTFSC	_LATZbits, 1, B
	INCF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x01
	RLNCF	WREG, W
	MOVWF	PRODH
; removed redundant BANKSEL
	MOVF	_PORTZbits, W, B
	ANDLW	0xfd
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	_PORTZbits, B
;	.line	83; /home/arsene/pd-externals/Fraise/core/core.c	T0CONbits.TMR0ON = 1;
	BSF	_T0CONbits, 7
;	.line	84; /home/arsene/pd-externals/Fraise/core/core.c	T0CONbits.T08BIT = 0;	// 16 bit timer
	BCF	_T0CONbits, 6
;	.line	85; /home/arsene/pd-externals/Fraise/core/core.c	T0CONbits.T0CS = 0;		// Use internal clock
	BCF	_T0CONbits, 5
;	.line	86; /home/arsene/pd-externals/Fraise/core/core.c	T0CONbits.T0SE = 1;		// Hi to low
	BSF	_T0CONbits, 4
;	.line	87; /home/arsene/pd-externals/Fraise/core/core.c	T0CONbits.PSA = 0;		// Use the prescaler
	BCF	_T0CONbits, 3
;	.line	88; /home/arsene/pd-externals/Fraise/core/core.c	T0CONbits.T0PS2 = 0;	// 
	BCF	_T0CONbits, 2
;	.line	89; /home/arsene/pd-externals/Fraise/core/core.c	T0CONbits.T0PS1 = 1;	// 1/16 prescaler: 
	BSF	_T0CONbits, 1
;	.line	90; /home/arsene/pd-externals/Fraise/core/core.c	T0CONbits.T0PS0 = 1;	// 
	BSF	_T0CONbits, 0
;	.line	91; /home/arsene/pd-externals/Fraise/core/core.c	INTCONbits.TMR0IE=1;	// enable TMR0 interrupt
	BSF	_INTCONbits, 5
;	.line	92; /home/arsene/pd-externals/Fraise/core/core.c	INTCON2bits.TMR0IP=1;	// high priority
	BSF	_INTCON2bits, 2
;	.line	95; /home/arsene/pd-externals/Fraise/core/core.c	RCONbits.IPEN = 1;  // enable interrupts priority mode
	BSF	_RCONbits, 7
;	.line	97; /home/arsene/pd-externals/Fraise/core/core.c	INTCONbits.GIEH = 1;  // enable interrupts
	BSF	_INTCONbits, 7
;	.line	98; /home/arsene/pd-externals/Fraise/core/core.c	INTCONbits.GIEL = 1;  // enable interrupts
	BSF	_INTCONbits, 6
;	.line	103; /home/arsene/pd-externals/Fraise/core/core.c	T2CONbits.T2CKPS0=1; //prescaler 4
	BSF	_T2CONbits, 0
;	.line	104; /home/arsene/pd-externals/Fraise/core/core.c	PR2=255;
	MOVLW	0xff
	SETF	_PR2
;	.line	105; /home/arsene/pd-externals/Fraise/core/core.c	T2CONbits.TMR2ON=1;
	BSF	_T2CONbits, 2
;	.line	106; /home/arsene/pd-externals/Fraise/core/core.c	}
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_core__eeReadByte	code
_eeReadByte:
;	.line	56; /home/arsene/pd-externals/Fraise/core/core.c	unsigned char eeReadByte(unsigned char address){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVLW	0x02
	MOVFF	PLUSW2, _EEADR
;	.line	58; /home/arsene/pd-externals/Fraise/core/core.c	EECON1bits.CFGS = 0;
	BCF	_EECON1bits, 6
;	.line	59; /home/arsene/pd-externals/Fraise/core/core.c	EECON1bits.EEPGD = 0;
	BCF	_EECON1bits, 7
;	.line	60; /home/arsene/pd-externals/Fraise/core/core.c	EECON1bits.RD = 1;
	BSF	_EECON1bits, 0
;	.line	61; /home/arsene/pd-externals/Fraise/core/core.c	return EEDATA;
	MOVF	_EEDATA, W
;	.line	62; /home/arsene/pd-externals/Fraise/core/core.c	}
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_core__eeWriteByte	code
_eeWriteByte:
;	.line	33; /home/arsene/pd-externals/Fraise/core/core.c	void eeWriteByte(unsigned char address, unsigned char value){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, _EEDATA
;	.line	36; /home/arsene/pd-externals/Fraise/core/core.c	EEADR = address;
	MOVFF	r0x00, _EEADR
;	.line	38; /home/arsene/pd-externals/Fraise/core/core.c	EECON1bits.EEPGD = 0;
	BCF	_EECON1bits, 7
;	.line	39; /home/arsene/pd-externals/Fraise/core/core.c	EECON1bits.CFGS = 0;
	BCF	_EECON1bits, 6
;	.line	40; /home/arsene/pd-externals/Fraise/core/core.c	EECON1bits.WREN = 1; // enable writes to data EEPROM
	BSF	_EECON1bits, 2
;	.line	41; /home/arsene/pd-externals/Fraise/core/core.c	INTCONbits.GIEH = 0;  // disable interrupts
	BCF	_INTCONbits, 7
;	.line	42; /home/arsene/pd-externals/Fraise/core/core.c	INTCONbits.GIEL = 0;  // disable interrupts
	BCF	_INTCONbits, 6
;	.line	43; /home/arsene/pd-externals/Fraise/core/core.c	EECON2 = 0x55;
	MOVLW	0x55
	MOVWF	_EECON2
;	.line	44; /home/arsene/pd-externals/Fraise/core/core.c	EECON2 = 0x0AA;
	MOVLW	0xaa
	MOVWF	_EECON2
;	.line	45; /home/arsene/pd-externals/Fraise/core/core.c	EECON1bits.WR = 1;   // start writing
	BSF	_EECON1bits, 1
_00105_DS_:
;	.line	46; /home/arsene/pd-externals/Fraise/core/core.c	while(EECON1bits.WR){
	BTFSS	_EECON1bits, 1
	BRA	_00107_DS_
	nop	
	BRA	_00105_DS_
_00107_DS_:
;	.line	51; /home/arsene/pd-externals/Fraise/core/core.c	EECON1bits.WREN = 0;
	BCF	_EECON1bits, 2
;	.line	52; /home/arsene/pd-externals/Fraise/core/core.c	INTCONbits.GIEH = 1;  // enable interrupts
	BSF	_INTCONbits, 7
;	.line	53; /home/arsene/pd-externals/Fraise/core/core.c	INTCONbits.GIEL = 1;  // enable interrupts
	BSF	_INTCONbits, 6
;	.line	54; /home/arsene/pd-externals/Fraise/core/core.c	}
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	



; Statistics:
; code size:	  548 (0x0224) bytes ( 0.42%)
;           	  274 (0x0112) words
; udata size:	   12 (0x000c) bytes ( 0.33%)
; access size:	    1 (0x0001) bytes


	end
