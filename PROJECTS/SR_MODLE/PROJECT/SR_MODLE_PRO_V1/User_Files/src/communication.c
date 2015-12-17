/*
���ļ���������ͨѶ��NRF24L01ͨѶ


����ͼ��
���⣺		PC4
NRF24L01:	{	
					PC5--SPI_SCK
					PC6--SPI_MOSI
					PC7--SPI_MISO
					PD2--CE
					PD3--CSN
					}

*/
#include	"stm8s.h"
#include	"stm8s_conf.h"

#define	IR_PORT	GPIOC
#define	IR_PIN	GPIO_PIN_4
#define	IR_EXTI_PORT	EXTI_PORT_GPIOC

volatile uint8_t IR_time_cnt;	//���ڴ�TIMER1��ȡʱ��

static void IR_Init(void){
	//PORT init
	GPIO_Init(IR_PORT,IR_PIN,GPIO_MODE_IN_PU_IT);	//���������룬ʹ�����ж�
	
	disableInterrupts();
	EXTI_SetExtIntSensitivity(IR_EXTI_PORT,EXTI_SENSITIVITY_FALL_ONLY);	//ֻ���½��ش���;����֮ǰ�Ƚ������ж�
	enableInterrupts();	
	
	TIM1_ITConfig(TIM1_IT_UPDATE,ENABLE);	//����TIMER1��ȡʱ�䣬�ظ�����������TIMER1��ʼ��ʱ����Ϊ3���������ж�
																				//Ƶ��Ϊ10KHZ
																				
	
}
static void NRF24L01_Init(void){
	
}

void Comm_Init(void)
{
		IR_Init();
		NRF24L01_Init();
}


