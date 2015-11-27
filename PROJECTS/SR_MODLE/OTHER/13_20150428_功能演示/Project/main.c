#include	"stm8s.h"
#include	"main.h"
#include	"test.h"
#include	"nokia5110.h"
#include	"font_lib.h"
#include	"ds18b20.h"
#include	"others.h"


volatile uint8_t 	Task_1ms_NotCritical_cnt;
volatile uint8_t 	Task_10ms_NotCritical_cnt;

void 	GPIO_Config_SystemOn(void);
void 	CLK_Config(void);
void 	Timer_Config(void);
void 	Task_1ms_NotCritical(void);
void 	Task_10ms_NotCritical(void);
void Main_Control_Logic(void);
PT_THREAD(MCL_Add(void));

uint8_t @near Mode=MODE_DONOTHING;	//����ģʽ
uint8_t @near KeyVal=V_KEY_NONE;	//������ֵ
struct pt @near pt_MCL_Add;
uint8_t @near pt_MCL_Add_cnt;
Sensor_Typedef @near Sensors;
SensorConfig_Typedef	@near SensorConfigData;


/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
int main(void)
{
	uint8_t m8;
	uint16_t m16;
	
	
	GPIO_Config_SystemOn();
	CLK_Config();	//Configure the Fcpu to 1MHz,Fmaster=2MHz	
	Timer_Config();
	/* Define FLASH programming time */
  FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);

	
	LED_Init();			
	Key_Init();
	Nokia5110_Init();	
	Ds18b20_Init();	
	
	PT_INIT(&pt_MCL_Add);
	
	//logo1
	LCD_Print(2,12*2,"ж����");
	LCD_Print(16+2,12*1,"��Ƶ���¶�");
	LCD_Print(32+2,6*3,"���ϵͳ");			
	delay_nx100ms(10);
	//logo2
	LCD_Clear();
	LCD_Print(2,12*1,"���ݸ���ɳ");
	LCD_Print(16+2,6*1,"�������޹�˾");
	LCD_Print(32+2,9,"���� �����");		
	delay_nx100ms(10);
	
	LCD_Clear();
//	m8=Check_ValidConfiguredSensor();	
	Check_Sensor();
	if(Sensors.Valid_Configured_Num==0){	//δ���ô�����
		LCD_Print(12*1,0,"û�����ô�����");
		LCD_Print(12*3,30,"ȷ��");		
		Mode=MODE_PREPROCESSING;		
		//delay_nx100ms(30);		
	}else{
		Mode=MODE_NORMAL;
	}
	while (1)
	{
		//LED_Control();
		Task_1ms_NotCritical();
		Task_10ms_NotCritical();
		
		Key_Scan(&KeyVal);
		
		Main_Control_Logic();		
		MCL_Add();
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
{	/*
  CLK_DeInit();  
  // Configures the HSI and CPU clock dividers. 
	CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV2);
  //CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV2);    
	*/
	
	CLK->CKDIVR=0x08;
	
}
void Timer_Config(void)
{
	/*
	//TIM4 config
	TIM4_TimeBaseInit(TIM4_PRESCALER_32,249);	//1ms---(x-1)*32=8000
	//Clear TIM4 update flag 
  TIM4_ClearFlag(TIM4_FLAG_UPDATE);
  //Enable update interrupt 
  TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);  
  //enable interrupts 
  enableInterrupts();
	//disableInterrupts();
  //Enable TIM4 
  TIM4_Cmd(ENABLE);*/	
	//...................
	TIM4->PSCR=((uint8_t)0x05);//TIM4_PRESCALER_32
	TIM4->ARR=249;
	TIM4->SR1=(uint8_t)(~0x01);
	TIM4->IER |= (uint8_t)0x01;// Enable the Interrupt sources 
	enableInterrupts();
	TIM4->CR1 |= TIM4_CR1_CEN;// set the CEN Bit 	
	TIM4->SR1 = (uint8_t)(~0x01);/* Clear the IT pending Bit */
	//...................
}

void 	Task_1ms_NotCritical(void)
{
	if(Task_1ms_NotCritical_cnt)
	{
		Task_1ms_NotCritical_cnt--;
		
		/***********write your app************/
		pt_KeyScan_cnt++;
	}
}

void 	Task_10ms_NotCritical(void)
{
	if(Task_10ms_NotCritical_cnt>9)
	{
		Task_10ms_NotCritical_cnt-=10;
		
		/***********write your app************/
		pt_MCL_Add_cnt++;
		
	}
}
/*
//��������ϵ���Ч������
//������Ч���������
uint8_t Check_ValidSensor(void)
{
	uint8_t m8,i,reval=0;
	m8=Ds18b20_SearchROM();
	for(i=0;i<m8;i++){
		if(xCal_crc(&ROM_Buf[i][0],7)==ROM_Buf[i][7]){
			reval|=1<<i;
		}		
	}
	return reval;
}

//����������Ѿ����ù���(�Ѿ�ʹ�ù���)������
//������Ч���������
uint8_t Check_ValidConfiguredSensor(void)
{
	uint8_t m8,m81,;
	m8=Check_ValidSensor();	
	m81=FLASH_ReadByte(EEPROM_ROMMASK_ADDRESS);
	m8&=m81;
	return m8;
}*/

//��⴫����
void Check_Sensor(void)
{
	uint8_t m8,m80,i,j,r;
	
	j=r=0;
	m8=Ds18b20_SearchROM();
	for(i=0;i<m8;i++){
		if(xCal_crc(&ROM_Buf[i][0],7)==ROM_Buf[i][7]){
			r|=(uint8_t)(1<<i);
			j++;
		}		
	}
	Sensors.Valid_Mark=r;
	Sensors.Valid_Num=j;
	
	m8=FLASH_ReadByte(EEPROM_ROMMASK_ADDRESS);
	m80=m8;m8&=r;
	Sensors.Valid_Configured_Mark=m8;
	r&=(uint8_t)(~m80);
	Sensors.Valid_NotConfigured_Mark=r;
	for(i=0,j=0;i<8;i++){
		if(m8&0x01){
			j++;
		}
		m8>>=1;
	}
	Sensors.Valid_Configured_Num=j;
	Sensors.Valid_NotConfigured_Num=(uint8_t)(Sensors.Valid_Num-j);	
}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#define	FUNC_ADD	0X01
#define	FUNC_DEL	0X02
#define	FUNC_CHANGE	0X04
#define	FUNC_RESET	0X08
#define	FUNC_RETURN	0X10
#define	FUNC_LOGO		0X20

static uint8_t Sig_En=Sig_MainLogic_En;
static uint8_t Config_Func;

//���ù��
static void MCL_Mouse(uint8_t row,uint8_t column,uint8_t add_del)
{
	if(add_del){
		LCD_Print(row,column,">");
		LCD_Print(row,(uint8_t)(column+30),"<");
	}else{
		LCD_Print(row,column," ");
		LCD_Print(row,(uint8_t)(column+30)," ");
	}
}
//���
PT_THREAD(MCL_Add(void))
{	
	uint8_t i,j;
	static uint8_t @near cnt;
	static uint16_t @near	address; 
	static uint8_t*	@near pdata;
	PT_BEGIN(&pt_MCL_Add);
	PT_WAIT_UNTIL(&pt_MCL_Add,(Sig_En&Sig_Add_En));		//�ȴ������ź�
	KeyVal=V_KEY_NONE;	
	LCD_Clear();
	
	Check_Sensor();
	pt_MCL_Add_cnt=0;
	PT_WAIT_UNTIL(&pt_MCL_Add,pt_MCL_Add_cnt>5);	//�ȴ�50ms
	
	LCD_Print(0,12,"��⵽ ��");
	LCD_Print(12*1,12,"������");
	LCD_Print_0to9DecNum(0,12+12*3,Sensors.Valid_Num);
	LCD_Print(12*2,12," ��δ����");
	LCD_Print_0to9DecNum(12*2,12,Sensors.Valid_NotConfigured_Num);
	pt_MCL_Add_cnt=0;
	PT_WAIT_UNTIL(&pt_MCL_Add,pt_MCL_Add_cnt>200);	//�ȴ�1s
	pt_MCL_Add_cnt=0;
	PT_WAIT_UNTIL(&pt_MCL_Add,pt_MCL_Add_cnt>200);	//�ȴ�1s
	
	LCD_Clear();
	LCD_Print(0,12,"Ϊ����������");
	LCD_Print(12*1,12,"ID:");	
	
	for(i=0;i<8;i++){
		if(Sensors.Valid_NotConfigured_Mark&(1<<i)){
			break;
		}	
	}	//������i��ֵ�����i��ROM		
	LCD_Print_HexNum(12*2,6*1,ROM_Buf[i][6]);
	LCD_Print_HexNum(12*2,6*3,ROM_Buf[i][5]);
	LCD_Print_HexNum(12*2,6*5,ROM_Buf[i][4]);	
	LCD_Print_HexNum(12*2,6*7,ROM_Buf[i][3]);
	LCD_Print_HexNum(12*2,6*9,ROM_Buf[i][2]);
	LCD_Print_HexNum(12*2,6*11,ROM_Buf[i][1]);
	//��������
	for(j=0;j<8;j++){
		SensorConfigData.ROM_ID[j]=ROM_Buf[i][j];
	}
	
	pt_MCL_Add_cnt=0;
	PT_WAIT_UNTIL(&pt_MCL_Add,pt_MCL_Add_cnt>5);	//�ȴ�50ms	
	LCD_Print(12*3,6*2,"<        >");
	//��	С��	����	����	����
	//1			2			3			4			5	
	cnt=1;
	while(1){
		
		switch(cnt){
			case	0:	cnt=5;break;
			case	1:	//if(Sensors.Valid_NotConfigured_Mark&0x01)	{
									LCD_Print(12*3,6*5,"��");	break;
								//}
			case	2:	//if(Sensors.Valid_NotConfigured_Mark&0x02)	{
									LCD_Print(12*3,6*5,"С��");	break;
								//}
			case	3:	//if(Sensors.Valid_NotConfigured_Mark&0x04)	{
									LCD_Print(12*3,6*5,"����");	break;
								//}
			case	4:	//if(Sensors.Valid_NotConfigured_Mark&0x08)	{
									LCD_Print(12*3,6*5,"����");	break;
								//}									
			case	5:	//if(Sensors.Valid_NotConfigured_Mark&0x10)	{
									LCD_Print(12*3,6*5,"����");	break;
								//}
			case	6:	cnt=1;	break;		
			default	:	cnt=1;	break;
		}
		if(KeyVal==V_KEY1)	cnt--;
		if(KeyVal==V_KEY3)	cnt++;
		if(KeyVal==V_KEY2)	{KeyVal=V_KEY_NONE;	break;}
		KeyVal=V_KEY_NONE;	//�������
		pt_MCL_Add_cnt=0;
		PT_WAIT_UNTIL(&pt_MCL_Add,pt_MCL_Add_cnt>5);	//�ȴ�50ms		
	}
	//��������	
	SensorConfigData.Name_ID=cnt;
	//�����¶�����
	LCD_Clear();
	LCD_Print(12*1,6*1,"���ñ����¶�");
	LCD_Print(12*3,6*2,"-  30    +");
	LCD_Print(12*3,6*7,pSheshidu);	
	
	cnt=30;
	while(1){
		if(KeyVal==V_KEY1)	cnt--;
		if(KeyVal==V_KEY3)	cnt++;
		if(KeyVal==V_KEY2)	{KeyVal=V_KEY_NONE;	break;}
		
		if(cnt<20)	cnt=20;
		if(cnt>49)	cnt=49;
		if(cnt>=20&&cnt<30){
			LCD_Print_0to9DecNum(12*3,6*5,2);
			LCD_Print_0to9DecNum(12*3,6*6,(uint8_t)(cnt-20));			
		}
		if(cnt>=30&&cnt<40){
			LCD_Print_0to9DecNum(12*3,6*5,3);
			LCD_Print_0to9DecNum(12*3,6*6,(uint8_t)(cnt-30));
		}
		if(cnt>=40&&cnt<50){
			LCD_Print_0to9DecNum(12*3,6*5,4);
			LCD_Print_0to9DecNum(12*3,6*6,(uint8_t)(cnt-40));
		}
		
		KeyVal=V_KEY_NONE;	//�������
		pt_MCL_Add_cnt=0;
		PT_WAIT_UNTIL(&pt_MCL_Add,pt_MCL_Add_cnt>5);	//�ȴ�50ms
	}
	SensorConfigData.TH=cnt;
	
	LCD_Clear();
	LCD_Print(12*1,6*3,"��������");
	LCD_Print(12*2,6*4,"< �� >");
	LCD_Print(12*3,6*5,"ȷ�� �ı�");
	cnt=1;
	while(1){		
		if(KeyVal==V_KEY3)	{
			if(cnt){
				cnt=0;
			}else{
				cnt=1;
			}
		}
		if(KeyVal==V_KEY2)	{KeyVal=V_KEY_NONE;	break;}
		
		if(cnt)		LCD_Print(12*2,6*6,"��");
		else			LCD_Print(12*2,6*6,"��");
		
		KeyVal=V_KEY_NONE;	//�������
		pt_MCL_Add_cnt=0;
		PT_WAIT_UNTIL(&pt_MCL_Add,pt_MCL_Add_cnt>5);	//�ȴ�50ms
	}
	SensorConfigData.AlarmSet=cnt;
	
	LCD_Clear();
	LCD_Print(12*1,6*0,"����������...");
	
	//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	/*	Ϊ��ʾ��ʱ����
	//�������õ�EEPROM
	 //Unlock Data memory 
	FLASH_Unlock(FLASH_MEMTYPE_DATA);
	address=EEPROM_START_ADDRESS+(sizeof(SensorConfigData))*(SensorConfigData.Name_ID-1);
	pdata=&SensorConfigData.Name_ID;
	//FLASH_EraseByte(EEPROM_CHECK_ADDRESS);		//���У��λ
	for(cnt=0;cnt<sizeof(SensorConfigData);cnt++){	//����
		address++;
		FLASH_EraseByte(address);
		
		pt_MCL_Add_cnt=0;
		PT_WAIT_UNTIL(&pt_MCL_Add,pt_MCL_Add_cnt);	//�ȴ�10ms
		
		FLASH_ProgramByte(address,*(pdata+cnt));
		
		pt_MCL_Add_cnt=0;
		PT_WAIT_UNTIL(&pt_MCL_Add,pt_MCL_Add_cnt);	//�ȴ�10ms
	}	//������Ϣд�����
	cnt=FLASH_ReadByte(EEPROM_ROMMASK_ADDRESS);	//���������Ǽ���Ϣ
	cnt|=(uint8_t)(1<<(SensorConfigData.Name_ID-1));
	FLASH_EraseByte(EEPROM_ROMMASK_ADDRESS);		//���	
	pt_MCL_Add_cnt=0;
	PT_WAIT_UNTIL(&pt_MCL_Add,pt_MCL_Add_cnt);	//�ȴ�10ms
	FLASH_ProgramByte(EEPROM_ROMMASK_ADDRESS,cnt);//д���µĵǼ���Ϣ
	//pt_MCL_Add_cnt=0;
	//PT_WAIT_UNTIL(&pt_MCL_Add,pt_MCL_Add_cnt);	//�ȴ�10ms	
	//FLASH_ProgramByte(EEPROM_CHECK_ADDRESS,EEPROM_CHECK_CODE);	//д��У����	
	FLASH_Lock(FLASH_MEMTYPE_DATA);
	*/
	

	
	
	
	//...
	
	//while(1);

	Sig_En&=(uint8_t)(~Sig_Add_En);	//��ֹ�������ٴ�����
	Config_Func=FUNC_LOGO;	//���õ��ó���
	Sig_En|=Sig_MainLogic_En;	//�������ó���
	PT_END(&pt_MCL_Add);
}

void Main_Control_Logic(void)
{		
		static uint8_t @near flag;
		
		if((Sig_En&Sig_MainLogic_En)==0){
			return;			//���ӳ��������У���ֹ���³�������
		}
		switch(Mode){
			case	MODE_NORMAL:	
						if(KeyVal==V_KEY2){
							//KeyVal=V_KEY_NONE;
							Mode=MODE_PREPROCESSING;
						}
						break;
			case	MODE_CONFIG:						
						switch(Config_Func) {
							case	FUNC_ADD:	
									if((flag&0x02)==0){	//ִֻ��1��
										flag|=0x02;	
										MCL_Mouse(12*1,6*0,1);	//��ӡ������
									}
									if(KeyVal==V_KEY3){																
										Config_Func=FUNC_DEL;
										MCL_Mouse(12*1,6*0,0);		//�������Ĺ��	
										flag&=(uint8_t)(~0x02);	//�����ٴδ�ӡ���
									}else if(KeyVal==V_KEY1){																
													Config_Func=FUNC_RESET;		
													MCL_Mouse(12*1,6*0,0);		//�������Ĺ��	
													flag&=(uint8_t)(~0x02);	//�����ٴδ�ӡ���
									}else if(KeyVal==V_KEY2){																						
													Sig_En|=Sig_Add_En;		//����MCL_Add()
													Sig_En&=(uint8_t)(~Sig_MainLogic_En);	//���ñ�����
												///	MCL_Add();	!!!�˺����ǲ���ִ�к����������ٴε���																		}
												}
									KeyVal=V_KEY_NONE;
									break;
							case	FUNC_DEL:	
									MCL_Mouse(12*1,6*8,1);	//��ӡ������
									if(KeyVal==V_KEY3){																
										Config_Func=FUNC_CHANGE;				
										MCL_Mouse(12*1,6*8,0);		//�������Ĺ��	
									}else if(KeyVal==V_KEY1){																
										Config_Func=FUNC_ADD;					
										MCL_Mouse(12*1,6*8,0);		//�������Ĺ��	
									}else if(KeyVal==V_KEY2){
										//...
									}															
									KeyVal=V_KEY_NONE;
									break;
							case	FUNC_CHANGE:	
									MCL_Mouse(12*2,6*8,1);	//��ӡ������							
									if(KeyVal==V_KEY3){																
										Config_Func=FUNC_RETURN;
										MCL_Mouse(12*2,6*8,0);		//�������Ĺ��																			
									}else if(KeyVal==V_KEY1){																
										Config_Func=FUNC_DEL;		
										MCL_Mouse(12*2,6*8,0);		//�������Ĺ��																			
									}else if(KeyVal==V_KEY2){
										//...
									}															
									KeyVal=V_KEY_NONE;
									break;
							case	FUNC_RESET:		
									MCL_Mouse(12*2,6*0,1);	//��ӡ������
									if(KeyVal==V_KEY3){																
										Config_Func=FUNC_ADD;	
										MCL_Mouse(12*2,6*0,0);		//�������Ĺ��																			
									}else if(KeyVal==V_KEY1){																
										Config_Func=FUNC_RETURN;			
										MCL_Mouse(12*2,6*0,0);		//�������Ĺ��																		
									}else if(KeyVal==V_KEY2){
										KeyVal=V_KEY_NONE;
										FLASH_Unlock(FLASH_MEMTYPE_DATA);
										FLASH_EraseByte(EEPROM_ROMMASK_ADDRESS);		//���
										FLASH_Lock(FLASH_MEMTYPE_DATA);
										//...
									}															
									KeyVal=V_KEY_NONE;
									break;
							case	FUNC_RETURN:	
									MCL_Mouse(12*3,6*4,1);	//��ӡ������																	
									if(KeyVal==V_KEY3){																
										Config_Func=FUNC_RESET;	
										MCL_Mouse(12*3,6*4,0);		//�������Ĺ��																			
									}else if(KeyVal==V_KEY1){		
										Config_Func=FUNC_CHANGE;			
										MCL_Mouse(12*3,6*4,0);		//�������Ĺ��																			
									}else if(KeyVal==V_KEY2){
										flag=0;
										LCD_Clear();
										Mode=MODE_NORMAL;																	
									}															
									KeyVal=V_KEY_NONE;
									break;
							case	FUNC_LOGO:	
									LCD_Clear();
									LCD_Print(0,12,"����������");
									LCD_Print(12*1,6*1,"���");	LCD_Print(12*1,6*9,"ɾ��");
									LCD_Print(12*2,6*1,"����");	LCD_Print(12*2,6*9,"�༭");							
									LCD_Print(12*3,6*5,"����");
									
									flag&=(uint8_t)(~0x02);	//�����ٴδ�ӡ���
									Config_Func=FUNC_ADD;																
									break;
																	
							default : break;
						}
			
			break;
			case	MODE_PREPROCESSING:
						if(KeyVal==V_KEY2){
							KeyVal=V_KEY_NONE;
							Config_Func=FUNC_LOGO;		//�������ý�������ò���
							Mode=MODE_CONFIG;
						}
						
						break;
			case	MODE_DONOTHING:	break;
			default	:break;
			
		}		
}


//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
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
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<