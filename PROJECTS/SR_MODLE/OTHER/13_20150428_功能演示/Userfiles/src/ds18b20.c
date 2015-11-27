#include	"stm8s.h"
#include	"test.h"
#include	"pt.h"
#define	DS18B20_PORT	GPIOD
#define	DS18B20_DATA	GPIO_PIN_4
#define	DS18B20_MODE_IN()	(DS18B20_PORT->DDR&=(uint8_t)(~DS18B20_DATA))	//默认上拉输入
#define	DS18B20_MODE_OUT()	(DS18B20_PORT->DDR|=DS18B20_DATA)	//默认推挽输出

//ROM FUNCTION COMMONDS
#define	READ_ROM	0X33
#define	MATCH_ROM	0X55
#define	SKIP_ROM	0XCC
#define	SEARCH_ROM	0XF0
#define	ALARM_SEARCH	0XEC

//MEMORY	COMMOND FUNCTIONS
#define	WRTIE_SCRATCHPAD	0X4E	
#define	READ_SCRATCHPAD		0XBE
#define	COPY_SCRATCHPAD		0X48
#define	CONVERT_T					0X44
#define	RECALL_E2					0XB8
#define	READ_POWER_SUPPLY	0XB4


void Ds18b20_Init(void)
{
	GPIO_Init(DS18B20_PORT,DS18B20_DATA,GPIO_MODE_IN_PU_NO_IT);	
}

//复位脉冲
//return 0:	success
//return 1:	failed
uint8_t Ds18b20_Reset(void)
{
	disableInterrupts();	//禁用中断
	DS18B20_MODE_OUT();		//推挽输出
	GPIO_WriteLow(DS18B20_PORT,DS18B20_DATA);	//输出低电平
	delay_10us(58);		//延时至少480us
	GPIO_WriteHigh(DS18B20_PORT,DS18B20_DATA);	//输出高电平
	delay_10us(7);	//等待存在脉冲
	DS18B20_MODE_IN();	//上拉输入
	if(GPIO_ReadInputPin(DS18B20_PORT,DS18B20_DATA))	//没有存在脉冲
	{
		delay_10us(7);	//再等待一段时间
		if(GPIO_ReadInputPin(DS18B20_PORT,DS18B20_DATA))	//没有存在脉冲
		{
			enableInterrupts();
			return 1;
		}			
		else	
		{
			delay_10us(58-7-7);
			GPIO_WriteHigh(DS18B20_PORT,DS18B20_DATA);	//输出高电平
			DS18B20_MODE_OUT();		//推挽输出
			enableInterrupts();
			return 0;
		}
		
	}else	
	{	
		delay_10us(51);
		GPIO_WriteHigh(DS18B20_PORT,DS18B20_DATA);	//输出高电平
		DS18B20_MODE_OUT();		//推挽输出
		enableInterrupts();		
		return 0;
	}	
}

void Ds18b20_MasterWrite_0(void)
{
	disableInterrupts();	//禁用中断
	GPIO_WriteLow(DS18B20_PORT,DS18B20_DATA);	//输出低电平
	delay_10us(7);
	GPIO_WriteHigh(DS18B20_PORT,DS18B20_DATA);	//输出高电平
	enableInterrupts();	
}
void Ds18b20_MasterWrite_1(void)
{
	uint8_t i;
	disableInterrupts();	//禁用中断
	GPIO_WriteLow(DS18B20_PORT,DS18B20_DATA);	//输出低电平
	//delay_10us(1);
	for(i=0;i<8;i++);	//延时至少1us
	GPIO_WriteHigh(DS18B20_PORT,DS18B20_DATA);	//输出高电平
	enableInterrupts();
	delay_10us(6);
}
//return 结果
uint8_t Ds18b20_MasterRead(void)
{
	uint8_t i;
	disableInterrupts();	//禁用中断
	GPIO_WriteLow(DS18B20_PORT,DS18B20_DATA);	//输出低电平
	//delay_10us(1);
	for(i=0;i<8;i++);	//延时至少1us
	GPIO_WriteHigh(DS18B20_PORT,DS18B20_DATA);	//输出高电平	
	for(i=0;i<3;i++);
	DS18B20_MODE_IN();	//设置为输入	
	if(GPIO_ReadInputPin(DS18B20_PORT,DS18B20_DATA))
	{
		enableInterrupts();		
		DS18B20_MODE_OUT();		//推挽输出
		delay_10us(6);		
		return 1;
	}else
	{
		enableInterrupts();		
		DS18B20_MODE_OUT();		//推挽输出
		delay_10us(6);		
		return 0;
	}	
}

void Ds18b20_MasterWriteOneByte(uint8_t data)
{
	uint8_t i;
	
	for(i=0;i<8;i++)
	{
		if(data&0x01)
			Ds18b20_MasterWrite_1();
		else
			Ds18b20_MasterWrite_0();			
		data>>=1;
	}
}

uint8_t Ds18b20_MasterReadOneByte(void)
{
	uint8_t i,m;
	m=0;
	for(i=0;i<8;i++)
	{		
			m>>=1;
			if(Ds18b20_MasterRead())
				m|=0x80;			
	}	
	return m;
}
//+++++++++++++++++++++++++++++++++++++++++++++++++


//+++++++++++++++++++++++++++++++++++++++++++++++++
/*
uint16_t Ds18b20_Demo(void)
{
	uint16_t m16,t;
	Ds18b20_Reset();
	Ds18b20_MasterWriteOneByte(SKIP_ROM);	//发送SKIP ROM 命令
	Ds18b20_MasterWriteOneByte(CONVERT_T);	//温度转换命令
	DS18B20_MODE_OUT();		//推挽输出
	delay_ms(250);
	delay_ms(250);
	delay_ms(250);
	delay_ms(250);
	Ds18b20_Reset();
	Ds18b20_MasterWriteOneByte(SKIP_ROM);	//发送SKIP ROM 命令
	Ds18b20_MasterWriteOneByte(READ_SCRATCHPAD);
	m16=Ds18b20_MasterReadOneByte();
	t=Ds18b20_MasterReadOneByte();
	t<<=8;
	m16|=t;
	return m16;	
}*/

/*
*说明：检测总线上DS18B20的数量，并作为返回值返回。

*/
uint8_t ROM_Buf[8][8];	//最多检测8个ROM	
uint8_t Ds18b20_SearchROM(void)
{
	uint8_t i,j,k,m8,m81,zheng,yu;
	uint8_t	ROM_Temp[8];	
	uint8_t ROM_Mark[8];
	//init
	
	for(i=0;i<8;i++)
	{
		for(j=0;j<8;j++)
		{
			ROM_Buf[i][j]=0;
		}
		//ROM_Mark[i]=0xff;	//默认初始为每位都有冲突，即每位都做标记
		ROM_Mark[i]=0;
	}
	
	//check ROM ,the first loop
	m8=0;
	Ds18b20_Reset();
	Ds18b20_MasterWriteOneByte(SEARCH_ROM);	//发送SEARCH_ROM 命令	
	
	for(j=0;j<64;j++){
		m8=Ds18b20_MasterRead();	//读1bit 原码
		m8<<=1;
		m8|=Ds18b20_MasterRead();	//读1bit 补码
		
		zheng=(uint8_t)(j/8);
		yu=(uint8_t)(j%8);
		switch(m8){	//总线上仍有多个18B20连接
			case	0:	Ds18b20_MasterWrite_0();	
								ROM_Temp[zheng]&=(uint8_t)(~(1<<yu));	//记录该位的值
								ROM_Mark[zheng]|=(uint8_t)(1<<yu);		//该位有总线冲突，做好标记
								break;
								//该位为0
			case	1:	Ds18b20_MasterWrite_0();	
								ROM_Temp[zheng]&=(uint8_t)(~(1<<yu));	//记录该位的值								
								break;
								//该位为1
			case	2:	Ds18b20_MasterWrite_1();	
								ROM_Temp[zheng]|=(uint8_t)((1<<yu));	//记录该位的值								
								break;
			case	3:	//总线上没有18B20连接
								return 0;
			default:	break;
		}
	}		
	//第一遍扫描结束
	for(i=0;i<8;i++){
		ROM_Buf[0][i]=ROM_Temp[i];	//保存读到的第一个ROM值
	}
	
	
		for(k=1;k<8;k++){
		
			m8=0;	//标记有没有未识别的ROM
			for(i=8;i>0;i--){
				if(ROM_Mark[i-1]){	//仍有未识别的ROM,识别冲突位的位置（最高位为1的位置）
					zheng=(uint8_t)(i-1);			
					m8=1;
					m81=ROM_Mark[i-1];
					for(j=0;j<8;j++){					
						if(m81&0x80){
							yu=(uint8_t)(7-j);
							break;
						}
						m81<<=1;
					}				
					break;
				}else{
					if(i==1){		//已全部识别
						return k;
					}
				}
			}
			
			if(m8){	//有未识别的ROM	
				Ds18b20_Reset();
				Ds18b20_MasterWriteOneByte(SEARCH_ROM);	//发送SEARCH_ROM 命令
				
				m8=(uint8_t)((zheng<<3)+yu);	//计算冲突位
				ROM_Mark[zheng]&=(uint8_t)(~(1<<yu));		//清除该位总线标记
				if(m8){
					//冲突位之前和上次ROM相同
					for(j=0;j<m8;j++){
						zheng=(uint8_t)(j/8);
						yu=(uint8_t)(j%8);
						Ds18b20_MasterRead();	//读1bit 原码
						Ds18b20_MasterRead();	//读1bit 补码
						if(ROM_Temp[zheng]&(1<<yu)){
							Ds18b20_MasterWrite_1();
						}else{
							Ds18b20_MasterWrite_0();
						}
					}
					Ds18b20_MasterRead();	//读1bit 原码
					Ds18b20_MasterRead();	//读1bit 补码
					Ds18b20_MasterWrite_1();//冲突位发送1			
					zheng=(uint8_t)(m8/8);
					yu=(uint8_t)(m8%8);
					ROM_Temp[zheng]|=(uint8_t)(1<<yu);	//记录该位的值	
					
					for(j=(uint8_t)(m8+1);j<64;j++){
						zheng=(uint8_t)(j/8);
						yu=(uint8_t)(j%8);
						m81=Ds18b20_MasterRead();//读1bit 原码
						if(m81){	
							ROM_Temp[zheng]|=(uint8_t)(1<<yu);	//记录该位的值	
						}else{
							ROM_Temp[zheng]&=(uint8_t)(~(1<<yu));	//记录该位的值
						}
						Ds18b20_MasterRead();	//读1bit 补码
						if(m81){
							Ds18b20_MasterWrite_1();
						}else{
							Ds18b20_MasterWrite_0();
						}				
					}		
				}else{
					ROM_Temp[7]|=0x80;	//最高位置1
				}
				for(j=0;j<8;j++){
				ROM_Buf[k][j]=ROM_Temp[j];	//保存读到的R OM值
				}					
		}
	}
	return 0;	
}


