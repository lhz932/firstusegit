/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */
#include "stm8s_conf.h"
#include	"indicator_light.h"
volatile uint8_t Timebase_cnt=0;
uint8_t TCnt_10ms;

void 	GPIO_Config_SystemOn(void);
void 	CLK_Config(void);
void 	Timer_Config(void);
void TimeCounters_1ms(void);
void TimeCounters_10ms(void);

//this fucntion is called in ISR
void Tasks_1ms_TimeCritical(void)
{
	
}

void TimeCounters_1ms(void)
{
	if(Timebase_cnt>0)
	{
		Timebase_cnt--;
		TCnt_10ms++;
		
		//write your counters
		
		
	}
	
}

void TimeCounters_10ms(void)
{
	if(TCnt_10ms>9)
	{
		TCnt_10ms-=10;
		
		//write your counters
		Indcator_cnt++;
		
	}
	
}

main()
{
	GPIO_Config_SystemOn();
	CLK_Config();	//Configure the Fcpu to 8MHz,Fmaster=8MHz	
	Timer_Config();
	
	Indicator_Init();
	
	while (1)
	{
			TimeCounters_1ms();
			TimeCounters_10ms();
			
			Indicator_Running();
			
	}
}


void GPIO_Config_SystemOn(void)
{
	//Input pull-up, no external interrupt 
	GPIO_Init(GPIOA,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
	GPIO_Init(GPIOB,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
	GPIO_Init(GPIOC,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
	GPIO_Init(GPIOD,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);	
}
/*Configure the Fcpu to 8MHz,Fmaster=8Mhz*/
void CLK_Config(void)
{
  CLK_DeInit();  
  /* Configures the HSI and CPU clock dividers. */
	CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV2);
  //CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV2);    
}
void 	Timer_Config(void)
{
	/*Timer4 config*/	
	TIM4_TimeBaseInit(TIM4_PRESCALER_32,249);	//1ms---(x-1)*32=8000
	//Clear TIM4 update flag 
  TIM4_ClearFlag(TIM4_FLAG_UPDATE);
  //Enable update interrupt 
  TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);  
  //enable interrupts 
  enableInterrupts();
	//disableInterrupts();
  //Enable TIM4 
  TIM4_Cmd(ENABLE);
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
		//LED_Control_2();
  }
}
#endif