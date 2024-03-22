void cikis_port_coklayici();
void clock595(void);
void giris_port_coklayici();
void clock165(void);
void clock_DINPUT();
void okuma_DINPUT();

#define Lo(param) ((char *)&param)[0]
#define Hi(param) ((char *)&param)[1]
#define PASIF 0
#define ON 0                             // BUTONLARA AYT DYRENÇLER PULL-UP OLDU?UNDAN BUTONA BASILDI?INDA LOW'a GYDER ,NORMALDE HIGH
#define OFF 1                            // BU YÜZDEN ON=0 ve OFF=1 OLARAK TANIMLANMI?TIR


//////////DIGITAL INPUT//////////////
sbit load_165_dir  at TRISD5_BIT ;
sbit qdata_165_dir at TRISE1_BIT;
sbit clk_165_dir at TRISE0_BIT;
sbit load_165 at RD5_BIT;
sbit qdata_165 at RE1_BIT;
sbit clk_165 at RE0_BIT;

//////////DIGITAL OUTPUT//////////////
sbit load_595_dir at TRISB7_BIT ;
sbit idata_595_dir at TRISB8_BIT;
sbit clk_595_dir at TRISB6_BIT;
sbit load_595 at RB7_BIT;
sbit idata_595 at RB8_BIT;
sbit clk_595 at RB6_BIT;

///////////ACIL STOP PINLERY////////////
sbit J29R29_dir at TRISE5_BIT;
sbit J29R30_dir at TRISB14_BIT;
sbit buton_acil_stop at RE5_BIT;
sbit J29R30 at RB14_BIT;

/////////JOYYSTYK PINLERY///////////////
sbit JOY1_dir at TRISB1_BIT;
sbit JOY2_dir at TRISB0_BIT;
sbit JOY3_dir at TRISB4_BIT;
sbit JOY4_dir at TRISB2_BIT;
sbit JOY5_dir at TRISB11_BIT;
sbit JOY6_dir at TRISB12_BIT;

//////// PIL OKUMA ANALOG //////////////
sbit PILOKU_dir at TRISB13_BIT;

//////////MCU DYPSWYTCH PYNLERY////////
sbit switchdata_dir at TRISE6_BIT;
sbit switch_stcp_dir at TRISE7_BIT;
sbit switch_shcp_dir at TRISG6_BIT;
sbit switchdata at RE6_BIT;
sbit switch_stcp at RE7_BIT;
sbit switch_shcp at RG6_BIT;