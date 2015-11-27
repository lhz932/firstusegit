#include	"stm8s.h"
#include	"test.h"
#include	"font_lib.h"

#define	NOKIA5110_PORT	GPIOC
#define	NOKIA5110_RST		GPIO_PIN_7
#define	NOKIA5110_CE		GPIO_PIN_6
#define	NOKIA5110_DC		GPIO_PIN_5
#define	NOKIA5110_DIN		GPIO_PIN_4
#define	NOKIA5110_CLK		GPIO_PIN_3

#define	NOKIA5110_RST_HIGH()	(NOKIA5110_PORT->ODR |= NOKIA5110_RST)
#define	NOKIA5110_RST_LOW()		(NOKIA5110_PORT->ODR &=~NOKIA5110_RST)
#define	NOKIA5110_CE_HIGH()		(NOKIA5110_PORT->ODR |= NOKIA5110_CE)
#define	NOKIA5110_CE_LOW()		(NOKIA5110_PORT->ODR &=~NOKIA5110_CE)
#define	NOKIA5110_DC_HIGH()		(NOKIA5110_PORT->ODR |= NOKIA5110_DC)
#define	NOKIA5110_DC_LOW()		(NOKIA5110_PORT->ODR &=~NOKIA5110_DC)
#define	NOKIA5110_DIN_HIGH()	(NOKIA5110_PORT->ODR |= NOKIA5110_DIN)
#define	NOKIA5110_DIN_LOW()		(NOKIA5110_PORT->ODR &=~NOKIA5110_DIN)
#define	NOKIA5110_CLK_HIGH()	(NOKIA5110_PORT->ODR |= NOKIA5110_CLK)
#define	NOKIA5110_CLK_LOW()		(NOKIA5110_PORT->ODR &=~NOKIA5110_CLK)

//��ʾ������
static unsigned char @near lcd_buf[6][84];
//��λ���Σ�����Ӱ��
char const mask_low[8]={
//0			1			2			3			4			5			6			7
	0x00,	0x01,	0x03,	0x07,	0x0f,	0x1f,	0x3f,	0x7f	
};
//��λ���Σ�����Ӱ��
char const mask_high[8]={
//0			1			2			3			4			5			6			7
	0xfe,	0xfc,	0xf8,	0xf0,	0xe0,	0xc0,	0x80,	0x00
};

void Nokia5110_PortInit(void)
{
		GPIO_Init(NOKIA5110_PORT,NOKIA5110_RST,GPIO_MODE_OUT_PP_HIGH_SLOW);
		GPIO_Init(NOKIA5110_PORT,NOKIA5110_CE,GPIO_MODE_OUT_PP_HIGH_SLOW);
		GPIO_Init(NOKIA5110_PORT,NOKIA5110_DC,GPIO_MODE_OUT_PP_LOW_SLOW);
		GPIO_Init(NOKIA5110_PORT,NOKIA5110_DIN,GPIO_MODE_OUT_PP_LOW_SLOW);
		GPIO_Init(NOKIA5110_PORT,NOKIA5110_CLK,GPIO_MODE_OUT_PP_LOW_SLOW);
}
static void write_byte(unsigned char dat,unsigned char iscmd)
{
	unsigned char i;
	NOKIA5110_CE_LOW();	
	//ָ�����������
	if(iscmd==1)	NOKIA5110_DC_LOW(); 	//����
	else					NOKIA5110_DC_HIGH();	//����
	
	for(i=0;i<8;i++)
	{
		NOKIA5110_CLK_LOW();
		
		if(dat&0x80)	NOKIA5110_DIN_HIGH();
		else					NOKIA5110_DIN_LOW();			
		
		NOKIA5110_CLK_HIGH();
		dat<<=1;
	}
	NOKIA5110_CE_HIGH();
}
static void clear(void)
{
	unsigned int i;				
	write_byte(0X80,1);	//set X address
	write_byte(0X40,1);	//set Y address
	for(i=0;i<504;i++)
	{
		write_byte(0X00,0);
	}
}
void Nokia5110_Init(void)
{
	//uint8_t i;
	Nokia5110_PortInit();	//�˿ڳ�ʼ��
	//��λ����	
	//NOKIA5110_RST_HIGH();
	//delay_ms(20);
	NOKIA5110_RST_LOW();
	delay_ms(2);
	NOKIA5110_RST_HIGH();
	
	write_byte(0x21,1);	//PD-0:chip active; V-0:horizontal addressing;
											//H-1:use extended instruction set
	write_byte(0x90,1);	//write Vop to register.Vop=6.06+0.06*(0xc8&0x80)=
											//4.02
	//write_byte(0x06,1);	//set temperature coefficient
	//write_byte(0x13,1); //set bias system,1:48 
	write_byte(0x20,1);	//H-1:use basic instruction set
	write_byte(0X0C,1);	//set display configuratin,DE-10:normal mode
	
	clear();
	
	
	
	
	/* for test
	write_byte(0X8f,1);	//set X address
	write_byte(0X43,1);	//set Y address
	//write_byte(0XE1,0);
	//write_byte(0Xff,0);
	//write_byte(0X0f,0);	
	//lcd_buf[5][83]=0;	
	for(i=0;i<12;i++)
	{
		write_byte(FontLib[0][i],0);
	}
	write_byte(0X8f,1);	//set X address
	write_byte(0X44,1);	//set Y address
	for(i=0;i<12;i++)
	{
		write_byte(FontLib[1][i],0);
	}*/
	
}
/*
x: 0-83
y: 0-5

*/
static void set_adress(uint8_t x,uint8_t y)
{
	uint8_t m;
	assert_param(x<84);
	assert_param(y<6);
	m=x|0x80;
	write_byte(m,1);	//set X address
	m=y|0x40;
	write_byte(m,1);	//set Y address
}
void LCD_Reflash(void)
{
	uint8_t i,j;	
	write_byte(0X80,1);	//set X address
	write_byte(0X40,1);	//set Y address
	
	for(j=0;j<6;j++)
	{
		for(i=0;i<84;i++)
		{
			write_byte(lcd_buf[j][i],0);
		}
	}
}
/*
Row:	0-47
Column:	0-83
*/
static uint8_t print_oneChineseWord(uint8_t Row,uint8_t Column,uint8_t *pString)
{
	uint16_t  m16;
	uint8_t i,m8,onemorerow,shang_begin,shang_end,yushu_begin,yushu_end;
	uint8_t *p;
	
	i=0;
	while(*FontIndex[i]!=0)
	{
		if((*pString==*FontIndex[i])&&(*(pString+1)==*(FontIndex[i]+1)))																										//�ҵ��ֿ�����
		{
			//��Ӧ�ֿ��ַ&FontLib[i*2][0];
			i<<=1;	//i*2
			p=&FontLib[i][0];	
			
			//��ʾ������ͬʱ��ʾ			
			shang_begin=Row/8;
			yushu_begin=Row%8;
			shang_end=(Row+12-1)/8;
			yushu_end=(Row+12-1)%8;		
						
			if((shang_end-shang_begin)>1) onemorerow=1;
			else	onemorerow=0;
			
			set_adress(Column,shang_begin);
			for(i=0;i<12;i++){
				lcd_buf[shang_begin][i+Column]&=mask_low[yushu_begin];	//����
				m8=*(p+i)<<yushu_begin;
				lcd_buf[shang_begin][i+Column]|=m8;			
				
				write_byte(lcd_buf[shang_begin][i+Column],0);
			}	
			if(onemorerow)	//��ռһ��
			{	
				m8=shang_begin+1;
				set_adress(Column,m8);
				for(i=0;i<12;i++){
					lcd_buf[m8][i+Column]=0x00;	//����
					
					m16=*(p+i)+((uint16_t)(*(p+12+i))<<8);
					m16<<=yushu_begin;
					lcd_buf[m8][i+Column]|=(uint8_t)(m16>>8);
					
					write_byte(lcd_buf[m8][i+Column],0);					
				}
			}			
			set_adress(Column,shang_end);
			for(i=0;i<12;i++){
				lcd_buf[shang_end][i+Column]&=mask_high[yushu_end];	//����
				/*
				m32=*(p+i)+((uint32_t)(*(p+12+i))<<8);
				m32<<=yushu_begin;
				if(onemorerow)
					lcd_buf[shang_end][i+Column]|=(uint8_t)(m32>>16);
				else
					lcd_buf[shang_end][i+Column]|=(uint8_t)(m32>>8);
				*/
				if(onemorerow)
				{
					m16=(uint16_t)(*(p+12+i));					
				}else
				{
					m16=*(p+i)+((uint16_t)(*(p+12+i))<<8);					
				}
				m16<<=yushu_begin;
				lcd_buf[shang_end][i+Column]|=(uint8_t)(m16>>8);
				
				write_byte(lcd_buf[shang_end][i+Column],0);
			}	
			return 1;	//success
		}else
		{
			i++;			
		}
	}	
	//û�����ֿ����ҵ�Ҫ��ʾ����	
	return 0;	//failed
}
/*
Row:	0-47
Column:	0-83
*/
static uint8_t print_oneChar(uint8_t Row,uint8_t Column,uint8_t *pChar)
{	
	uint16_t  m16;
	uint8_t i,m8,onemorerow,shang_begin,shang_end,yushu_begin,yushu_end;
	uint8_t *p;
	
	i=0;
	while(CharIndex[i]!=0)
	{
		if(*pChar==CharIndex[i])																										//�ҵ��ֿ�����
		{
			//��Ӧ�ֿ��ַ&CharLib[i][0];			
			p=&CharLib[i][0];	
			
			//��ʾ������ͬʱ��ʾ			
			shang_begin=Row/8;
			yushu_begin=Row%8;
			shang_end=(Row+12-1)/8;
			yushu_end=(Row+12-1)%8;		
						
			if((shang_end-shang_begin)>1) onemorerow=1;
			else	onemorerow=0;
			
			set_adress(Column,shang_begin);
			for(i=0;i<6;i++){
				lcd_buf[shang_begin][i+Column]&=mask_low[yushu_begin];	//����
				m8=*(p+i)<<yushu_begin;
				lcd_buf[shang_begin][i+Column]|=m8;			
				
				write_byte(lcd_buf[shang_begin][i+Column],0);
			}	
			if(onemorerow)	//��ռһ��
			{	
				m8=shang_begin+1;
				set_adress(Column,m8);
				for(i=0;i<6;i++){
					lcd_buf[m8][i+Column]=0x00;	//����
					
					m16=*(p+i)+((uint16_t)(*(p+6+i))<<8);
					m16<<=yushu_begin;
					lcd_buf[m8][i+Column]|=(uint8_t)(m16>>8);
					
					write_byte(lcd_buf[m8][i+Column],0);					
				}
			}			
			set_adress(Column,shang_end);
			for(i=0;i<6;i++){
				lcd_buf[shang_end][i+Column]&=mask_high[yushu_end];	//����
				/*
				m32=*(p+i)+((uint32_t)(*(p+6+i))<<8);
				m32<<=yushu_begin;
				if(onemorerow)
					lcd_buf[shang_end][i+Column]|=(uint8_t)(m32>>16);
				else
					lcd_buf[shang_end][i+Column]|=(uint8_t)(m32>>8);
					*/
				if(onemorerow)
				{
					m16=(uint16_t)(*(p+6+i));					
				}else
				{
					m16=*(p+i)+((uint16_t)(*(p+6+i))<<8);					
				}
				m16<<=yushu_begin;
				lcd_buf[shang_end][i+Column]|=(uint8_t)(m16>>8);
				
				write_byte(lcd_buf[shang_end][i+Column],0);
			}	
			return 1;	//success
		}else
		{
			i++;			
		}
	}	
	return 0;	//failed
}

/*
return 	1:-success
				0:-failed
Row:	0-47
Column:	0-83
*/
uint8_t LCD_Print(uint8_t Row,uint8_t Column,uint8_t *pString)
{
	uint8_t r,c;
	uint8_t *p;
	
	assert_param(Row<48);
	assert_param(Column<84);
	
	r=Row;c=Column;
	p=pString;
	while(*p!='\0')
	{
		if(*p>0x80&&*p<0xff)		//����
		{
			if(c>=(84-12))	//����
			{
				if(r<(48-12))			r+=12; 	//����һ��
				else							r=0;		//��������
				
				c=0;											//��������
			}
			if(print_oneChineseWord(r,c,p)==0)
				print_oneChineseWord(r,c,Chinese_ndef);
			
			c+=12;
			p+=2;	//ÿ������ռ��2���ֽڿռ�
		}else if(*p<0x81)	//��ĸ
		{
			if(c>=(84-6))	//����
			{
				if(r<(48-12))			r+=12; 	//����һ��
				else							r=0;		//��������
				
				c=0;											//��������
			}
			if(print_oneChar(r,c,p)==0)
				print_oneChar(r,c,pChar_ndef);
			
			c+=6;
			p++;
		}else return 0;
	}
	return 1;
}


