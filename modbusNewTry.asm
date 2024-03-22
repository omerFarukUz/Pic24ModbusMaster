
_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68

;modbusNewTry.c,9 :: 		void main()
;modbusNewTry.c,12 :: 		rs485Init();
	CALL	_rs485Init
;modbusNewTry.c,13 :: 		giris_port_coklayici();   //Panel giris datalari icin entegre aktif edildi.
	CALL	_giris_port_coklayici
;modbusNewTry.c,14 :: 		cikis_port_coklayici();   //Panel cikis datalari icin entegre aktif edildi.
	CALL	_cikis_port_coklayici
;modbusNewTry.c,15 :: 		asm CLRWDT;
	CLRWDT
;modbusNewTry.c,16 :: 		Delay_ms(100);
	MOV	#3, W8
	MOV	#2261, W7
L_main0:
	DEC	W7
	BRA NZ	L_main0
	DEC	W8
	BRA NZ	L_main0
;modbusNewTry.c,17 :: 		joystick_init();
	CALL	_joystick_init
;modbusNewTry.c,19 :: 		while(1)
L_main2:
;modbusNewTry.c,21 :: 		asm CLRWDT;
	CLRWDT
;modbusNewTry.c,23 :: 		butonBilgi();
	CALL	_butonBilgi
;modbusNewTry.c,24 :: 		rs485DataGonder();   //Sorgu geldikce YIKK datalari yorumlanip ekrana aktariliyor.
	CALL	_rs485DataGonder
;modbusNewTry.c,27 :: 		}
	GOTO	L_main2
;modbusNewTry.c,28 :: 		}
L_end_main:
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
