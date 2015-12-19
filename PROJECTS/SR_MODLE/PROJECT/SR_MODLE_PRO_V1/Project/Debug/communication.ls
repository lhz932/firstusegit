   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
  54                     ; 27 static void IR_Init(void){
  56                     .text:	section	.text,new
  57  0000               L3_IR_Init:
  61                     ; 29 	GPIO_Init(IR_PORT,IR_PIN,GPIO_MODE_IN_PU_IT);	//带上拉输入，使用外中断
  63  0000 4b60          	push	#96
  64  0002 4b10          	push	#16
  65  0004 ae500a        	ldw	x,#20490
  66  0007 cd0000        	call	_GPIO_Init
  68  000a 9b            	sim	
  69  000b 85            	popw	x
  70                     ; 31 	disableInterrupts();
  74                     ; 32 	EXTI_SetExtIntSensitivity(IR_EXTI_PORT,EXTI_SENSITIVITY_FALL_ONLY);	//只在下降沿触发;设置之前先禁用总中断
  77  000c ae0202        	ldw	x,#514
  78  000f cd0000        	call	_EXTI_SetExtIntSensitivity
  80                     ; 33 	enableInterrupts();	
  83  0012 9a            	rim	
  85                     ; 35 	TIM1_ITConfig(TIM1_IT_UPDATE,ENABLE);	//利用TIMER1获取时间，重复计数器已在TIMER1初始化时设置为3，即更新中断
  88  0013 ae0101        	ldw	x,#257
  90                     ; 39 }
  93  0016 cc0000        	jp	_TIM1_ITConfig
 116                     ; 40 static void NRF24L01_Init(void){
 117                     .text:	section	.text,new
 118  0000               L32_NRF24L01_Init:
 122                     ; 42 }
 125  0000 81            	ret	
 150                     ; 44 void Comm_Init(void)
 150                     ; 45 {
 151                     .text:	section	.text,new
 152  0000               _Comm_Init:
 156                     ; 46 		IR_Init();
 158  0000 cd0000        	call	L3_IR_Init
 160                     ; 47 		NRF24L01_Init();
 163                     ; 48 }
 166  0003 cc0000        	jp	L32_NRF24L01_Init
 239                     ; 51 uint8_t IR_GetCode(uint8_t* ir_code)
 239                     ; 52 {
 240                     .text:	section	.text,new
 241  0000               _IR_GetCode:
 243  0000 89            	pushw	x
 244  0001 5204          	subw	sp,#4
 245       00000004      OFST:	set	4
 248                     ; 55 	if(New_IR_Code_Flag)
 250  0003 3d00          	tnz	_New_IR_Code_Flag
 251  0005 2728          	jreq	L301
 252                     ; 57 		New_IR_Code_Flag=0;	//clear flag
 254  0007 3f00          	clr	_New_IR_Code_Flag
 255                     ; 59 		a=(uint8_t)(IR_Code>>24);
 257  0009 b601          	ld	a,_IR_Code
 258  000b 6b01          	ld	(OFST-3,sp),a
 260                     ; 60 		b=(uint8_t)((IR_Code>>16)%256);
 262  000d b602          	ld	a,_IR_Code+1
 263  000f 6b02          	ld	(OFST-2,sp),a
 265                     ; 61 		c=(uint8_t)(IR_Code>>8);
 267  0011 b603          	ld	a,_IR_Code+2
 268  0013 6b03          	ld	(OFST-1,sp),a
 270                     ; 62 		d=(uint8_t)IR_Code;
 272  0015 b604          	ld	a,_IR_Code+3
 273  0017 6b04          	ld	(OFST+0,sp),a
 275                     ; 64 		if(((a^b)==0xff)&&((c^d)==0xff))	//data valid
 277  0019 7b01          	ld	a,(OFST-3,sp)
 278  001b 1802          	xor	a,(OFST-2,sp)
 279  001d 4c            	inc	a
 280  001e 260f          	jrne	L301
 282  0020 7b03          	ld	a,(OFST-1,sp)
 283  0022 1804          	xor	a,(OFST+0,sp)
 284  0024 4c            	inc	a
 285  0025 2608          	jrne	L301
 286                     ; 66 			*ir_code=d;			
 288  0027 1e05          	ldw	x,(OFST+1,sp)
 289  0029 7b04          	ld	a,(OFST+0,sp)
 290  002b f7            	ld	(x),a
 291                     ; 67 			return 0;
 293  002c 4f            	clr	a
 295  002d 2005          	jra	L62
 296  002f               L301:
 297                     ; 70 	*ir_code=0;
 299  002f 1e05          	ldw	x,(OFST+1,sp)
 300                     ; 71 	return 1;		
 302  0031 a601          	ld	a,#1
 303  0033 7f            	clr	(x)
 305  0034               L62:
 307  0034 5b06          	addw	sp,#6
 308  0036 81            	ret	
 350                     	xdef	_IR_GetCode
 351                     	xdef	_Comm_Init
 352                     	switch	.ubsct
 353  0000               _New_IR_Code_Flag:
 354  0000 00            	ds.b	1
 355                     	xdef	_New_IR_Code_Flag
 356  0001               _IR_Code:
 357  0001 00000000      	ds.b	4
 358                     	xdef	_IR_Code
 359  0005               _IR_time_cnt:
 360  0005 00            	ds.b	1
 361                     	xdef	_IR_time_cnt
 362                     	xref	_TIM1_ITConfig
 363                     	xref	_GPIO_Init
 364                     	xref	_EXTI_SetExtIntSensitivity
 384                     	end
