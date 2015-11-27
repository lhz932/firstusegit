#ifndef	_MAIN_H_
#define	_MAIN_H_

#define	EEPROM_START_ADDRESS	0X4000
#define	EEPROM_ROMMASK_ADDRESS	0X407F	//���ROM_Mask,һ���ֽ�
#define	EEPROM_CHECK_ADDRESS		0X407E	//���У��λ����������EEPROMд���Ƿ����
#define	EEPROM_CHECK_CODE				0x5A		//У����

#define	MODE_NORMAL	0X01
#define	MODE_CONFIG	0X02
#define	MODE_PREPROCESSING	0X11
#define	MODE_DONOTHING			0X00

typedef struct SensorConfig_struct{
	uint8_t Name_ID;	//���
	uint8_t ROM_ID[8];	//Ψһʶ����
	uint8_t	TH;	//�¶�������ֵ
	uint8_t AlarmSet;	//�����趨
	//uint8_t	isValid;	//�Ƿ����
	
} SensorConfig_Typedef;
typedef	struct Sensor_struct{
	uint8_t Valid_Num;					//��Ч����������
	uint8_t Valid_Configured_Num;		//�����õĴ���������
	uint8_t Valid_NotConfigured_Num;	//δ���õĴ���������
	uint8_t Valid_Mark;				//ָʾ������λ��
	uint8_t Valid_Configured_Mark;
	uint8_t Valid_NotConfigured_Mark;
} Sensor_Typedef;
typedef enum{
	Sig_MainLogic_En	=0x01,
	Sig_Add_En				=0x02
	
} Sig_InterLock_Typedef;


extern volatile uint8_t 	Task_1ms_NotCritical_cnt;
extern volatile uint8_t 	Task_10ms_NotCritical_cnt;


//����������Ѿ����ù���(�Ѿ�ʹ�ù���)������
//������Ч���������
//uint8_t Check_ValidConfiguredSensor(void);
void Check_Sensor(void);

#endif

