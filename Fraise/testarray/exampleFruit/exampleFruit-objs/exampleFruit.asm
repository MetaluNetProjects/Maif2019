;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.9 #10186 (Linux)
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f26k22
	radix	dec


;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global	_setup
	global	_loop
	global	_fraiseReceiveChar
	global	_fraiseReceive
	global	_highInterrupts
	global	_period
	global	_t
	global	_t2
	global	_mainDelay
	global	_index
	global	_Table

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
	extern	_printf
	extern	_putchar
	extern	_time
	extern	_fraiseService
	extern	_fraiseGetChar
	extern	_fraiseGetLen
	extern	_fruitInit
	extern	__mulint

;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
TBLPTRL	equ	0xff6
TBLPTRH	equ	0xff7
TBLPTRU	equ	0xff8
TABLAT	equ	0xff5
FSR0L	equ	0xfe9
FSR0H	equ	0xfea
FSR1L	equ	0xfe1
INDF0	equ	0xfef
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PRODL	equ	0xff3
PRODH	equ	0xff4


	idata
_period	db	0xc8
_t	db	0x00
_t2	db	0x00
_index	db	0x00


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1
r0x02	res	1
r0x03	res	1
r0x05	res	1

udata_main_0	udata
_highInterrupts_tableResult_1_89	res	2

udata_main_1	udata
_highInterrupts_tableIndex_1_89	res	2

udata_main_2	udata
_mainDelay	res	4

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_main__highInterrupts	code
_highInterrupts:
;	.line	96; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	void highInterrupts()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	101; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	if(PIR1bits.TMR1IF) {
	BTFSS	_PIR1bits, 0
	BRA	_00205_DS_
	BANKSEL	(_highInterrupts_tableIndex_1_89 + 1)
;	.line	102; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	tableResult = Table[tableIndex];
	MOVF	(_highInterrupts_tableIndex_1_89 + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_highInterrupts_tableIndex_1_89, W, B
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x04
	ADDWF	FSR1L, F
	CLRF	r0x02
	MOVLW	LOW(_Table)
	ADDWF	r0x00, F
	MOVLW	HIGH(_Table)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_Table)
	ADDWFC	r0x02, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, _highInterrupts_tableResult_1_89
	TBLRD*+	
	MOVFF	TABLAT, (_highInterrupts_tableResult_1_89 + 1)
	BANKSEL	_highInterrupts_tableIndex_1_89
;	.line	103; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	tableIndex++;
	INCFSZ	_highInterrupts_tableIndex_1_89, F, B
	BRA	_10200_DS_
; removed redundant BANKSEL
	INCF	(_highInterrupts_tableIndex_1_89 + 1), F, B
_10200_DS_:
;	.line	104; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	InitTimerUS(20);
	SETF	_TMR1H
	MOVLW	0xd7
	MOVWF	_TMR1L
	BCF	_PIR1bits, 0
_00205_DS_:
;	.line	106; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	}
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__fraiseReceive	code
_fraiseReceive:
;	.line	88; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	c=fraiseGetChar();	// get the first byte
	CALL	_fraiseGetChar
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
;	.line	90; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	switch(c) {
	XORLW	0x01
	BNZ	_00189_DS_
;	.line	91; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	PARAM_CHAR(1,period); break; 	// if the first byte is 1 then set period 
	CALL	_fraiseGetChar
	BANKSEL	_period
	MOVWF	_period, B
_00189_DS_:
;	.line	94; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	}
	RETURN	

; ; Starting pCode block
S_main__fraiseReceiveChar	code
_fraiseReceiveChar:
;	.line	67; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	void fraiseReceiveChar() // receive text
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
;	.line	71; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	c=fraiseGetChar();
	CALL	_fraiseGetChar
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
;	.line	72; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	if(c=='L'){		//switch LED on/off 
	MOVWF	r0x00
	XORLW	0x4c
	BNZ	_00157_DS_
;	.line	73; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	c=fraiseGetChar();
	CALL	_fraiseGetChar
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
;	.line	74; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	digitalWrite(LED, c!='0');		
	XORLW	0x30
	BZ	_00146_DS_
	BSF	_LATCbits, 1
	BRA	_00159_DS_
_00146_DS_:
	BCF	_LATCbits, 1
	BRA	_00159_DS_
_00157_DS_:
;	.line	76; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	else if(c=='E') { 	// echo text (send it back to host)
	MOVF	r0x00, W
	XORLW	0x45
	BNZ	_00159_DS_
;	.line	77; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	printf("C");
	MOVLW	UPPER(___str_2)
	MOVWF	POSTDEC1
	MOVLW	HIGH(___str_2)
	MOVWF	POSTDEC1
	MOVLW	LOW(___str_2)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	78; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	c = fraiseGetLen(); 			// get length of current packet
	CALL	_fraiseGetLen
	MOVWF	r0x00
_00151_DS_:
;	.line	79; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	while(c--) printf("%c",fraiseGetChar());// send each received byte
	MOVFF	r0x00, r0x01
	DECF	r0x00, F
	MOVF	r0x01, W
	BZ	_00153_DS_
	CALL	_fraiseGetChar
	CLRF	POSTDEC1
	MOVWF	POSTDEC1
	MOVLW	UPPER(___str_3)
	MOVWF	POSTDEC1
	MOVLW	HIGH(___str_3)
	MOVWF	POSTDEC1
	MOVLW	LOW(___str_3)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x05
	ADDWF	FSR1L, F
	BRA	_00151_DS_
_00153_DS_:
;	.line	80; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	putchar('\n');				// end of line
	MOVLW	0x0a
	CALL	_putchar
_00159_DS_:
;	.line	82; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	}
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__loop	code
_loop:
;	.line	44; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	void loop() {
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
;	.line	46; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	fraiseService();	// listen to Fraise events
	CALL	_fraiseService
; ;multiply lit val:0x02 by variable _index and store in r0x00
	BANKSEL	_index
;	.line	49; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	if(Table[index] != index) printf("CError\n");
	MOVF	_index, W, B
	MULLW	0x02
	MOVF	PRODH, W
	MOVWF	r0x01
	MOVFF	PRODL, r0x00
	CLRF	r0x02
	MOVLW	LOW(_Table)
	ADDWF	r0x00, F
	MOVLW	HIGH(_Table)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_Table)
	ADDWFC	r0x02, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	TBLRD*+	
	MOVFF	TABLAT, r0x01
	MOVFF	_index, r0x02
	CLRF	r0x03
	MOVF	r0x00, W
	XORWF	r0x02, W
	BNZ	_00137_DS_
	MOVF	r0x01, W
	XORWF	r0x03, W
	BZ	_00120_DS_
_00137_DS_:
	MOVLW	UPPER(___str_0)
	MOVWF	POSTDEC1
	MOVLW	HIGH(___str_0)
	MOVWF	POSTDEC1
	MOVLW	LOW(___str_0)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
_00120_DS_:
	BANKSEL	_index
;	.line	51; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	index++;
	INCF	_index, F, B
;	.line	53; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	if(delayFinished(mainDelay)) // when mainDelay triggers :
	CALL	_time
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	BANKSEL	_mainDelay
	MOVF	_mainDelay, W, B
	SUBWF	r0x00, F
; removed redundant BANKSEL
	MOVF	(_mainDelay + 1), W, B
	SUBWFB	r0x01, F
; removed redundant BANKSEL
	MOVF	(_mainDelay + 2), W, B
	SUBWFB	r0x02, F
; removed redundant BANKSEL
	MOVF	(_mainDelay + 3), W, B
	SUBWFB	r0x03, F
	BCF	r0x03, 7
	MOVLW	0x3f
	SUBWF	r0x03, W
	BNZ	_00139_DS_
	MOVLW	0xff
	SUBWF	r0x02, W
	BNZ	_00139_DS_
	MOVLW	0xff
	SUBWF	r0x01, W
	BNZ	_00139_DS_
	MOVLW	0xff
	SUBWF	r0x00, W
_00139_DS_:
	BTFSC	STATUS, 0
	BRA	_00125_DS_
;	.line	55; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	delayStart(mainDelay, 5000); 	// re-init mainDelay
	CALL	_time
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	ADDLW	0x88
	BANKSEL	_mainDelay
	MOVWF	_mainDelay, B
	MOVLW	0x13
	ADDWFC	r0x01, W
; removed redundant BANKSEL
	MOVWF	(_mainDelay + 1), B
	MOVLW	0x00
	ADDWFC	r0x02, W
; removed redundant BANKSEL
	MOVWF	(_mainDelay + 2), B
	MOVLW	0x00
	ADDWFC	r0x03, W
; removed redundant BANKSEL
	MOVWF	(_mainDelay + 3), B
	BANKSEL	_t
;	.line	56; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	t = t + 1;			// increment period counter	
	MOVF	_t, W, B
	MOVWF	r0x00
	INCF	r0x00, W
; removed redundant BANKSEL
	MOVWF	_t, B
	BANKSEL	_period
;	.line	57; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	if(t >= period){		// if counter overflows :
	MOVF	_period, W, B
	BANKSEL	_t
	SUBWF	_t, W, B
	BNC	_00125_DS_
; removed redundant BANKSEL
;	.line	58; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	t = 0;				 // clear counter
	CLRF	_t, B
	BANKSEL	_t2
;	.line	59; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	t2 = t2 + 1;			 // increment aux counter 
	MOVF	_t2, W, B
	MOVWF	r0x00
	INCF	r0x00, W
; removed redundant BANKSEL
	MOVWF	_t2, B
;	.line	60; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	printf("CHello! t2= %d K1= %d\n", t2, digitalRead(K1));// print Hello + aux counter value
	CLRF	r0x00
	BTFSC	_PORTAbits, 0
	INCF	r0x00, F
	MOVFF	_t2, r0x02
	CLRF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(___str_1)
	MOVWF	POSTDEC1
	MOVLW	HIGH(___str_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(___str_1)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x07
	ADDWF	FSR1L, F
_00125_DS_:
;	.line	63; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	}
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__setup	code
_setup:
;	.line	27; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	void setup(void) {		
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x05, POSTDEC1
;	.line	29; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	fruitInit();
	CALL	_fruitInit
;	.line	31; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	pinModeDigitalOut(LED); 	// set the LED pin mode to digital out
	BCF	_TRISCbits, 1
;	.line	32; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	digitalClear(LED);		// clear the LED
	BCF	_LATCbits, 1
;	.line	33; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	delayStart(mainDelay, 5000); 	// init the mainDelay to 5 ms
	CALL	_time
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	ADDLW	0x88
	BANKSEL	_mainDelay
	MOVWF	_mainDelay, B
	MOVLW	0x13
	ADDWFC	r0x01, W
; removed redundant BANKSEL
	MOVWF	(_mainDelay + 1), B
	MOVLW	0x00
	ADDWFC	r0x02, W
; removed redundant BANKSEL
	MOVWF	(_mainDelay + 2), B
	MOVLW	0x00
	ADDWFC	r0x03, W
; removed redundant BANKSEL
	MOVWF	(_mainDelay + 3), B
;	.line	35; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	pinModeDigitalIn(K1);
	BSF	_TRISAbits, 0
	MOVLW	LOW(_PORTA)
	MOVWF	r0x00
	MOVLW	HIGH(_PORTA)
	MOVWF	r0x01
	MOVLW	HIGH(_ANSELA)
	MOVWF	r0x03
	MOVLW	LOW(_ANSELA)
	ADDWF	r0x00, F
	MOVF	r0x03, W
	ADDWFC	r0x01, F
	MOVLW	LOW(_PORTA)
	MOVWF	r0x02
	MOVLW	HIGH(_PORTA)
	MOVWF	r0x03
	MOVLW	LOW(_PORTA)
	SUBWF	r0x00, F
	MOVF	r0x03, W
	SUBWFB	r0x01, F
	MOVLW	HIGH(_ANSELA)
	MOVWF	r0x05
	MOVLW	LOW(_ANSELA)
	ADDWF	r0x02, F
	MOVF	r0x05, W
	ADDWFC	r0x03, F
	MOVLW	HIGH(_PORTA)
	MOVWF	r0x05
	MOVLW	LOW(_PORTA)
	SUBWF	r0x02, F
	MOVF	r0x05, W
	SUBWFB	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	INDF0, r0x02
	BCF	r0x02, 0
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	r0x02, INDF0
;	.line	37; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	T1CON=0b00110011;//src=fosc/4,ps=8,16bit r/w,on.
	MOVLW	0x33
	MOVWF	_T1CON
;	.line	38; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	PIE1bits.TMR1IE=1;  //1;
	BSF	_PIE1bits, 0
;	.line	39; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	IPR1bits.TMR1IP=1;
	BSF	_IPR1bits, 0
;	.line	41; /home/arsene/pd-externals/Fraise/testarray/exampleFruit/main.c	}
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block for Ival
	code
_Table:
	DB	0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x03, 0x00, 0x04, 0x00, 0x05, 0x00
	DB	0x06, 0x00, 0x07, 0x00, 0x08, 0x00, 0x09, 0x00, 0x0a, 0x00, 0x0b, 0x00
	DB	0x0c, 0x00, 0x0d, 0x00, 0x0e, 0x00, 0x0f, 0x00, 0x10, 0x00, 0x11, 0x00
	DB	0x12, 0x00, 0x13, 0x00, 0x14, 0x00, 0x15, 0x00, 0x16, 0x00, 0x17, 0x00
	DB	0x18, 0x00, 0x19, 0x00, 0x1a, 0x00, 0x1b, 0x00, 0x1c, 0x00, 0x1d, 0x00
	DB	0x1e, 0x00, 0x1f, 0x00, 0x20, 0x00, 0x21, 0x00, 0x22, 0x00, 0x23, 0x00
	DB	0x24, 0x00, 0x25, 0x00, 0x26, 0x00, 0x27, 0x00, 0x28, 0x00, 0x29, 0x00
	DB	0x2a, 0x00, 0x2b, 0x00, 0x2c, 0x00, 0x2d, 0x00, 0x2e, 0x00, 0x2f, 0x00
	DB	0x30, 0x00, 0x31, 0x00, 0x32, 0x00, 0x33, 0x00, 0x34, 0x00, 0x35, 0x00
	DB	0x36, 0x00, 0x37, 0x00, 0x38, 0x00, 0x39, 0x00, 0x3a, 0x00, 0x3b, 0x00
	DB	0x3c, 0x00, 0x3d, 0x00, 0x3e, 0x00, 0x3f, 0x00, 0x40, 0x00, 0x41, 0x00
	DB	0x42, 0x00, 0x43, 0x00, 0x44, 0x00, 0x45, 0x00, 0x46, 0x00, 0x47, 0x00
	DB	0x48, 0x00, 0x49, 0x00, 0x4a, 0x00, 0x4b, 0x00, 0x4c, 0x00, 0x4d, 0x00
	DB	0x4e, 0x00, 0x4f, 0x00, 0x50, 0x00, 0x51, 0x00, 0x52, 0x00, 0x53, 0x00
	DB	0x54, 0x00, 0x55, 0x00, 0x56, 0x00, 0x57, 0x00, 0x58, 0x00, 0x59, 0x00
	DB	0x5a, 0x00, 0x5b, 0x00, 0x5c, 0x00, 0x5d, 0x00, 0x5e, 0x00, 0x5f, 0x00
	DB	0x60, 0x00, 0x61, 0x00, 0x62, 0x00, 0x63, 0x00, 0x64, 0x00, 0x65, 0x00
	DB	0x66, 0x00, 0x67, 0x00, 0x68, 0x00, 0x69, 0x00, 0x6a, 0x00, 0x6b, 0x00
	DB	0x6c, 0x00, 0x6d, 0x00, 0x6e, 0x00, 0x6f, 0x00, 0x70, 0x00, 0x71, 0x00
	DB	0x72, 0x00, 0x73, 0x00, 0x74, 0x00, 0x75, 0x00, 0x76, 0x00, 0x77, 0x00
	DB	0x78, 0x00, 0x79, 0x00, 0x7a, 0x00, 0x7b, 0x00, 0x7c, 0x00, 0x7d, 0x00
	DB	0x7e, 0x00, 0x7f, 0x00, 0x80, 0x00, 0x81, 0x00, 0x82, 0x00, 0x83, 0x00
	DB	0x84, 0x00, 0x85, 0x00, 0x86, 0x00, 0x87, 0x00, 0x88, 0x00, 0x89, 0x00
	DB	0x8a, 0x00, 0x8b, 0x00, 0x8c, 0x00, 0x8d, 0x00, 0x8e, 0x00, 0x8f, 0x00
	DB	0x90, 0x00, 0x91, 0x00, 0x92, 0x00, 0x93, 0x00, 0x94, 0x00, 0x95, 0x00
	DB	0x96, 0x00, 0x97, 0x00, 0x98, 0x00, 0x99, 0x00, 0x9a, 0x00, 0x9b, 0x00
	DB	0x9c, 0x00, 0x9d, 0x00, 0x9e, 0x00, 0x9f, 0x00, 0xa0, 0x00, 0xa1, 0x00
	DB	0xa2, 0x00, 0xa3, 0x00, 0xa4, 0x00, 0xa5, 0x00, 0xa6, 0x00, 0xa7, 0x00
	DB	0xa8, 0x00, 0xa9, 0x00, 0xaa, 0x00, 0xab, 0x00, 0xac, 0x00, 0xad, 0x00
	DB	0xae, 0x00, 0xaf, 0x00, 0xb0, 0x00, 0xb1, 0x00, 0xb2, 0x00, 0xb3, 0x00
	DB	0xb4, 0x00, 0xb5, 0x00, 0xb6, 0x00, 0xb7, 0x00, 0xb8, 0x00, 0xb9, 0x00
	DB	0xba, 0x00, 0xbb, 0x00, 0xbc, 0x00, 0xbd, 0x00, 0xbe, 0x00, 0xbf, 0x00
	DB	0xc0, 0x00, 0xc1, 0x00, 0xc2, 0x00, 0xc3, 0x00, 0xc4, 0x00, 0xc5, 0x00
	DB	0xc6, 0x00, 0xc7, 0x00, 0xc8, 0x00, 0xc9, 0x00, 0xca, 0x00, 0xcb, 0x00
	DB	0xcc, 0x00, 0xcd, 0x00, 0xce, 0x00, 0xcf, 0x00, 0xd0, 0x00, 0xd1, 0x00
	DB	0xd2, 0x00, 0xd3, 0x00, 0xd4, 0x00, 0xd5, 0x00, 0xd6, 0x00, 0xd7, 0x00
	DB	0xd8, 0x00, 0xd9, 0x00, 0xda, 0x00, 0xdb, 0x00, 0xdc, 0x00, 0xdd, 0x00
	DB	0xde, 0x00, 0xdf, 0x00, 0xe0, 0x00, 0xe1, 0x00, 0xe2, 0x00, 0xe3, 0x00
	DB	0xe4, 0x00, 0xe5, 0x00, 0xe6, 0x00, 0xe7, 0x00, 0xe8, 0x00, 0xe9, 0x00
	DB	0xea, 0x00, 0xeb, 0x00, 0xec, 0x00, 0xed, 0x00, 0xee, 0x00, 0xef, 0x00
	DB	0xf0, 0x00, 0xf1, 0x00, 0xf2, 0x00, 0xf3, 0x00, 0xf4, 0x00, 0xf5, 0x00
	DB	0xf6, 0x00, 0xf7, 0x00, 0xf8, 0x00, 0xf9, 0x00, 0xfa, 0x00, 0xfb, 0x00
	DB	0xfc, 0x00, 0xfd, 0x00, 0xfe, 0x00, 0xff, 0x00
; ; Starting pCode block
___str_0:
	DB	0x43, 0x45, 0x72, 0x72, 0x6f, 0x72, 0x0a, 0x00
; ; Starting pCode block
___str_1:
	DB	0x43, 0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x21, 0x20, 0x74, 0x32, 0x3d, 0x20
	DB	0x25, 0x64, 0x20, 0x4b, 0x31, 0x3d, 0x20, 0x25, 0x64, 0x0a, 0x00
; ; Starting pCode block
___str_2:
	DB	0x43, 0x00
; ; Starting pCode block
___str_3:
	DB	0x25, 0x63, 0x00


; Statistics:
; code size:	  848 (0x0350) bytes ( 0.65%)
;           	  424 (0x01a8) words
; udata size:	    8 (0x0008) bytes ( 0.22%)
; access size:	    5 (0x0005) bytes


	end
