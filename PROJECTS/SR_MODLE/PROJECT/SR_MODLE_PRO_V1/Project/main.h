#ifndef	_MAIN_H_
#define	_MAIN_H_
#include	"stm8s.h"

extern volatile uint8_t Timebase_cnt;
extern volatile uint8_t Timer1_Period;
void Tasks_1ms_TimeCritical(void);

#endif