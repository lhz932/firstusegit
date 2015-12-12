   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
  20                     	bsct
  21  0000               _Timebase_cnt:
  22  0000 00            	dc.b	0
  23  0001               _Timer1_Period:
  24  0001 87            	dc.b	135
  54                     ; 21 void Tasks_1ms_TimeCritical(void)
  54                     ; 22 {
  56                     .text:	section	.text,new
  57  0000               _Tasks_1ms_TimeCritical:
  61                     ; 24 }
  64  0000 81            	ret	
  90                     ; 26 void TimeCounters_1ms(void)
  90                     ; 27 {
  91                     .text:	section	.text,new
  92  0000               _TimeCounters_1ms:
  96                     ; 28 	if(Timebase_cnt>0)
  98  0000 3d00          	tnz	_Timebase_cnt
  99  0002 2706          	jreq	L13
 100                     ; 30 		Timebase_cnt--;
 102  0004 3a00          	dec	_Timebase_cnt
 103                     ; 31 		TCnt_10ms++;
 105  0006 3c00          	inc	_TCnt_10ms
 106                     ; 34 		pt_Keyscan_cnt++;
 108  0008 3c00          	inc	_pt_Keyscan_cnt
 109  000a               L13:
 110                     ; 38 }
 113  000a 81            	ret	
 141                     ; 40 void TimeCounters_10ms(void)
 141                     ; 41 {
 142                     .text:	section	.text,new
 143  0000               _TimeCounters_10ms:
 147                     ; 42 	if(TCnt_10ms>9)
 149  0000 b600          	ld	a,_TCnt_10ms
 150  0002 a00a          	sub	a,#10
 151  0004 250c          	jrult	L34
 152                     ; 44 		TCnt_10ms-=10;
 154  0006 b700          	ld	_TCnt_10ms,a
 155                     ; 47 		Indcator_cnt++;
 157  0008 3c00          	inc	_Indcator_cnt
 158                     ; 48 		pt_Alarm_Speaker_cnt++;
 160  000a 3c00          	inc	_pt_Alarm_Speaker_cnt
 161                     ; 51 		Sensor_OA_Scan();
 163  000c cd0000        	call	_Sensor_OA_Scan
 165                     ; 52 		MT_Control();
 167  000f cd0000        	call	_MT_Control
 169  0012               L34:
 170                     ; 55 }
 173  0012 81            	ret	
 204                     ; 57 main()
 204                     ; 58 {
 205                     .text:	section	.text,new
 206  0000               _main:
 210                     ; 59 	GPIO_Config_SystemOn();
 212  0000 cd0000        	call	_GPIO_Config_SystemOn
 214                     ; 60 	CLK_Config();	//Configure the Fcpu to 8MHz,Fmaster=8MHz	
 216  0003 cd0000        	call	_CLK_Config
 218                     ; 61 	Timer_Config();
 220  0006 cd0000        	call	_Timer_Config
 222                     ; 62 	Motor_Init();
 224  0009 cd0000        	call	_Motor_Init
 226  000c               L55:
 227                     ; 68 			TimeCounters_1ms();
 229  000c cd0000        	call	_TimeCounters_1ms
 231                     ; 69 			TimeCounters_10ms();
 233  000f cd0000        	call	_TimeCounters_10ms
 235                     ; 73 			Key_Scan();
 237  0012 cd0000        	call	_Key_Scan
 239                     ; 74 			Alarm();
 241  0015 cd0000        	call	_Alarm
 244  0018 20f2          	jra	L55
 269                     ; 80 void GPIO_Config_SystemOn(void)
 269                     ; 81 {
 270                     .text:	section	.text,new
 271  0000               _GPIO_Config_SystemOn:
 275                     ; 83 	GPIO_Init(GPIOA,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 277  0000 4b40          	push	#64
 278  0002 4bff          	push	#255
 279  0004 ae5000        	ldw	x,#20480
 280  0007 cd0000        	call	_GPIO_Init
 282  000a 85            	popw	x
 283                     ; 84 	GPIO_Init(GPIOB,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 285  000b 4b40          	push	#64
 286  000d 4bff          	push	#255
 287  000f ae5005        	ldw	x,#20485
 288  0012 cd0000        	call	_GPIO_Init
 290  0015 85            	popw	x
 291                     ; 85 	GPIO_Init(GPIOC,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 293  0016 4b40          	push	#64
 294  0018 4bff          	push	#255
 295  001a ae500a        	ldw	x,#20490
 296  001d cd0000        	call	_GPIO_Init
 298  0020 85            	popw	x
 299                     ; 86 	GPIO_Init(GPIOD,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);	
 301  0021 4b40          	push	#64
 302  0023 4bff          	push	#255
 303  0025 ae500f        	ldw	x,#20495
 304  0028 cd0000        	call	_GPIO_Init
 306  002b 85            	popw	x
 307                     ; 87 }
 310  002c 81            	ret	
 335                     ; 89 void CLK_Config(void)
 335                     ; 90 {
 336                     .text:	section	.text,new
 337  0000               _CLK_Config:
 341                     ; 91   CLK_DeInit();  
 343  0000 cd0000        	call	_CLK_DeInit
 345                     ; 93 	CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV2);
 347  0003 a608          	ld	a,#8
 349                     ; 95 }
 352  0005 cc0000        	jp	_CLK_SYSCLKConfig
 384                     ; 96 void 	Timer_Config(void)
 384                     ; 97 {
 385                     .text:	section	.text,new
 386  0000               _Timer_Config:
 390                     ; 99 	TIM1_DeInit();
 392  0000 cd0000        	call	_TIM1_DeInit
 394                     ; 100 	TIM1_TimeBaseInit(	0,																	//不分频，即8MHZ
 394                     ; 101 											TIM1_COUNTERMODE_CENTERALIGNED1 ,		//中央对齐模式
 394                     ; 102 											200,																//设置输出频率 20K
 394                     ; 103 											0);																	//重复计数器
 396  0003 4b00          	push	#0
 397  0005 ae00c8        	ldw	x,#200
 398  0008 89            	pushw	x
 399  0009 4b20          	push	#32
 400  000b 5f            	clrw	x
 401  000c cd0000        	call	_TIM1_TimeBaseInit
 403  000f 5b04          	addw	sp,#4
 404                     ; 104 	TIM1_OC3Init(	TIM1_OCMODE_PWM2,													//TIM1_CNT<TIM1_CCR1时为无效电平
 404                     ; 105 								TIM1_OUTPUTSTATE_ENABLE, 									//OC3信号输出到引脚
 404                     ; 106 								TIM1_OUTPUTNSTATE_DISABLE,								//
 404                     ; 107 								Timer1_Period,														//设置占空比
 404                     ; 108 								TIM1_OCPOLARITY_LOW,											//OC1高电平有效
 404                     ; 109 								TIM1_OCNPOLARITY_LOW,
 404                     ; 110 								TIM1_OCIDLESTATE_RESET,										//空闲状态OC1=0							
 404                     ; 111 								
 404                     ; 112 								TIM1_OCNIDLESTATE_RESET);
 406  0011 4b00          	push	#0
 407  0013 4b00          	push	#0
 408  0015 4b88          	push	#136
 409  0017 4b22          	push	#34
 410  0019 b601          	ld	a,_Timer1_Period
 411  001b 5f            	clrw	x
 412  001c 97            	ld	xl,a
 413  001d 89            	pushw	x
 414  001e 4b00          	push	#0
 415  0020 ae7011        	ldw	x,#28689
 416  0023 cd0000        	call	_TIM1_OC3Init
 418  0026 5b07          	addw	sp,#7
 419                     ; 122 	TIM4_TimeBaseInit(TIM4_PRESCALER_32,249);	//1ms---(x-1)*32=8000
 421  0028 ae05f9        	ldw	x,#1529
 422  002b cd0000        	call	_TIM4_TimeBaseInit
 424                     ; 124   TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 426  002e a601          	ld	a,#1
 427  0030 cd0000        	call	_TIM4_ClearFlag
 429                     ; 126   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);  
 431  0033 ae0101        	ldw	x,#257
 432  0036 cd0000        	call	_TIM4_ITConfig
 434                     ; 128   enableInterrupts();
 437  0039 9a            	rim	
 439                     ; 131   TIM4_Cmd(ENABLE);
 442  003a a601          	ld	a,#1
 444                     ; 135 }
 447  003c cc0000        	jp	_TIM4_Cmd
 489                     	xdef	_main
 490                     	xdef	_Tasks_1ms_TimeCritical
 491                     	xdef	_TimeCounters_10ms
 492                     	xdef	_TimeCounters_1ms
 493                     	xdef	_Timer_Config
 494                     	xdef	_CLK_Config
 495                     	xdef	_GPIO_Config_SystemOn
 496                     	xdef	_Timer1_Period
 497                     	switch	.ubsct
 498  0000               _TCnt_10ms:
 499  0000 00            	ds.b	1
 500                     	xdef	_TCnt_10ms
 501                     	xdef	_Timebase_cnt
 502                     	xref	_Alarm
 503                     	xref	_MT_Control
 504                     	xref	_Key_Scan
 505                     	xref	_Sensor_OA_Scan
 506                     	xref	_Motor_Init
 507                     	xref.b	_pt_Alarm_Speaker_cnt
 508                     	xref.b	_pt_Keyscan_cnt
 509                     	xref.b	_Indcator_cnt
 510                     	xref	_TIM4_ClearFlag
 511                     	xref	_TIM4_ITConfig
 512                     	xref	_TIM4_Cmd
 513                     	xref	_TIM4_TimeBaseInit
 514                     	xref	_TIM1_OC3Init
 515                     	xref	_TIM1_TimeBaseInit
 516                     	xref	_TIM1_DeInit
 517                     	xref	_GPIO_Init
 518                     	xref	_CLK_SYSCLKConfig
 519                     	xref	_CLK_DeInit
 539                     	end
