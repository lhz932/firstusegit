#include	"pt.h"
#include	"stm8s.h"
#include	"others.h"

struct pt pt_KeyScan;
uint8_t pt_KeyScan_cnt;

#define	KEY_PORT			GPIOD
#define	KEY1_PIN			GPIO_PIN_5
#define	KEY2_PIN			GPIO_PIN_2
#define	KEY3_PIN			GPIO_PIN_3

#define	KEY_MASK		(KEY1_PIN|KEY2_PIN|KEY3_PIN)

void Key_Init(void)
{//Input pull-up, no external interrupt 
	GPIO_Init(KEY_PORT,KEY1_PIN|KEY2_PIN|KEY3_PIN,GPIO_MODE_IN_PU_NO_IT);	
	PT_INIT(&pt_KeyScan);	
}

PT_THREAD(Key_Scan(uint8_t *Key_Val))
{
	static uint8_t keyvalue;
	uint8_t m8;
	
	PT_BEGIN(&pt_KeyScan);
	
	m8=GPIO_ReadInputData(KEY_PORT);
	m8&=KEY_MASK;
	if(m8!=KEY_MASK){
		keyvalue=m8;		//保留原始键值
		
		pt_KeyScan_cnt=0;
		PT_WAIT_UNTIL(&pt_KeyScan,pt_KeyScan_cnt>9);
		
		m8=GPIO_ReadInputData(KEY_PORT);
		m8&=KEY_MASK;		
		if(m8==keyvalue){		//键有效按下，并非抖动	
			if((m8&KEY1_PIN)==0)	keyvalue=V_KEY1;
			if((m8&KEY2_PIN)==0)	keyvalue=V_KEY2;
			if((m8&KEY3_PIN)==0)	keyvalue=V_KEY3;	
			
			//等待按键抬起			
			LC_SET((&pt_KeyScan)->lc);				
			m8=GPIO_ReadInputData(KEY_PORT);
			m8&=KEY_MASK;				
			if(m8!=KEY_MASK){	//仍有按键按下
				return PT_WAITING;				
			}
			
			*Key_Val=keyvalue;							
		}
	}		
	
	PT_END(&pt_KeyScan);
}

uint8_t xCal_crc(uint8_t *ptr,uint8_t len)
{uint8_t crc;
 uint8_t i;
    crc = 0;
    while(len--)
    {
       crc ^= *ptr++;
       for(i = 0;i < 8;i++)
       {
           if(crc & 0x01)
           {
               crc = (uint8_t)((crc >> 1) ^ 0x8C);
           }else crc >>= 1;
       }
    }
    return crc;
}


