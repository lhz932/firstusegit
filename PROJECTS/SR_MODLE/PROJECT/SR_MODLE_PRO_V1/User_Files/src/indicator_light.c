#include "stm8s.h"

#define	INDICATOR_PORT	GPIOB
#define	INDICATOR_PIN		GPIO_PIN_5

void Indicator_Init(void)
{
	GPIO_Init(INDICATOR_PORT,INDICATOR_PIN,GPIO_MODE_OUT_PP_HIGH_SLOW);
}

//100msɨ������
void Indicator_Running(void)
{
	static uint8_t status,cnt;
	cnt++;
	if(cnt>1){
		cnt=0;
		if(status==0){
			GPIO_WriteLow(INDICATOR_PORT,INDICATOR_PIN);	//����
			status=1;
		}
		else{
			GPIO_WriteHigh(INDICATOR_PORT,INDICATOR_PIN);	//Ϩ��
			status=0;
		}
	}
}