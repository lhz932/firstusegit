#ifndef _OTHERS_H_
#define	_OTHERS_H_
#include	"stm8s.h"
#include	"pt.h"

#define	V_KEY1	0X01	//key1µÄ¼üÖµ
#define	V_KEY2	0X02
#define	V_KEY3	0X03
#define	V_KEY_NONE	0XFF

extern uint8_t pt_KeyScan_cnt;

void Key_Init(void);
PT_THREAD(Key_Scan(uint8_t *Key_Val));

uint8_t xCal_crc(uint8_t *ptr,uint8_t len);
#endif
