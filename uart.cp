#line 1 "C:/Users/omer/Desktop/modbusNewTry/uart.c"
#line 1 "c:/users/omer/desktop/modbusnewtry/uart.h"

void UART1RXInterrupt();
#line 3 "C:/Users/omer/Desktop/modbusNewTry/uart.c"
char uart_RX_DATA[8];
char TX_DATA[] = {'t', '1', '.', 't', 'x', 't', '='};
char msg1[1] = {'\"'};
char msg2[1];

int uart_int=0;
char uart_temp;

void UART1RXInterrupt() iv IVT_ADDR_U1RXINTERRUPT
{
 if(UART1_Data_Ready())
 {
 uart_temp = UART1_Read();

 if(uart_temp==101 || uart_RX_DATA[0]==101)
 {
 uart_RX_DATA[uart_int] = uart_temp;
 uart_int++;
 }
 }

 if(uart_int==7)
 {
 uart_int=0;
 }

 IFS0bits.U1RXIF = 0;
}
