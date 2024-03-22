
_UART2TX:

;rs485.c,16 :: 		void UART2TX(int length)
;rs485.c,18 :: 		rs_485_rxtx_pin=1;
	BSET	LATG8_bit, BitPos(LATG8_bit+0)
;rs485.c,19 :: 		Delay_us(1);
	NOP
	NOP
	NOP
	NOP
;rs485.c,22 :: 		for(j=0 ; j<length ; j++)
	CLR	W0
	MOV	W0, _j
L_UART2TX0:
	MOV	#lo_addr(_j), W0
	CP	W10, [W0]
	BRA GT	L__UART2TX14
	GOTO	L_UART2TX1
L__UART2TX14:
;rs485.c,24 :: 		UART2_Write(rs485_TX_DATA[j]);
	MOV	#lo_addr(_rs485_TX_DATA), W1
	MOV	#lo_addr(_j), W0
	ADD	W1, [W0], W0
	PUSH	W10
	ZE	[W0], W10
	CALL	_UART2_Write
	POP	W10
;rs485.c,22 :: 		for(j=0 ; j<length ; j++)
	MOV	#1, W1
	MOV	#lo_addr(_j), W0
	ADD	W1, [W0], [W0]
;rs485.c,25 :: 		}
	GOTO	L_UART2TX0
L_UART2TX1:
;rs485.c,27 :: 		Delay_ms(1);
	MOV	#1333, W7
L_UART2TX3:
	DEC	W7
	BRA NZ	L_UART2TX3
	NOP
;rs485.c,29 :: 		rs_485_rxtx_pin=0;
	BCLR	LATG8_bit, BitPos(LATG8_bit+0)
;rs485.c,30 :: 		}
L_end_UART2TX:
	RETURN
; end of _UART2TX

_fnxChecksum:

;rs485.c,32 :: 		void fnxChecksum(unsigned char *input, int length,unsigned char *crcResult)
;rs485.c,34 :: 		unsigned int temp=0xFFFF;
; temp start address is: 2 (W1)
	MOV	#65535, W1
;rs485.c,36 :: 		for(d=0;d<length;d++)
	CLR	W0
	MOV	W0, _d
; temp end address is: 2 (W1)
L_fnxChecksum5:
; temp start address is: 2 (W1)
	MOV	#lo_addr(_d), W0
	CP	W11, [W0]
	BRA GT	L__fnxChecksum16
	GOTO	L_fnxChecksum6
L__fnxChecksum16:
;rs485.c,38 :: 		temp=input[d]^temp;
	MOV	#lo_addr(_d), W0
	ADD	W10, [W0], W0
	ZE	[W0], W0
; temp start address is: 4 (W2)
	XOR	W0, W1, W2
; temp end address is: 2 (W1)
;rs485.c,40 :: 		for(e=0;e<8;e++)
	CLR	W0
	MOV	W0, _e
; temp end address is: 4 (W2)
L_fnxChecksum8:
; temp start address is: 4 (W2)
	MOV	_e, W0
	CP	W0, #8
	BRA LT	L__fnxChecksum17
	GOTO	L_fnxChecksum9
L__fnxChecksum17:
;rs485.c,42 :: 		if(temp&0x01)
	BTSS	W2, #0
	GOTO	L_fnxChecksum11
;rs485.c,44 :: 		temp=temp>>1;
	LSR	W2, #1, W1
; temp end address is: 4 (W2)
;rs485.c,45 :: 		temp=temp^0xA001;
	MOV	#40961, W0
; temp start address is: 4 (W2)
	XOR	W1, W0, W2
;rs485.c,46 :: 		}
	GOTO	L_fnxChecksum12
L_fnxChecksum11:
;rs485.c,49 :: 		temp=temp>>1;
	LSR	W2, #1, W0
	MOV	W0, W2
; temp end address is: 4 (W2)
;rs485.c,50 :: 		}
L_fnxChecksum12:
;rs485.c,40 :: 		for(e=0;e<8;e++)
; temp start address is: 4 (W2)
	MOV	#1, W1
	MOV	#lo_addr(_e), W0
	ADD	W1, [W0], [W0]
;rs485.c,51 :: 		}
	GOTO	L_fnxChecksum8
L_fnxChecksum9:
;rs485.c,36 :: 		for(d=0;d<length;d++)
	MOV	#1, W1
	MOV	#lo_addr(_d), W0
	ADD	W1, [W0], [W0]
;rs485.c,52 :: 		}
	MOV	W2, W1
; temp end address is: 4 (W2)
	GOTO	L_fnxChecksum5
L_fnxChecksum6:
;rs485.c,54 :: 		crcResult[1]=temp;
; temp start address is: 2 (W1)
	ADD	W12, #1, W0
	MOV.B	W1, [W0]
;rs485.c,55 :: 		crcResult[0]=temp>>8;
	LSR	W1, #8, W0
; temp end address is: 2 (W1)
	MOV.B	W0, [W12]
;rs485.c,56 :: 		}
L_end_fnxChecksum:
	RETURN
; end of _fnxChecksum
