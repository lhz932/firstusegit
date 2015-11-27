#include	"stm8s.h"
#include	"main.h"
#include	"test.h"
#include	"nokia5110.h"
#include	"font_lib.h"

volatile uint8_t 	Task_1ms_NotCritical_cnt;
volatile uint8_t 	Task_10ms_NotCritical_cnt;

void 	GPIO_Config_SystemOn(void);
void 	CLK_Config(void);
void 	Timer_Config(void);
void 	Task_1ms_NotCritical(void);
void 	Task_10ms_NotCritical(void);
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
int main(void)
{
	GPIO_Config_SystemOn();
	CLK_Config();	//Configure the Fcpu to 1MHz,Fmaster=2MHz	
	Timer_Config();
	
	LED_Init();		
	
	Nokia5110_Init();
	
	
	LCD_Print(12*0,12*1,"新沙港务公司");
	LCD_Print(12*1,12*0,"作者:李宏洲");
	LCD_Print(12*2,12*1,"变频器温度");
	LCD_Print(12*3,12*5,pSheshidu);
	
	while (1)
	{
		//LED_Control();
		Task_1ms_NotCritical();
		Task_10ms_NotCritical();
	}
}
/*<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<*/


void GPIO_Config_SystemOn(void)
{
	//Input pull-up, no external interrupt 
	GPIO_Init(GPIOA,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
	GPIO_Init(GPIOB,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
	GPIO_Init(GPIOC,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
	GPIO_Init(GPIOD,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);	
}
/*Configure the Fcpu to 1MHz,Fmaster=2Mhz*/
void CLK_Config(void)
{
  CLK_DeInit();  
  /* Configures the HSI and CPU clock dividers. */
	CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV2);
  //CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV2);    
}
void Timer_Config(void)
{
	/*TIM4 config*/
	TIM4_TimeBaseInit(TIM4_PRESCALER_32,249);	//1ms---(x-1)*32=8000
	/* Clear TIM4 update flag */
  TIM4_ClearFlag(TIM4_FLAG_UPDATE);
  /* Enable update interrupt */
  TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);  
  /* enable interrupts */
  enableInterrupts();
	//disableInterrupts();
  /* Enable TIM4 */
  TIM4_Cmd(ENABLE);	
}

void 	Task_1ms_NotCritical(void)
{
	if(Task_1ms_NotCritical_cnt)
	{
		Task_1ms_NotCritical_cnt--;
		
		/***********write your app************/
		
	}
}

void 	Task_10ms_NotCritical(void)
{
	if(Task_10ms_NotCritical_cnt>9)
	{
		Task_10ms_NotCritical_cnt-=10;
		
		/***********write your app************/
		
	}
}


#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
		LED_Control_2();
  }
}
#endif
