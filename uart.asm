
_UART1RXInterrupt:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;uart.c,11 :: 		void UART1RXInterrupt() iv IVT_ADDR_U1RXINTERRUPT
;uart.c,13 :: 		if(UART1_Data_Ready())
	CALL	_UART1_Data_Ready
	CP0	W0
	BRA NZ	L__UART1RXInterrupt9
	GOTO	L_UART1RXInterrupt0
L__UART1RXInterrupt9:
;uart.c,15 :: 		uart_temp = UART1_Read();
	CALL	_UART1_Read
	MOV	#lo_addr(_uart_temp), W1
	MOV.B	W0, [W1]
;uart.c,17 :: 		if(uart_temp==101 || uart_RX_DATA[0]==101)
	MOV.B	#101, W1
	CP.B	W0, W1
	BRA NZ	L__UART1RXInterrupt10
	GOTO	L__UART1RXInterrupt7
L__UART1RXInterrupt10:
	MOV	#lo_addr(_uart_RX_DATA), W0
	MOV.B	[W0], W1
	MOV.B	#101, W0
	CP.B	W1, W0
	BRA NZ	L__UART1RXInterrupt11
	GOTO	L__UART1RXInterrupt6
L__UART1RXInterrupt11:
	GOTO	L_UART1RXInterrupt3
L__UART1RXInterrupt7:
L__UART1RXInterrupt6:
;uart.c,19 :: 		uart_RX_DATA[uart_int] = uart_temp;
	MOV	#lo_addr(_uart_RX_DATA), W1
	MOV	#lo_addr(_uart_int), W0
	ADD	W1, [W0], W1
	MOV	#lo_addr(_uart_temp), W0
	MOV.B	[W0], [W1]
;uart.c,20 :: 		uart_int++;
	MOV	#1, W1
	MOV	#lo_addr(_uart_int), W0
	ADD	W1, [W0], [W0]
;uart.c,21 :: 		}
L_UART1RXInterrupt3:
;uart.c,22 :: 		}
L_UART1RXInterrupt0:
;uart.c,24 :: 		if(uart_int==7)
	MOV	_uart_int, W0
	CP	W0, #7
	BRA Z	L__UART1RXInterrupt12
	GOTO	L_UART1RXInterrupt4
L__UART1RXInterrupt12:
;uart.c,26 :: 		uart_int=0;
	CLR	W0
	MOV	W0, _uart_int
;uart.c,27 :: 		}
L_UART1RXInterrupt4:
;uart.c,29 :: 		IFS0bits.U1RXIF = 0;
	BCLR	IFS0bits, #11
;uart.c,30 :: 		}
L_end_UART1RXInterrupt:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _UART1RXInterrupt
