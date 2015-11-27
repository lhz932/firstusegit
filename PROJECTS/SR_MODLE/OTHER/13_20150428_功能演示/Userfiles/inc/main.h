#ifndef	_MAIN_H_
#define	_MAIN_H_

#define	EEPROM_START_ADDRESS	0X4000
#define	EEPROM_ROMMASK_ADDRESS	0X407F	//存放ROM_Mask,一个字节
#define	EEPROM_CHECK_ADDRESS		0X407E	//存放校验位，用来检验EEPROM写入是否完成
#define	EEPROM_CHECK_CODE				0x5A		//校验码

#define	MODE_NORMAL	0X01
#define	MODE_CONFIG	0X02
#define	MODE_PREPROCESSING	0X11
#define	MODE_DONOTHING			0X00

typedef struct SensorConfig_struct{
	uint8_t Name_ID;	//编号
	uint8_t ROM_ID[8];	//唯一识别码
	uint8_t	TH;	//温度上限阈值
	uint8_t AlarmSet;	//报警设定
	//uint8_t	isValid;	//是否可用
	
} SensorConfig_Typedef;
typedef	struct Sensor_struct{
	uint8_t Valid_Num;					//有效传感器数量
	uint8_t Valid_Configured_Num;		//已配置的传感器数量
	uint8_t Valid_NotConfigured_Num;	//未配置的传感器数量
	uint8_t Valid_Mark;				//指示传感器位置
	uint8_t Valid_Configured_Mark;
	uint8_t Valid_NotConfigured_Mark;
} Sensor_Typedef;
typedef enum{
	Sig_MainLogic_En	=0x01,
	Sig_Add_En				=0x02
	
} Sig_InterLock_Typedef;


extern volatile uint8_t 	Task_1ms_NotCritical_cnt;
extern volatile uint8_t 	Task_10ms_NotCritical_cnt;


//检测总线上已经配置过的(已经使用过的)传感器
//返回有效传感器标记
//uint8_t Check_ValidConfiguredSensor(void);
void Check_Sensor(void);

#endif

