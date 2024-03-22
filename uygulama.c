#include <stdint.h>
#include "uygulama.h"
#include "rs485.h"
#include "Pebble_IO.h"

//RS485 hatti pinleri ve degiskenleri
extern sfr sbit rs_485_RX_direction;
extern sfr sbit rs_485_rxtx_pin_direction;
extern sfr sbit rs_485_TX_direction;
extern sfr sbit rs_485_rxtx_pin;

extern unsigned char rs485_TX_DATA[64];
extern unsigned char rs485_RX_DATA[64];
unsigned char msgToSend[] = { 0x27 , 0x28 , 0x29 , 0x30 };
uint8_t outputSet = 0;
bool trig[1];

//Joystick pinleri
extern sfr sbit J29R29_dir;
extern sfr sbit J29R30_dir;
extern sfr sbit JOY1_dir;
extern sfr sbit JOY2_dir;
extern sfr sbit JOY3_dir;
extern sfr sbit JOY4_dir;
extern sfr sbit JOY5_dir;
extern sfr sbit JOY6_dir;


//////////*HC5165*//////////////
extern sfr sbit load_165_dir ;
extern sfr sbit qdata_165_dir;
extern sfr sbit clk_165_dir;
extern sfr sbit load_165 ;
extern sfr sbit qdata_165;
extern sfr sbit clk_165;

//////////*HC595*//////////////
extern sfr sbit load_595_dir ;
extern sfr sbit idata_595_dir;
extern sfr sbit clk_595_dir;
extern sfr sbit load_595 ;
extern sfr sbit idata_595;
extern sfr sbit clk_595;

/////////DIPSWITCH///////////
extern sfr sbit switchdata_dir;
extern sfr sbit switch_stcp_dir;
extern sfr sbit switch_shcp_dir;
extern sfr sbit switchdata;
extern sfr sbit switch_stcp;
extern sfr sbit switch_shcp;


int j1_analog = 0 , j2_analog = 0 , j3_analog = 0 , j4_analog = 0 , j5_analog = 0;


//Acil stop, buton, toggle ve joystick datalari
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
  T1CON     = 0x8020;
  T1IE_bit  = 1;
  T1IF_bit  = 0;
  IPC0      = IPC0 | 0x1000;
  PR1       = 25000;
}

void joystick_init()
{

     ////// Analog Pin Configurate

     AD1PCFGL=0b0100011111100011; //ANALOG PINLER 0-1-2-4-5-11-12-13-14

     cm1con.f15=0;                //comparator1 kapalý
     cm2con.f15=0;                //comparator2 kapalý
     cm3con.f15=0;                //comparator3 kapalý

     ADC1_Init();

     JOY1_dir=1;                  //J37
     JOY2_dir=1;                  //J39
     JOY3_dir =1;                 //J41
     JOY4_dir =1;                 //J43
     JOY5_dir =1;                 //J45
     JOY6_dir =1;                 //J47
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

     /////// RS485 Pin Configurate
     oscconbits.IOLOCK=0; //unlock
     RPINR19bits.U2RXR=27; //uart2 I RP27
     RPOR13bits.RP26R=5;   //uart2 O RP26
     UART2_Init(19200);    //uart baud rate ayarlandi gercekte 19200
     
    // U2BRG=12;


     UART_Set_Active(&UART2_Read, &UART2_Write, &UART2_Data_Ready, &UART2_Tx_Idle);

     U2STAbits.UTXEN = 1;   //enable transmission
     IFS1bits.U2RXIF = 0;
     IEC1bits.U2RXIE = 1;   //enable U1RX interrupt

     rs_485_rxtx_pin=0;
}

void butonBilgi()
{
     giris_port_coklayici();
     giris_port_coklayici();
     
      j1_analog = abs(1014-ADC1_Get_Sample(3));  //Analog-3
      j2_analog = abs(1014-ADC1_Get_Sample(15)); //Analog-15
      j3_analog = abs(1014-ADC1_Get_Sample(4));  //Analog-4
      j4_analog = abs(1014-ADC1_Get_Sample(2));  //Analog-2
      j5_analog = abs(1014-ADC1_Get_Sample(11));  //Analog-11
      
       if(j1_analog>=650) outputSet = 1;
       else outputSet = 0;
       

     if(buton_acil_stop==0)
     {
         gonderilen_acil_stop=0x01;   //0x31
     }
     else
     {
         gonderilen_acil_stop=0x00;  //0x30
     }
}

void rs485DataGonder()
{
        rs485_TX_DATA[0] = 0x01;                   // Slave Address
        rs485_TX_DATA[1] = 0x06;                   // Function Code
        rs485_TX_DATA[2] = (uint8_t)(msgToSend[0]);
        rs485_TX_DATA[3] = (uint8_t)(msgToSend[1]);
        rs485_TX_DATA[4] = (uint8_t)(msgToSend[2]);
        rs485_TX_DATA[5] = (uint8_t)(msgToSend[3]);

        fnxChecksum(rs485_TX_DATA,6,crcResult);
        rs485_TX_DATA[6] = crcResult[0];            // 2 bytes of CRC
        rs485_TX_DATA[7] = crcResult[1];

       if(risingEdgeFnx(outputSet , &trig[0])) UART2TX(8);

        
}

bool risingEdgeFnx(bool buttonInfo , bool *memBit)
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


