#include	"main.h"
#include	"stm8s.h"
#include	"stm8s_conf.h"
#include	"motor.h"

/*
	����ͼ��
	����	ռ��I/O
	����		2��		PD2��PD3	�ߵ�ƽ��Ч
	����		2��		PA1��PA2	�͵�ƽ��Ч
	����		1��		PD4				�ߵ�ƽ��Ч
	����		1��		PA3				�͵�ƽ��Ч
	���		3��		PB4��PB5,PC3
	SPI			3�� 	PC5��PC6��PC7
  UART		2�� 	PD5��PD6 	
	
	
*/


#define	MOTOR_PWM_PORT	GPIOC
#define	MOTOR_PWM				GPIO_PIN_3	
#define	L298N_ENA				MOTOR_PWM

#define	L298N_IN_PORT		GPIOB			
#define	L298N_IN1				GPIO_PIN_4
#define	L298N_IN2				GPIO_PIN_5

#define	OBSTACLE_AVOIDANCE_SENSOR_PORT	GPIOA
#define	OBSTACLE_AVOIDANCE_SENSOR_A			GPIO_PIN_1
#define	OBSTACLE_AVOIDANCE_SENSOR_B			GPIO_PIN_2

#define	SPEED_SENSOR_PORT								GPIOD
#define	SPEED_SENSOR										GPIO_PIN_4

#define	KEY_PORT												GPIOD
#define	KEY_A														GPIO_PIN_2
#define	KEY_B														GPIO_PIN_3

#define	ALARM_PORT											GPIOA
#define	ALARM														GPIO_PIN_3


Motor_Para MT={0};

static void Obstacle_Avoidance_Sensor_Init(void)
{
	GPIO_Init(OBSTACLE_AVOIDANCE_SENSOR_PORT,
						OBSTACLE_AVOIDANCE_SENSOR_A|OBSTACLE_AVOIDANCE_SENSOR_B,
						GPIO_MODE_IN_PU_NO_IT);				
						
}
static void Speed_Sensor_Init(void)
{
	GPIO_Init(SPEED_SENSOR_PORT,SPEED_SENSOR,GPIO_MODE_IN_PU_NO_IT);
}
static void Key_Init(void)
{
	GPIO_Init(KEY_PORT,KEY_A|KEY_B,GPIO_MODE_IN_PU_NO_IT);
}
static void Alarm_Init(void)
{
	GPIO_Init(ALARM_PORT,ALARM,GPIO_MODE_OUT_PP_HIGH_SLOW);
}


void Motor_Init(void)
{
	//��������˿ڳ�ʼ��
	GPIO_Init(L298N_IN_PORT,L298N_IN1|L298N_IN2,GPIO_MODE_OUT_PP_LOW_SLOW);
	GPIO_Init(MOTOR_PWM_PORT,MOTOR_PWM,GPIO_MODE_OUT_PP_LOW_SLOW);
	
	TIM1_Cmd(DISABLE);																			//stop������
	TIM1_CtrlPWMOutputs(DISABLE);														// TIM1 Main Output disable
	
	Obstacle_Avoidance_Sensor_Init();
	Speed_Sensor_Init();
	Key_Init();
	Alarm_Init();
	
	
}

void Motor_Start(Motor_Direction_Typedef dir)
{
	if(dir){
		GPIO_WriteHigh(L298N_IN_PORT,L298N_IN1);
		GPIO_WriteLow(L298N_IN_PORT,L298N_IN2);
	}else{
		GPIO_WriteHigh(L298N_IN_PORT,L298N_IN2);
		GPIO_WriteLow(L298N_IN_PORT,L298N_IN1);
	}
	
	TIM1_Cmd(ENABLE);																			//ʹ�ܼ�����
	TIM1_CtrlPWMOutputs(ENABLE);													// TIM1 Main Output Enable
}
void Motor_Stop(void)
{
	TIM1_Cmd(DISABLE);																			//stop������
	TIM1_CtrlPWMOutputs(DISABLE);														// TIM1 Main Output disable
	GPIO_WriteLow(L298N_IN_PORT,L298N_IN1);
	GPIO_WriteLow(L298N_IN_PORT,L298N_IN2);
}

void Signal_Scan(void)
{
	GPIO_ReadInputPin(OBSTACLE_AVOIDANCE_SENSOR_PORT,OBSTACLE_AVOIDANCE_SENSOR_A);
}


