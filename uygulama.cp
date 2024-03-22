#line 1 "C:/Users/omer/Desktop/modbusNewTry/uygulama.c"
#line 1 "c:/users/omer/desktop/mikroc pro for dspic/include/stdint.h"




typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;



typedef signed int int_fast8_t;
typedef signed int int_fast16_t;
typedef signed long int int_fast32_t;


typedef unsigned int uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned long int uint_fast32_t;


typedef signed int intptr_t;
typedef unsigned int uintptr_t;


typedef signed long int intmax_t;
typedef unsigned long int uintmax_t;
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
#line 7 "C:/Users/omer/Desktop/modbusNewTry/uygulama.c"
extern sfr sbit rs_485_RX_direction;
extern sfr sbit rs_485_rxtx_pin_direction;
extern sfr sbit rs_485_TX_direction;
extern sfr sbit rs_485_rxtx_pin;

extern unsigned char rs485_TX_DATA[64];
extern unsigned char rs485_RX_DATA[64];
unsigned char msgToSend[] = { 0x27 , 0x28 , 0x29 , 0x30 };
uint8_t outputSet = 0;
 _Bool  trig[1];


extern sfr sbit J29R29_dir;
extern sfr sbit J29R30_dir;
extern sfr sbit JOY1_dir;
extern sfr sbit JOY2_dir;
extern sfr sbit JOY3_dir;
extern sfr sbit JOY4_dir;
extern sfr sbit JOY5_dir;
extern sfr sbit JOY6_dir;



extern sfr sbit load_165_dir ;
extern sfr sbit qdata_165_dir;
extern sfr sbit clk_165_dir;
extern sfr sbit load_165 ;
extern sfr sbit qdata_165;
extern sfr sbit clk_165;


extern sfr sbit load_595_dir ;
extern sfr sbit idata_595_dir;
extern sfr sbit clk_595_dir;
extern sfr sbit load_595 ;
extern sfr sbit idata_595;
extern sfr sbit clk_595;


extern sfr sbit switchdata_dir;
extern sfr sbit switch_stcp_dir;
extern sfr sbit switch_shcp_dir;
extern sfr sbit switchdata;
extern sfr sbit switch_stcp;
extern sfr sbit switch_shcp;


int j1_analog = 0 , j2_analog = 0 , j3_analog = 0 , j4_analog = 0 , j5_analog = 0;



extern sfr sbit buton_acil_stop;


extern unsigned char crcResult[2];

unsigned char gonderilen_acil_stop=0;

void Timer1Interrupt() iv IVT_ADDR_T1INTERRUPT
{
 if(IFS0bits.T1IF==1)
 {
 T1IF_bit=0;
 asm CLRWDT;
 }
}

void init_timer()
{
 T1CON = 0x8020;
 T1IE_bit = 1;
 T1IF_bit = 0;
 IPC0 = IPC0 | 0x1000;
 PR1 = 25000;
}

void joystick_init()
{



 AD1PCFGL=0b0100011111100011;

 cm1con.f15=0;
 cm2con.f15=0;
 cm3con.f15=0;

 ADC1_Init();

 JOY1_dir=1;
 JOY2_dir=1;
 JOY3_dir =1;
 JOY4_dir =1;
 JOY5_dir =1;
 JOY6_dir =1;
 J29R30_dir=1;
 J29R29_dir=1;
 idata_595_dir=0;
 load_595_dir=0;
 clk_595_dir=0;
 load_165_dir=0;
 clk_165_dir=0;
 qdata_165_dir=1;
 switchdata_dir=1;
 switch_stcp_dir=0;
 switch_shcp_dir=0;


}

void rs485Init()
{
 rs_485_RX_direction=1;
 rs_485_rxtx_pin_direction=0;
 rs_485_TX_direction=0;


 oscconbits.IOLOCK=0;
 RPINR19bits.U2RXR=27;
 RPOR13bits.RP26R=5;
 UART2_Init(19200);




 UART_Set_Active(&UART2_Read, &UART2_Write, &UART2_Data_Ready, &UART2_Tx_Idle);

 U2STAbits.UTXEN = 1;
 IFS1bits.U2RXIF = 0;
 IEC1bits.U2RXIE = 1;

 rs_485_rxtx_pin=0;
}

void butonBilgi()
{
 giris_port_coklayici();
 giris_port_coklayici();

 j1_analog = abs(1014-ADC1_Get_Sample(3));
 j2_analog = abs(1014-ADC1_Get_Sample(15));
 j3_analog = abs(1014-ADC1_Get_Sample(4));
 j4_analog = abs(1014-ADC1_Get_Sample(2));
 j5_analog = abs(1014-ADC1_Get_Sample(11));

 if(j1_analog>=650) outputSet = 1;
 else outputSet = 0;


 if(buton_acil_stop==0)
 {
 gonderilen_acil_stop=0x01;
 }
 else
 {
 gonderilen_acil_stop=0x00;
 }
}

void rs485DataGonder()
{
 rs485_TX_DATA[0] = 0x01;
 rs485_TX_DATA[1] = 0x06;
 rs485_TX_DATA[2] = (uint8_t)(msgToSend[0]);
 rs485_TX_DATA[3] = (uint8_t)(msgToSend[1]);
 rs485_TX_DATA[4] = (uint8_t)(msgToSend[2]);
 rs485_TX_DATA[5] = (uint8_t)(msgToSend[3]);

 fnxChecksum(rs485_TX_DATA,6,crcResult);
 rs485_TX_DATA[6] = crcResult[0];
 rs485_TX_DATA[7] = crcResult[1];

 if(risingEdgeFnx(outputSet , &trig[0])) UART2TX(8);


}

 _Bool  risingEdgeFnx( _Bool  buttonInfo ,  _Bool  *memBit)
{
 if((buttonInfo) && !(*memBit))
 {
 *memBit = 1;
 return 1;
 }
 else if(!(buttonInfo) && (*memBit))
 {
 *memBit = 0;
 return 0;
 }
 else return 0;
}
