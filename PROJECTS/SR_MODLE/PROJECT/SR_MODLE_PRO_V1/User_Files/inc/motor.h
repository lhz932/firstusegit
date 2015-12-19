#ifndef	_MOTOR_H_
#define	_MOTOR_H_
#include	"pt.h"
#include	"stm8s.h"

typedef enum
{
	MOTOR_FORWARD=1,
	MOTOR_BACKWARD=0
}Motor_Direction_Typedef;

typedef enum
{
	MT_STOPPED=0X01,
	MT_RUNNING_FORWARD=0X02,
	MT_RUNNING_BACKWARD=0X04
	//MT_LASTTIME_FORWARD=0X08,	//停止前的运行状态
	//MT_LASTTIME_BACKWARD=0X10	//停止前的运行状态
}Motor_Status_Typedef;
typedef enum
{
	MT_LAST_FORWARD=0X02,
	MT_LAST_BACKWARD=0X04
}Motor_Status_Lasttime_Typedef;

typedef enum
{
	SPEED_NO_PULSE=0X00,
	SPEED_FIRST_PULSE=0X01,
	SPEED_OK=0X02
}Speed_Pulse_Status_Typedef;

typedef struct motor_para{
	Motor_Status_Typedef 		status;				//电机运行状态
	Motor_Status_Lasttime_Typedef last_status;	//电机上次运行状态
	uint16_t		Disstance_Total_cnt;			//全程计数
	uint16_t		Disstance_Now_cnt;				//当前计数
	uint8_t			Sensor_OA_A;							//信号状态实时更新
	uint8_t			Sensor_OA_B;							//信号状态实时更新
	uint8_t			Sensor_Speed;						
	uint8_t			Key_A;										//信号处理后清零
	uint8_t			Key_B;										//信号处理后清零
	uint8_t			o_Alarm;									//报警输出中间变量
	
} Motor_Para;

extern Motor_Para MT;
extern uint8_t pt_Keyscan_cnt;
extern uint8_t pt_Alarm_Speaker_cnt;
extern Speed_Pulse_Status_Typedef Speed_Pulse_Status;
extern uint16_t Speed_Origin;
extern uint16_t Speed_Pulse_cnt;

void Motor_Init(void);

void Motor_Start(Motor_Direction_Typedef dir);
void Motor_Stop(void);

void Sensor_OA_Scan(void);
PT_THREAD(Key_Scan(void));
void MT_Control(void);
void Alarm(void);
#endif
