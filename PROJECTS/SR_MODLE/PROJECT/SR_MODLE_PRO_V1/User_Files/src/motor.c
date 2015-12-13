#include	"main.h"
#include	"stm8s.h"
#include	"stm8s_conf.h"
#include	"motor.h"
#include	"pt.h"

struct pt pt_Keyscan;
uint8_t pt_Keyscan_cnt;

struct pt pt_Alarm_Speaker;
uint8_t pt_Alarm_Speaker_cnt;

struct pt pt_Alarm_Light;
uint8_t pt_Alarm_Light_cnt;
/*
	接线图：
	功能	占用I/O
	按键		2个		PB4，PB5	高电平有效
	避障		2个		PA1，PA2	低电平有效
	测速		1个		PA3				高电平有效
	报警		1个		PD4				低电平有效
	电机		3个		PD5，PD6,PC3
	SPI			3个 	PC5，PC6，PC7
  
	
	
*/


#define	MOTOR_PWM_PORT	GPIOC
#define	MOTOR_PWM				GPIO_PIN_3	
#define	L298N_ENA				MOTOR_PWM

#define	L298N_IN_PORT		GPIOD			
#define	L298N_IN1				GPIO_PIN_5
#define	L298N_IN2				GPIO_PIN_6

#define	OBSTACLE_AVOIDANCE_SENSOR_PORT	GPIOA
#define	OBSTACLE_AVOIDANCE_SENSOR_A			GPIO_PIN_1
#define	OBSTACLE_AVOIDANCE_SENSOR_B			GPIO_PIN_2

#define	SPEED_SENSOR_PORT								GPIOA
#define	SPEED_SENSOR										GPIO_PIN_3

#define	KEY_PORT												GPIOB
#define	KEY_A														GPIO_PIN_4
#define	KEY_B														GPIO_PIN_5

#define	ALARM_PORT											GPIOD
#define	ALARM														GPIO_PIN_4


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
	PT_INIT(&pt_Keyscan);
}
static void Alarm_Init(void)
{
	GPIO_Init(ALARM_PORT,ALARM,GPIO_MODE_OUT_PP_HIGH_SLOW);
	
	PT_INIT(&pt_Alarm_Speaker);
	PT_INIT(&pt_Alarm_Light);
}


void Motor_Init(void)
{
	//电机驱动端口初始化
	GPIO_Init(L298N_IN_PORT,L298N_IN1|L298N_IN2,GPIO_MODE_OUT_PP_LOW_SLOW);
	GPIO_Init(MOTOR_PWM_PORT,MOTOR_PWM,GPIO_MODE_OUT_PP_LOW_SLOW);
	
	TIM1_Cmd(DISABLE);																			//stop计数器
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
	
	TIM1_Cmd(ENABLE);																			//使能计数器
	TIM1_CtrlPWMOutputs(ENABLE);													// TIM1 Main Output Enable
}
void Motor_Stop(void)
{
	TIM1_Cmd(DISABLE);																			//stop计数器
	TIM1_CtrlPWMOutputs(DISABLE);														// TIM1 Main Output disable
	GPIO_WriteLow(L298N_IN_PORT,L298N_IN1);
	GPIO_WriteLow(L298N_IN_PORT,L298N_IN2);
}
//避障传感器检测
//低电平有效
void Sensor_OA_Scan(void)
{
	if(GPIO_ReadInputPin(OBSTACLE_AVOIDANCE_SENSOR_PORT,OBSTACLE_AVOIDANCE_SENSOR_A)){	//
		MT.Sensor_OA_A=0;	
	}else{
		MT.Sensor_OA_A=1;
	}
	if(GPIO_ReadInputPin(OBSTACLE_AVOIDANCE_SENSOR_PORT,OBSTACLE_AVOIDANCE_SENSOR_B)){	//
		MT.Sensor_OA_B=0;	
	}else{
		MT.Sensor_OA_B=1;
	}
}
//按键检测
//1ms刷新
PT_THREAD(Key_Scan(void))
{
	PT_BEGIN(&pt_Keyscan);
	
	if(GPIO_ReadInputPin(KEY_PORT,KEY_A)){	//按键动作
		//等待至少5ms
		pt_Keyscan_cnt=0;
		PT_WAIT_UNTIL(&pt_Keyscan,pt_Keyscan_cnt>5);
		if(GPIO_ReadInputPin(KEY_PORT,KEY_A)){	//有效的按键动作
			PT_WAIT_UNTIL(&pt_Keyscan,GPIO_ReadInputPin(KEY_PORT,KEY_A)==0);	//等待按键释放
			MT.Key_A=1;
		}
	}
	if(GPIO_ReadInputPin(KEY_PORT,KEY_B)){	//按键动作
		//等待至少5ms
		pt_Keyscan_cnt=0;
		PT_WAIT_UNTIL(&pt_Keyscan,pt_Keyscan_cnt>5);
		if(GPIO_ReadInputPin(KEY_PORT,KEY_B)){
			PT_WAIT_UNTIL(&pt_Keyscan,GPIO_ReadInputPin(KEY_PORT,KEY_B)==0);	//等待按键释放
			MT.Key_B=1;
		}
	}
	
	PT_END(&pt_Keyscan);
}

void MT_Control(void)
{
	if(MT.Key_A&&(MT.Sensor_OA_A==0)){	//正向满足运行条件
		MT.Key_A=0;	//清除按键指令	
		if(MT.status==MT_STOPPED){				//停止状态可以直接启动
			Motor_Start(MOTOR_FORWARD);
			MT.status=MT_RUNNING_FORWARD;		//更新运行状态
		}else{														//运行状态则停止运行
			Motor_Stop();
			MT.status=MT_STOPPED;						//更新运行状态
		}
	}
	
	if(MT.Key_B&&(MT.Sensor_OA_B==0)){	//反向满足运行条件
		MT.Key_B=0;	//清除按键指令	
		if(MT.status==MT_STOPPED){				//停止状态可以直接启动
			Motor_Start(MOTOR_BACKWARD);
			MT.status=MT_RUNNING_BACKWARD;		//更新运行状态
		}else{														//运行状态则停止运行
			Motor_Stop();
			MT.status=MT_STOPPED;						//更新运行状态
		}
	}
	
	if((MT.status==MT_RUNNING_FORWARD)&&(MT.Sensor_OA_A==1))	//正向急停
	{
		Motor_Stop();
		MT.status=MT_STOPPED;						//更新运行状态
	}
	if((MT.status==MT_RUNNING_BACKWARD)&&(MT.Sensor_OA_B==1))	//反向急停
	{
		Motor_Stop();
		MT.status=MT_STOPPED;						//更新运行状态
	}
	
	
}
PT_THREAD(Alarm_Speaker(void))
{
	PT_BEGIN(&pt_Alarm_Speaker);
	
	pt_Alarm_Speaker_cnt=0;
	PT_WAIT_UNTIL(&pt_Alarm_Speaker,pt_Alarm_Speaker_cnt>30);
	GPIO_WriteLow(ALARM_PORT,ALARM);
	
	pt_Alarm_Speaker_cnt=0;
	PT_WAIT_UNTIL(&pt_Alarm_Speaker,pt_Alarm_Speaker_cnt>50);
	GPIO_WriteHigh(ALARM_PORT,ALARM);
	
	PT_END(&pt_Alarm_Speaker);
	
}


void Alarm(void)
{
	if(MT.status&0x01)	//if running
	{
		Alarm_Speaker();
	}else{
		GPIO_WriteHigh(ALARM_PORT,ALARM);
	}
}


