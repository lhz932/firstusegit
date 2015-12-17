/*
此文件包括红外通讯和NRF24L01通讯


接线图：
红外：		PC4
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

volatile uint8_t IR_time_cnt;	//用于从TIMER1获取时间

static void IR_Init(void){
	//PORT init
	GPIO_Init(IR_PORT,IR_PIN,GPIO_MODE_IN_PU_IT);	//带上拉输入，使用外中断
	
	disableInterrupts();
	EXTI_SetExtIntSensitivity(IR_EXTI_PORT,EXTI_SENSITIVITY_FALL_ONLY);	//只在下降沿触发;设置之前先禁用总中断
	enableInterrupts();	
	
	TIM1_ITConfig(TIM1_IT_UPDATE,ENABLE);	//利用TIMER1获取时间，重复计数器已在TIMER1初始化时设置为3，即更新中断
																				//频率为10KHZ
																				
	
}
static void NRF24L01_Init(void){
	
}

void Comm_Init(void)
{
		IR_Init();
		NRF24L01_Init();
}


