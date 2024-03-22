#line 1 "C:/Users/omer/Desktop/modbusNewTry/rs485.c"
#line 1 "c:/users/omer/desktop/modbusnewtry/rs485.h"

void UART2TX(int length);
void fnxChecksum(unsigned char *input, int length,unsigned char *crcResult);
#line 3 "C:/Users/omer/Desktop/modbusNewTry/rs485.c"
unsigned char rs485_TX_DATA[255];
unsigned char rs485_RX_DATA[255];

sbit rs_485_RX_direction at TRISG9_bit;
sbit rs_485_rxtx_pin_direction at TRISG8_bit;
sbit rs_485_TX_direction at TRISG7_bit;
sbit rs_485_RX at RG9_bit;
sbit rs_485_rxtx_pin at LATG8_bit;
sbit rs_485_TX at LATG7_bit;

int j=0,d=0,e=0;
unsigned char crcResult[2];

void UART2TX(int length)
{
 rs_485_rxtx_pin=1;
 Delay_us(1);


 for(j=0 ; j<length ; j++)
 {
 UART2_Write(rs485_TX_DATA[j]);
 }

 Delay_ms(1);

 rs_485_rxtx_pin=0;
}

void fnxChecksum(unsigned char *input, int length,unsigned char *crcResult)
{
 unsigned int temp=0xFFFF;

 for(d=0;d<length;d++)
 {
 temp=input[d]^temp;

 for(e=0;e<8;e++)
 {
 if(temp&0x01)
 {
 temp=temp>>1;
 temp=temp^0xA001;
 }
 else
 {
 temp=temp>>1;
 }
 }
 }

 crcResult[1]=temp;
 crcResult[0]=temp>>8;
}
