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
	global	___uflags
	global	__entry
	global	__startup
	global	__do_cinit

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern	_stack
	extern	_stack_end
	extern	_TBLPTRU
	extern	_TBLPTRH
	extern	_TBLPTRL
	extern	_FSR0L
	extern	_FSR0H
	extern	_TABLAT
	extern	_POSTINC0
	extern	_POSTDEC0
	extern	_main
	extern	_cinit


	idata
___uflags	db	0x00

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; ; Starting pCode block
S_crt0iz_rloc___entry	code	0X000000
__entry:
	goto	__startup 
;	.line	66; /home/arsene/pd-externals/Fraise/core/crt0iz-rloc.c	}
; I code from now on!
; ; Starting pCode block
S_crt0iz_rloc___do_cinit	code
__do_cinit:
	;	TBLPTR = &cinit
	movlw	low(_cinit)
	movwf	_TBLPTRL
	movlw	high(_cinit)
	movwf	_TBLPTRH
	movlw	upper(_cinit)
	movwf	_TBLPTRU
	;	0x05 = cinit.num_init
	;	movlb 0x07
	tblrd*+
	movf	_TABLAT, w
	movwf	0x05
	tblrd*+
	movf	_TABLAT, w
	movwf	0x05 +1
	;	while (0x05) {
test:
	bnz	cont1 ;;done1
	tstfsz	0x05, 1
	bra	cont1
done1:
	goto	done
cont1:
	;	Count down so we only have to look up the data in _cinit once.
	;	At this point we know that TBLPTR points to the top of the current
	;	entry in _cinit, so we can just start reading the from, to, and
	;	size values.
	;	read the source address low
	tblrd*+
	movf	_TABLAT, w
	movwf	0x00
	;	source address high
	tblrd*+
	movf	_TABLAT, w
	movwf	0x00 + 1
	;	source address upper
	tblrd*+
	movf	_TABLAT, w
	movwf	0x00 + 2
	;	skip a byte since it is stored as a 32bit int
	tblrd*+
	;	read the destination address directly into FSR0
	;	destination address low
	tblrd*+
	movf	_TABLAT, w
	movwf	_FSR0L
	;	destination address high
	tblrd*+
	movf	_TABLAT, w
	movwf	_FSR0H
	;	skip two bytes since it is stored as a 32bit int
	tblrd*+
	tblrd*+
	;	read the size of data to transfer to destination address
	tblrd*+
	movf	_TABLAT, w
	movwf	0x03
	tblrd*+
	movf	_TABLAT, w
	movwf	0x03 +1
	;	skip two bytes since it is stored as a 32bit int
	tblrd*+
	tblrd*+
	;	0x00 = 0x07 ->from;
	;	FSR0 = 0x07 ->to;
	;	0x03 = (unsigned short) 0x07 ->size;
	;	the table pointer now points to the next entry. Save it
	;	off since we will be using the table pointer to do the copying
	;	for the entry
	;	0x07 = TBLPTR
	movff	_TBLPTRL, 0x07
	movff	_TBLPTRH, 0x07 + 1
	movff	_TBLPTRU, 0x07 + 2
	;	now assign the source address to the table pointer
	;	TBLPTR = 0x00
	movff	0x00, _TBLPTRL
	movff	0x00 + 1, _TBLPTRH
	movff	0x00 + 2, _TBLPTRU
	;	do the copy loop
	;	determine if we have any more bytes to copy
	;	movlb 0x03
	movf	0x03, w
copy_loop:
	bnz	copy_one_byte ; copy_one_byte
	movf	0x03 + 1, w
	bz	done_copying
copy_one_byte:
	tblrd*+
	movf	_TABLAT, w
	movwf	_POSTINC0
	;	decrement byte counter
	decf	0x03, f
	bc	copy_loop ; copy_loop
	decf	0x03 + 1, f
	bra	copy_one_byte
done_copying:
	;	restore the table pointer for the next entry
	;	TBLPTR = 0x07
	movff	0x07, _TBLPTRL
	movff	0x07 + 1, _TBLPTRH
	movff	0x07 + 2, _TBLPTRU
	decf	0x05, f
	bc	do_next
	decf	0x05 + 1, f
do_next:
	;	next entry...
	;	_do_cinit_curr_entry--;
	goto	test;
	;	emit done label
done:
	return
	
;	.line	301; /home/arsene/pd-externals/Fraise/core/crt0iz-rloc.c	}
; ; Starting pCode block
S_crt0iz_rloc___startup	code
__startup:
	lfsr	1, _stack_end
	lfsr	2, _stack_end
	clrf	_TBLPTRU, 0
	bsf	0xa6, 7, 0
	bcf	0xa6, 6, 0
	
	;	movlw 0xff
	;	movwf _FSR0L, 0
	setf	_FSR0L
	movlw	0x0e
	movwf	_FSR0H, 0
	;	movlw 1
	;	movwf 0x00, 0
	setf	0x00
	movlw	0x00
clear_loop:
	clrf	_POSTDEC0
	movf	0x00, w
	bnz	clear_loop
	
;	.line	107; /home/arsene/pd-externals/Fraise/core/crt0iz-rloc.c	_do_cinit();
	CALL	__do_cinit
;	.line	110; /home/arsene/pd-externals/Fraise/core/crt0iz-rloc.c	main();
	CALL	_main
_00110_DS_:
;	.line	114; /home/arsene/pd-externals/Fraise/core/crt0iz-rloc.c	goto loop;
	BRA	_00110_DS_
;	.line	115; /home/arsene/pd-externals/Fraise/core/crt0iz-rloc.c	}


; Statistics:
; code size:	  276 (0x0114) bytes ( 0.21%)
;           	  138 (0x008a) words
; udata size:	    0 (0x0000) bytes ( 0.00%)
; access size:	    0 (0x0000) bytes


	end
