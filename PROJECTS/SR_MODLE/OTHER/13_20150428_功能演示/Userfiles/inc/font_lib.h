#ifndef	_FONT_LIB_H_
#define	_FONT_LIB_H_
#include	"stm8s.h"
//�ֿ���δ������ַ���?����
extern char *const pChar_ndef;
//�ֿ���δ����ĺ����ã�����
extern char const Chinese_ndef[3];

//�����������
extern uint8_t *const pSheshidu;	//���϶�ָ��

extern char const CharIndex[];
extern char const CharLib[][12];
extern char const *FontIndex[];
extern char const FontLib[][12];
#endif
