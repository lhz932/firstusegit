#ifndef _PID_H_
#define	_PID_H_
#include	"stm8s.h"
/*
������PID�㷨
PID=Uk+Kp*[E(k)-E(k-1)]+Ki*E(k)+Kd*[E(k)-2E(k-1)+E(k-2)]

*/

typedef struct PID_Value
{
	int8_t Kp;	//����ϵ��
	int8_t Ki;	//����ϵ��
	int8_t Kd;	//΢��ϵ��
	//int8_t F;	//����Ƶ��
	int8_t BitMov_In_Right;	//��������λ��
	int8_t BitMov_Out_Left;	//�������λ��
	int16_t Ek[3];	//��ʷƫ��
	
	int8_t	Uk;	//pid ���
	int16_t Rk;	//pid ����
	int16_t Ck;	//pid ʵ��ֵ
	int16_t Uk_Real;	//	pid ʵ��ֵ
}pid_str;

extern pid_str pid;

void pid_exe(pid_str* PID);
void PID_set(void);
#endif

