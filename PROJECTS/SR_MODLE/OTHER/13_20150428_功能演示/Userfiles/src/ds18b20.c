#include	"stm8s.h"
#include	"test.h"
#include	"pt.h"
#define	DS18B20_PORT	GPIOD
#define	DS18B20_DATA	GPIO_PIN_4
#define	DS18B20_MODE_IN()	(DS18B20_PORT->DDR&=(uint8_t)(~DS18B20_DATA))	//Ĭ����������
#define	DS18B20_MODE_OUT()	(DS18B20_PORT->DDR|=DS18B20_DATA)	//Ĭ���������

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

//��λ����
//return 0:	success
//return 1:	failed
uint8_t Ds18b20_Reset(void)
{
	disableInterrupts();	//�����ж�
	DS18B20_MODE_OUT();		//�������
	GPIO_WriteLow(DS18B20_PORT,DS18B20_DATA);	//����͵�ƽ
	delay_10us(58);		//��ʱ����480us
	GPIO_WriteHigh(DS18B20_PORT,DS18B20_DATA);	//����ߵ�ƽ
	delay_10us(7);	//�ȴ���������
	DS18B20_MODE_IN();	//��������
	if(GPIO_ReadInputPin(DS18B20_PORT,DS18B20_DATA))	//û�д�������
	{
		delay_10us(7);	//�ٵȴ�һ��ʱ��
		if(GPIO_ReadInputPin(DS18B20_PORT,DS18B20_DATA))	//û�д�������
		{
			enableInterrupts();
			return 1;
		}			
		else	
		{
			delay_10us(58-7-7);
			GPIO_WriteHigh(DS18B20_PORT,DS18B20_DATA);	//����ߵ�ƽ
			DS18B20_MODE_OUT();		//�������
			enableInterrupts();
			return 0;
		}
		
	}else	
	{	
		delay_10us(51);
		GPIO_WriteHigh(DS18B20_PORT,DS18B20_DATA);	//����ߵ�ƽ
		DS18B20_MODE_OUT();		//�������
		enableInterrupts();		
		return 0;
	}	
}

void Ds18b20_MasterWrite_0(void)
{
	disableInterrupts();	//�����ж�
	GPIO_WriteLow(DS18B20_PORT,DS18B20_DATA);	//����͵�ƽ
	delay_10us(7);
	GPIO_WriteHigh(DS18B20_PORT,DS18B20_DATA);	//����ߵ�ƽ
	enableInterrupts();	
}
void Ds18b20_MasterWrite_1(void)
{
	uint8_t i;
	disableInterrupts();	//�����ж�
	GPIO_WriteLow(DS18B20_PORT,DS18B20_DATA);	//����͵�ƽ
	//delay_10us(1);
	for(i=0;i<8;i++);	//��ʱ����1us
	GPIO_WriteHigh(DS18B20_PORT,DS18B20_DATA);	//����ߵ�ƽ
	enableInterrupts();
	delay_10us(6);
}
//return ���
uint8_t Ds18b20_MasterRead(void)
{
	uint8_t i;
	disableInterrupts();	//�����ж�
	GPIO_WriteLow(DS18B20_PORT,DS18B20_DATA);	//����͵�ƽ
	//delay_10us(1);
	for(i=0;i<8;i++);	//��ʱ����1us
	GPIO_WriteHigh(DS18B20_PORT,DS18B20_DATA);	//����ߵ�ƽ	
	for(i=0;i<3;i++);
	DS18B20_MODE_IN();	//����Ϊ����	
	if(GPIO_ReadInputPin(DS18B20_PORT,DS18B20_DATA))
	{
		enableInterrupts();		
		DS18B20_MODE_OUT();		//�������
		delay_10us(6);		
		return 1;
	}else
	{
		enableInterrupts();		
		DS18B20_MODE_OUT();		//�������
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
	Ds18b20_MasterWriteOneByte(SKIP_ROM);	//����SKIP ROM ����
	Ds18b20_MasterWriteOneByte(CONVERT_T);	//�¶�ת������
	DS18B20_MODE_OUT();		//�������
	delay_ms(250);
	delay_ms(250);
	delay_ms(250);
	delay_ms(250);
	Ds18b20_Reset();
	Ds18b20_MasterWriteOneByte(SKIP_ROM);	//����SKIP ROM ����
	Ds18b20_MasterWriteOneByte(READ_SCRATCHPAD);
	m16=Ds18b20_MasterReadOneByte();
	t=Ds18b20_MasterReadOneByte();
	t<<=8;
	m16|=t;
	return m16;	
}*/

/*
*˵�������������DS18B20������������Ϊ����ֵ���ء�

*/
uint8_t ROM_Buf[8][8];	//�����8��ROM	
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
		//ROM_Mark[i]=0xff;	//Ĭ�ϳ�ʼΪÿλ���г�ͻ����ÿλ�������
		ROM_Mark[i]=0;
	}
	
	//check ROM ,the first loop
	m8=0;
	Ds18b20_Reset();
	Ds18b20_MasterWriteOneByte(SEARCH_ROM);	//����SEARCH_ROM ����	
	
	for(j=0;j<64;j++){
		m8=Ds18b20_MasterRead();	//��1bit ԭ��
		m8<<=1;
		m8|=Ds18b20_MasterRead();	//��1bit ����
		
		zheng=(uint8_t)(j/8);
		yu=(uint8_t)(j%8);
		switch(m8){	//���������ж��18B20����
			case	0:	Ds18b20_MasterWrite_0();	
								ROM_Temp[zheng]&=(uint8_t)(~(1<<yu));	//��¼��λ��ֵ
								ROM_Mark[zheng]|=(uint8_t)(1<<yu);		//��λ�����߳�ͻ�����ñ��
								break;
								//��λΪ0
			case	1:	Ds18b20_MasterWrite_0();	
								ROM_Temp[zheng]&=(uint8_t)(~(1<<yu));	//��¼��λ��ֵ								
								break;
								//��λΪ1
			case	2:	Ds18b20_MasterWrite_1();	
								ROM_Temp[zheng]|=(uint8_t)((1<<yu));	//��¼��λ��ֵ								
								break;
			case	3:	//������û��18B20����
								return 0;
			default:	break;
		}
	}		
	//��һ��ɨ�����
	for(i=0;i<8;i++){
		ROM_Buf[0][i]=ROM_Temp[i];	//��������ĵ�һ��ROMֵ
	}
	
	
		for(k=1;k<8;k++){
		
			m8=0;	//�����û��δʶ���ROM
			for(i=8;i>0;i--){
				if(ROM_Mark[i-1]){	//����δʶ���ROM,ʶ���ͻλ��λ�ã����λΪ1��λ�ã�
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
					if(i==1){		//��ȫ��ʶ��
						return k;
					}
				}
			}
			
			if(m8){	//��δʶ���ROM	
				Ds18b20_Reset();
				Ds18b20_MasterWriteOneByte(SEARCH_ROM);	//����SEARCH_ROM ����
				
				m8=(uint8_t)((zheng<<3)+yu);	//�����ͻλ
				ROM_Mark[zheng]&=(uint8_t)(~(1<<yu));		//�����λ���߱��
				if(m8){
					//��ͻλ֮ǰ���ϴ�ROM��ͬ
					for(j=0;j<m8;j++){
						zheng=(uint8_t)(j/8);
						yu=(uint8_t)(j%8);
						Ds18b20_MasterRead();	//��1bit ԭ��
						Ds18b20_MasterRead();	//��1bit ����
						if(ROM_Temp[zheng]&(1<<yu)){
							Ds18b20_MasterWrite_1();
						}else{
							Ds18b20_MasterWrite_0();
						}
					}
					Ds18b20_MasterRead();	//��1bit ԭ��
					Ds18b20_MasterRead();	//��1bit ����
					Ds18b20_MasterWrite_1();//��ͻλ����1			
					zheng=(uint8_t)(m8/8);
					yu=(uint8_t)(m8%8);
					ROM_Temp[zheng]|=(uint8_t)(1<<yu);	//��¼��λ��ֵ	
					
					for(j=(uint8_t)(m8+1);j<64;j++){
						zheng=(uint8_t)(j/8);
						yu=(uint8_t)(j%8);
						m81=Ds18b20_MasterRead();//��1bit ԭ��
						if(m81){	
							ROM_Temp[zheng]|=(uint8_t)(1<<yu);	//��¼��λ��ֵ	
						}else{
							ROM_Temp[zheng]&=(uint8_t)(~(1<<yu));	//��¼��λ��ֵ
						}
						Ds18b20_MasterRead();	//��1bit ����
						if(m81){
							Ds18b20_MasterWrite_1();
						}else{
							Ds18b20_MasterWrite_0();
						}				
					}		
				}else{
					ROM_Temp[7]|=0x80;	//���λ��1
				}
				for(j=0;j<8;j++){
				ROM_Buf[k][j]=ROM_Temp[j];	//���������R OMֵ
				}					
		}
	}
	return 0;	
}


