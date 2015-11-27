#ifndef	_DS18B20_H_
#define	_DS18B20_H_
#include	"stm8s.h"
extern uint8_t ROM_Buf[8][8];

void Ds18b20_Init(void);
uint8_t Ds18b20_Reset(void);
//uint16_t Ds18b20_Demo(void);
uint8_t Ds18b20_SearchROM(void);
#endif
