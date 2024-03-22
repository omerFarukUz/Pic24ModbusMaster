#include "Pebble_IO.h"
#include "uygulama.h"
#include "rs485.h"


extern sfr sbit rs_485_rxtx_pin;
extern unsigned char rs485_TX_DATA[64];

void main()
{

     rs485Init();
     giris_port_coklayici();   //Panel giris datalari icin entegre aktif edildi.
     cikis_port_coklayici();   //Panel cikis datalari icin entegre aktif edildi.
     asm CLRWDT;
     Delay_ms(100);
     joystick_init();

     while(1)
     {
        asm CLRWDT;

         butonBilgi();
         rs485DataGonder();   //Sorgu geldikce YIKK datalari yorumlanip ekrana aktariliyor.


     }
}