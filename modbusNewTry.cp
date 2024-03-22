#line 1 "C:/Users/omer/Desktop/modbusNewTry/modbusNewTry.c"
#line 1 "c:/users/omer/desktop/modbusnewtry/pebble_io.h"
void cikis_port_coklayici();
void clock595(void);
void giris_port_coklayici();
void clock165(void);
void clock_DINPUT();
void okuma_DINPUT();









sbit load_165_dir at TRISD5_BIT ;
sbit qdata_165_dir at TRISE1_BIT;
sbit clk_165_dir at TRISE0_BIT;
sbit load_165 at RD5_BIT;
sbit qdata_165 at RE1_BIT;
sbit clk_165 at RE0_BIT;


sbit load_595_dir at TRISB7_BIT ;
sbit idata_595_dir at TRISB8_BIT;
sbit clk_595_dir at TRISB6_BIT;
sbit load_595 at RB7_BIT;
sbit idata_595 at RB8_BIT;
sbit clk_595 at RB6_BIT;


sbit J29R29_dir at TRISE5_BIT;
sbit J29R30_dir at TRISB14_BIT;
sbit buton_acil_stop at RE5_BIT;
sbit J29R30 at RB14_BIT;


sbit JOY1_dir at TRISB1_BIT;
sbit JOY2_dir at TRISB0_BIT;
sbit JOY3_dir at TRISB4_BIT;
sbit JOY4_dir at TRISB2_BIT;
sbit JOY5_dir at TRISB11_BIT;
sbit JOY6_dir at TRISB12_BIT;


sbit PILOKU_dir at TRISB13_BIT;


sbit switchdata_dir at TRISE6_BIT;
sbit switch_stcp_dir at TRISE7_BIT;
sbit switch_shcp_dir at TRISG6_BIT;
sbit switchdata at RE6_BIT;
sbit switch_stcp at RE7_BIT;
sbit switch_shcp at RG6_BIT;
#line 1 "c:/users/omer/desktop/modbusnewtry/uygulama.h"
#line 1 "c:/users/omer/desktop/mikroc pro for dspic/include/stdbool.h"



 typedef char _Bool;
#line 3 "c:/users/omer/desktop/modbusnewtry/uygulama.h"
void Timer1Interrupt();
void init_timer();
void rs485DataGonder();
void butonBilgi();
void rs485Init();
void joystick_init();
 _Bool  risingEdgeFnx( _Bool  buttonInfo ,  _Bool  *memBit);
#line 1 "c:/users/omer/desktop/modbusnewtry/rs485.h"

void UART2TX(int length);
void fnxChecksum(unsigned char *input, int length,unsigned char *crcResult);
#line 6 "C:/Users/omer/Desktop/modbusNewTry/modbusNewTry.c"
extern sfr sbit rs_485_rxtx_pin;
extern unsigned char rs485_TX_DATA[64];

void main()
{

 rs485Init();
 giris_port_coklayici();
 cikis_port_coklayici();
 asm CLRWDT;
 Delay_ms(100);
 joystick_init();

 while(1)
 {
 asm CLRWDT;

 butonBilgi();
 rs485DataGonder();


 }
}
