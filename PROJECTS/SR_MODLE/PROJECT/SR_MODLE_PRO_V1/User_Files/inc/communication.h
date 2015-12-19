#ifndef	_COMMUNICATION_H_
#define	_COMMUNICATION_H_
//remote	controler key define||IR CODE
#define	IR_CH_N		0X5D				//0X00FFA25D
#define	IR_CH			0X9D				//0X00FF629D
#define	IR_CH_P		0X1D				//0X00FFE21D
#define	IR_PREV		0XDD				//0X00FF22DD
#define	IR_NEXT		0XFD				//0X00FF02FD
#define	IR_PLAY_PAUSE	0X3D		//0X00FFC23D
#define	IR_VOL_N	0X1F				//0X00FFE01F
#define	IR_VOL_P	0X57				//0X00FFA857	
#define	IR_EQ			0X6F				//0X00FF906F
#define	IR_0			0X97				//0X00FF6897
#define	IR_100_P	0X67				//0X00FF9867
#define	IR_200_P	0X4F				//0X00FFB04F
#define	IR_1			0XCF				//0X00FF30CF
#define	IR_2			0XE7				//0X00FF18E7
#define	IR_3			0X85				//0X00FF7A85
#define	IR_4			0XEF				//0X00FF10EF
#define	IR_5			0XC7				//0X00FF38C7
#define	IR_6			0XA5				//0X00FF5AA5
#define	IR_7			0XBD				//0X00FF42BD
#define	IR_8			0XB5				//0X00FF4AB5
#define	IR_9			0XAD				//0X00FF52AD

extern uint8_t IR_time_cnt;
extern uint32_t IR_Code;
extern uint8_t New_IR_Code_Flag;

void Comm_Init(void);
uint8_t IR_GetCode(uint8_t* ir_code);	//return:	0--success;	1--fail
#endif
