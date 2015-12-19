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
volatile	uint32_t IR_Code;	
volatile uint8_t New_IR_Code_Flag;

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

//return:	0--success;	1--fail
uint8_t IR_GetCode(uint8_t* ir_code)
{
	uint8_t a,b,c,d;
	
	if(New_IR_Code_Flag)
	{
		New_IR_Code_Flag=0;	//clear flag
		
		a=(uint8_t)(IR_Code>>24);
		b=(uint8_t)((IR_Code>>16)%256);
		c=(uint8_t)(IR_Code>>8);
		d=(uint8_t)IR_Code;
		
		if(((a^b)==0xff)&&((c^d)==0xff))	//data valid
		{
			*ir_code=d;			
			return 0;
		}		
	}
	*ir_code=0;
	return 1;		
}
