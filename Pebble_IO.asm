
_clock165:

;Pebble_IO.c,55 :: 		void clock165(void)
;Pebble_IO.c,57 :: 		clk_165=1;
	PUSH	W10
	PUSH	W11
	BSET	RE0_bit, BitPos(RE0_bit+0)
;Pebble_IO.c,58 :: 		Delay_Cyc_Long(1);
	MOV	#1, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;Pebble_IO.c,59 :: 		clk_165=0;
	BCLR	RE0_bit, BitPos(RE0_bit+0)
;Pebble_IO.c,60 :: 		}
L_end_clock165:
	POP	W11
	POP	W10
	RETURN
; end of _clock165

_giris_port_coklayici:

;Pebble_IO.c,62 :: 		void giris_port_coklayici()
;Pebble_IO.c,64 :: 		clock165();                        // Boþ Pin
	PUSH	W10
	PUSH	W11
	CALL	_clock165
;Pebble_IO.c,65 :: 		clock165();                        // Boþ Pin
	CALL	_clock165
;Pebble_IO.c,66 :: 		P2C26R67=qdata_165;clock165();     // Joystick-3 Aþaðý Kurtulma
	MOV	#lo_addr(_P2C26R67), W0
	BSET	[W0], BitPos(_P2C26R67+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P2C26R67+0)
	CALL	_clock165
;Pebble_IO.c,67 :: 		P2C25R66=qdata_165;clock165();     // Joystick-3 Yukarý Kurtulma
	MOV	#lo_addr(_P2C25R66), W0
	BSET	[W0], BitPos(_P2C25R66+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P2C25R66+0)
	CALL	_clock165
;Pebble_IO.c,68 :: 		P2C24R65=qdata_165;clock165();     // Joystick-2 Aþaðý Kurtulma
	MOV	#lo_addr(_P2C24R65), W0
	BSET	[W0], BitPos(_P2C24R65+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P2C24R65+0)
	CALL	_clock165
;Pebble_IO.c,69 :: 		P2C23R64=qdata_165;clock165();     // Joystick-2 Yukarý Kurtulma
	MOV	#lo_addr(_P2C23R64), W0
	BSET	[W0], BitPos(_P2C23R64+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P2C23R64+0)
	CALL	_clock165
;Pebble_IO.c,70 :: 		P2C22R63=qdata_165;clock165();     // Joystick-1 Aþaðý Kurtulma
	MOV	#lo_addr(_P2C22R63), W0
	BSET	[W0], BitPos(_P2C22R63+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P2C22R63+0)
	CALL	_clock165
;Pebble_IO.c,71 :: 		P2C21R62=qdata_165;clock165();     // Joystick-1 Yukarý Kurtulma
	MOV	#lo_addr(_P2C21R62), W0
	BSET	[W0], BitPos(_P2C21R62+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P2C21R62+0)
	CALL	_clock165
;Pebble_IO.c,73 :: 		P3R25=qdata_165;clock165();        // Buton-1
	MOV	#lo_addr(_P3R25), W0
	BSET	[W0], BitPos(_P3R25+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P3R25+0)
	CALL	_clock165
;Pebble_IO.c,74 :: 		P3R30=qdata_165;clock165();        // Buton-2
	MOV	#lo_addr(_P3R30), W0
	BSET	[W0], BitPos(_P3R30+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P3R30+0)
	CALL	_clock165
;Pebble_IO.c,75 :: 		P2C33R72=qdata_165;clock165();     // Joystick-6 Yukarý Kurtulma
	MOV	#lo_addr(_P2C33R72), W0
	BSET	[W0], BitPos(_P2C33R72+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P2C33R72+0)
	CALL	_clock165
;Pebble_IO.c,76 :: 		P2C34R73=qdata_165;clock165();     // Joystick-6 Aþaðý Kurtulma
	MOV	#lo_addr(_P2C34R73), W0
	BSET	[W0], BitPos(_P2C34R73+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P2C34R73+0)
	CALL	_clock165
;Pebble_IO.c,77 :: 		P2C31R70=qdata_165;clock165();     // Joystick-5 Yukarý Kurtulma
	MOV	#lo_addr(_P2C31R70), W0
	BSET	[W0], BitPos(_P2C31R70+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P2C31R70+0)
	CALL	_clock165
;Pebble_IO.c,78 :: 		P2C32R71=qdata_165;clock165();     // Joystick-5 Aþaðý Kurtulma
	MOV	#lo_addr(_P2C32R71), W0
	BSET	[W0], BitPos(_P2C32R71+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P2C32R71+0)
	CALL	_clock165
;Pebble_IO.c,79 :: 		P2C29R68=qdata_165;clock165();     // Joystick-4 Yukarý Kurtulma
	MOV	#lo_addr(_P2C29R68), W0
	BSET	[W0], BitPos(_P2C29R68+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P2C29R68+0)
	CALL	_clock165
;Pebble_IO.c,80 :: 		P2C30R69=qdata_165;clock165();     // Joystick-4 Aþaðý Kurtulma
	MOV	#lo_addr(_P2C30R69), W0
	BSET	[W0], BitPos(_P2C30R69+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P2C30R69+0)
	CALL	_clock165
;Pebble_IO.c,82 :: 		P3R26=qdata_165;clock165();        // Buton-6
	MOV	#lo_addr(_P3R26), W0
	BSET	[W0], BitPos(_P3R26+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P3R26+0)
	CALL	_clock165
;Pebble_IO.c,83 :: 		P3R46=qdata_165;clock165();        // Buton-5
	MOV	#lo_addr(_P3R46), W0
	BSET	[W0], BitPos(_P3R46+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P3R46+0)
	CALL	_clock165
;Pebble_IO.c,84 :: 		P3R40=qdata_165;clock165();        // Buton-4
	MOV	#lo_addr(_P3R40), W0
	BSET	[W0], BitPos(_P3R40+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P3R40+0)
	CALL	_clock165
;Pebble_IO.c,85 :: 		P3R35=qdata_165;clock165();        // Buton-3
	MOV	#lo_addr(_P3R35), W0
	BSET	[W0], BitPos(_P3R35+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P3R35+0)
	CALL	_clock165
;Pebble_IO.c,86 :: 		P3R31=qdata_165;clock165();        // Buton-7
	MOV	#lo_addr(_P3R31), W0
	BSET	[W0], BitPos(_P3R31+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P3R31+0)
	CALL	_clock165
;Pebble_IO.c,87 :: 		P3R36=qdata_165;clock165();        // Buton-8
	MOV	#lo_addr(_P3R36), W0
	BSET	[W0], BitPos(_P3R36+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P3R36+0)
	CALL	_clock165
;Pebble_IO.c,88 :: 		P3R41=qdata_165;clock165();        // Buton-9
	MOV	#lo_addr(_P3R41), W0
	BSET	[W0], BitPos(_P3R41+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P3R41+0)
	CALL	_clock165
;Pebble_IO.c,89 :: 		P3R47=qdata_165;clock165();        // Buton-10
	MOV	#lo_addr(_P3R47), W0
	BSET	[W0], BitPos(_P3R47+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P3R47+0)
	CALL	_clock165
;Pebble_IO.c,91 :: 		P1R17=qdata_165;clock165();        // Toggle-1
	MOV	#lo_addr(_P1R17), W0
	BSET	[W0], BitPos(_P1R17+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P1R17+0)
	CALL	_clock165
;Pebble_IO.c,92 :: 		P1R22=qdata_165;clock165();        // Toggle-2
	MOV	#lo_addr(_P1R22), W0
	BSET	[W0], BitPos(_P1R22+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P1R22+0)
	CALL	_clock165
;Pebble_IO.c,93 :: 		P3R57=qdata_165;clock165();        // Toggle-24
	MOV	#lo_addr(_P3R57), W0
	BSET	[W0], BitPos(_P3R57+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P3R57+0)
	CALL	_clock165
;Pebble_IO.c,94 :: 		P3R51=qdata_165;clock165();        // Toggle-23
	MOV	#lo_addr(_P3R51), W0
	BSET	[W0], BitPos(_P3R51+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P3R51+0)
	CALL	_clock165
;Pebble_IO.c,95 :: 		P1R33=qdata_165;clock165();        // Toggle-12
	MOV	#lo_addr(_P1R33), W0
	BSET	[W0], BitPos(_P1R33+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P1R33+0)
	CALL	_clock165
;Pebble_IO.c,96 :: 		P1R38=qdata_165;clock165();        // Toggle-13
	MOV	#lo_addr(_P1R38), W0
	BSET	[W0], BitPos(_P1R38+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P1R38+0)
	CALL	_clock165
;Pebble_IO.c,97 :: 		P1R43=qdata_165;clock165();        // Toggle-14
	MOV	#lo_addr(_P1R43), W0
	BSET	[W0], BitPos(_P1R43+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P1R43+0)
	CALL	_clock165
;Pebble_IO.c,98 :: 		P1R27=qdata_165;clock165();        // Toggle-3
	MOV	#lo_addr(_P1R27), W0
	BSET	[W0], BitPos(_P1R27+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P1R27+0)
	CALL	_clock165
;Pebble_IO.c,100 :: 		P1R56=qdata_165;clock165();        // Toggle-16
	MOV	#lo_addr(_P1R56), W0
	BSET	[W0], BitPos(_P1R56+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P1R56+0)
	CALL	_clock165
;Pebble_IO.c,101 :: 		P1R37=qdata_165;clock165();        // Toggle-5
	MOV	#lo_addr(_P1R37), W0
	BSET	[W0], BitPos(_P1R37+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P1R37+0)
	CALL	_clock165
;Pebble_IO.c,102 :: 		P1R50=qdata_165;clock165();        // Toggle-15
	MOV	#lo_addr(_P1R50), W0
	BSET	[W0], BitPos(_P1R50+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P1R50+0)
	CALL	_clock165
;Pebble_IO.c,103 :: 		P1R32=qdata_165;clock165();        // Toggle-4
	MOV	#lo_addr(_P1R32), W0
	BSET	[W0], BitPos(_P1R32+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P1R32+0)
	CALL	_clock165
;Pebble_IO.c,104 :: 		P1R32=qdata_165;clock165();        // Toggle-18
	MOV	#lo_addr(_P1R32), W0
	BSET	[W0], BitPos(_P1R32+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P1R32+0)
	CALL	_clock165
;Pebble_IO.c,105 :: 		P1R49=qdata_165;clock165();        // Toggle-7
	MOV	#lo_addr(_P1R49), W0
	BSET	[W0], BitPos(_P1R49+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P1R49+0)
	CALL	_clock165
;Pebble_IO.c,106 :: 		P1R19=qdata_165;clock165();        // Toggle-17
	MOV	#lo_addr(_P1R19), W0
	BSET	[W0], BitPos(_P1R19+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P1R19+0)
	CALL	_clock165
;Pebble_IO.c,107 :: 		P1R42=qdata_165;clock165();        // Toggle-6
	MOV	#lo_addr(_P1R42), W0
	BSET	[W0], BitPos(_P1R42+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P1R42+0)
	CALL	_clock165
;Pebble_IO.c,109 :: 		P1R28=qdata_165;clock165();        // Toggle-11
	MOV	#lo_addr(_P1R28), W0
	BSET	[W0], BitPos(_P1R28+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P1R28+0)
	CALL	_clock165
;Pebble_IO.c,110 :: 		P1R44=qdata_165;clock165();        // Toggle-22
	MOV	#lo_addr(_P1R44), W0
	BSET	[W0], BitPos(_P1R44+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P1R44+0)
	CALL	_clock165
;Pebble_IO.c,111 :: 		P1R23=qdata_165;clock165();        // Toggle-10
	MOV	#lo_addr(_P1R23), W0
	BSET	[W0], BitPos(_P1R23+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P1R23+0)
	CALL	_clock165
;Pebble_IO.c,112 :: 		P1R39=qdata_165;clock165();        // Toggle-21
	MOV	#lo_addr(_P1R39), W0
	BSET	[W0], BitPos(_P1R39+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P1R39+0)
	CALL	_clock165
;Pebble_IO.c,113 :: 		P1R18=qdata_165;clock165();        // Toggle-9
	MOV	#lo_addr(_P1R18), W0
	BSET	[W0], BitPos(_P1R18+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P1R18+0)
	CALL	_clock165
;Pebble_IO.c,114 :: 		P1R34=qdata_165;clock165();        // Toggle-20
	MOV	#lo_addr(_P1R34), W0
	BSET	[W0], BitPos(_P1R34+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P1R34+0)
	CALL	_clock165
;Pebble_IO.c,115 :: 		P1R55=qdata_165;clock165();        // Toggle-8
	MOV	#lo_addr(_P1R55), W0
	BSET	[W0], BitPos(_P1R55+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P1R55+0)
	CALL	_clock165
;Pebble_IO.c,116 :: 		P1R29=qdata_165;clock165();        // Toggle-19
	MOV	#lo_addr(_P1R29), W0
	BSET	[W0], BitPos(_P1R29+0)
	BTSS	RE1_bit, BitPos(RE1_bit+0)
	BCLR	[W0], BitPos(_P1R29+0)
	CALL	_clock165
;Pebble_IO.c,119 :: 		load_165=0;
	BCLR	RD5_bit, BitPos(RD5_bit+0)
;Pebble_IO.c,120 :: 		Delay_Cyc_Long(1);
	MOV	#1, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;Pebble_IO.c,121 :: 		load_165=1;
	BSET	RD5_bit, BitPos(RD5_bit+0)
;Pebble_IO.c,122 :: 		}
L_end_giris_port_coklayici:
	POP	W11
	POP	W10
	RETURN
; end of _giris_port_coklayici

_clock595:

;Pebble_IO.c,124 :: 		void clock595(void)
;Pebble_IO.c,126 :: 		clk_595=1;
	PUSH	W10
	PUSH	W11
	BSET	RB6_bit, BitPos(RB6_bit+0)
;Pebble_IO.c,127 :: 		Delay_Cyc_Long(1);
	MOV	#1, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;Pebble_IO.c,128 :: 		clk_595=0;
	BCLR	RB6_bit, BitPos(RB6_bit+0)
;Pebble_IO.c,129 :: 		}
L_end_clock595:
	POP	W11
	POP	W10
	RETURN
; end of _clock595

_cikis_port_coklayici:

;Pebble_IO.c,132 :: 		void cikis_port_coklayici()
;Pebble_IO.c,134 :: 		clock595();
	PUSH	W10
	PUSH	W11
	CALL	_clock595
;Pebble_IO.c,135 :: 		clock595();
	CALL	_clock595
;Pebble_IO.c,137 :: 		idata_595=P3R9;clock595();     // Led-4
	MOV	#lo_addr(_P3R9), W0
	BTSS	[W0], BitPos(_P3R9+0)
	BCLR	RB8_bit, BitPos(RB8_bit+0)
	BTSC	[W0], BitPos(_P3R9+0)
	BSET	RB8_bit, BitPos(RB8_bit+0)
	CALL	_clock595
;Pebble_IO.c,138 :: 		idata_595=P3R6;clock595();     // Led-3
	MOV	#lo_addr(_P3R6), W0
	BTSS	[W0], BitPos(_P3R6+0)
	BCLR	RB8_bit, BitPos(RB8_bit+0)
	BTSC	[W0], BitPos(_P3R6+0)
	BSET	RB8_bit, BitPos(RB8_bit+0)
	CALL	_clock595
;Pebble_IO.c,139 :: 		idata_595=P3R2;clock595();     // Led-2
	MOV	#lo_addr(_P3R2), W0
	BTSS	[W0], BitPos(_P3R2+0)
	BCLR	RB8_bit, BitPos(RB8_bit+0)
	BTSC	[W0], BitPos(_P3R2+0)
	BSET	RB8_bit, BitPos(RB8_bit+0)
	CALL	_clock595
;Pebble_IO.c,140 :: 		idata_595=P3R8;clock595();     // Led-1
	MOV	#lo_addr(_P3R8), W0
	BTSS	[W0], BitPos(_P3R8+0)
	BCLR	RB8_bit, BitPos(RB8_bit+0)
	BTSC	[W0], BitPos(_P3R8+0)
	BSET	RB8_bit, BitPos(RB8_bit+0)
	CALL	_clock595
;Pebble_IO.c,141 :: 		idata_595=P3R5;clock595();     // Batarya Led Kýrmýzý
	MOV	#lo_addr(_P3R5), W0
	BTSS	[W0], BitPos(_P3R5+0)
	BCLR	RB8_bit, BitPos(RB8_bit+0)
	BTSC	[W0], BitPos(_P3R5+0)
	BSET	RB8_bit, BitPos(RB8_bit+0)
	CALL	_clock595
;Pebble_IO.c,142 :: 		idata_595=P3R1;clock595();     // Batarya Led Yeþil
	MOV	#lo_addr(_P3R1), W0
	BTSS	[W0], BitPos(_P3R1+0)
	BCLR	RB8_bit, BitPos(RB8_bit+0)
	BTSC	[W0], BitPos(_P3R1+0)
	BSET	RB8_bit, BitPos(RB8_bit+0)
	CALL	_clock595
;Pebble_IO.c,143 :: 		idata_595=P3R7;clock595();     // Durum Led Kýrmýzý
	MOV	#lo_addr(_P3R7), W0
	BTSS	[W0], BitPos(_P3R7+0)
	BCLR	RB8_bit, BitPos(RB8_bit+0)
	BTSC	[W0], BitPos(_P3R7+0)
	BSET	RB8_bit, BitPos(RB8_bit+0)
	CALL	_clock595
;Pebble_IO.c,144 :: 		idata_595=P3R4;clock595();     // Durum Led Yeþil
	MOV	#lo_addr(_P3R4), W0
	BTSS	[W0], BitPos(_P3R4+0)
	BCLR	RB8_bit, BitPos(RB8_bit+0)
	BTSC	[W0], BitPos(_P3R4+0)
	BSET	RB8_bit, BitPos(RB8_bit+0)
	CALL	_clock595
;Pebble_IO.c,146 :: 		load_595=0;
	BCLR	RB7_bit, BitPos(RB7_bit+0)
;Pebble_IO.c,147 :: 		Delay_Cyc_Long(1);
	MOV	#1, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;Pebble_IO.c,148 :: 		load_595=1;
	BSET	RB7_bit, BitPos(RB7_bit+0)
;Pebble_IO.c,149 :: 		}
L_end_cikis_port_coklayici:
	POP	W11
	POP	W10
	RETURN
; end of _cikis_port_coklayici

_clock_DINPUT:

;Pebble_IO.c,151 :: 		void clock_DINPUT()
;Pebble_IO.c,153 :: 		switch_shcp=1;
	PUSH	W10
	PUSH	W11
	BSET	RG6_bit, BitPos(RG6_bit+0)
;Pebble_IO.c,154 :: 		Delay_Cyc_Long(1);
	MOV	#1, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;Pebble_IO.c,155 :: 		switch_shcp=0;
	BCLR	RG6_bit, BitPos(RG6_bit+0)
;Pebble_IO.c,156 :: 		}
L_end_clock_DINPUT:
	POP	W11
	POP	W10
	RETURN
; end of _clock_DINPUT

_okuma_DINPUT:

;Pebble_IO.c,158 :: 		void okuma_DINPUT()
;Pebble_IO.c,161 :: 		switch_stcp=1;
	BSET	RE7_bit, BitPos(RE7_bit+0)
;Pebble_IO.c,163 :: 		mcu_dipswitch.B7=switchdata;
	MOV	#lo_addr(_mcu_dipswitch), W0
	BSET.B	[W0], #7
	BTSS	RE6_bit, BitPos(RE6_bit+0)
	BCLR.B	[W0], #7
;Pebble_IO.c,164 :: 		clock_DINPUT();
	CALL	_clock_DINPUT
;Pebble_IO.c,165 :: 		mcu_dipswitch.B6=switchdata;
	MOV	#lo_addr(_mcu_dipswitch), W0
	BSET.B	[W0], #6
	BTSS	RE6_bit, BitPos(RE6_bit+0)
	BCLR.B	[W0], #6
;Pebble_IO.c,166 :: 		clock_DINPUT();
	CALL	_clock_DINPUT
;Pebble_IO.c,167 :: 		mcu_dipswitch.B5=switchdata;
	MOV	#lo_addr(_mcu_dipswitch), W0
	BSET.B	[W0], #5
	BTSS	RE6_bit, BitPos(RE6_bit+0)
	BCLR.B	[W0], #5
;Pebble_IO.c,168 :: 		clock_DINPUT();
	CALL	_clock_DINPUT
;Pebble_IO.c,169 :: 		mcu_dipswitch.B4=switchdata;
	MOV	#lo_addr(_mcu_dipswitch), W0
	BSET.B	[W0], #4
	BTSS	RE6_bit, BitPos(RE6_bit+0)
	BCLR.B	[W0], #4
;Pebble_IO.c,170 :: 		clock_DINPUT();
	CALL	_clock_DINPUT
;Pebble_IO.c,171 :: 		mcu_dipswitch.B3=switchdata;
	MOV	#lo_addr(_mcu_dipswitch), W0
	BSET.B	[W0], #3
	BTSS	RE6_bit, BitPos(RE6_bit+0)
	BCLR.B	[W0], #3
;Pebble_IO.c,172 :: 		clock_DINPUT();
	CALL	_clock_DINPUT
;Pebble_IO.c,173 :: 		mcu_dipswitch.B2=switchdata;
	MOV	#lo_addr(_mcu_dipswitch), W0
	BSET.B	[W0], #2
	BTSS	RE6_bit, BitPos(RE6_bit+0)
	BCLR.B	[W0], #2
;Pebble_IO.c,174 :: 		clock_DINPUT();
	CALL	_clock_DINPUT
;Pebble_IO.c,175 :: 		mcu_dipswitch.B1=switchdata;
	MOV	#lo_addr(_mcu_dipswitch), W0
	BSET.B	[W0], #1
	BTSS	RE6_bit, BitPos(RE6_bit+0)
	BCLR.B	[W0], #1
;Pebble_IO.c,176 :: 		clock_DINPUT();
	CALL	_clock_DINPUT
;Pebble_IO.c,177 :: 		mcu_dipswitch.B0=switchdata;
	MOV	#lo_addr(_mcu_dipswitch), W0
	BSET.B	[W0], #0
	BTSS	RE6_bit, BitPos(RE6_bit+0)
	BCLR.B	[W0], #0
;Pebble_IO.c,178 :: 		clock_DINPUT();
	CALL	_clock_DINPUT
;Pebble_IO.c,180 :: 		switch_stcp=0;
	BCLR	RE7_bit, BitPos(RE7_bit+0)
;Pebble_IO.c,181 :: 		}
L_end_okuma_DINPUT:
	RETURN
; end of _okuma_DINPUT
