#include <stdbool.h>

void Timer1Interrupt();
void init_timer();
void rs485DataGonder();
void butonBilgi();
void rs485Init();
void joystick_init();
bool risingEdgeFnx(bool buttonInfo , bool *memBit);
