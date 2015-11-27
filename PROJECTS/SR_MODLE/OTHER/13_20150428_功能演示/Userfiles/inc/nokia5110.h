#ifndef	_NOKIA5110_H_
#define	_NOKIA5110_H_
void Nokia5110_Init(void);
uint8_t LCD_Print(uint8_t Row,uint8_t Column,uint8_t *pString);
void LCD_Print_HexNum(uint8_t Row,uint8_t Column,uint8_t num);
void LCD_Print_0to9DecNum(uint8_t Row,uint8_t Column,uint8_t num);
void LCD_Clear(void);
#endif
