#line 1 "C:/Users/omer/Desktop/modbusNewTry/Pebble_IO.c"
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
#line 3 "C:/Users/omer/Desktop/modbusNewTry/Pebble_IO.c"
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
 clock165();
 clock165();
 P2C26R67=qdata_165;clock165();
 P2C25R66=qdata_165;clock165();
 P2C24R65=qdata_165;clock165();
 P2C23R64=qdata_165;clock165();
 P2C22R63=qdata_165;clock165();
 P2C21R62=qdata_165;clock165();

 P3R25=qdata_165;clock165();
 P3R30=qdata_165;clock165();
 P2C33R72=qdata_165;clock165();
 P2C34R73=qdata_165;clock165();
 P2C31R70=qdata_165;clock165();
 P2C32R71=qdata_165;clock165();
 P2C29R68=qdata_165;clock165();
 P2C30R69=qdata_165;clock165();

 P3R26=qdata_165;clock165();
 P3R46=qdata_165;clock165();
 P3R40=qdata_165;clock165();
 P3R35=qdata_165;clock165();
 P3R31=qdata_165;clock165();
 P3R36=qdata_165;clock165();
 P3R41=qdata_165;clock165();
 P3R47=qdata_165;clock165();

 P1R17=qdata_165;clock165();
 P1R22=qdata_165;clock165();
 P3R57=qdata_165;clock165();
 P3R51=qdata_165;clock165();
 P1R33=qdata_165;clock165();
 P1R38=qdata_165;clock165();
 P1R43=qdata_165;clock165();
 P1R27=qdata_165;clock165();

 P1R56=qdata_165;clock165();
 P1R37=qdata_165;clock165();
 P1R50=qdata_165;clock165();
 P1R32=qdata_165;clock165();
 P1R32=qdata_165;clock165();
 P1R49=qdata_165;clock165();
 P1R19=qdata_165;clock165();
 P1R42=qdata_165;clock165();

 P1R28=qdata_165;clock165();
 P1R44=qdata_165;clock165();
 P1R23=qdata_165;clock165();
 P1R39=qdata_165;clock165();
 P1R18=qdata_165;clock165();
 P1R34=qdata_165;clock165();
 P1R55=qdata_165;clock165();
 P1R29=qdata_165;clock165();


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

 idata_595=P3R9;clock595();
 idata_595=P3R6;clock595();
 idata_595=P3R2;clock595();
 idata_595=P3R8;clock595();
 idata_595=P3R5;clock595();
 idata_595=P3R1;clock595();
 idata_595=P3R7;clock595();
 idata_595=P3R4;clock595();

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
