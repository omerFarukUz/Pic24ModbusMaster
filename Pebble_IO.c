#include "Pebble_IO.h"

bit P1R17,P1R22,P1R33,P1R38,P1R43,P1R27,P1R56,P1R37,P1R50,P1R32,P1R24,P1R49,P1R19,P1R42,P1R28,P1R44,P1R23,P1R39,P1R18,P1R34,P1R55,P1R29;
bit P2C26R67,P2C25R66,P2C24R65,P2C23R64,P2C22R63,P2C21R62,P2C33R72,P2C34R73,P2C31R70,P2C32R71,P2C29R68,P2C30R69;
bit P3R25,P3R30,P3R26,P3R46,P3R40,P3R35,P3R31,P3R36,P3R41,P3R47,P3R57,P3R51,P3R4,P3R7,P3R1,P3R5,P3R8,P3R2,P3R6,P3R9;
unsigned int JOY1,JOY2,JOY3,JOY4,JOY5,JOY6,PILOKU;

extern sfr sbit PILOKU_dir;
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

unsigned char mcu_dipswitch=0;

extern sfr sbit switchdata_dir;
extern sfr sbit switch_stcp_dir;
extern sfr sbit switch_shcp_dir;
extern sfr sbit switchdata;
extern sfr sbit switch_stcp;
extern sfr sbit switch_shcp;

sbit fonksiyon at P1R28;
sbit isiklar at P1R23;
sbit onay at P1R18;
sbit manuel_kontrol at P1R55;
sbit bakim_modu at P1R49;

sbit sol_joy_yukari at P2C21R62;
sbit sol_joy_asagi at P2C22R63;
sbit sag_joy_yukari at P2C23R64;
sbit sag_joy_asagi at P2C24R65;


void clock165(void)
{
     clk_165=1;
     Delay_Cyc_Long(1);
     clk_165=0;
}

void giris_port_coklayici()
{
     clock165();                        // Boþ Pin
     clock165();                        // Boþ Pin
     P2C26R67=qdata_165;clock165();     // Joystick-3 Aþaðý Kurtulma
     P2C25R66=qdata_165;clock165();     // Joystick-3 Yukarý Kurtulma
     P2C24R65=qdata_165;clock165();     // Joystick-2 Aþaðý Kurtulma
     P2C23R64=qdata_165;clock165();     // Joystick-2 Yukarý Kurtulma
     P2C22R63=qdata_165;clock165();     // Joystick-1 Aþaðý Kurtulma
     P2C21R62=qdata_165;clock165();     // Joystick-1 Yukarý Kurtulma

     P3R25=qdata_165;clock165();        // Buton-1
     P3R30=qdata_165;clock165();        // Buton-2
     P2C33R72=qdata_165;clock165();     // Joystick-6 Yukarý Kurtulma
     P2C34R73=qdata_165;clock165();     // Joystick-6 Aþaðý Kurtulma
     P2C31R70=qdata_165;clock165();     // Joystick-5 Yukarý Kurtulma
     P2C32R71=qdata_165;clock165();     // Joystick-5 Aþaðý Kurtulma
     P2C29R68=qdata_165;clock165();     // Joystick-4 Yukarý Kurtulma
     P2C30R69=qdata_165;clock165();     // Joystick-4 Aþaðý Kurtulma

     P3R26=qdata_165;clock165();        // Buton-6
     P3R46=qdata_165;clock165();        // Buton-5
     P3R40=qdata_165;clock165();        // Buton-4
     P3R35=qdata_165;clock165();        // Buton-3
     P3R31=qdata_165;clock165();        // Buton-7
     P3R36=qdata_165;clock165();        // Buton-8
     P3R41=qdata_165;clock165();        // Buton-9
     P3R47=qdata_165;clock165();        // Buton-10

     P1R17=qdata_165;clock165();        // Toggle-1
     P1R22=qdata_165;clock165();        // Toggle-2
     P3R57=qdata_165;clock165();        // Toggle-24
     P3R51=qdata_165;clock165();        // Toggle-23
     P1R33=qdata_165;clock165();        // Toggle-12
     P1R38=qdata_165;clock165();        // Toggle-13
     P1R43=qdata_165;clock165();        // Toggle-14
     P1R27=qdata_165;clock165();        // Toggle-3

     P1R56=qdata_165;clock165();        // Toggle-16
     P1R37=qdata_165;clock165();        // Toggle-5
     P1R50=qdata_165;clock165();        // Toggle-15
     P1R32=qdata_165;clock165();        // Toggle-4
     P1R32=qdata_165;clock165();        // Toggle-18
     P1R49=qdata_165;clock165();        // Toggle-7
     P1R19=qdata_165;clock165();        // Toggle-17
     P1R42=qdata_165;clock165();        // Toggle-6

     P1R28=qdata_165;clock165();        // Toggle-11
     P1R44=qdata_165;clock165();        // Toggle-22
     P1R23=qdata_165;clock165();        // Toggle-10
     P1R39=qdata_165;clock165();        // Toggle-21
     P1R18=qdata_165;clock165();        // Toggle-9
     P1R34=qdata_165;clock165();        // Toggle-20
     P1R55=qdata_165;clock165();        // Toggle-8
     P1R29=qdata_165;clock165();        // Toggle-19


     load_165=0;
     Delay_Cyc_Long(1);
     load_165=1;
}

void clock595(void)
{
     clk_595=1;
     Delay_Cyc_Long(1);
     clk_595=0;
}


void cikis_port_coklayici()
{
     clock595();
     clock595();

     idata_595=P3R9;clock595();     // Led-4
     idata_595=P3R6;clock595();     // Led-3
     idata_595=P3R2;clock595();     // Led-2
     idata_595=P3R8;clock595();     // Led-1
     idata_595=P3R5;clock595();     // Batarya Led Kýrmýzý
     idata_595=P3R1;clock595();     // Batarya Led Yeþil
     idata_595=P3R7;clock595();     // Durum Led Kýrmýzý
     idata_595=P3R4;clock595();     // Durum Led Yeþil

     load_595=0;
     Delay_Cyc_Long(1);
     load_595=1;
}

void clock_DINPUT()
{
     switch_shcp=1;
     Delay_Cyc_Long(1);
     switch_shcp=0;
}

void okuma_DINPUT()
{
    //okuma sýrasý dsw 8-1.. din 8-1.. din 16-9..
    switch_stcp=1;

    mcu_dipswitch.B7=switchdata;
    clock_DINPUT();
    mcu_dipswitch.B6=switchdata;
    clock_DINPUT();
    mcu_dipswitch.B5=switchdata;
    clock_DINPUT();
    mcu_dipswitch.B4=switchdata;
    clock_DINPUT();
    mcu_dipswitch.B3=switchdata;
    clock_DINPUT();
    mcu_dipswitch.B2=switchdata;
    clock_DINPUT();
    mcu_dipswitch.B1=switchdata;
    clock_DINPUT();
    mcu_dipswitch.B0=switchdata;
    clock_DINPUT();

    switch_stcp=0;
}