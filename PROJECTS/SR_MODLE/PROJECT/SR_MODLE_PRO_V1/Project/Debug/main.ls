   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
  20                     	bsct
  21  0000               _Timebase_cnt:
  22  0000 00            	dc.b	0
  23  0001               _Timer1_Period:
  24  0001 8c            	dc.b	140
  54                     ; 29 void Tasks_1ms_TimeCritical(void)
  54                     ; 30 {
  56                     .text:	section	.text,new
  57  0000               _Tasks_1ms_TimeCritical:
  61                     ; 32 }
  64  0000 81            	ret	
  90                     ; 34 void TimeCounters_1ms(void)
  90                     ; 35 {
  91                     .text:	section	.text,new
  92  0000               _TimeCounters_1ms:
  96                     ; 36 	if(Timebase_cnt>0)
  98  0000 3d00          	tnz	_Timebase_cnt
  99  0002 2706          	jreq	L13
 100                     ; 38 		Timebase_cnt--;
 102  0004 3a00          	dec	_Timebase_cnt
 103                     ; 39 		TCnt_10ms++;
 105  0006 3c00          	inc	_TCnt_10ms
 106                     ; 42 		pt_Keyscan_cnt++;
 108  0008 3c00          	inc	_pt_Keyscan_cnt
 109  000a               L13:
 110                     ; 46 }
 113  000a 81            	ret	
 141                     ; 48 void TimeCounters_10ms(void)
 141                     ; 49 {
 142                     .text:	section	.text,new
 143  0000               _TimeCounters_10ms:
 147                     ; 50 	if(TCnt_10ms>9)
 149  0000 b600          	ld	a,_TCnt_10ms
 150  0002 a00a          	sub	a,#10
 151  0004 250c          	jrult	L34
 152                     ; 52 		TCnt_10ms-=10;
 154  0006 b700          	ld	_TCnt_10ms,a
 155                     ; 55 		Indcator_cnt++;
 157  0008 3c00          	inc	_Indcator_cnt
 158                     ; 56 		pt_Alarm_Speaker_cnt++;
 160  000a 3c00          	inc	_pt_Alarm_Speaker_cnt
 161                     ; 59 		Sensor_OA_Scan();
 163  000c cd0000        	call	_Sensor_OA_Scan
 165                     ; 60 		MT_Control();
 167  000f cd0000        	call	_MT_Control
 169  0012               L34:
 170                     ; 63 }
 173  0012 81            	ret	
 205                     ; 65 main()
 205                     ; 66 {	
 206                     .text:	section	.text,new
 207  0000               _main:
 211                     ; 67 	GPIO_Config_SystemOn();
 213  0000 cd0000        	call	_GPIO_Config_SystemOn
 215                     ; 68 	CLK_Config();	//Configure the Fcpu to 8MHz,Fmaster=8MHz	
 217  0003 cd0000        	call	_CLK_Config
 219                     ; 69 	Timer_Config();
 221  0006 cd0000        	call	_Timer_Config
 223                     ; 70 	Motor_Init();
 225  0009 cd0000        	call	_Motor_Init
 227                     ; 71 	Comm_Init();
 229  000c cd0000        	call	_Comm_Init
 231  000f               L55:
 232                     ; 76 			TimeCounters_1ms();
 234  000f cd0000        	call	_TimeCounters_1ms
 236                     ; 77 			TimeCounters_10ms();
 238  0012 cd0000        	call	_TimeCounters_10ms
 240                     ; 81 			Key_Scan();
 242  0015 cd0000        	call	_Key_Scan
 244                     ; 82 			Alarm();
 246  0018 cd0000        	call	_Alarm
 249  001b 20f2          	jra	L55
 274                     ; 88 void GPIO_Config_SystemOn(void)
 274                     ; 89 {
 275                     .text:	section	.text,new
 276  0000               _GPIO_Config_SystemOn:
 280                     ; 91 	GPIO_Init(GPIOA,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 282  0000 4b40          	push	#64
 283  0002 4bff          	push	#255
 284  0004 ae5000        	ldw	x,#20480
 285  0007 cd0000        	call	_GPIO_Init
 287  000a 85            	popw	x
 288                     ; 92 	GPIO_Init(GPIOB,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 290  000b 4b40          	push	#64
 291  000d 4bff          	push	#255
 292  000f ae5005        	ldw	x,#20485
 293  0012 cd0000        	call	_GPIO_Init
 295  0015 85            	popw	x
 296                     ; 93 	GPIO_Init(GPIOC,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 298  0016 4b40          	push	#64
 299  0018 4bff          	push	#255
 300  001a ae500a        	ldw	x,#20490
 301  001d cd0000        	call	_GPIO_Init
 303  0020 85            	popw	x
 304                     ; 94 	GPIO_Init(GPIOD,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);	
 306  0021 4b40          	push	#64
 307  0023 4bff          	push	#255
 308  0025 ae500f        	ldw	x,#20495
 309  0028 cd0000        	call	_GPIO_Init
 311  002b 85            	popw	x
 312                     ; 95 }
 315  002c 81            	ret	
 340                     ; 97 void CLK_Config(void)
 340                     ; 98 {
 341                     .text:	section	.text,new
 342  0000               _CLK_Config:
 346                     ; 99   CLK_DeInit();  
 348  0000 cd0000        	call	_CLK_DeInit
 350                     ; 101 	CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV2);
 352  0003 a608          	ld	a,#8
 354                     ; 103 }
 357  0005 cc0000        	jp	_CLK_SYSCLKConfig
 396                     ; 104 void 	Timer_Config(void)
 396                     ; 105 {
 397                     .text:	section	.text,new
 398  0000               _Timer_Config:
 402                     ; 107 	TIM1_DeInit();
 404  0000 cd0000        	call	_TIM1_DeInit
 406                     ; 108 	TIM1_TimeBaseInit(	0,																	//不分频，即8MHZ
 406                     ; 109 											TIM1_COUNTERMODE_CENTERALIGNED1 ,		//中央对齐模式
 406                     ; 110 											200,																//设置输出频率 20KHZ
 406                     ; 111 											3);																	//重复计数器，每两个周期产生一次更新，频率为10KHZ。此功能用于红外通讯模块
 408  0003 4b03          	push	#3
 409  0005 ae00c8        	ldw	x,#200
 410  0008 89            	pushw	x
 411  0009 4b20          	push	#32
 412  000b 5f            	clrw	x
 413  000c cd0000        	call	_TIM1_TimeBaseInit
 415  000f 5b04          	addw	sp,#4
 416                     ; 112 	TIM1_OC3Init(	TIM1_OCMODE_PWM2,													//TIM1_CNT<TIM1_CCR1时为无效电平
 416                     ; 113 								TIM1_OUTPUTSTATE_DISABLE, 									//OC3信号输出到引脚(这里先禁用输出)
 416                     ; 114 								TIM1_OUTPUTNSTATE_DISABLE,								//
 416                     ; 115 								Timer1_Period,														//设置占空比
 416                     ; 116 								TIM1_OCPOLARITY_LOW,											//OC1高电平有效
 416                     ; 117 								TIM1_OCNPOLARITY_LOW,
 416                     ; 118 								TIM1_OCIDLESTATE_RESET,										//空闲状态OC1=0							
 416                     ; 119 								
 416                     ; 120 								TIM1_OCNIDLESTATE_RESET);
 418  0011 4b00          	push	#0
 419  0013 4b00          	push	#0
 420  0015 4b88          	push	#136
 421  0017 4b22          	push	#34
 422  0019 b601          	ld	a,_Timer1_Period
 423  001b 5f            	clrw	x
 424  001c 97            	ld	xl,a
 425  001d 89            	pushw	x
 426  001e 4b00          	push	#0
 427  0020 ae7000        	ldw	x,#28672
 428  0023 cd0000        	call	_TIM1_OC3Init
 430  0026 5b07          	addw	sp,#7
 431                     ; 121 	 TIM1_Cmd(ENABLE);																			//使能计数器
 433  0028 a601          	ld	a,#1
 434  002a cd0000        	call	_TIM1_Cmd
 436                     ; 122 	 TIM1_CtrlPWMOutputs(ENABLE);														// TIM1 Main Output Enable
 438  002d a601          	ld	a,#1
 439  002f cd0000        	call	_TIM1_CtrlPWMOutputs
 441                     ; 125 	TIM2_DeInit();
 443  0032 cd0000        	call	_TIM2_DeInit
 445                     ; 127 	TIM2_TimeBaseInit(TIM2_PRESCALER_64, 65535);	//timer2的时钟：125KHZ
 447  0035 aeffff        	ldw	x,#65535
 448  0038 89            	pushw	x
 449  0039 a606          	ld	a,#6
 450  003b cd0000        	call	_TIM2_TimeBaseInit
 452  003e 85            	popw	x
 453                     ; 128 	TIM2_ICInit(TIM2_CHANNEL_3,										//
 453                     ; 129 							TIM2_ICPOLARITY_FALLING,					//下降沿捕获
 453                     ; 130 							TIM2_ICSELECTION_DIRECTTI,	//CC1 channel is configured as input, IC1 is mapped on TI1FP1
 453                     ; 131 							TIM2_ICPSC_DIV1,	//No prescaler, capture is made each time an edge is detected on the capture input
 453                     ; 132 							3);																//滤波采样8次
 455  003f 4b03          	push	#3
 456  0041 4b00          	push	#0
 457  0043 4b01          	push	#1
 458  0045 ae0244        	ldw	x,#580
 459  0048 cd0000        	call	_TIM2_ICInit
 461  004b 5b03          	addw	sp,#3
 462                     ; 134 	TIM2_ITConfig(TIM2_IT_CC3|TIM2_IT_UPDATE,ENABLE);	//使能更新中断和捕获中断
 464  004d ae0901        	ldw	x,#2305
 465  0050 cd0000        	call	_TIM2_ITConfig
 467                     ; 135 	TIM2_Cmd(ENABLE);
 469  0053 a601          	ld	a,#1
 470  0055 cd0000        	call	_TIM2_Cmd
 472                     ; 140 	TIM4_TimeBaseInit(TIM4_PRESCALER_32,249);	//1ms---(x-1)*32=8000
 474  0058 ae05f9        	ldw	x,#1529
 475  005b cd0000        	call	_TIM4_TimeBaseInit
 477                     ; 142   TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 479  005e a601          	ld	a,#1
 480  0060 cd0000        	call	_TIM4_ClearFlag
 482                     ; 144   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);  
 484  0063 ae0101        	ldw	x,#257
 485  0066 cd0000        	call	_TIM4_ITConfig
 487                     ; 146   enableInterrupts();
 490  0069 9a            	rim	
 492                     ; 149   TIM4_Cmd(ENABLE);
 495  006a a601          	ld	a,#1
 497                     ; 153 }
 500  006c cc0000        	jp	_TIM4_Cmd
 542                     	xdef	_main
 543                     	xdef	_Tasks_1ms_TimeCritical
 544                     	xdef	_TimeCounters_10ms
 545                     	xdef	_TimeCounters_1ms
 546                     	xdef	_Timer_Config
 547                     	xdef	_CLK_Config
 548                     	xdef	_GPIO_Config_SystemOn
 549                     	xdef	_Timer1_Period
 550                     	switch	.ubsct
 551  0000               _TCnt_10ms:
 552  0000 00            	ds.b	1
 553                     	xdef	_TCnt_10ms
 554                     	xdef	_Timebase_cnt
 555                     	xref	_Comm_Init
 556                     	xref	_Alarm
 557                     	xref	_MT_Control
 558                     	xref	_Key_Scan
 559                     	xref	_Sensor_OA_Scan
 560                     	xref	_Motor_Init
 561                     	xref.b	_pt_Alarm_Speaker_cnt
 562                     	xref.b	_pt_Keyscan_cnt
 563                     	xref.b	_Indcator_cnt
 564                     	xref	_TIM4_ClearFlag
 565                     	xref	_TIM4_ITConfig
 566                     	xref	_TIM4_Cmd
 567                     	xref	_TIM4_TimeBaseInit
 568                     	xref	_TIM2_ITConfig
 569                     	xref	_TIM2_Cmd
 570                     	xref	_TIM2_ICInit
 571                     	xref	_TIM2_TimeBaseInit
 572                     	xref	_TIM2_DeInit
 573                     	xref	_TIM1_CtrlPWMOutputs
 574                     	xref	_TIM1_Cmd
 575                     	xref	_TIM1_OC3Init
 576                     	xref	_TIM1_TimeBaseInit
 577                     	xref	_TIM1_DeInit
 578                     	xref	_GPIO_Init
 579                     	xref	_CLK_SYSCLKConfig
 580                     	xref	_CLK_DeInit
 600                     	end
