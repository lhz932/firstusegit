#include	"pid.h"
#include	"motor.h"
#include	"stm8s_conf.h"

#define	MAXOUT 50
/*
增量型PID算法
PID=Uk+Kp*[E(k)-E(k-1)]+Ki*E(k)+Kd*[E(k)-2E(k-1)+E(k-2)]

*/
/*
函数入口：PID->RK(给定值)
					PID->CK(实际值)
					PID->Kp
					PID->Ki
					PID->Kd
函数出口：Uk

*/
pid_str pid={
							5,	//kp
							2,	//ki
							1,	//kd
							4,	//输入右移5位
							1,	//输出左移了8位，即最后输出时再右移8位
							
							{0,0,0}, //e[3]
							
							0,	//uk
							30,	//rk
							0,		//ck
							0			//uk_real				
};

void pid_exe(pid_str* PID)
{
	PID->Ek[2]=PID->Ek[1];
	PID->Ek[1]=PID->Ek[0];
	PID->Ek[0]=(PID->Rk >> PID->BitMov_In_Right) - (PID->Ck >> PID->BitMov_In_Right);
	
	PID->Uk_Real = 	PID->Uk_Real + 
									PID->Kp * (PID->Ek[0] - PID->Ek[1]) +
									PID->Ki * (PID->Ek[0]) +
									PID->Kd * (PID->Ek[0] - 2 * PID->Ek[1] + PID->Ek[2]);
									
	if((PID->Uk_Real >> PID->BitMov_Out_Left) > MAXOUT)
	{
		PID->Uk = MAXOUT;
	}else if((PID->Uk_Real >> PID->BitMov_Out_Left) <= -MAXOUT)
	{
		PID->Uk = -MAXOUT;
	}else
	{
		PID->Uk =	PID->Uk_Real >> PID->BitMov_Out_Left;
	}
}

void PID_set(void)
{
	uint16_t m;
	if(Speed_Origin!=0xFFFF)
	{
		m=Speed_Origin>>3;
		pid.Ck=15000*25/8/m;
	}else
	{
		pid.Ck=0;
	}
	pid_exe(&pid);
	TIM1_SetCompare3(150+pid.Uk);
}
