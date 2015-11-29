#include "stm8s.h"

#define	INDICATOR_PORT	GPIOB
#define	INDICATOR_PIN		GPIO_PIN_5

uint8_t Indcator_cnt;

void Indicator_Init(void)
{
	GPIO_Init(INDICATOR_PORT,INDICATOR_PIN,GPIO_MODE_OUT_PP_HIGH_SLOW);
}

//ע��ɨ������
void Indicator_Running(void)
{
	static uint8_t status,cnt;
	if(Indcator_cnt>19){		
		Indcator_cnt=0;
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