#ifndef	_MOTOR_H_
#define	_MOTOR_H_

typedef enum
{
	MOTOR_FORWARD=1,
	MOTOR_BACKWARK=0
}Motor_Direction_Typedef;

typedef struct motor_para{
	uint8_t 		status;										//�������״̬
	uint16_t		Disstance_Total_cnt;			//ȫ�̼���
	uint16_t		Disstance_Now_cnt;				//��ǰ����
	uint8_t			Sensor_OA_A;
	uint8_t			Sensor_OA_B;
	uint8_t			Sensor_Speed;
	uint8_t			Key_A;
	uint8_t			Key_B;
	uint8_t			o_Alarm;									//��������м����
	
} Motor_Para;

void Motor_Init(void);

void Motor_Start(Motor_Direction_Typedef dir);
void Motor_Stop(void);


#endif
