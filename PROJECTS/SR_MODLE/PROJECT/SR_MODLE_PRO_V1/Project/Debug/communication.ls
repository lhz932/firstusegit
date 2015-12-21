   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
  53                     ; 27 static void IR_Init(void){
  55                     .text:	section	.text,new
  56  0000               L3_IR_Init:
  60                     ; 29 	GPIO_Init(IR_PORT,IR_PIN,GPIO_MODE_IN_PU_IT);	//带上拉输入，使用外中断
  62  0000 4b60          	push	#96
  63  0002 4b10          	push	#16
  64  0004 ae500a        	ldw	x,#20490
  65  0007 cd0000        	call	_GPIO_Init
  67  000a 9b            	sim	
  68  000b 85            	popw	x
  69                     ; 31 	disableInterrupts();
  73                     ; 32 	EXTI_SetExtIntSensitivity(IR_EXTI_PORT,EXTI_SENSITIVITY_FALL_ONLY);	//只在下降沿触发;设置之前先禁用总中断
  76  000c ae0202        	ldw	x,#514
  77  000f cd0000        	call	_EXTI_SetExtIntSensitivity
  79                     ; 33 	enableInterrupts();	
  82  0012 9a            	rim	
  84                     ; 35 	TIM1_ITConfig(TIM1_IT_UPDATE,ENABLE);	//利用TIMER1获取时间，重复计数器已在TIMER1初始化时设置为3，即更新中断
  87  0013 ae0101        	ldw	x,#257
  89                     ; 39 }
  92  0016 cc0000        	jp	_TIM1_ITConfig
 115                     ; 40 static void NRF24L01_Init(void){
 116                     .text:	section	.text,new
 117  0000               L32_NRF24L01_Init:
 121                     ; 42 }
 124  0000 81            	ret	
 149                     ; 44 void Comm_Init(void)
 149                     ; 45 {
 150                     .text:	section	.text,new
 151  0000               _Comm_Init:
 155                     ; 46 		IR_Init();
 157  0000 cd0000        	call	L3_IR_Init
 159                     ; 47 		NRF24L01_Init();
 162                     ; 48 }
 165  0003 cc0000        	jp	L32_NRF24L01_Init
 238                     ; 51 uint8_t IR_GetCode(uint8_t* ir_code)
 238                     ; 52 {
 239                     .text:	section	.text,new
 240  0000               _IR_GetCode:
 242  0000 89            	pushw	x
 243  0001 5204          	subw	sp,#4
 244       00000004      OFST:	set	4
 247                     ; 55 	if(New_IR_Code_Flag)
 249  0003 3d00          	tnz	_New_IR_Code_Flag
 250  0005 2728          	jreq	L301
 251                     ; 57 		New_IR_Code_Flag=0;	//clear flag
 253  0007 3f00          	clr	_New_IR_Code_Flag
 254                     ; 59 		a=(uint8_t)(IR_Code>>24);
 256  0009 b601          	ld	a,_IR_Code
 257  000b 6b01          	ld	(OFST-3,sp),a
 259                     ; 60 		b=(uint8_t)((IR_Code>>16)%256);
 261  000d b602          	ld	a,_IR_Code+1
 262  000f 6b02          	ld	(OFST-2,sp),a
 264                     ; 61 		c=(uint8_t)(IR_Code>>8);
 266  0011 b603          	ld	a,_IR_Code+2
 267  0013 6b03          	ld	(OFST-1,sp),a
 269                     ; 62 		d=(uint8_t)IR_Code;
 271  0015 b604          	ld	a,_IR_Code+3
 272  0017 6b04          	ld	(OFST+0,sp),a
 274                     ; 64 		if(((a^b)==0xff)&&((c^d)==0xff))	//data valid
 276  0019 7b01          	ld	a,(OFST-3,sp)
 277  001b 1802          	xor	a,(OFST-2,sp)
 278  001d 4c            	inc	a
 279  001e 260f          	jrne	L301
 281  0020 7b03          	ld	a,(OFST-1,sp)
 282  0022 1804          	xor	a,(OFST+0,sp)
 283  0024 4c            	inc	a
 284  0025 2608          	jrne	L301
 285                     ; 66 			*ir_code=d;			
 287  0027 1e05          	ldw	x,(OFST+1,sp)
 288  0029 7b04          	ld	a,(OFST+0,sp)
 289  002b f7            	ld	(x),a
 290                     ; 67 			return 0;
 292  002c 4f            	clr	a
 294  002d 2005          	jra	L62
 295  002f               L301:
 296                     ; 70 	*ir_code=0;
 298  002f 1e05          	ldw	x,(OFST+1,sp)
 299                     ; 71 	return 1;		
 301  0031 a601          	ld	a,#1
 302  0033 7f            	clr	(x)
 304  0034               L62:
 306  0034 5b06          	addw	sp,#6
 307  0036 81            	ret	
 349                     	xdef	_IR_GetCode
 350                     	xdef	_Comm_Init
 351                     	switch	.ubsct
 352  0000               _New_IR_Code_Flag:
 353  0000 00            	ds.b	1
 354                     	xdef	_New_IR_Code_Flag
 355  0001               _IR_Code:
 356  0001 00000000      	ds.b	4
 357                     	xdef	_IR_Code
 358  0005               _IR_time_cnt:
 359  0005 00            	ds.b	1
 360                     	xdef	_IR_time_cnt
 361                     	xref	_TIM1_ITConfig
 362                     	xref	_GPIO_Init
 363                     	xref	_EXTI_SetExtIntSensitivity
 383                     	end
