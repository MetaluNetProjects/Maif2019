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
	global	_FraiseState
	global	_FrTXtries
	global	_fraiseSetID
	global	_fraiseInit
	global	_fraiseSetInterruptEnable
	global	_fraiseGetInterruptEnable
	global	_fraiseSend
	global	_fraiseSendBroadcast
	global	_fraiseISR
	global	_fraiseGetChar
	global	_fraisePeekChar
	global	_fraiseGetLen
	global	_fraiseGetIndex
	global	_fraiseGetAt
	global	_fraiseSendCopy
	global	_fraiseService
	global	_putchar
	global	_FrTXbuf
	global	_FrTXin
	global	_FrTXout
	global	_FrTXbufFree
	global	_FrTXpacket
	global	_FrTXpacket_i
	global	_FrTXpacket_len
	global	_FrTXchksum
	global	_FrRXbuf
	global	_FrRXchksum
	global	_FrRXin
	global	_FrRXin_tmp
	global	_FrRXin_end
	global	_FrRXout
	global	_FrRXout_end
	global	_FrRXout_len
	global	_FrRXout_first
	global	_FraiseStatus
	global	_FrInterruptEnabled
	global	_FrID
	global	_txbuf
	global	_txlen

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern	__gptrget1
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
	extern	_eeWriteByte
	extern	_eeReadByte
	extern	_fraiseReceiveChar
	extern	_fraiseReceive
	extern	__modsint

;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
WREG	equ	0xfe8
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


	idata
_FrTXin	db	0x00
_FrTXout	db	0x00
_FrTXbufFree	db	0xff
_FrInterruptEnabled	db	0x00
_FrID	db	0x00
_txlen	db	0x00


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

udata_fraisedevice_0	udata
_FrTXtries	res	1

udata_fraisedevice_1	udata
_FraiseState	res	1

udata_fraisedevice_2	udata
_fraiseISR_c_1_112	res	1

udata_fraisedevice_3	udata
_fraiseISR_c2_1_112	res	1

udata_fraisedevice_4	udata
_FrRXin	res	1

udata_fraisedevice_5	udata
_FrRXout	res	1

udata_fraisedevice_6	udata
_FrTXpacket_len	res	1

udata_fraisedevice_7	udata
_FraiseStatus	res	1

udata_fraisedevice_8	udata
_FrTXbuf	res	256

udata_fraisedevice_9	udata
_FrTXchksum	res	1

udata_fraisedevice_10	udata
_FrTXpacket_i	res	1

udata_fraisedevice_11	udata
_fraiseDecodeNextTXPacket_ischar_1_92	res	1

udata_fraisedevice_12	udata
_FrTXpacket	res	35

udata_fraisedevice_13	udata
_FrRXchksum	res	1

udata_fraisedevice_14	udata
_FrRXin_tmp	res	1

udata_fraisedevice_15	udata
_FrRXin_end	res	1

udata_fraisedevice_16	udata
_FrRXbuf	res	128

udata_fraisedevice_17	udata
_FrRXout_end	res	1

udata_fraisedevice_18	udata
_FrRXout_len	res	1

udata_fraisedevice_19	udata
_FrRXout_first	res	1

udata_fraisedevice_20	udata
_txbuf	res	35

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_fraisedevice__putchar	code
_putchar:
;	.line	782; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	PUTCHAR (c) {
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVWF	r0x00
;	.line	783; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	txbuf[txlen] = c;
	MOVLW	LOW(_txbuf)
	BANKSEL	_txlen
	ADDWF	_txlen, W, B
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_txbuf)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	r0x00, INDF0
;	.line	784; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(txlen < (sizeof(txbuf) - 1)) txlen++;
	MOVLW	0x22
; #	SUBWF	_txlen, W, B
; #	BTFSC	STATUS, 0
; #	GOTO	_00808_DS_
; #	INCF	_txlen, F, B
; #	MOVF	r0x00, W
; removed redundant BANKSEL
;	.line	785; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(c == '\n') {
	SUBWF	_txlen, W, B
	BC	_10807_DS_
; removed redundant BANKSEL
	INCF	_txlen, F, B
_10807_DS_:
	MOVF	r0x00, W
	XORLW	0x0a
	BNZ	_00811_DS_
_00821_DS_:
	BANKSEL	_txlen
;	.line	786; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	fraiseSend(txbuf, txlen);
	MOVF	_txlen, W, B
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVLW	HIGH(_txbuf)
	MOVWF	POSTDEC1
	MOVLW	LOW(_txbuf)
	MOVWF	POSTDEC1
	CALL	_fraiseSend
	MOVLW	0x04
	ADDWF	FSR1L, F
	BANKSEL	_txlen
;	.line	787; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	txlen = 0;
	CLRF	_txlen, B
_00811_DS_:
;	.line	789; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	}
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_fraisedevice__fraiseService	code
_fraiseService:
;	.line	698; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	void fraiseService(void)
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	BANKSEL	_FrRXout
;	.line	702; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(FrRXout != FrRXin) //FraiseStatus.RX_FULL
	MOVF	_FrRXout, W, B
	BANKSEL	_FrRXin
	XORWF	_FrRXin, W, B
	BNZ	_00785_DS_
	BRA	_00731_DS_
_00785_DS_:
;	.line	704; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	c = FrRXout;
	MOVFF	_FrRXout, r0x00
;	.line	705; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	c += 1;
	MOVF	r0x00, W
	MOVWF	r0x01
	INCF	r0x01, W
	MOVWF	r0x00
;	.line	706; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	c %= sizeof(FrRXbuf);
	BCF	r0x00, 7
;	.line	707; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrRXout_len = FrRXbuf[c];
	MOVLW	LOW(_FrRXbuf)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_FrRXbuf)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	INDF0, _FrRXout_len
;	.line	708; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrRXout_len &= 31;
	MOVLW	0x1f
	BANKSEL	_FrRXout_len
	ANDWF	_FrRXout_len, F, B
;	.line	710; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrRXout_end = FrRXout;
	MOVFF	_FrRXout, _FrRXout_end
; removed redundant BANKSEL
;	.line	711; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrRXout_end += FrRXout_len;
	MOVF	_FrRXout_len, W, B
	BANKSEL	_FrRXout_end
	ADDWF	_FrRXout_end, F, B
;	.line	712; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrRXout_end += 2;
	MOVF	_FrRXout_end, W, B
	MOVWF	r0x01
	MOVLW	0x02
	ADDWF	r0x01, W
; removed redundant BANKSEL
	MOVWF	_FrRXout_end, B
;	.line	713; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrRXout_end %= sizeof(FrRXbuf);
	BCF	_FrRXout_end, 7, B
;	.line	715; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	isbroadcast = (fraiseGetChar() == 0);
	CALL	_fraiseGetChar
	MOVWF	r0x01
	MOVF	r0x01, W
	BNZ	_00789_DS_
	CLRF	r0x01
	INCF	r0x01, F
	BRA	_00790_DS_
_00789_DS_:
	CLRF	r0x01
_00790_DS_:
;	.line	716; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrRXout_len = fraiseGetChar();
	CALL	_fraiseGetChar
	BANKSEL	_FrRXout_len
	MOVWF	_FrRXout_len, B
;	.line	717; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	ischar = FrRXout_len & 128;
	MOVFF	_FrRXout_len, r0x02
	MOVLW	0x80
	ANDWF	r0x02, F
;	.line	719; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(!(FrRXout_len &= 31)){ //packet error
	MOVFF	_FrRXout_len, r0x03
	MOVLW	0x1f
	ANDWF	r0x03, F
	MOVFF	r0x03, r0x04
	MOVFF	r0x03, _FrRXout_len
	MOVF	r0x04, W
	BNZ	_00709_DS_
;	.line	720; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrRXout = FrRXin;
	MOVFF	_FrRXin, _FrRXout
;	.line	721; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	return;
	BRA	_00740_DS_
_00709_DS_:
;	.line	724; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(isbroadcast) //Broadcast packet
	MOVF	r0x01, W
	BZ	_00727_DS_
;	.line	726; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(ischar){
	MOVF	r0x02, W
	BZ	_00729_DS_
;	.line	727; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	c = fraiseGetChar();
	CALL	_fraiseGetChar
	MOVWF	r0x00
	BANKSEL	_FrRXout_len
;	.line	728; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrRXout_len -= 1;
	MOVF	_FrRXout_len, W, B
	MOVWF	r0x01
	DECF	r0x01, W
; removed redundant BANKSEL
	MOVWF	_FrRXout_len, B
;	.line	729; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if     (c == 'B') {
	MOVF	r0x00, W
	XORLW	0x42
	BZ	_00729_DS_
;	.line	734; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	else if(c == 'N') Assign();		/* assign to id if name matchs */
	MOVF	r0x00, W
	XORLW	0x4e
	BNZ	_00716_DS_
	CALL	_Assign
	BRA	_00729_DS_
_00716_DS_:
;	.line	735; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	else if(c == 'F') ResetToBld();	/* goto Fraisebootloader if name matchs */
	MOVF	r0x00, W
	XORLW	0x46
	BNZ	_00713_DS_
	CALL	_ResetToBld
	BRA	_00729_DS_
_00713_DS_:
;	.line	736; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	else if(c == 'I') __asm reset __endasm; //init
	MOVF	r0x00, W
	XORLW	0x49
	BNZ	_00729_DS_
_00800_DS_:
	reset	
	BRA	_00729_DS_
_00727_DS_:
;	.line	748; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrRXout_first = FrRXout;
	MOVFF	_FrRXout, _FrRXout_first
;	.line	749; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(ischar) {
	MOVF	r0x02, W
	BZ	_00724_DS_
;	.line	751; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	fraiseReceiveChar();
	CALL	_fraiseReceiveChar
	BRA	_00729_DS_
_00724_DS_:
;	.line	755; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	else fraiseReceive();
	CALL	_fraiseReceive
_00729_DS_:
;	.line	762; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrRXout = FrRXout_end;
	MOVFF	_FrRXout_end, _FrRXout
_00731_DS_:
	BANKSEL	_FrTXin
;	.line	765; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if((!FrTXempty) && (!FrTXpacket_len)) { // if there is sth to send to master and nothing in TXpacket :
	MOVF	_FrTXin, W, B
	BANKSEL	_FrTXout
	XORWF	_FrTXout, W, B
	BZ	_00737_DS_
_00802_DS_:
	BANKSEL	_FrTXpacket_len
	MOVF	_FrTXpacket_len, W, B
	BNZ	_00737_DS_
;	.line	766; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	fraiseDecodeNextTXPacket();
	CALL	_fraiseDecodeNextTXPacket
	BRA	_00740_DS_
_00737_DS_:
;	.line	768; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	else if(Serial_Is_Driver() && (!FrTXpacket_len) && TXSTAxbits.TRMT)// security:
	BTFSC	_TRISCbits, 0
	BRA	_00740_DS_
	BANKSEL	_FrTXpacket_len
	MOVF	_FrTXpacket_len, W, B
;	.line	769; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	Serial_Init_Receiver();
	BNZ	_00740_DS_
; #	GOTO	_00740_DS_
; #	BTFSS	_TXSTAbits, 1
; #	GOTO	_00740_DS_
; #	CALL	_Serial_Init_Receiver
; #; info ==> [localregs] exit begin

; #	MOVFF	PREINC1, r0x04
;	.line	772; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	}
	BTFSC	_TXSTAbits, 1
	CALL	_Serial_Init_Receiver
_00740_DS_:
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_fraisedevice__ResetToBld	code
_ResetToBld:
;	.line	684; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	static void ResetToBld() //"F" command
	MOVFF	r0x00, POSTDEC1
;	.line	687; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(CompareName()) {
	CALL	_CompareName
	MOVWF	r0x00
	MOVF	r0x00, W
;	.line	689; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	return;
	BNZ	_00703_DS_
_00702_DS_:
	reset	
_00703_DS_:
;	.line	692; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	}
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_fraisedevice__Assign	code
_Assign:
;	.line	666; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	static void Assign() //"N" command
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	669; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	c = fraiseGetChar();
	CALL	_fraiseGetChar
	MOVWF	r0x00
;	.line	670; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	c2 = fraiseGetChar();
	CALL	_fraiseGetChar
	MOVWF	r0x01
;	.line	671; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	c -= '0'; if (c > 9) c -= 'A' - '9' - 1;
	MOVF	r0x00, W
	MOVWF	r0x02
	MOVLW	0xd0
	ADDWF	r0x02, W
	MOVWF	r0x00
	MOVLW	0x0a
	SUBWF	r0x00, W
	BNC	_00671_DS_
	MOVF	r0x00, W
	MOVWF	r0x02
	MOVLW	0xf9
	ADDWF	r0x02, W
	MOVWF	r0x00
_00671_DS_:
;	.line	672; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	c2 -= '0'; if (c2 > 9) c2 -= 'A' - '9' - 1;
	MOVF	r0x01, W
	MOVWF	r0x02
	MOVLW	0xd0
	ADDWF	r0x02, W
	MOVWF	r0x01
	MOVLW	0x0a
	SUBWF	r0x01, W
	BNC	_00673_DS_
	MOVF	r0x01, W
	MOVWF	r0x02
	MOVLW	0xf9
	ADDWF	r0x02, W
	MOVWF	r0x01
_00673_DS_:
;	.line	673; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if((c > 7) || (c2 > 15)) { // bad id... discard
	MOVLW	0x08
	SUBWF	r0x00, W
	BC	_00679_DS_
	MOVLW	0x10
; #	SUBWF	r0x01, W
; #	BTFSS	STATUS, 0
; #	GOTO	_00675_DS_
; #	GOTO	_00679_DS_
; #	SWAPF	r0x00, W
;	.line	674; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	return; 
	SUBWF	r0x01, W
;	.line	676; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	tmpid = c2 + (c << 4);
	BTFSC	STATUS, 0
_00674_DS_:
	BRA	_00679_DS_
	SWAPF	r0x00, W
	ANDLW	0xf0
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	ADDWF	r0x01, W
	MOVWF	r0x00
;	.line	678; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(CompareName()) return;
	CALL	_CompareName
	MOVWF	r0x01
; #	MOVF	r0x01, W
; #	BTFSC	STATUS, 2
; #	GOTO	_00678_DS_
; #	GOTO	_00679_DS_
; #	MOVF	r0x00, W
;	.line	680; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	fraiseSetID(tmpid);
	MOVF	r0x01, W
	BNZ	_00679_DS_
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_fraiseSetID
	MOVF	POSTINC1, F
_00679_DS_:
;	.line	682; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	}
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_fraisedevice__CompareName	code
_CompareName:
;	.line	634; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	static char CompareName() 
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	638; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	eei = EE_PREFIX;
	MOVLW	0x01
	MOVWF	r0x00
_00636_DS_:
;	.line	639; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	while(c = fraiseGetChar()){
	CALL	_fraiseGetChar
	MOVWF	r0x01
	MOVFF	r0x01, r0x02
	MOVF	r0x01, W
	BZ	_00638_DS_
;	.line	640; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	c2 = eeReadByte(eei);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_eeReadByte
	MOVWF	r0x01
	MOVF	POSTINC1, F
;	.line	641; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(c2 == 0) { //end of string
	MOVF	r0x01, W
	BNZ	_00631_DS_
;	.line	642; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(eei < EE_NAME) { //end of prefix
	MOVLW	0x0a
	SUBWF	r0x00, W
	BC	_00628_DS_
; #	MOVLW	0x0a
; #	MOVWF	r0x00
; #	MOVLW	0x0a
;	.line	643; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	eei = EE_NAME; //goto to name first char
	MOVLW	0x0a
;	.line	644; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	c2 = eeReadByte(eei);
	MOVWF	r0x00
	MOVWF	POSTDEC1
	CALL	_eeReadByte
	MOVWF	r0x01
	MOVF	POSTINC1, F
;	.line	645; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(c2 == 0) { //no name?!
	MOVF	r0x01, W
	BNZ	_00631_DS_
;	.line	646; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	return -1; 
	SETF	WREG
	BRA	_00639_DS_
_00628_DS_:
;	.line	650; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	return -1; 
	SETF	WREG
	BRA	_00639_DS_
_00631_DS_:
;	.line	653; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(c2 != c) { //spelled name differs from device name; discard.
	MOVF	r0x01, W
	XORWF	r0x02, W
	BZ	_00633_DS_
;	.line	654; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	return -1; 
	SETF	WREG
	BRA	_00639_DS_
_00633_DS_:
;	.line	656; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	eei++;
	INCF	r0x00, F
;	.line	657; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(eei > EE_NAMEMAX) { //spelled name too long; discard.
	MOVLW	0x1b
	SUBWF	r0x00, W
	BNC	_00636_DS_
;	.line	658; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	return -1;
	SETF	WREG
	BRA	_00639_DS_
_00638_DS_:
;	.line	662; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	return 0;
	CLRF	WREG
_00639_DS_:
;	.line	663; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	}
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_fraisedevice__fraiseSendCopy	code
_fraiseSendCopy:
;	.line	616; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	void fraiseSendCopy()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
;	.line	620; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	l = (FrRXout - FrRXout_first)%sizeof(FrRXbuf);
	MOVFF	_FrRXout, r0x00
	CLRF	r0x01
	MOVFF	_FrRXout_first, r0x02
	CLRF	r0x03
	MOVF	r0x02, W
	SUBWF	r0x00, F
	MOVF	r0x03, W
	SUBWFB	r0x01, F
	CLRF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__modsint
	MOVWF	r0x00
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	621; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	l--;
	DECF	r0x00, F
;	.line	622; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	i = FrRXout_first;
	MOVFF	_FrRXout_first, r0x01
;	.line	623; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	putchar('C'); putchar(' '); 
	MOVLW	0x43
	CALL	_putchar
	MOVLW	0x20
	CALL	_putchar
_00604_DS_:
;	.line	625; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	while(l > 0) {
	MOVF	r0x00, W
	BZ	_00607_DS_
;	.line	626; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	printf("%d ", FrRXbuf[i]);
	MOVLW	LOW(_FrRXbuf)
	ADDWF	r0x01, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_FrRXbuf)
	ADDWFC	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	INDF0, r0x02
	CLRF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(___str_0)
	MOVWF	POSTDEC1
	MOVLW	HIGH(___str_0)
	MOVWF	POSTDEC1
	MOVLW	LOW(___str_0)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	627; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	i++;
	INCF	r0x01, F
;	.line	628; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(i == sizeof(FrRXbuf)) i = 0;
	MOVF	r0x01, W
	XORLW	0x80
	BNZ	_00603_DS_
	CLRF	r0x01
_00603_DS_:
;	.line	629; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	l--;
	DECF	r0x00, F
	BRA	_00604_DS_
_00607_DS_:
;	.line	631; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	}
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_fraisedevice__fraiseGetAt	code
_fraiseGetAt:
;	.line	611; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	unsigned char fraiseGetAt(unsigned char i)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	613; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	return FrRXbuf[(i + FrRXout_first)%sizeof(FrRXbuf)];
	CLRF	r0x01
	MOVFF	_FrRXout_first, r0x02
	CLRF	r0x03
	MOVF	r0x02, W
	ADDWF	r0x00, F
	MOVF	r0x03, W
	ADDWFC	r0x01, F
	CLRF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__modsint
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVLW	LOW(_FrRXbuf)
	ADDWF	r0x00, F
	MOVLW	HIGH(_FrRXbuf)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	INDF0, r0x00
	MOVF	r0x00, W
;	.line	614; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	}
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_fraisedevice__fraiseGetIndex	code
_fraiseGetIndex:
	BANKSEL	_FrRXout
;	.line	608; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	return FrRXout;
	MOVF	_FrRXout, W, B
;	.line	609; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	}
	RETURN	

; ; Starting pCode block
S_fraisedevice__fraiseGetLen	code
_fraiseGetLen:
	BANKSEL	_FrRXout_len
;	.line	603; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	return FrRXout_len;
	MOVF	_FrRXout_len, W, B
;	.line	604; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	}
	RETURN	

; ; Starting pCode block
S_fraisedevice__fraisePeekChar	code
_fraisePeekChar:
;	.line	596; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	unsigned char fraisePeekChar()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
;	.line	598; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	return FrRXbuf[FrRXout];
	MOVLW	LOW(_FrRXbuf)
	BANKSEL	_FrRXout
	ADDWF	_FrRXout, W, B
	MOVWF	r0x00
	CLRF	r0x01
	MOVLW	HIGH(_FrRXbuf)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	INDF0, r0x00
	MOVF	r0x00, W
;	.line	599; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	}
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_fraisedevice__fraiseGetChar	code
_fraiseGetChar:
;	.line	586; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	unsigned char fraiseGetChar()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	BANKSEL	_FrRXout
;	.line	590; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if((FrRXout == FrRXout_end) || (FrRXout == FrRXin)) return 0; //underflow error
	MOVF	_FrRXout, W, B
	BANKSEL	_FrRXout_end
	XORWF	_FrRXout_end, W, B
	BZ	_00559_DS_
_00573_DS_:
	BANKSEL	_FrRXout
	MOVF	_FrRXout, W, B
	BANKSEL	_FrRXin
	XORWF	_FrRXin, W, B
	BNZ	_00560_DS_
_00559_DS_:
	CLRF	WREG
	BRA	_00564_DS_
_00560_DS_:
;	.line	591; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	c = FrRXbuf[FrRXout++];
	MOVFF	_FrRXout, r0x00
	BANKSEL	_FrRXout
	INCF	_FrRXout, F, B
	CLRF	r0x01
	MOVLW	LOW(_FrRXbuf)
	ADDWF	r0x00, F
	MOVLW	HIGH(_FrRXbuf)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	INDF0, r0x00
; removed redundant BANKSEL
;	.line	592; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(FrRXout == sizeof(FrRXbuf)) FrRXout = 0;
	MOVF	_FrRXout, W, B
	XORLW	0x80
	BNZ	_00563_DS_
_00577_DS_:
	BANKSEL	_FrRXout
	CLRF	_FrRXout, B
_00563_DS_:
;	.line	593; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	return c;
	MOVF	r0x00, W
_00564_DS_:
;	.line	594; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	}
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_fraisedevice__fraiseISR	code
_fraiseISR:
;	.line	467; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	void fraiseISR(void)
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
; #	MOVF	_FrInterruptEnabled, W, B
; #	BTFSS	STATUS, 2
; #	GOTO	_00391_DS_
; #	GOTO	_00457_DS_
; #	BTFSS	_PIE1bits, 4
	BANKSEL	_FrInterruptEnabled
;	.line	471; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(FrInterruptEnabled == 0) return;
	MOVF	_FrInterruptEnabled, W, B
;	.line	473; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(TXxIE && TXxIF) {
	BTFSC	STATUS, 2
	BRA	_00457_DS_
	BTFSS	_PIE1bits, 4
	BRA	_00395_DS_
	BTFSS	_PIR1bits, 4
	BRA	_00395_DS_
	BANKSEL	_FrTXpacket_i
;	.line	474; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(FrTXpacket_i == FrTXpacket_len) { //if end of the packet:
	MOVF	_FrTXpacket_i, W, B
	BANKSEL	_FrTXpacket_len
	XORWF	_FrTXpacket_len, W, B
	BNZ	_00393_DS_
;	.line	476; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	Serial_Init_Receiver();
	CALL	_Serial_Init_Receiver
	BANKSEL	_FrTXpacket_len
;	.line	477; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrTXpacket_len = 0;
	CLRF	_FrTXpacket_len, B
;	.line	479; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	return;
	BRA	_00457_DS_
_00393_DS_:
;	.line	481; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	c = FrTXpacket[FrTXpacket_i];
	MOVLW	LOW(_FrTXpacket)
	BANKSEL	_FrTXpacket_i
	ADDWF	_FrTXpacket_i, W, B
	MOVWF	r0x00
	CLRF	r0x01
	MOVLW	HIGH(_FrTXpacket)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	INDF0, _fraiseISR_c_1_112
; removed redundant BANKSEL
;	.line	482; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrTXpacket_i++;
	INCF	_FrTXpacket_i, F, B
;	.line	483; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	TXREGx = c; // send next byte
	MOVFF	_fraiseISR_c_1_112, _TXREG
;	.line	485; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	return;
	BRA	_00457_DS_
_00395_DS_:
;	.line	488; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(RCxIE && RCxIF) {
	BTFSS	_PIE1bits, 5
	BRA	_00457_DS_
	BTFSS	_PIR1bits, 5
	BRA	_00457_DS_
;	.line	489; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(RCSTAxbits.OERR){
	BTFSS	_RCSTAbits, 1
	BRA	_00398_DS_
	BANKSEL	_FraiseStatus
;	.line	490; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FraiseStatus.RX_OERR = 1;
	BSF	_FraiseStatus, 0, B
;	.line	491; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	Serial_Init_Receiver();
	CALL	_Serial_Init_Receiver
;	.line	492; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	return;
	BRA	_00457_DS_
_00398_DS_:
;	.line	494; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(RCSTAxbits.FERR){
	BTFSS	_RCSTAbits, 2
	BRA	_00400_DS_
	BANKSEL	_FraiseStatus
;	.line	495; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FraiseStatus.RX_FERR = 1;
	BSF	_FraiseStatus, 1, B
;	.line	496; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	Serial_Init_Receiver();
	CALL	_Serial_Init_Receiver
;	.line	497; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	return;
	BRA	_00457_DS_
_00400_DS_:
;	.line	500; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if (RCSTAxbits.RX9D) { // -------  address : 
	BTFSS	_RCSTAbits, 0
	BRA	_00412_DS_
;	.line	501; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	c = RCREGx; // get byte
	MOVFF	_RCREG, _fraiseISR_c_1_112
;	.line	502; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(c == (FrID | 128)) { // poll signal
	MOVFF	_FrID, r0x00
	CLRF	r0x01
	BSF	r0x00, 7
	MOVFF	_fraiseISR_c_1_112, r0x02
	CLRF	r0x03
	MOVF	r0x02, W
	XORWF	r0x00, W
	BNZ	_00534_DS_
	MOVF	r0x03, W
	XORWF	r0x01, W
	BZ	_00535_DS_
_00534_DS_:
	BRA	_00402_DS_
_00535_DS_:
	BANKSEL	_FraiseStatus
;	.line	503; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FraiseStatus.RX_POLL = 1;
	BSF	_FraiseStatus, 4, B
;	.line	504; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	RCSTAxbits.ADDEN = 0;
	BCF	_RCSTAbits, 3
;	.line	505; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	return;
	BRA	_00457_DS_
_00402_DS_:
	BANKSEL	_fraiseISR_c_1_112
;	.line	507; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if ((c == 0) || (c == FrID)) {
	MOVF	_fraiseISR_c_1_112, W, B
	BZ	_00408_DS_
; removed redundant BANKSEL
	MOVF	_fraiseISR_c_1_112, W, B
	BANKSEL	_FrID
	XORWF	_FrID, W, B
	BNZ	_00409_DS_
_00408_DS_:
	BANKSEL	_FraiseStatus
;	.line	508; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FraiseStatus.RX_POLL = 0;
	BCF	_FraiseStatus, 4, B
;	.line	509; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	RCSTAxbits.ADDEN = 0;
	BCF	_RCSTAbits, 3
	BANKSEL	_fraiseISR_c_1_112
;	.line	510; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(c) FraiseStatus.RX_BRDCST = 0;
	MOVF	_fraiseISR_c_1_112, W, B
	BZ	_00404_DS_
	BANKSEL	_FraiseStatus
	BCF	_FraiseStatus, 3, B
	BRA	_00405_DS_
_00404_DS_:
	BANKSEL	_FraiseStatus
;	.line	511; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	else FraiseStatus.RX_BRDCST = 1;
	BSF	_FraiseStatus, 3, B
_00405_DS_:
;	.line	513; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrRXchksum = c;
	MOVFF	_fraiseISR_c_1_112, _FrRXchksum
;	.line	514; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrRXin_tmp = FrRXin;
	MOVFF	_FrRXin, _FrRXin_tmp
	BANKSEL	_FrRXin
;	.line	515; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrRXin_end = FrRXin - 1; // protect FrRXin_end
	MOVF	_FrRXin, W, B
	MOVWF	r0x00
	DECF	r0x00, W
	BANKSEL	_FrRXin_end
	MOVWF	_FrRXin_end, B
;	.line	516; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrRXbuf[FrRXin_tmp] = c;
	MOVLW	LOW(_FrRXbuf)
	BANKSEL	_FrRXin_tmp
	ADDWF	_FrRXin_tmp, W, B
	MOVWF	r0x00
	CLRF	r0x01
	MOVLW	HIGH(_FrRXbuf)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	_fraiseISR_c_1_112, INDF0
; removed redundant BANKSEL
;	.line	517; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrRXin_tmp++;
	INCF	_FrRXin_tmp, F, B
;	.line	518; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(FrRXin_tmp == sizeof(FrRXbuf)) FrRXin_tmp = 0;
	MOVF	_FrRXin_tmp, W, B
	XORLW	0x80
	BNZ	_00407_DS_
_00539_DS_:
	BANKSEL	_FrRXin_tmp
	CLRF	_FrRXin_tmp, B
_00407_DS_:
;	.line	519; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	return;
	BRA	_00457_DS_
_00409_DS_:
	BANKSEL	_FraiseStatus
;	.line	521; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FraiseStatus.RX_POLL= 0;
	BCF	_FraiseStatus, 4, B
;	.line	522; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	RCSTAxbits.ADDEN = 1;
	BSF	_RCSTAbits, 3
;	.line	523; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	return;
	BRA	_00457_DS_
_00412_DS_:
;	.line	526; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	c = RCREGx; // get byte
	MOVFF	_RCREG, _fraiseISR_c_1_112
	BANKSEL	_FraiseStatus
;	.line	527; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(FraiseStatus.RX_POLL) { // had a poll signal
	BTFSS	_FraiseStatus, 4, B
	BRA	_00425_DS_
;	.line	528; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(c == (FrID | 128)){ 	// confirmation byte of poll signal:
	MOVFF	_FrID, r0x00
	CLRF	r0x01
	BSF	r0x00, 7
	MOVFF	_fraiseISR_c_1_112, r0x02
	CLRF	r0x03
	MOVF	r0x02, W
	XORWF	r0x00, W
	BNZ	_00541_DS_
	MOVF	r0x03, W
	XORWF	r0x01, W
	BZ	_00542_DS_
_00541_DS_:
	BRA	_00423_DS_
_00542_DS_:
;	.line	530; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	Serial_Init_Driver();
	BCF	_PIE1bits, 5
	BCF	_RCSTAbits, 4
	BCF	_TRISCbits, 0
	BANKSEL	_FrTXpacket_len
;	.line	531; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(FrTXpacket_len == 0) {
	MOVF	_FrTXpacket_len, W, B
	BNZ	_00420_DS_
;	.line	532; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	TXREGx = 0;
	CLRF	_TXREG
;	.line	533; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	Serial_Init_Receiver();
	CALL	_Serial_Init_Receiver
	BRA	_00423_DS_
_00420_DS_:
;	.line	535; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	fraiseSendLaunch();
	MOVFF	_FrTXpacket, _TXREG
	MOVLW	0x01
	BANKSEL	_FrTXpacket_i
	MOVWF	_FrTXpacket_i, B
	BSF	_PIE1bits, 4
;	.line	536; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	return;
	BRA	_00457_DS_
_00423_DS_:
;	.line	539; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	RCSTAxbits.ADDEN = 1;
	BSF	_RCSTAbits, 3
;	.line	540; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	return;
	BRA	_00457_DS_
_00425_DS_:
	BANKSEL	_fraiseISR_c_1_112
;	.line	543; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrRXchksum += c;
	MOVF	_fraiseISR_c_1_112, W, B
	BANKSEL	_FrRXchksum
	ADDWF	_FrRXchksum, F, B
	BANKSEL	_FrRXin_tmp
;	.line	545; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(FrRXin_tmp == FrRXin_end) {// RX packet complete
	MOVF	_FrRXin_tmp, W, B
	BANKSEL	_FrRXin_end
	XORWF	_FrRXin_end, W, B
	BNZ	_00446_DS_
_00544_DS_:
	BANKSEL	_FrRXchksum
;	.line	546; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(!FrRXchksum) { // RX packet checksum ok 
	MOVF	_FrRXchksum, W, B
	BNZ	_00443_DS_
;	.line	547; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrRXin = FrRXin_tmp; //validation of packet
	MOVFF	_FrRXin_tmp, _FrRXin
	BANKSEL	_FraiseStatus
;	.line	548; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(!FraiseStatus.RX_BRDCST){
	BTFSC	_FraiseStatus, 3, B
	BRA	_00444_DS_
;	.line	549; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	Serial_Init_Driver();
	BCF	_PIE1bits, 5
	BCF	_RCSTAbits, 4
	BCF	_TRISCbits, 0
;	.line	550; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	TXREGx = 0; //Acknowldge
	CLRF	_TXREG
;	.line	551; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	Serial_Init_Receiver();
	CALL	_Serial_Init_Receiver
	BRA	_00444_DS_
_00443_DS_:
	BANKSEL	_FraiseStatus
;	.line	555; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FraiseStatus.RX_SERR = 1;
	BSF	_FraiseStatus, 2, B
;	.line	556; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(!FraiseStatus.RX_BRDCST){
	BTFSC	_FraiseStatus, 3, B
	BRA	_00444_DS_
;	.line	557; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	Serial_Init_Driver();
	BCF	_PIE1bits, 5
	BCF	_RCSTAbits, 4
	BCF	_TRISCbits, 0
;	.line	558; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	TXREGx = 1; //Checksum nack
	MOVLW	0x01
	MOVWF	_TXREG
;	.line	559; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	Serial_Init_Receiver();
	CALL	_Serial_Init_Receiver
_00444_DS_:
;	.line	562; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	return;
	BRA	_00457_DS_
_00446_DS_:
	BANKSEL	_FrRXin_tmp
;	.line	565; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if((FrRXin_tmp == FrRXout)&&(FrRXout != FrRXin)) { //collision case : RX buffer full !
	MOVF	_FrRXin_tmp, W, B
	BANKSEL	_FrRXout
	XORWF	_FrRXout, W, B
	BNZ	_00448_DS_
_00546_DS_:
	BANKSEL	_FrRXout
	MOVF	_FrRXout, W, B
	BANKSEL	_FrRXin
	XORWF	_FrRXin, W, B
	BZ	_00448_DS_
;	.line	566; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	Serial_Init_Receiver(); // discard current packet... TODO:send an buffer full nack (2)
	CALL	_Serial_Init_Receiver
;	.line	567; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	return;
	BRA	_00457_DS_
_00448_DS_:
;	.line	570; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	c2 = (FrRXin + 1) % sizeof(FrRXbuf);
	MOVFF	_FrRXin, r0x00
	CLRF	r0x01
	INFSNZ	r0x00, F
	INCF	r0x01, F
	CLRF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__modsint
	MOVWF	r0x00
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVF	r0x00, W
; #	MOVWF	_fraiseISR_c2_1_112, B
; #	MOVF	_FrRXin_tmp, W, B
; #	XORWF	_fraiseISR_c2_1_112, W, B
	BANKSEL	_fraiseISR_c2_1_112
;	.line	571; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(FrRXin_tmp == c2) { //FrRXin_tmp == (FrRXin + 1): first byte following address = data length...
	MOVWF	_fraiseISR_c2_1_112, B
	BANKSEL	_FrRXin_tmp
	XORWF	_FrRXin_tmp, W, B
	BNZ	_00451_DS_
;	.line	572; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrRXin_end = (c & 31);
	MOVFF	_fraiseISR_c_1_112, r0x00
	MOVLW	0x1f
	ANDWF	r0x00, W
; #	MOVWF	_FrRXin_end, B
; #	MOVF	_FrRXin_end, W, B
	BANKSEL	_FrRXin_end
;	.line	573; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrRXin_end += 2;
	MOVWF	_FrRXin_end, B
	MOVWF	r0x00
	MOVLW	0x02
	ADDWF	r0x00, W
; removed redundant BANKSEL
	MOVWF	_FrRXin_end, B
	BANKSEL	_FrRXin
;	.line	574; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrRXin_end += FrRXin;
	MOVF	_FrRXin, W, B
	BANKSEL	_FrRXin_end
	ADDWF	_FrRXin_end, F, B
;	.line	575; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrRXin_end %= sizeof(FrRXbuf);
	BCF	_FrRXin_end, 7, B
_00451_DS_:
;	.line	578; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrRXbuf[FrRXin_tmp++] = c;
	MOVFF	_FrRXin_tmp, r0x00
	BANKSEL	_FrRXin_tmp
	INCF	_FrRXin_tmp, F, B
	CLRF	r0x01
	MOVLW	LOW(_FrRXbuf)
	ADDWF	r0x00, F
	MOVLW	HIGH(_FrRXbuf)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	_fraiseISR_c_1_112, INDF0
; removed redundant BANKSEL
;	.line	579; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(FrRXin_tmp == sizeof(FrRXbuf)) FrRXin_tmp = 0; //ring buffer index
	MOVF	_FrRXin_tmp, W, B
	XORLW	0x80
	BNZ	_00457_DS_
_00554_DS_:
	BANKSEL	_FrRXin_tmp
	CLRF	_FrRXin_tmp, B
_00457_DS_:
;	.line	582; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	}
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_fraisedevice__fraiseSendBroadcast	code
_fraiseSendBroadcast:
;	.line	420; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	void fraiseSendBroadcast(const unsigned char *buf, unsigned char len)
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
;	.line	422; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	unsigned char i = len;
	MOVFF	r0x03, r0x04
;	.line	423; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	unsigned char ischar = 0;
	CLRF	r0x05
; #	MOVF	r0x03, W
; #	BTFSS	STATUS, 2
; #	GOTO	_00294_DS_
; #	GOTO	_00327_DS_
; #	MOVFF	r0x00, FSR0L
;	.line	426; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(!i) return;
	MOVF	r0x03, W
;	.line	427; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(*buf == 'C') {
	BTFSC	STATUS, 2
	BRA	_00327_DS_
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
; #	MOVWF	r0x06
; #	MOVF	r0x06, W
	MOVWF	r0x06
	XORLW	0x43
	BNZ	_00296_DS_
;	.line	428; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	ischar = 1;
	MOVLW	0x01
	MOVWF	r0x05
;	.line	429; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	len |= 128;
	MOVFF	r0x03, r0x06
	CLRF	r0x07
	BSF	r0x06, 7
	MOVF	r0x06, W
	MOVWF	r0x03
_00296_DS_:
;	.line	432; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	i--;
	DECF	r0x04, F
;	.line	433; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	buf++;
	INCF	r0x00, F
	BNC	_00384_DS_
	INFSNZ	r0x01, F
	INCF	r0x02, F
_00384_DS_:
;	.line	434; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	Serial_Init_Driver();
	BCF	_PIE1bits, 5
	BCF	_RCSTAbits, 4
	BCF	_TRISCbits, 0
;	.line	435; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	TXxIE = 0;
	BCF	_PIE1bits, 4
_00303_DS_:
;	.line	437; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	while(TXxIF == 0);
	BTFSS	_PIR1bits, 4
	BRA	_00303_DS_
;	.line	439; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	TXSTAxbits.TX9D = 1; 	// address byte
	BSF	_TXSTAbits, 0
;	.line	440; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	chksum += (TXREGx = 0);	// adress is null = broadcast
	CLRF	_TXREG
	nop	
_00306_DS_:
	BTFSS	_PIR1bits, 4
	BRA	_00306_DS_
;	.line	443; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	TXSTAxbits.TX9D = 0;
	BCF	_TXSTAbits, 0
;	.line	445; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	chksum += (TXREGx = len);
	MOVFF	r0x03, _TXREG
	nop	
_00309_DS_:
	BTFSS	_PIR1bits, 4
	BRA	_00309_DS_
;	.line	448; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(ischar) chksum += (TXREGx = 'B');
	MOVF	r0x05, W
	BZ	_00313_DS_
; #	MOVLW	0x42
; #	MOVWF	_TXREG
; #	MOVLW	0x42
	MOVLW	0x42
	MOVWF	_TXREG
	ADDWF	r0x03, F
	BRA	_00318_DS_
_00313_DS_:
;	.line	449; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	else chksum += (TXREGx = 'b');
	MOVLW	0x62
	MOVWF	_TXREG
	MOVLW	0x62
	ADDWF	r0x03, F
_00318_DS_:
;	.line	451; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	while(i) {
	MOVF	r0x04, W
	BZ	_00320_DS_
	nop	
_00315_DS_:
	BTFSS	_PIR1bits, 4
	BRA	_00315_DS_
;	.line	453; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	chksum += (TXREGx = *buf);
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x05
	MOVFF	r0x05, _TXREG
	MOVF	r0x05, W
	ADDWF	r0x03, F
;	.line	454; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	i--;
	DECF	r0x04, F
;	.line	455; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	buf++;
	INCF	r0x00, F
	BNC	_00385_DS_
	INFSNZ	r0x01, F
	INCF	r0x02, F
_00385_DS_:
	BRA	_00318_DS_
_00320_DS_:
	nop	
_00321_DS_:
	BTFSS	_PIR1bits, 4
	BRA	_00321_DS_
;	.line	459; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	TXREGx = -chksum;
	COMF	r0x03, W
	MOVWF	_TXREG
	INCF	_TXREG, F
	nop	
_00324_DS_:
	BTFSS	_PIR1bits, 4
	BRA	_00324_DS_
;	.line	462; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	Serial_Init_Receiver();
	CALL	_Serial_Init_Receiver
_00327_DS_:
;	.line	463; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	}
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
S_fraisedevice__fraiseDecodeNextTXPacket	code
_fraiseDecodeNextTXPacket:
;	.line	337; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	static void fraiseDecodeNextTXPacket()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
; #	MOVFF	r0x04, POSTDEC1
; #; info ==> [localregs] entry end

; #	BTFSC	_TXSTAbits, 1
; #	GOTO	_00200_DS_
; #	GOTO	_00238_DS_
; #	CALL	_fraiseGetTXChar
;	.line	341; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(TXSTAxbits.TRMT == 0) return; //return if a serial transmission is in progress
	MOVFF	r0x04, POSTDEC1
;	.line	343; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	len = fraiseGetTXChar(); //1st byte = len
	BTFSS	_TXSTAbits, 1
	BRA	_00238_DS_
	CALL	_fraiseGetTXChar
	MOVWF	r0x00
;	.line	344; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(!len) {
	MOVF	r0x00, W
	BNZ	_00202_DS_
	BANKSEL	_FrTXout
;	.line	346; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrTXin = FrTXout=0;
	CLRF	_FrTXout, B
	BANKSEL	_FrTXin
	CLRF	_FrTXin, B
;	.line	347; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	return; //?
	BRA	_00238_DS_
_00202_DS_:
;	.line	350; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	txout_end = FrTXout;
	MOVFF	_FrTXout, r0x01
;	.line	351; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	txout_end += len;
	MOVF	r0x00, W
	ADDWF	r0x01, F
;	.line	353; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	c=fraiseGetTXChar(); //2nd byte = command (or hi nibble of address)
	CALL	_fraiseGetTXChar
	MOVWF	r0x02
;	.line	354; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	len -= 1;
	MOVF	r0x00, W
	MOVWF	r0x03
	DECF	r0x03, W
	MOVWF	r0x00
;	.line	356; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(c == '#') {						
	MOVF	r0x02, W
	XORLW	0x23
	BNZ	_00217_DS_
;	.line	358; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(len < 1) goto discard;
	MOVLW	0x01
	SUBWF	r0x00, W
	BTFSS	STATUS, 0
	BRA	_00237_DS_
;	.line	359; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	c = fraiseGetTXChar(); //what is the command ?
	CALL	_fraiseGetTXChar
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
;	.line	360; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(c == 'i'){
	MOVWF	r0x02
	XORLW	0x69
	BNZ	_00214_DS_
;	.line	362; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	fraiseInit();
	CALL	_fraiseInit
;	.line	363; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	goto discard;
	BRA	_00237_DS_
_00214_DS_:
;	.line	370; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	else if(c == 'r'){
	MOVF	r0x02, W
	XORLW	0x72
	BNZ	_00211_DS_
;	.line	371; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	Serial_Init_Receiver();
	CALL	_Serial_Init_Receiver
;	.line	372; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	goto discard;
	BRA	_00237_DS_
_00211_DS_:
;	.line	374; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	else if(c == 's'){
	MOVF	r0x02, W
	XORLW	0x73
	BZ	_00281_DS_
	BRA	_00237_DS_
_00281_DS_:
;	.line	376; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	SerDrv_Off();
	BSF	_TRISCbits, 0
;	.line	377; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	RCSTAxbits.ADDEN = 1; 
	BSF	_RCSTAbits, 3
;	.line	378; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	RCxIE = 1;		
	BSF	_PIE1bits, 5
;	.line	379; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	TXxIE = 0;
	BCF	_PIE1bits, 4
	;	VOLATILE READ - BEGIN
	MOVF	_RCREG, W
	;	VOLATILE READ - END
	;	VOLATILE READ - BEGIN
	MOVF	_RCREG, W
	;	VOLATILE READ - END
;	.line	382; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	RCSTAxbits.CREN = 0;		
	BCF	_RCSTAbits, 4
;	.line	383; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	RCSTAxbits.CREN = 1;		
	BSF	_RCSTAbits, 4
;	.line	385; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	goto discard;
	BRA	_00237_DS_
_00217_DS_:
;	.line	391; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(c == 'C') { //"char" packet
	MOVF	r0x02, W
	XORLW	0x43
	BZ	_00222_DS_
;	.line	396; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(c == 'B') { //"bytes" packet
	MOVF	r0x02, W
	XORLW	0x42
	BZ	_00285_DS_
	BRA	_00237_DS_
_00285_DS_:
;	.line	404; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(ischar) len |= 128;
	BRA	_00225_DS_
_00222_DS_:
;	.line	404; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(ischar) len |= 128;
	MOVFF	r0x00, r0x03
	CLRF	r0x04
	BSF	r0x03, 7
	MOVF	r0x03, W
	MOVWF	r0x00
_00225_DS_:
;	.line	406; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	fraiseSendInit(len);
	MOVFF	r0x00, _FrTXchksum
	MOVF	r0x00, W
	BANKSEL	_FrTXpacket
	MOVWF	_FrTXpacket, B
	MOVLW	0x01
	BANKSEL	_FrTXpacket_i
	MOVWF	_FrTXpacket_i, B
_00231_DS_:
	BANKSEL	_FrTXout
;	.line	408; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	while(FrTXout != txout_end) {
	MOVF	_FrTXout, W, B
	XORWF	r0x01, W
	BZ	_00234_DS_
;	.line	409; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	c = fraiseGetTXChar();
	CALL	_fraiseGetTXChar
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
;	.line	410; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	fraiseSendData(c); 
	MOVWF	r0x02
	BANKSEL	_FrTXchksum
	ADDWF	_FrTXchksum, F, B
	MOVLW	LOW(_FrTXpacket)
	BANKSEL	_FrTXpacket_i
	ADDWF	_FrTXpacket_i, W, B
	MOVWF	r0x00
	CLRF	r0x03
	MOVLW	HIGH(_FrTXpacket)
	ADDWFC	r0x03, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x02, INDF0
; removed redundant BANKSEL
	INCF	_FrTXpacket_i, F, B
	BRA	_00231_DS_
_00234_DS_:
;	.line	412; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	fraiseSendClose();	
	MOVLW	LOW(_FrTXpacket)
	BANKSEL	_FrTXpacket_i
	ADDWF	_FrTXpacket_i, W, B
	MOVWF	r0x00
	CLRF	r0x02
	MOVLW	HIGH(_FrTXpacket)
	ADDWFC	r0x02, F
	BANKSEL	_FrTXchksum
	COMF	_FrTXchksum, W, B
	MOVWF	r0x03
	INCF	r0x03, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	r0x03, INDF0
	BANKSEL	_FrTXpacket_i
	INCF	_FrTXpacket_i, F, B
	MOVFF	_FrTXpacket_i, _FrTXpacket_len
	BANKSEL	_FrTXtries
;	.line	413; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrTXtries = 0;
	CLRF	_FrTXtries, B
_00237_DS_:
;	.line	416; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrTXout = txout_end;
	MOVFF	r0x01, _FrTXout
_00238_DS_:
;	.line	418; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	}
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_fraisedevice__fraiseSend	code
_fraiseSend:
;	.line	294; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	char fraiseSend(const unsigned char *buf,unsigned char len)
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
;	.line	298; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrTXbufFree = FrTXout;
	MOVFF	_FrTXout, _FrTXbufFree
	BANKSEL	_FrTXin
;	.line	299; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrTXbufFree -= FrTXin;
	MOVF	_FrTXin, W, B
	BANKSEL	_FrTXbufFree
	SUBWF	_FrTXbufFree, F, B
;	.line	300; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrTXbufFree -= 1;
	MOVF	_FrTXbufFree, W, B
	MOVWF	r0x04
	DECF	r0x04, W
; removed redundant BANKSEL
	MOVWF	_FrTXbufFree, B
;	.line	302; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if ((len + 3) > FrTXbufFree) {
	MOVFF	r0x03, r0x04
	CLRF	r0x05
	MOVLW	0x03
	ADDWF	r0x04, F
	BTFSC	STATUS, 0
	INCF	r0x05, F
	MOVFF	_FrTXbufFree, r0x06
	CLRF	r0x07
	MOVF	r0x07, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x05, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00192_DS_
	MOVF	r0x04, W
	SUBWF	r0x06, W
_00192_DS_:
	BC	_00171_DS_
;	.line	304; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	return -1;
	SETF	WREG
	BRA	_00177_DS_
_00171_DS_:
;	.line	306; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if (len < 2) {
	MOVLW	0x02
	SUBWF	r0x03, W
	BC	_00173_DS_
;	.line	308; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	return 0;
	CLRF	WREG
	BRA	_00177_DS_
_00173_DS_:
;	.line	310; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	len -= 1; //don't keep '\n' terminator
	MOVF	r0x03, W
	MOVWF	r0x04
	DECF	r0x04, W
; #	MOVWF	r0x03
; #	MOVF	r0x03, W
;	.line	311; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	fraisePutChar(len); //prefix tx packet buffer by its length
	MOVWF	r0x03
	MOVWF	POSTDEC1
	CALL	_fraisePutChar
	MOVF	POSTINC1, F
;	.line	313; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	while(i < len) { //fill tx packet buffer
	CLRF	r0x04
_00174_DS_:
	MOVF	r0x03, W
	SUBWF	r0x04, W
	BC	_00176_DS_
;	.line	314; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	c = buf[i];
	MOVF	r0x04, W
	ADDWF	r0x00, W
	MOVWF	r0x05
	CLRF	WREG
	ADDWFC	r0x01, W
	MOVWF	r0x06
	CLRF	WREG
	ADDWFC	r0x02, W
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	CALL	__gptrget1
;	.line	315; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	i++;
	INCF	r0x04, F
;	.line	316; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	fraisePutChar(c);
	MOVWF	POSTDEC1
	CALL	_fraisePutChar
	MOVF	POSTINC1, F
	BRA	_00174_DS_
_00176_DS_:
;	.line	320; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrTXbufFree = FrTXout;
	MOVFF	_FrTXout, _FrTXbufFree
	BANKSEL	_FrTXin
;	.line	321; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrTXbufFree -= FrTXin;
	MOVF	_FrTXin, W, B
	BANKSEL	_FrTXbufFree
	SUBWF	_FrTXbufFree, F, B
;	.line	322; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrTXbufFree -= 1;
	MOVF	_FrTXbufFree, W, B
	MOVWF	r0x00
	DECF	r0x00, W
; removed redundant BANKSEL
	MOVWF	_FrTXbufFree, B
;	.line	323; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	return 0;
	CLRF	WREG
_00177_DS_:
;	.line	324; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	}
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
S_fraisedevice__fraiseGetTXChar	code
_fraiseGetTXChar:
;	.line	284; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	static unsigned char fraiseGetTXChar()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	BANKSEL	_FrTXin
;	.line	288; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(FrTXin == FrTXout) return 0; //underflow check
	MOVF	_FrTXin, W, B
	BANKSEL	_FrTXout
	XORWF	_FrTXout, W, B
	BNZ	_00158_DS_
	CLRF	WREG
	BRA	_00159_DS_
_00158_DS_:
;	.line	289; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	c = FrTXbuf[FrTXout];
	MOVLW	LOW(_FrTXbuf)
	BANKSEL	_FrTXout
	ADDWF	_FrTXout, W, B
	MOVWF	r0x00
	CLRF	r0x01
	MOVLW	HIGH(_FrTXbuf)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	INDF0, r0x00
; removed redundant BANKSEL
;	.line	290; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrTXout++;
	INCF	_FrTXout, F, B
;	.line	291; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	return c;
	MOVF	r0x00, W
_00159_DS_:
;	.line	292; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	}
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_fraisedevice__fraisePutChar	code
_fraisePutChar:
;	.line	274; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	static void fraisePutChar(unsigned char c)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	276; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if((FrTXin + 1) == FrTXout) {
	MOVFF	_FrTXin, r0x01
	CLRF	r0x02
	INFSNZ	r0x01, F
	INCF	r0x02, F
	MOVFF	_FrTXout, r0x03
	CLRF	r0x04
	MOVF	r0x01, W
	XORWF	r0x03, W
	BNZ	_00151_DS_
	MOVF	r0x02, W
	XORWF	r0x04, W
	BZ	_00152_DS_
_00151_DS_:
	BRA	_00145_DS_
_00152_DS_:
;	.line	278; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	return; //overflow check done by fraiseSend, but...
	BRA	_00146_DS_
_00145_DS_:
;	.line	280; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrTXbuf[FrTXin] = c;
	MOVLW	LOW(_FrTXbuf)
	BANKSEL	_FrTXin
	ADDWF	_FrTXin, W, B
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_FrTXbuf)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	r0x00, INDF0
; removed redundant BANKSEL
;	.line	281; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrTXin++;
	INCF	_FrTXin, F, B
_00146_DS_:
;	.line	282; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	}
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_fraisedevice__fraiseGetInterruptEnable	code
_fraiseGetInterruptEnable:
	BANKSEL	_FrInterruptEnabled
;	.line	268; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	return FrInterruptEnabled;
	MOVF	_FrInterruptEnabled, W, B
;	.line	269; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	}
	RETURN	

; ; Starting pCode block
S_fraisedevice__fraiseSetInterruptEnable	code
_fraiseSetInterruptEnable:
;	.line	256; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	void fraiseSetInterruptEnable(char enable)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	258; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrInterruptEnabled = enable;
	MOVFF	r0x00, _FrInterruptEnabled
;	.line	259; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	if(enable == 0) {
	MOVF	r0x00, W
	BNZ	_00134_DS_
;	.line	260; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	Serial_Init_Receiver();
	CALL	_Serial_Init_Receiver
;	.line	261; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	RCxIE = 0;
	BCF	_PIE1bits, 5
;	.line	262; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	TXxIE = 0;
	BCF	_PIE1bits, 4
_00134_DS_:
;	.line	264; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	}
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_fraisedevice__fraiseInit	code
_fraiseInit:
	BANKSEL	_FrTXin
;	.line	214; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrTXin = 0;
	CLRF	_FrTXin, B
	BANKSEL	_FrTXout
;	.line	215; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrTXout = 0;
	CLRF	_FrTXout, B
	BANKSEL	_FrTXbufFree
;	.line	216; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrTXbufFree = 255;
	SETF	_FrTXbufFree, B
;	.line	219; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	SerDrv_Off();
	BSF	_TRISCbits, 0
;	.line	220; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	InitSerDrv();
	BCF	_LATCbits, 0
	BSF	_TRISCbits, 0
;	.line	224; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	SPBRGHx = BRGHL/256;
	CLRF	_SPBRGH
;	.line	225; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	SPBRGx = BRGHL%256;
	MOVLW	0x3f
	MOVWF	_SPBRG
;	.line	227; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	BAUDCONxbits.BRG16 = 1;
	BSF	_BAUDCONbits, 3
;	.line	229; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	TXSTAxbits.TXEN = 1;
	BSF	_TXSTAbits, 5
;	.line	230; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	TXSTAxbits.BRGH = 1;
	BSF	_TXSTAbits, 2
;	.line	231; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	TXSTAxbits.TX9 = 1;
	BSF	_TXSTAbits, 6
;	.line	232; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	TXSTAxbits.TX9D = 0;
	BCF	_TXSTAbits, 0
;	.line	234; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	RCSTAxbits.RX9 = 1;
	BSF	_RCSTAbits, 6
;	.line	235; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	RCSTAxbits.SPEN = 1;
	BSF	_RCSTAbits, 7
	BANKSEL	_FraiseStatus
;	.line	237; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FraiseStatus.VAL = 0;
	CLRF	_FraiseStatus, B
	BANKSEL	_FraiseState
;	.line	238; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FraiseState = fIDLE;
	CLRF	_FraiseState, B
	BANKSEL	_FrRXin
;	.line	239; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrRXin = 0;
	CLRF	_FrRXin, B
	BANKSEL	_FrRXout
;	.line	240; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrRXout = 0;
	CLRF	_FrRXout, B
	BANKSEL	_FrTXpacket_len
;	.line	241; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrTXpacket_len = 0;
	CLRF	_FrTXpacket_len, B
;	.line	243; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrID = eeReadByte(EE_ID);
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	_eeReadByte
	BANKSEL	_FrID
	MOVWF	_FrID, B
	MOVF	POSTINC1, F
;	.line	246; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	TXxIP = 0;
	BCF	_IPR1bits, 4
;	.line	247; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	RCxIP = 0;
	BCF	_IPR1bits, 5
;	.line	248; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	FrInterruptEnabled = 1;
	MOVLW	0x01
	BANKSEL	_FrInterruptEnabled
	MOVWF	_FrInterruptEnabled, B
	BANKSEL	_stdout
;	.line	251; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	stdout = STREAM_USER;
	CLRF	_stdout, B
; removed redundant BANKSEL
	CLRF	(_stdout + 1), B
	MOVLW	0x2f
; removed redundant BANKSEL
	MOVWF	(_stdout + 2), B
;	.line	253; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	Serial_Init_Receiver();
	CALL	_Serial_Init_Receiver
;	.line	254; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	}
	RETURN	

; ; Starting pCode block
S_fraisedevice__fraiseSetID	code
_fraiseSetID:
;	.line	207; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	void fraiseSetID(unsigned char id)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	209; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	eeWriteByte(EE_ID,FrID = id);
	MOVFF	r0x00, _FrID
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	_eeWriteByte
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	210; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	}
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_fraisedevice__Serial_Init_Receiver	code
_Serial_Init_Receiver:
_00105_DS_:
;	.line	110; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	while(TXSTAxbits.TRMT == 0);
	BTFSS	_TXSTAbits, 1
	BRA	_00105_DS_
;	.line	111; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	SerDrv_Off();
	BSF	_TRISCbits, 0
;	.line	112; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	WREG=RCREGx;
	MOVF	_RCREG, W
	nop	
;	.line	114; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	WREG=RCREGx;
	MOVF	_RCREG, W
;	.line	115; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	RCSTAxbits.CREN = 0;
	BCF	_RCSTAbits, 4
;	.line	116; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	RCSTAxbits.CREN = 1;
	BSF	_RCSTAbits, 4
;	.line	117; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	RCSTAxbits.ADDEN = 1;
	BSF	_RCSTAbits, 3
;	.line	118; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	RCxIE = 1;
	BSF	_PIE1bits, 5
;	.line	119; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	TXxIE = 0;
	BCF	_PIE1bits, 4
;	.line	120; /home/arsene/pd-externals/Fraise/fraisedevice/fraisedevice.c	}
	RETURN	

; ; Starting pCode block
___str_0:
	DB	0x25, 0x64, 0x20, 0x00


; Statistics:
; code size:	 2928 (0x0b70) bytes ( 2.23%)
;           	 1464 (0x05b8) words
; udata size:	  471 (0x01d7) bytes (12.80%)
; access size:	    8 (0x0008) bytes


	end
