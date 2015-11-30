#ifndef	_MOTOR_H_
#define	_MOTOR_H_

typedef enum
{
	MOTOR_FORWARD=1,
	MOTOR_BACKWARK=0
}Motor_Direction_Typedef;

typedef struct motor_para{
	uint8_t 		status;										//电机运行状态
	uint16_t		Disstance_Total_cnt;			//全程计数
	uint16_t		Disstance_Now_cnt;				//当前计数
	uint8_t			Sensor_OA_A;
	uint8_t			Sensor_OA_B;
	uint8_t			Sensor_Speed;
	uint8_t			Key_A;
	uint8_t			Key_B;
	uint8_t			o_Alarm;									//报警输出中间变量
	
} Motor_Para;

void Motor_Init(void);

void Motor_Start(Motor_Direction_Typedef dir);
void Motor_Stop(void);


#endif
