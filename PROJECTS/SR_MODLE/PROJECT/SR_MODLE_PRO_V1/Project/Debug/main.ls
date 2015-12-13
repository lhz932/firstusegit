   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
  21                     	bsct
  22  0000               _Timebase_cnt:
  23  0000 00            	dc.b	0
  24  0001               _Timer1_Period:
  25  0001 96            	dc.b	150
  55                     ; 28 void Tasks_1ms_TimeCritical(void)
  55                     ; 29 {
  57                     .text:	section	.text,new
  58  0000               _Tasks_1ms_TimeCritical:
  62                     ; 31 }
  65  0000 81            	ret	
  91                     ; 33 void TimeCounters_1ms(void)
  91                     ; 34 {
  92                     .text:	section	.text,new
  93  0000               _TimeCounters_1ms:
  97                     ; 35 	if(Timebase_cnt>0)
  99  0000 3d00          	tnz	_Timebase_cnt
 100  0002 2706          	jreq	L13
 101                     ; 37 		Timebase_cnt--;
 103  0004 3a00          	dec	_Timebase_cnt
 104                     ; 38 		TCnt_10ms++;
 106  0006 3c00          	inc	_TCnt_10ms
 107                     ; 41 		pt_Keyscan_cnt++;
 109  0008 3c00          	inc	_pt_Keyscan_cnt
 110  000a               L13:
 111                     ; 45 }
 114  000a 81            	ret	
 142                     ; 47 void TimeCounters_10ms(void)
 142                     ; 48 {
 143                     .text:	section	.text,new
 144  0000               _TimeCounters_10ms:
 148                     ; 49 	if(TCnt_10ms>9)
 150  0000 b600          	ld	a,_TCnt_10ms
 151  0002 a00a          	sub	a,#10
 152  0004 250c          	jrult	L34
 153                     ; 51 		TCnt_10ms-=10;
 155  0006 b700          	ld	_TCnt_10ms,a
 156                     ; 54 		Indcator_cnt++;
 158  0008 3c00          	inc	_Indcator_cnt
 159                     ; 55 		pt_Alarm_Speaker_cnt++;
 161  000a 3c00          	inc	_pt_Alarm_Speaker_cnt
 162                     ; 58 		Sensor_OA_Scan();
 164  000c cd0000        	call	_Sensor_OA_Scan
 166                     ; 59 		MT_Control();
 168  000f cd0000        	call	_MT_Control
 170  0012               L34:
 171                     ; 62 }
 174  0012 81            	ret	
 205                     ; 64 main()
 205                     ; 65 {
 206                     .text:	section	.text,new
 207  0000               _main:
 211                     ; 66 	GPIO_Config_SystemOn();
 213  0000 cd0000        	call	_GPIO_Config_SystemOn
 215                     ; 67 	CLK_Config();	//Configure the Fcpu to 8MHz,Fmaster=8MHz	
 217  0003 cd0000        	call	_CLK_Config
 219                     ; 68 	Timer_Config();
 221  0006 cd0000        	call	_Timer_Config
 223                     ; 69 	Motor_Init();
 225  0009 cd0000        	call	_Motor_Init
 227  000c               L55:
 228                     ; 75 			TimeCounters_1ms();
 230  000c cd0000        	call	_TimeCounters_1ms
 232                     ; 76 			TimeCounters_10ms();
 234  000f cd0000        	call	_TimeCounters_10ms
 236                     ; 80 			Key_Scan();
 238  0012 cd0000        	call	_Key_Scan
 240                     ; 81 			Alarm();
 242  0015 cd0000        	call	_Alarm
 245  0018 20f2          	jra	L55
 270                     ; 87 void GPIO_Config_SystemOn(void)
 270                     ; 88 {
 271                     .text:	section	.text,new
 272  0000               _GPIO_Config_SystemOn:
 276                     ; 90 	GPIO_Init(GPIOA,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 278  0000 4b40          	push	#64
 279  0002 4bff          	push	#255
 280  0004 ae5000        	ldw	x,#20480
 281  0007 cd0000        	call	_GPIO_Init
 283  000a 85            	popw	x
 284                     ; 91 	GPIO_Init(GPIOB,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 286  000b 4b40          	push	#64
 287  000d 4bff          	push	#255
 288  000f ae5005        	ldw	x,#20485
 289  0012 cd0000        	call	_GPIO_Init
 291  0015 85            	popw	x
 292                     ; 92 	GPIO_Init(GPIOC,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 294  0016 4b40          	push	#64
 295  0018 4bff          	push	#255
 296  001a ae500a        	ldw	x,#20490
 297  001d cd0000        	call	_GPIO_Init
 299  0020 85            	popw	x
 300                     ; 93 	GPIO_Init(GPIOD,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);	
 302  0021 4b40          	push	#64
 303  0023 4bff          	push	#255
 304  0025 ae500f        	ldw	x,#20495
 305  0028 cd0000        	call	_GPIO_Init
 307  002b 85            	popw	x
 308                     ; 94 }
 311  002c 81            	ret	
 336                     ; 96 void CLK_Config(void)
 336                     ; 97 {
 337                     .text:	section	.text,new
 338  0000               _CLK_Config:
 342                     ; 98   CLK_DeInit();  
 344  0000 cd0000        	call	_CLK_DeInit
 346                     ; 100 	CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV2);
 348  0003 a608          	ld	a,#8
 350                     ; 102 }
 353  0005 cc0000        	jp	_CLK_SYSCLKConfig
 390                     ; 103 void 	Timer_Config(void)
 390                     ; 104 {
 391                     .text:	section	.text,new
 392  0000               _Timer_Config:
 396                     ; 106 	TIM1_DeInit();
 398  0000 cd0000        	call	_TIM1_DeInit
 400                     ; 107 	TIM1_TimeBaseInit(	0,																	//不分频，即8MHZ
 400                     ; 108 											TIM1_COUNTERMODE_CENTERALIGNED1 ,		//中央对齐模式
 400                     ; 109 											200,																//设置输出频率 20K
 400                     ; 110 											0);																	//重复计数器
 402  0003 4b00          	push	#0
 403  0005 ae00c8        	ldw	x,#200
 404  0008 89            	pushw	x
 405  0009 4b20          	push	#32
 406  000b 5f            	clrw	x
 407  000c cd0000        	call	_TIM1_TimeBaseInit
 409  000f 5b04          	addw	sp,#4
 410                     ; 111 	TIM1_OC3Init(	TIM1_OCMODE_PWM2,													//TIM1_CNT<TIM1_CCR1时为无效电平
 410                     ; 112 								TIM1_OUTPUTSTATE_ENABLE, 									//OC3信号输出到引脚
 410                     ; 113 								TIM1_OUTPUTNSTATE_DISABLE,								//
 410                     ; 114 								Timer1_Period,														//设置占空比
 410                     ; 115 								TIM1_OCPOLARITY_LOW,											//OC1高电平有效
 410                     ; 116 								TIM1_OCNPOLARITY_LOW,
 410                     ; 117 								TIM1_OCIDLESTATE_RESET,										//空闲状态OC1=0							
 410                     ; 118 								
 410                     ; 119 								TIM1_OCNIDLESTATE_RESET);
 412  0011 4b00          	push	#0
 413  0013 4b00          	push	#0
 414  0015 4b88          	push	#136
 415  0017 4b22          	push	#34
 416  0019 b601          	ld	a,_Timer1_Period
 417  001b 5f            	clrw	x
 418  001c 97            	ld	xl,a
 419  001d 89            	pushw	x
 420  001e 4b00          	push	#0
 421  0020 ae7011        	ldw	x,#28689
 422  0023 cd0000        	call	_TIM1_OC3Init
 424  0026 5b07          	addw	sp,#7
 425                     ; 124 	TIM2_DeInit();
 427  0028 cd0000        	call	_TIM2_DeInit
 429                     ; 126 	TIM2_TimeBaseInit(TIM2_PRESCALER_64, 65535);	//timer2的时钟：125KHZ
 431  002b aeffff        	ldw	x,#65535
 432  002e 89            	pushw	x
 433  002f a606          	ld	a,#6
 434  0031 cd0000        	call	_TIM2_TimeBaseInit
 436  0034 85            	popw	x
 437                     ; 127 	TIM2_ICInit(TIM2_CHANNEL_3,										//
 437                     ; 128 							TIM2_ICPOLARITY_FALLING,					//下降沿捕获
 437                     ; 129 							TIM2_ICSELECTION_DIRECTTI,	//CC1 channel is configured as input, IC1 is mapped on TI1FP1
 437                     ; 130 							TIM2_ICPSC_DIV1,	//No prescaler, capture is made each time an edge is detected on the capture input
 437                     ; 131 							3);																//滤波采样8次
 439  0035 4b03          	push	#3
 440  0037 4b00          	push	#0
 441  0039 4b01          	push	#1
 442  003b ae0244        	ldw	x,#580
 443  003e cd0000        	call	_TIM2_ICInit
 445  0041 5b03          	addw	sp,#3
 446                     ; 133 	TIM2_ITConfig(TIM2_IT_CC3|TIM2_IT_UPDATE,ENABLE);	//使能更新中断和捕获中断
 448  0043 ae0901        	ldw	x,#2305
 449  0046 cd0000        	call	_TIM2_ITConfig
 451                     ; 134 	TIM2_Cmd(ENABLE);
 453  0049 a601          	ld	a,#1
 454  004b cd0000        	call	_TIM2_Cmd
 456                     ; 139 	TIM4_TimeBaseInit(TIM4_PRESCALER_32,249);	//1ms---(x-1)*32=8000
 458  004e ae05f9        	ldw	x,#1529
 459  0051 cd0000        	call	_TIM4_TimeBaseInit
 461                     ; 141   TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 463  0054 a601          	ld	a,#1
 464  0056 cd0000        	call	_TIM4_ClearFlag
 466                     ; 143   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);  
 468  0059 ae0101        	ldw	x,#257
 469  005c cd0000        	call	_TIM4_ITConfig
 471                     ; 145   enableInterrupts();
 474  005f 9a            	rim	
 476                     ; 148   TIM4_Cmd(ENABLE);
 479  0060 a601          	ld	a,#1
 481                     ; 152 }
 484  0062 cc0000        	jp	_TIM4_Cmd
 526                     	xdef	_main
 527                     	xdef	_Tasks_1ms_TimeCritical
 528                     	xdef	_TimeCounters_10ms
 529                     	xdef	_TimeCounters_1ms
 530                     	xdef	_Timer_Config
 531                     	xdef	_CLK_Config
 532                     	xdef	_GPIO_Config_SystemOn
 533                     	xdef	_Timer1_Period
 534                     	switch	.ubsct
 535  0000               _TCnt_10ms:
 536  0000 00            	ds.b	1
 537                     	xdef	_TCnt_10ms
 538                     	xdef	_Timebase_cnt
 539                     	xref	_Alarm
 540                     	xref	_MT_Control
 541                     	xref	_Key_Scan
 542                     	xref	_Sensor_OA_Scan
 543                     	xref	_Motor_Init
 544                     	xref.b	_pt_Alarm_Speaker_cnt
 545                     	xref.b	_pt_Keyscan_cnt
 546                     	xref.b	_Indcator_cnt
 547                     	xref	_TIM4_ClearFlag
 548                     	xref	_TIM4_ITConfig
 549                     	xref	_TIM4_Cmd
 550                     	xref	_TIM4_TimeBaseInit
 551                     	xref	_TIM2_ITConfig
 552                     	xref	_TIM2_Cmd
 553                     	xref	_TIM2_ICInit
 554                     	xref	_TIM2_TimeBaseInit
 555                     	xref	_TIM2_DeInit
 556                     	xref	_TIM1_OC3Init
 557                     	xref	_TIM1_TimeBaseInit
 558                     	xref	_TIM1_DeInit
 559                     	xref	_GPIO_Init
 560                     	xref	_CLK_SYSCLKConfig
 561                     	xref	_CLK_DeInit
 581                     	end
