
_Timer1Interrupt:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;uygulama.c,65 :: 		void Timer1Interrupt() iv IVT_ADDR_T1INTERRUPT
;uygulama.c,67 :: 		if(IFS0bits.T1IF==1)
	BTSS	IFS0bits, #3
	GOTO	L_Timer1Interrupt0
;uygulama.c,69 :: 		T1IF_bit=0;
	BCLR	T1IF_bit, BitPos(T1IF_bit+0)
;uygulama.c,70 :: 		asm CLRWDT;
	CLRWDT
;uygulama.c,71 :: 		}
L_Timer1Interrupt0:
;uygulama.c,72 :: 		}
L_end_Timer1Interrupt:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _Timer1Interrupt

_init_timer:

;uygulama.c,74 :: 		void init_timer()
;uygulama.c,76 :: 		T1CON     = 0x8020;
	MOV	#32800, W0
	MOV	WREG, T1CON
;uygulama.c,77 :: 		T1IE_bit  = 1;
	BSET	T1IE_bit, BitPos(T1IE_bit+0)
;uygulama.c,78 :: 		T1IF_bit  = 0;
	BCLR	T1IF_bit, BitPos(T1IF_bit+0)
;uygulama.c,79 :: 		IPC0      = IPC0 | 0x1000;
	MOV	#4096, W1
	MOV	#lo_addr(IPC0), W0
	IOR	W1, [W0], [W0]
;uygulama.c,80 :: 		PR1       = 25000;
	MOV	#25000, W0
	MOV	WREG, PR1
;uygulama.c,81 :: 		}
L_end_init_timer:
	RETURN
; end of _init_timer

_joystick_init:

;uygulama.c,83 :: 		void joystick_init()
;uygulama.c,88 :: 		AD1PCFGL=0b0100011111100011; //ANALOG PINLER 0-1-2-4-5-11-12-13-14
	MOV	#18403, W0
	MOV	WREG, AD1PCFGL
;uygulama.c,90 :: 		cm1con.f15=0;                //comparator1 kapalý
	BCLR	CM1CON, #15
;uygulama.c,91 :: 		cm2con.f15=0;                //comparator2 kapalý
	BCLR	CM2CON, #15
;uygulama.c,92 :: 		cm3con.f15=0;                //comparator3 kapalý
	BCLR	CM3CON, #15
;uygulama.c,94 :: 		ADC1_Init();
	CALL	_ADC1_Init
;uygulama.c,96 :: 		JOY1_dir=1;                  //J37
	BSET	TRISB1_bit, BitPos(TRISB1_bit+0)
;uygulama.c,97 :: 		JOY2_dir=1;                  //J39
	BSET	TRISB0_bit, BitPos(TRISB0_bit+0)
;uygulama.c,98 :: 		JOY3_dir =1;                 //J41
	BSET	TRISB4_bit, BitPos(TRISB4_bit+0)
;uygulama.c,99 :: 		JOY4_dir =1;                 //J43
	BSET	TRISB2_bit, BitPos(TRISB2_bit+0)
;uygulama.c,100 :: 		JOY5_dir =1;                 //J45
	BSET	TRISB11_bit, BitPos(TRISB11_bit+0)
;uygulama.c,101 :: 		JOY6_dir =1;                 //J47
	BSET	TRISB12_bit, BitPos(TRISB12_bit+0)
;uygulama.c,102 :: 		J29R30_dir=1;
	BSET	TRISB14_bit, BitPos(TRISB14_bit+0)
;uygulama.c,103 :: 		J29R29_dir=1;
	BSET	TRISE5_bit, BitPos(TRISE5_bit+0)
;uygulama.c,104 :: 		idata_595_dir=0;
	BCLR	TRISB8_bit, BitPos(TRISB8_bit+0)
;uygulama.c,105 :: 		load_595_dir=0;
	BCLR	TRISB7_bit, BitPos(TRISB7_bit+0)
;uygulama.c,106 :: 		clk_595_dir=0;
	BCLR	TRISB6_bit, BitPos(TRISB6_bit+0)
;uygulama.c,107 :: 		load_165_dir=0;
	BCLR	TRISD5_bit, BitPos(TRISD5_bit+0)
;uygulama.c,108 :: 		clk_165_dir=0;
	BCLR	TRISE0_bit, BitPos(TRISE0_bit+0)
;uygulama.c,109 :: 		qdata_165_dir=1;
	BSET	TRISE1_bit, BitPos(TRISE1_bit+0)
;uygulama.c,110 :: 		switchdata_dir=1;
	BSET	TRISE6_bit, BitPos(TRISE6_bit+0)
;uygulama.c,111 :: 		switch_stcp_dir=0;
	BCLR	TRISE7_bit, BitPos(TRISE7_bit+0)
;uygulama.c,112 :: 		switch_shcp_dir=0;
	BCLR	TRISG6_bit, BitPos(TRISG6_bit+0)
;uygulama.c,115 :: 		}
L_end_joystick_init:
	RETURN
; end of _joystick_init

_rs485Init:

;uygulama.c,117 :: 		void rs485Init()
;uygulama.c,119 :: 		rs_485_RX_direction=1;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	BSET	rs_485_RX_direction, BitPos(rs_485_RX_direction+0)
;uygulama.c,120 :: 		rs_485_rxtx_pin_direction=0;
	BCLR	rs_485_rxtx_pin_direction, BitPos(rs_485_rxtx_pin_direction+0)
;uygulama.c,121 :: 		rs_485_TX_direction=0;
	BCLR	rs_485_TX_direction, BitPos(rs_485_TX_direction+0)
;uygulama.c,124 :: 		oscconbits.IOLOCK=0; //unlock
	BCLR	OSCCONbits, #6
;uygulama.c,125 :: 		RPINR19bits.U2RXR=27; //uart2 I RP27
	MOV.B	#27, W0
	MOV.B	W0, W1
	MOV	#lo_addr(RPINR19bits), W0
	XOR.B	W1, [W0], W1
	MOV.B	#63, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(RPINR19bits), W0
	XOR.B	W1, [W0], W1
	MOV	#lo_addr(RPINR19bits), W0
	MOV.B	W1, [W0]
;uygulama.c,126 :: 		RPOR13bits.RP26R=5;   //uart2 O RP26
	MOV.B	#5, W0
	MOV.B	W0, W1
	MOV	#lo_addr(RPOR13bits), W0
	XOR.B	W1, [W0], W1
	MOV.B	#63, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(RPOR13bits), W0
	XOR.B	W1, [W0], W1
	MOV	#lo_addr(RPOR13bits), W0
	MOV.B	W1, [W0]
;uygulama.c,127 :: 		UART2_Init(19200);    //uart baud rate ayarlandi gercekte 19200
	MOV	#19200, W10
	MOV	#0, W11
	CALL	_UART2_Init
;uygulama.c,132 :: 		UART_Set_Active(&UART2_Read, &UART2_Write, &UART2_Data_Ready, &UART2_Tx_Idle);
	MOV	#lo_addr(_UART2_Tx_Idle), W13
	MOV	#lo_addr(_UART2_Data_Ready), W12
	MOV	#lo_addr(_UART2_Write), W11
	MOV	#lo_addr(_UART2_Read), W10
	CALL	_UART_Set_Active
;uygulama.c,134 :: 		U2STAbits.UTXEN = 1;   //enable transmission
	BSET	U2STAbits, #10
;uygulama.c,135 :: 		IFS1bits.U2RXIF = 0;
	BCLR	IFS1bits, #14
;uygulama.c,136 :: 		IEC1bits.U2RXIE = 1;   //enable U1RX interrupt
	BSET	IEC1bits, #14
;uygulama.c,138 :: 		rs_485_rxtx_pin=0;
	BCLR	rs_485_rxtx_pin, BitPos(rs_485_rxtx_pin+0)
;uygulama.c,139 :: 		}
L_end_rs485Init:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _rs485Init

_butonBilgi:

;uygulama.c,141 :: 		void butonBilgi()
;uygulama.c,143 :: 		giris_port_coklayici();
	PUSH	W10
	CALL	_giris_port_coklayici
;uygulama.c,144 :: 		giris_port_coklayici();
	CALL	_giris_port_coklayici
;uygulama.c,146 :: 		j1_analog = abs(1014-ADC1_Get_Sample(3));  //Analog-3
	MOV	#3, W10
	CALL	_ADC1_Get_Sample
	MOV	#1014, W1
	SUB	W1, W0, W0
	MOV	W0, W10
	CALL	_abs
	MOV	W0, _j1_analog
;uygulama.c,147 :: 		j2_analog = abs(1014-ADC1_Get_Sample(15)); //Analog-15
	MOV	#15, W10
	CALL	_ADC1_Get_Sample
	MOV	#1014, W1
	SUB	W1, W0, W0
	MOV	W0, W10
	CALL	_abs
	MOV	W0, _j2_analog
;uygulama.c,148 :: 		j3_analog = abs(1014-ADC1_Get_Sample(4));  //Analog-4
	MOV	#4, W10
	CALL	_ADC1_Get_Sample
	MOV	#1014, W1
	SUB	W1, W0, W0
	MOV	W0, W10
	CALL	_abs
	MOV	W0, _j3_analog
;uygulama.c,149 :: 		j4_analog = abs(1014-ADC1_Get_Sample(2));  //Analog-2
	MOV	#2, W10
	CALL	_ADC1_Get_Sample
	MOV	#1014, W1
	SUB	W1, W0, W0
	MOV	W0, W10
	CALL	_abs
	MOV	W0, _j4_analog
;uygulama.c,150 :: 		j5_analog = abs(1014-ADC1_Get_Sample(11));  //Analog-11
	MOV	#11, W10
	CALL	_ADC1_Get_Sample
	MOV	#1014, W1
	SUB	W1, W0, W0
	MOV	W0, W10
	CALL	_abs
	MOV	W0, _j5_analog
;uygulama.c,152 :: 		if(j1_analog>=650) outputSet = 1;
	MOV	_j1_analog, W1
	MOV	#650, W0
	CP	W1, W0
	BRA GE	L__butonBilgi25
	GOTO	L_butonBilgi1
L__butonBilgi25:
	MOV	#lo_addr(_outputSet), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
	GOTO	L_butonBilgi2
L_butonBilgi1:
;uygulama.c,153 :: 		else outputSet = 0;
	MOV	#lo_addr(_outputSet), W1
	CLR	W0
	MOV.B	W0, [W1]
L_butonBilgi2:
;uygulama.c,156 :: 		if(buton_acil_stop==0)
	BTSC	RE5_bit, BitPos(RE5_bit+0)
	GOTO	L_butonBilgi3
;uygulama.c,158 :: 		gonderilen_acil_stop=0x01;   //0x31
	MOV	#lo_addr(_gonderilen_acil_stop), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;uygulama.c,159 :: 		}
	GOTO	L_butonBilgi4
L_butonBilgi3:
;uygulama.c,162 :: 		gonderilen_acil_stop=0x00;  //0x30
	MOV	#lo_addr(_gonderilen_acil_stop), W1
	CLR	W0
	MOV.B	W0, [W1]
;uygulama.c,163 :: 		}
L_butonBilgi4:
;uygulama.c,164 :: 		}
L_end_butonBilgi:
	POP	W10
	RETURN
; end of _butonBilgi

_rs485DataGonder:

;uygulama.c,166 :: 		void rs485DataGonder()
;uygulama.c,168 :: 		rs485_TX_DATA[0] = 0x01;                   // Slave Address
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(_rs485_TX_DATA), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;uygulama.c,169 :: 		rs485_TX_DATA[1] = 0x06;                   // Function Code
	MOV	#lo_addr(_rs485_TX_DATA+1), W1
	MOV.B	#6, W0
	MOV.B	W0, [W1]
;uygulama.c,170 :: 		rs485_TX_DATA[2] = (uint8_t)(msgToSend[0]);
	MOV	#lo_addr(_rs485_TX_DATA+2), W1
	MOV	#lo_addr(_msgToSend), W0
	MOV.B	[W0], [W1]
;uygulama.c,171 :: 		rs485_TX_DATA[3] = (uint8_t)(msgToSend[1]);
	MOV	#lo_addr(_rs485_TX_DATA+3), W1
	MOV	#lo_addr(_msgToSend+1), W0
	MOV.B	[W0], [W1]
;uygulama.c,172 :: 		rs485_TX_DATA[4] = (uint8_t)(msgToSend[2]);
	MOV	#lo_addr(_rs485_TX_DATA+4), W1
	MOV	#lo_addr(_msgToSend+2), W0
	MOV.B	[W0], [W1]
;uygulama.c,173 :: 		rs485_TX_DATA[5] = (uint8_t)(msgToSend[3]);
	MOV	#lo_addr(_rs485_TX_DATA+5), W1
	MOV	#lo_addr(_msgToSend+3), W0
	MOV.B	[W0], [W1]
;uygulama.c,175 :: 		fnxChecksum(rs485_TX_DATA,6,crcResult);
	MOV	#lo_addr(_crcResult), W12
	MOV	#6, W11
	MOV	#lo_addr(_rs485_TX_DATA), W10
	CALL	_fnxChecksum
;uygulama.c,176 :: 		rs485_TX_DATA[6] = crcResult[0];            // 2 bytes of CRC
	MOV	#lo_addr(_rs485_TX_DATA+6), W1
	MOV	#lo_addr(_crcResult), W0
	MOV.B	[W0], [W1]
;uygulama.c,177 :: 		rs485_TX_DATA[7] = crcResult[1];
	MOV	#lo_addr(_rs485_TX_DATA+7), W1
	MOV	#lo_addr(_crcResult+1), W0
	MOV.B	[W0], [W1]
;uygulama.c,179 :: 		if(risingEdgeFnx(outputSet , &trig[0])) UART2TX(8);
	MOV	#lo_addr(_outputSet), W0
	MOV	#lo_addr(_trig), W11
	MOV.B	[W0], W10
	CALL	_risingEdgeFnx
	CP0.B	W0
	BRA NZ	L__rs485DataGonder27
	GOTO	L_rs485DataGonder5
L__rs485DataGonder27:
	MOV	#8, W10
	CALL	_UART2TX
L_rs485DataGonder5:
;uygulama.c,182 :: 		}
L_end_rs485DataGonder:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _rs485DataGonder

_risingEdgeFnx:

;uygulama.c,184 :: 		bool risingEdgeFnx(bool buttonInfo , bool *memBit)
;uygulama.c,186 :: 		if((buttonInfo) && !(*memBit))
	CP0.B	W10
	BRA NZ	L__risingEdgeFnx29
	GOTO	L__risingEdgeFnx17
L__risingEdgeFnx29:
	CP0.B	[W11]
	BRA Z	L__risingEdgeFnx30
	GOTO	L__risingEdgeFnx16
L__risingEdgeFnx30:
L__risingEdgeFnx15:
;uygulama.c,188 :: 		*memBit = 1;
	MOV.B	#1, W0
	MOV.B	W0, [W11]
;uygulama.c,189 :: 		return 1;
	MOV.B	#1, W0
	GOTO	L_end_risingEdgeFnx
;uygulama.c,186 :: 		if((buttonInfo) && !(*memBit))
L__risingEdgeFnx17:
L__risingEdgeFnx16:
;uygulama.c,191 :: 		else if(!(buttonInfo) && (*memBit))
	CP0.B	W10
	BRA Z	L__risingEdgeFnx31
	GOTO	L__risingEdgeFnx19
L__risingEdgeFnx31:
	CP0.B	[W11]
	BRA NZ	L__risingEdgeFnx32
	GOTO	L__risingEdgeFnx18
L__risingEdgeFnx32:
L__risingEdgeFnx14:
;uygulama.c,193 :: 		*memBit = 0;
	CLR	W0
	MOV.B	W0, [W11]
;uygulama.c,194 :: 		return 0;
	CLR	W0
	GOTO	L_end_risingEdgeFnx
;uygulama.c,191 :: 		else if(!(buttonInfo) && (*memBit))
L__risingEdgeFnx19:
L__risingEdgeFnx18:
;uygulama.c,196 :: 		else return 0;
	CLR	W0
;uygulama.c,197 :: 		}
L_end_risingEdgeFnx:
	RETURN
; end of _risingEdgeFnx
