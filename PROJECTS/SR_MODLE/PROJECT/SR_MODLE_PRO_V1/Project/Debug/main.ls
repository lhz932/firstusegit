   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
  21                     	bsct
  22  0000               _Timebase_cnt:
  23  0000 00            	dc.b	0
  24  0001               _Timer1_Period:
  25  0001 8c            	dc.b	140
  55                     ; 29 void Tasks_1ms_TimeCritical(void)
  55                     ; 30 {
  57                     .text:	section	.text,new
  58  0000               _Tasks_1ms_TimeCritical:
  62                     ; 32 }
  65  0000 81            	ret	
  91                     ; 34 void TimeCounters_1ms(void)
  91                     ; 35 {
  92                     .text:	section	.text,new
  93  0000               _TimeCounters_1ms:
  97                     ; 36 	if(Timebase_cnt>0)
  99  0000 3d00          	tnz	_Timebase_cnt
 100  0002 2706          	jreq	L13
 101                     ; 38 		Timebase_cnt--;
 103  0004 3a00          	dec	_Timebase_cnt
 104                     ; 39 		TCnt_10ms++;
 106  0006 3c00          	inc	_TCnt_10ms
 107                     ; 42 		pt_Keyscan_cnt++;
 109  0008 3c00          	inc	_pt_Keyscan_cnt
 110  000a               L13:
 111                     ; 46 }
 114  000a 81            	ret	
 142                     ; 48 void TimeCounters_10ms(void)
 142                     ; 49 {
 143                     .text:	section	.text,new
 144  0000               _TimeCounters_10ms:
 148                     ; 50 	if(TCnt_10ms>9)
 150  0000 b600          	ld	a,_TCnt_10ms
 151  0002 a00a          	sub	a,#10
 152  0004 250c          	jrult	L34
 153                     ; 52 		TCnt_10ms-=10;
 155  0006 b700          	ld	_TCnt_10ms,a
 156                     ; 55 		Indcator_cnt++;
 158  0008 3c00          	inc	_Indcator_cnt
 159                     ; 56 		pt_Alarm_Speaker_cnt++;
 161  000a 3c00          	inc	_pt_Alarm_Speaker_cnt
 162                     ; 59 		Sensor_OA_Scan();
 164  000c cd0000        	call	_Sensor_OA_Scan
 166                     ; 60 		MT_Control();
 168  000f cd0000        	call	_MT_Control
 170  0012               L34:
 171                     ; 63 }
 174  0012 81            	ret	
 206                     ; 65 main()
 206                     ; 66 {	
 207                     .text:	section	.text,new
 208  0000               _main:
 212                     ; 67 	GPIO_Config_SystemOn();
 214  0000 cd0000        	call	_GPIO_Config_SystemOn
 216                     ; 68 	CLK_Config();	//Configure the Fcpu to 8MHz,Fmaster=8MHz	
 218  0003 cd0000        	call	_CLK_Config
 220                     ; 69 	Timer_Config();
 222  0006 cd0000        	call	_Timer_Config
 224                     ; 70 	Motor_Init();
 226  0009 cd0000        	call	_Motor_Init
 228                     ; 71 	Comm_Init();
 230  000c cd0000        	call	_Comm_Init
 232  000f               L55:
 233                     ; 76 			TimeCounters_1ms();
 235  000f cd0000        	call	_TimeCounters_1ms
 237                     ; 77 			TimeCounters_10ms();
 239  0012 cd0000        	call	_TimeCounters_10ms
 241                     ; 81 			Key_Scan();
 243  0015 cd0000        	call	_Key_Scan
 245                     ; 82 			Alarm();
 247  0018 cd0000        	call	_Alarm
 250  001b 20f2          	jra	L55
 275                     ; 88 void GPIO_Config_SystemOn(void)
 275                     ; 89 {
 276                     .text:	section	.text,new
 277  0000               _GPIO_Config_SystemOn:
 281                     ; 91 	GPIO_Init(GPIOA,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 283  0000 4b40          	push	#64
 284  0002 4bff          	push	#255
 285  0004 ae5000        	ldw	x,#20480
 286  0007 cd0000        	call	_GPIO_Init
 288  000a 85            	popw	x
 289                     ; 92 	GPIO_Init(GPIOB,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 291  000b 4b40          	push	#64
 292  000d 4bff          	push	#255
 293  000f ae5005        	ldw	x,#20485
 294  0012 cd0000        	call	_GPIO_Init
 296  0015 85            	popw	x
 297                     ; 93 	GPIO_Init(GPIOC,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 299  0016 4b40          	push	#64
 300  0018 4bff          	push	#255
 301  001a ae500a        	ldw	x,#20490
 302  001d cd0000        	call	_GPIO_Init
 304  0020 85            	popw	x
 305                     ; 94 	GPIO_Init(GPIOD,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);	
 307  0021 4b40          	push	#64
 308  0023 4bff          	push	#255
 309  0025 ae500f        	ldw	x,#20495
 310  0028 cd0000        	call	_GPIO_Init
 312  002b 85            	popw	x
 313                     ; 95 }
 316  002c 81            	ret	
 341                     ; 97 void CLK_Config(void)
 341                     ; 98 {
 342                     .text:	section	.text,new
 343  0000               _CLK_Config:
 347                     ; 99   CLK_DeInit();  
 349  0000 cd0000        	call	_CLK_DeInit
 351                     ; 101 	CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV2);
 353  0003 a608          	ld	a,#8
 355                     ; 103 }
 358  0005 cc0000        	jp	_CLK_SYSCLKConfig
 397                     ; 104 void 	Timer_Config(void)
 397                     ; 105 {
 398                     .text:	section	.text,new
 399  0000               _Timer_Config:
 403                     ; 107 	TIM1_DeInit();
 405  0000 cd0000        	call	_TIM1_DeInit
 407                     ; 108 	TIM1_TimeBaseInit(	0,																	//不分频，即8MHZ
 407                     ; 109 											TIM1_COUNTERMODE_CENTERALIGNED1 ,		//中央对齐模式
 407                     ; 110 											200,																//设置输出频率 20KHZ
 407                     ; 111 											3);																	//重复计数器，每两个周期产生一次更新，频率为10KHZ。此功能用于红外通讯模块
 409  0003 4b03          	push	#3
 410  0005 ae00c8        	ldw	x,#200
 411  0008 89            	pushw	x
 412  0009 4b20          	push	#32
 413  000b 5f            	clrw	x
 414  000c cd0000        	call	_TIM1_TimeBaseInit
 416  000f 5b04          	addw	sp,#4
 417                     ; 112 	TIM1_OC3Init(	TIM1_OCMODE_PWM2,													//TIM1_CNT<TIM1_CCR1时为无效电平
 417                     ; 113 								TIM1_OUTPUTSTATE_DISABLE, 									//OC3信号输出到引脚(这里先禁用输出)
 417                     ; 114 								TIM1_OUTPUTNSTATE_DISABLE,								//
 417                     ; 115 								Timer1_Period,														//设置占空比
 417                     ; 116 								TIM1_OCPOLARITY_LOW,											//OC1高电平有效
 417                     ; 117 								TIM1_OCNPOLARITY_LOW,
 417                     ; 118 								TIM1_OCIDLESTATE_RESET,										//空闲状态OC1=0							
 417                     ; 119 								
 417                     ; 120 								TIM1_OCNIDLESTATE_RESET);
 419  0011 4b00          	push	#0
 420  0013 4b00          	push	#0
 421  0015 4b88          	push	#136
 422  0017 4b22          	push	#34
 423  0019 b601          	ld	a,_Timer1_Period
 424  001b 5f            	clrw	x
 425  001c 97            	ld	xl,a
 426  001d 89            	pushw	x
 427  001e 4b00          	push	#0
 428  0020 ae7000        	ldw	x,#28672
 429  0023 cd0000        	call	_TIM1_OC3Init
 431  0026 5b07          	addw	sp,#7
 432                     ; 121 	 TIM1_Cmd(ENABLE);																			//使能计数器
 434  0028 a601          	ld	a,#1
 435  002a cd0000        	call	_TIM1_Cmd
 437                     ; 122 	 TIM1_CtrlPWMOutputs(ENABLE);														// TIM1 Main Output Enable
 439  002d a601          	ld	a,#1
 440  002f cd0000        	call	_TIM1_CtrlPWMOutputs
 442                     ; 125 	TIM2_DeInit();
 444  0032 cd0000        	call	_TIM2_DeInit
 446                     ; 127 	TIM2_TimeBaseInit(TIM2_PRESCALER_64, 65535);	//timer2的时钟：125KHZ
 448  0035 aeffff        	ldw	x,#65535
 449  0038 89            	pushw	x
 450  0039 a606          	ld	a,#6
 451  003b cd0000        	call	_TIM2_TimeBaseInit
 453  003e 85            	popw	x
 454                     ; 128 	TIM2_ICInit(TIM2_CHANNEL_3,										//
 454                     ; 129 							TIM2_ICPOLARITY_FALLING,					//下降沿捕获
 454                     ; 130 							TIM2_ICSELECTION_DIRECTTI,	//CC1 channel is configured as input, IC1 is mapped on TI1FP1
 454                     ; 131 							TIM2_ICPSC_DIV1,	//No prescaler, capture is made each time an edge is detected on the capture input
 454                     ; 132 							3);																//滤波采样8次
 456  003f 4b03          	push	#3
 457  0041 4b00          	push	#0
 458  0043 4b01          	push	#1
 459  0045 ae0244        	ldw	x,#580
 460  0048 cd0000        	call	_TIM2_ICInit
 462  004b 5b03          	addw	sp,#3
 463                     ; 134 	TIM2_ITConfig(TIM2_IT_CC3|TIM2_IT_UPDATE,ENABLE);	//使能更新中断和捕获中断
 465  004d ae0901        	ldw	x,#2305
 466  0050 cd0000        	call	_TIM2_ITConfig
 468                     ; 135 	TIM2_Cmd(ENABLE);
 470  0053 a601          	ld	a,#1
 471  0055 cd0000        	call	_TIM2_Cmd
 473                     ; 140 	TIM4_TimeBaseInit(TIM4_PRESCALER_32,249);	//1ms---(x-1)*32=8000
 475  0058 ae05f9        	ldw	x,#1529
 476  005b cd0000        	call	_TIM4_TimeBaseInit
 478                     ; 142   TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 480  005e a601          	ld	a,#1
 481  0060 cd0000        	call	_TIM4_ClearFlag
 483                     ; 144   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);  
 485  0063 ae0101        	ldw	x,#257
 486  0066 cd0000        	call	_TIM4_ITConfig
 488                     ; 146   enableInterrupts();
 491  0069 9a            	rim	
 493                     ; 149   TIM4_Cmd(ENABLE);
 496  006a a601          	ld	a,#1
 498                     ; 153 }
 501  006c cc0000        	jp	_TIM4_Cmd
 543                     	xdef	_main
 544                     	xdef	_Tasks_1ms_TimeCritical
 545                     	xdef	_TimeCounters_10ms
 546                     	xdef	_TimeCounters_1ms
 547                     	xdef	_Timer_Config
 548                     	xdef	_CLK_Config
 549                     	xdef	_GPIO_Config_SystemOn
 550                     	xdef	_Timer1_Period
 551                     	switch	.ubsct
 552  0000               _TCnt_10ms:
 553  0000 00            	ds.b	1
 554                     	xdef	_TCnt_10ms
 555                     	xdef	_Timebase_cnt
 556                     	xref	_Comm_Init
 557                     	xref	_Alarm
 558                     	xref	_MT_Control
 559                     	xref	_Key_Scan
 560                     	xref	_Sensor_OA_Scan
 561                     	xref	_Motor_Init
 562                     	xref.b	_pt_Alarm_Speaker_cnt
 563                     	xref.b	_pt_Keyscan_cnt
 564                     	xref.b	_Indcator_cnt
 565                     	xref	_TIM4_ClearFlag
 566                     	xref	_TIM4_ITConfig
 567                     	xref	_TIM4_Cmd
 568                     	xref	_TIM4_TimeBaseInit
 569                     	xref	_TIM2_ITConfig
 570                     	xref	_TIM2_Cmd
 571                     	xref	_TIM2_ICInit
 572                     	xref	_TIM2_TimeBaseInit
 573                     	xref	_TIM2_DeInit
 574                     	xref	_TIM1_CtrlPWMOutputs
 575                     	xref	_TIM1_Cmd
 576                     	xref	_TIM1_OC3Init
 577                     	xref	_TIM1_TimeBaseInit
 578                     	xref	_TIM1_DeInit
 579                     	xref	_GPIO_Init
 580                     	xref	_CLK_SYSCLKConfig
 581                     	xref	_CLK_DeInit
 601                     	end
