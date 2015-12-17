   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
  16                     	bsct
  17  0000               _Timebase_cnt:
  18  0000 00            	dc.b	0
  19  0001               _Timer1_Period:
  20  0001 96            	dc.b	150
  50                     ; 29 void Tasks_1ms_TimeCritical(void)
  50                     ; 30 {
  52                     	switch	.text
  53  0000               _Tasks_1ms_TimeCritical:
  57                     ; 32 }
  60  0000 81            	ret
  86                     ; 34 void TimeCounters_1ms(void)
  86                     ; 35 {
  87                     	switch	.text
  88  0001               _TimeCounters_1ms:
  92                     ; 36 	if(Timebase_cnt>0)
  94  0001 3d00          	tnz	_Timebase_cnt
  95  0003 2706          	jreq	L13
  96                     ; 38 		Timebase_cnt--;
  98  0005 3a00          	dec	_Timebase_cnt
  99                     ; 39 		TCnt_10ms++;
 101  0007 3c00          	inc	_TCnt_10ms
 102                     ; 42 		pt_Keyscan_cnt++;
 104  0009 3c00          	inc	_pt_Keyscan_cnt
 105  000b               L13:
 106                     ; 46 }
 109  000b 81            	ret
 137                     ; 48 void TimeCounters_10ms(void)
 137                     ; 49 {
 138                     	switch	.text
 139  000c               _TimeCounters_10ms:
 143                     ; 50 	if(TCnt_10ms>9)
 145  000c b600          	ld	a,_TCnt_10ms
 146  000e a10a          	cp	a,#10
 147  0010 2510          	jrult	L34
 148                     ; 52 		TCnt_10ms-=10;
 150  0012 b600          	ld	a,_TCnt_10ms
 151  0014 a00a          	sub	a,#10
 152  0016 b700          	ld	_TCnt_10ms,a
 153                     ; 55 		Indcator_cnt++;
 155  0018 3c00          	inc	_Indcator_cnt
 156                     ; 56 		pt_Alarm_Speaker_cnt++;
 158  001a 3c00          	inc	_pt_Alarm_Speaker_cnt
 159                     ; 59 		Sensor_OA_Scan();
 161  001c cd0000        	call	_Sensor_OA_Scan
 163                     ; 60 		MT_Control();
 165  001f cd0000        	call	_MT_Control
 167  0022               L34:
 168                     ; 63 }
 171  0022 81            	ret
 203                     ; 65 main()
 203                     ; 66 {
 204                     	switch	.text
 205  0023               _main:
 209                     ; 67 	GPIO_Config_SystemOn();
 211  0023 ad16          	call	_GPIO_Config_SystemOn
 213                     ; 68 	CLK_Config();	//Configure the Fcpu to 8MHz,Fmaster=8MHz	
 215  0025 ad41          	call	_CLK_Config
 217                     ; 69 	Timer_Config();
 219  0027 ad48          	call	_Timer_Config
 221                     ; 70 	Motor_Init();
 223  0029 cd0000        	call	_Motor_Init
 225                     ; 71 	Comm_Init();
 227  002c cd0000        	call	_Comm_Init
 229  002f               L55:
 230                     ; 76 			TimeCounters_1ms();
 232  002f add0          	call	_TimeCounters_1ms
 234                     ; 77 			TimeCounters_10ms();
 236  0031 add9          	call	_TimeCounters_10ms
 238                     ; 81 			Key_Scan();
 240  0033 cd0000        	call	_Key_Scan
 242                     ; 82 			Alarm();
 244  0036 cd0000        	call	_Alarm
 247  0039 20f4          	jra	L55
 272                     ; 88 void GPIO_Config_SystemOn(void)
 272                     ; 89 {
 273                     	switch	.text
 274  003b               _GPIO_Config_SystemOn:
 278                     ; 91 	GPIO_Init(GPIOA,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 280  003b 4b40          	push	#64
 281  003d 4bff          	push	#255
 282  003f ae5000        	ldw	x,#20480
 283  0042 cd0000        	call	_GPIO_Init
 285  0045 85            	popw	x
 286                     ; 92 	GPIO_Init(GPIOB,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 288  0046 4b40          	push	#64
 289  0048 4bff          	push	#255
 290  004a ae5005        	ldw	x,#20485
 291  004d cd0000        	call	_GPIO_Init
 293  0050 85            	popw	x
 294                     ; 93 	GPIO_Init(GPIOC,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 296  0051 4b40          	push	#64
 297  0053 4bff          	push	#255
 298  0055 ae500a        	ldw	x,#20490
 299  0058 cd0000        	call	_GPIO_Init
 301  005b 85            	popw	x
 302                     ; 94 	GPIO_Init(GPIOD,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);	
 304  005c 4b40          	push	#64
 305  005e 4bff          	push	#255
 306  0060 ae500f        	ldw	x,#20495
 307  0063 cd0000        	call	_GPIO_Init
 309  0066 85            	popw	x
 310                     ; 95 }
 313  0067 81            	ret
 338                     ; 97 void CLK_Config(void)
 338                     ; 98 {
 339                     	switch	.text
 340  0068               _CLK_Config:
 344                     ; 99   CLK_DeInit();  
 346  0068 cd0000        	call	_CLK_DeInit
 348                     ; 101 	CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV2);
 350  006b a608          	ld	a,#8
 351  006d cd0000        	call	_CLK_SYSCLKConfig
 353                     ; 103 }
 356  0070 81            	ret
 393                     ; 104 void 	Timer_Config(void)
 393                     ; 105 {
 394                     	switch	.text
 395  0071               _Timer_Config:
 399                     ; 107 	TIM1_DeInit();
 401  0071 cd0000        	call	_TIM1_DeInit
 403                     ; 108 	TIM1_TimeBaseInit(	0,																	//不分频，即8MHZ
 403                     ; 109 											TIM1_COUNTERMODE_CENTERALIGNED1 ,		//中央对齐模式
 403                     ; 110 											200,																//设置输出频率 20KHZ
 403                     ; 111 											3);																	//重复计数器，每两个周期产生一次更新，频率为10KHZ。此功能用于红外通讯模块
 405  0074 4b03          	push	#3
 406  0076 ae00c8        	ldw	x,#200
 407  0079 89            	pushw	x
 408  007a 4b20          	push	#32
 409  007c 5f            	clrw	x
 410  007d cd0000        	call	_TIM1_TimeBaseInit
 412  0080 5b04          	addw	sp,#4
 413                     ; 112 	TIM1_OC3Init(	TIM1_OCMODE_PWM2,													//TIM1_CNT<TIM1_CCR1时为无效电平
 413                     ; 113 								TIM1_OUTPUTSTATE_ENABLE, 									//OC3信号输出到引脚
 413                     ; 114 								TIM1_OUTPUTNSTATE_DISABLE,								//
 413                     ; 115 								Timer1_Period,														//设置占空比
 413                     ; 116 								TIM1_OCPOLARITY_LOW,											//OC1高电平有效
 413                     ; 117 								TIM1_OCNPOLARITY_LOW,
 413                     ; 118 								TIM1_OCIDLESTATE_RESET,										//空闲状态OC1=0							
 413                     ; 119 								
 413                     ; 120 								TIM1_OCNIDLESTATE_RESET);
 415  0082 4b00          	push	#0
 416  0084 4b00          	push	#0
 417  0086 4b88          	push	#136
 418  0088 4b22          	push	#34
 419  008a b601          	ld	a,_Timer1_Period
 420  008c 5f            	clrw	x
 421  008d 97            	ld	xl,a
 422  008e 89            	pushw	x
 423  008f 4b00          	push	#0
 424  0091 ae7011        	ldw	x,#28689
 425  0094 cd0000        	call	_TIM1_OC3Init
 427  0097 5b07          	addw	sp,#7
 428                     ; 125 	TIM2_DeInit();
 430  0099 cd0000        	call	_TIM2_DeInit
 432                     ; 127 	TIM2_TimeBaseInit(TIM2_PRESCALER_64, 65535);	//timer2的时钟：125KHZ
 434  009c aeffff        	ldw	x,#65535
 435  009f 89            	pushw	x
 436  00a0 a606          	ld	a,#6
 437  00a2 cd0000        	call	_TIM2_TimeBaseInit
 439  00a5 85            	popw	x
 440                     ; 128 	TIM2_ICInit(TIM2_CHANNEL_3,										//
 440                     ; 129 							TIM2_ICPOLARITY_FALLING,					//下降沿捕获
 440                     ; 130 							TIM2_ICSELECTION_DIRECTTI,	//CC1 channel is configured as input, IC1 is mapped on TI1FP1
 440                     ; 131 							TIM2_ICPSC_DIV1,	//No prescaler, capture is made each time an edge is detected on the capture input
 440                     ; 132 							3);																//滤波采样8次
 442  00a6 4b03          	push	#3
 443  00a8 4b00          	push	#0
 444  00aa 4b01          	push	#1
 445  00ac ae0244        	ldw	x,#580
 446  00af cd0000        	call	_TIM2_ICInit
 448  00b2 5b03          	addw	sp,#3
 449                     ; 134 	TIM2_ITConfig(TIM2_IT_CC3|TIM2_IT_UPDATE,ENABLE);	//使能更新中断和捕获中断
 451  00b4 ae0901        	ldw	x,#2305
 452  00b7 cd0000        	call	_TIM2_ITConfig
 454                     ; 135 	TIM2_Cmd(ENABLE);
 456  00ba a601          	ld	a,#1
 457  00bc cd0000        	call	_TIM2_Cmd
 459                     ; 140 	TIM4_TimeBaseInit(TIM4_PRESCALER_32,249);	//1ms---(x-1)*32=8000
 461  00bf ae05f9        	ldw	x,#1529
 462  00c2 cd0000        	call	_TIM4_TimeBaseInit
 464                     ; 142   TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 466  00c5 a601          	ld	a,#1
 467  00c7 cd0000        	call	_TIM4_ClearFlag
 469                     ; 144   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);  
 471  00ca ae0101        	ldw	x,#257
 472  00cd cd0000        	call	_TIM4_ITConfig
 474                     ; 146   enableInterrupts();
 477  00d0 9a            rim
 479                     ; 149   TIM4_Cmd(ENABLE);
 482  00d1 a601          	ld	a,#1
 483  00d3 cd0000        	call	_TIM4_Cmd
 485                     ; 153 }
 488  00d6 81            	ret
 530                     	xdef	_main
 531                     	xdef	_Tasks_1ms_TimeCritical
 532                     	xdef	_TimeCounters_10ms
 533                     	xdef	_TimeCounters_1ms
 534                     	xdef	_Timer_Config
 535                     	xdef	_CLK_Config
 536                     	xdef	_GPIO_Config_SystemOn
 537                     	xdef	_Timer1_Period
 538                     	switch	.ubsct
 539  0000               _TCnt_10ms:
 540  0000 00            	ds.b	1
 541                     	xdef	_TCnt_10ms
 542                     	xdef	_Timebase_cnt
 543                     	xref	_Comm_Init
 544                     	xref	_Alarm
 545                     	xref	_MT_Control
 546                     	xref	_Key_Scan
 547                     	xref	_Sensor_OA_Scan
 548                     	xref	_Motor_Init
 549                     	xref.b	_pt_Alarm_Speaker_cnt
 550                     	xref.b	_pt_Keyscan_cnt
 551                     	xref.b	_Indcator_cnt
 552                     	xref	_TIM4_ClearFlag
 553                     	xref	_TIM4_ITConfig
 554                     	xref	_TIM4_Cmd
 555                     	xref	_TIM4_TimeBaseInit
 556                     	xref	_TIM2_ITConfig
 557                     	xref	_TIM2_Cmd
 558                     	xref	_TIM2_ICInit
 559                     	xref	_TIM2_TimeBaseInit
 560                     	xref	_TIM2_DeInit
 561                     	xref	_TIM1_OC3Init
 562                     	xref	_TIM1_TimeBaseInit
 563                     	xref	_TIM1_DeInit
 564                     	xref	_GPIO_Init
 565                     	xref	_CLK_SYSCLKConfig
 566                     	xref	_CLK_DeInit
 586                     	end
