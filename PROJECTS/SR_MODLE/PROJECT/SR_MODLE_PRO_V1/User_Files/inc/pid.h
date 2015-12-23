#ifndef _PID_H_
#define	_PID_H_
#include	"stm8s.h"
/*
增量型PID算法
PID=Uk+Kp*[E(k)-E(k-1)]+Ki*E(k)+Kd*[E(k)-2E(k-1)+E(k-2)]

*/

typedef struct PID_Value
{
	int8_t Kp;	//比例系数
	int8_t Ki;	//积分系数
	int8_t Kd;	//微分系数
	//int8_t F;	//采样频率
	int8_t BitMov_In_Right;	//输入右移位数
	int8_t BitMov_Out_Left;	//输出左移位数
	int16_t Ek[3];	//历史偏差
	
	int8_t	Uk;	//pid 输出
	int16_t Rk;	//pid 给定
	int16_t Ck;	//pid 实际值
	int16_t Uk_Real;	//	pid 实际值
}pid_str;

extern pid_str pid;

void pid_exe(pid_str* PID);
void PID_set(void);
#endif

