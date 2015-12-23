   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
  49                     ; 27 static void IR_Init(void){
  51                     	switch	.text
  52  0000               L3_IR_Init:
  56                     ; 29 	GPIO_Init(IR_PORT,IR_PIN,GPIO_MODE_IN_PU_IT);	//带上拉输入，使用外中断
  58  0000 4b60          	push	#96
  59  0002 4b10          	push	#16
  60  0004 ae500a        	ldw	x,#20490
  61  0007 cd0000        	call	_GPIO_Init
  63  000a 85            	popw	x
  64                     ; 31 	disableInterrupts();
  67  000b 9b            sim
  69                     ; 32 	EXTI_SetExtIntSensitivity(IR_EXTI_PORT,EXTI_SENSITIVITY_FALL_ONLY);	//只在下降沿触发;设置之前先禁用总中断
  72  000c ae0202        	ldw	x,#514
  73  000f cd0000        	call	_EXTI_SetExtIntSensitivity
  75                     ; 33 	enableInterrupts();	
  78  0012 9a            rim
  80                     ; 35 	TIM1_ITConfig(TIM1_IT_UPDATE,ENABLE);	//利用TIMER1获取时间，重复计数器已在TIMER1初始化时设置为3，即更新中断
  83  0013 ae0101        	ldw	x,#257
  84  0016 cd0000        	call	_TIM1_ITConfig
  86                     ; 39 }
  89  0019 81            	ret
 112                     ; 40 static void NRF24L01_Init(void){
 113                     	switch	.text
 114  001a               L32_NRF24L01_Init:
 118                     ; 42 }
 121  001a 81            	ret
 146                     ; 44 void Comm_Init(void)
 146                     ; 45 {
 147                     	switch	.text
 148  001b               _Comm_Init:
 152                     ; 46 		IR_Init();
 154  001b ade3          	call	L3_IR_Init
 156                     ; 47 		NRF24L01_Init();
 158  001d adfb          	call	L32_NRF24L01_Init
 160                     ; 48 }
 163  001f 81            	ret
 236                     ; 51 uint8_t IR_GetCode(uint8_t* ir_code)
 236                     ; 52 {
 237                     	switch	.text
 238  0020               _IR_GetCode:
 240  0020 89            	pushw	x
 241  0021 5204          	subw	sp,#4
 242       00000004      OFST:	set	4
 245                     ; 55 	if(New_IR_Code_Flag)
 247  0023 3d00          	tnz	_New_IR_Code_Flag
 248  0025 272c          	jreq	L301
 249                     ; 57 		New_IR_Code_Flag=0;	//clear flag
 251  0027 3f00          	clr	_New_IR_Code_Flag
 252                     ; 59 		a=(uint8_t)(IR_Code>>24);
 254  0029 b601          	ld	a,_IR_Code
 255  002b 6b01          	ld	(OFST-3,sp),a
 257                     ; 60 		b=(uint8_t)((IR_Code>>16)%256);
 259  002d b602          	ld	a,_IR_Code+1
 260  002f a4ff          	and	a,#255
 261  0031 6b02          	ld	(OFST-2,sp),a
 263                     ; 61 		c=(uint8_t)(IR_Code>>8);
 265  0033 b603          	ld	a,_IR_Code+2
 266  0035 6b03          	ld	(OFST-1,sp),a
 268                     ; 62 		d=(uint8_t)IR_Code;
 270  0037 b604          	ld	a,_IR_Code+3
 271  0039 6b04          	ld	(OFST+0,sp),a
 273                     ; 64 		if(((a^b)==0xff)&&((c^d)==0xff))	//data valid
 275  003b 7b01          	ld	a,(OFST-3,sp)
 276  003d 1802          	xor	a,(OFST-2,sp)
 277  003f a1ff          	cp	a,#255
 278  0041 2610          	jrne	L301
 280  0043 7b03          	ld	a,(OFST-1,sp)
 281  0045 1804          	xor	a,(OFST+0,sp)
 282  0047 a1ff          	cp	a,#255
 283  0049 2608          	jrne	L301
 284                     ; 66 			*ir_code=d;			
 286  004b 7b04          	ld	a,(OFST+0,sp)
 287  004d 1e05          	ldw	x,(OFST+1,sp)
 288  004f f7            	ld	(x),a
 289                     ; 67 			return 0;
 291  0050 4f            	clr	a
 293  0051 2005          	jra	L41
 294  0053               L301:
 295                     ; 70 	*ir_code=0;
 297  0053 1e05          	ldw	x,(OFST+1,sp)
 298  0055 7f            	clr	(x)
 299                     ; 71 	return 1;		
 301  0056 a601          	ld	a,#1
 303  0058               L41:
 305  0058 5b06          	addw	sp,#6
 306  005a 81            	ret
 348                     	xdef	_IR_GetCode
 349                     	xdef	_Comm_Init
 350                     	switch	.ubsct
 351  0000               _New_IR_Code_Flag:
 352  0000 00            	ds.b	1
 353                     	xdef	_New_IR_Code_Flag
 354  0001               _IR_Code:
 355  0001 00000000      	ds.b	4
 356                     	xdef	_IR_Code
 357  0005               _IR_time_cnt:
 358  0005 00            	ds.b	1
 359                     	xdef	_IR_time_cnt
 360                     	xref	_TIM1_ITConfig
 361                     	xref	_GPIO_Init
 362                     	xref	_EXTI_SetExtIntSensitivity
 382                     	end
