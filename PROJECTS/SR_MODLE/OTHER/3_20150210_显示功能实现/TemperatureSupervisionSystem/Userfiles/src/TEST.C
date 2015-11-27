#include	"stm8s.h"
#define	LED_PORT	GPIOD
#define	LED_PIN		GPIO_PIN_3

void delay_10us(uint8_t n)
{
	uint8_t i;
	while(n--)
	{
		for(i=0;i<15;i++);
	}
}

void delay_ms(uint8_t n)
{
	uint8_t i;
	while(n--)
	{
		//for(i=0;i<250;i++);
		delay_10us(100);
	}
}

void LED_Init(void)
{
	GPIO_Init(LED_PORT,LED_PIN,GPIO_MODE_OUT_PP_HIGH_SLOW);
}
void LED_Control(void)
{
	GPIO_WriteHigh(LED_PORT,LED_PIN);
	delay_ms(200);
	GPIO_WriteLow(LED_PORT,LED_PIN);
	delay_ms(200);
}

void LED_Control_2(void)
{
	GPIO_WriteHigh(LED_PORT,LED_PIN);
	delay_ms(100);	
	GPIO_WriteLow(LED_PORT,LED_PIN);
	delay_ms(100);
}

void LED_On(void)
{
	GPIO_WriteLow(LED_PORT,LED_PIN);

}
void LED_Off(void)
{
	GPIO_WriteHigh(LED_PORT,LED_PIN);
}
