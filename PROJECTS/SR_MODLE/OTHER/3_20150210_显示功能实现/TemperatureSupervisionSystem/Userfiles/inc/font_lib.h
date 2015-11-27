#ifndef	_FONT_LIB_H_
#define	_FONT_LIB_H_
#include	"stm8s.h"
//字库里未定义的字符用?代替
extern char *const pChar_ndef;
//字库里未定义的汉字用？代替
extern char const Chinese_ndef[3];

//定义特殊符号
extern uint8_t *const pSheshidu;	//摄氏度指针

extern char const CharIndex[];
extern char const CharLib[][12];
extern char const *FontIndex[];
extern char const FontLib[][12];
#endif
