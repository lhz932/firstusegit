   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
  16                     	bsct
  17  0000               _Timebase_cnt:
  18  0000 00            	dc.b	0
  19  0001               _Timer1_Pulse:
  20  0001 8c            	dc.b	140
  50                     ; 30 void Tasks_1ms_TimeCritical(void)
  50                     ; 31 {
  52                     	switch	.text
  53  0000               _Tasks_1ms_TimeCritical:
  57                     ; 33 }
  60  0000 81            	ret
  86                     ; 35 void TimeCounters_1ms(void)
  86                     ; 36 {
  87                     	switch	.text
  88  0001               _TimeCounters_1ms:
  92                     ; 37 	if(Timebase_cnt>0)
  94  0001 3d00          	tnz	_Timebase_cnt
  95  0003 2706          	jreq	L13
  96                     ; 39 		Timebase_cnt--;
  98  0005 3a00          	dec	_Timebase_cnt
  99                     ; 40 		TCnt_10ms++;
 101  0007 3c01          	inc	_TCnt_10ms
 102                     ; 43 		pt_Keyscan_cnt++;
 104  0009 3c00          	inc	_pt_Keyscan_cnt
 105  000b               L13:
 106                     ; 47 }
 109  000b 81            	ret
 112                     	switch	.ubsct
 113  0000               L33_i:
 114  0000 00            	ds.b	1
 152                     ; 49 void TimeCounters_10ms(void)
 152                     ; 50 {
 153                     	switch	.text
 154  000c               _TimeCounters_10ms:
 158                     ; 53 	if(TCnt_10ms>9)
 160  000c b601          	ld	a,_TCnt_10ms
 161  000e a10a          	cp	a,#10
 162  0010 251d          	jrult	L35
 163                     ; 55 		TCnt_10ms-=10;
 165  0012 b601          	ld	a,_TCnt_10ms
 166  0014 a00a          	sub	a,#10
 167  0016 b701          	ld	_TCnt_10ms,a
 168                     ; 58 		Indcator_cnt++;
 170  0018 3c00          	inc	_Indcator_cnt
 171                     ; 59 		pt_Alarm_Speaker_cnt++;
 173  001a 3c00          	inc	_pt_Alarm_Speaker_cnt
 174                     ; 62 		Sensor_OA_Scan();
 176  001c cd0000        	call	_Sensor_OA_Scan
 178                     ; 63 		MT_Control();
 180  001f cd0000        	call	_MT_Control
 182                     ; 65 		i++;
 184  0022 3c00          	inc	L33_i
 185                     ; 66 		if(i>20){
 187  0024 b600          	ld	a,L33_i
 188  0026 a115          	cp	a,#21
 189  0028 2505          	jrult	L35
 190                     ; 67 			PID_set();
 192  002a cd0000        	call	_PID_set
 194                     ; 68 			i=0;
 196  002d 3f00          	clr	L33_i
 197  002f               L35:
 198                     ; 72 }
 201  002f 81            	ret
 233                     ; 74 main()
 233                     ; 75 {	
 234                     	switch	.text
 235  0030               _main:
 239                     ; 76 	GPIO_Config_SystemOn();
 241  0030 ad16          	call	_GPIO_Config_SystemOn
 243                     ; 77 	CLK_Config();	//Configure the Fcpu to 8MHz,Fmaster=8MHz	
 245  0032 ad41          	call	_CLK_Config
 247                     ; 78 	Timer_Config();
 249  0034 ad48          	call	_Timer_Config
 251                     ; 79 	Motor_Init();
 253  0036 cd0000        	call	_Motor_Init
 255                     ; 80 	Comm_Init();
 257  0039 cd0000        	call	_Comm_Init
 259  003c               L76:
 260                     ; 85 			TimeCounters_1ms();
 262  003c adc3          	call	_TimeCounters_1ms
 264                     ; 86 			TimeCounters_10ms();
 266  003e adcc          	call	_TimeCounters_10ms
 268                     ; 90 			Key_Scan();
 270  0040 cd0000        	call	_Key_Scan
 272                     ; 91 			Alarm();
 274  0043 cd0000        	call	_Alarm
 277  0046 20f4          	jra	L76
 302                     ; 97 void GPIO_Config_SystemOn(void)
 302                     ; 98 {
 303                     	switch	.text
 304  0048               _GPIO_Config_SystemOn:
 308                     ; 100 	GPIO_Init(GPIOA,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 310  0048 4b40          	push	#64
 311  004a 4bff          	push	#255
 312  004c ae5000        	ldw	x,#20480
 313  004f cd0000        	call	_GPIO_Init
 315  0052 85            	popw	x
 316                     ; 101 	GPIO_Init(GPIOB,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 318  0053 4b40          	push	#64
 319  0055 4bff          	push	#255
 320  0057 ae5005        	ldw	x,#20485
 321  005a cd0000        	call	_GPIO_Init
 323  005d 85            	popw	x
 324                     ; 102 	GPIO_Init(GPIOC,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 326  005e 4b40          	push	#64
 327  0060 4bff          	push	#255
 328  0062 ae500a        	ldw	x,#20490
 329  0065 cd0000        	call	_GPIO_Init
 331  0068 85            	popw	x
 332                     ; 103 	GPIO_Init(GPIOD,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);	
 334  0069 4b40          	push	#64
 335  006b 4bff          	push	#255
 336  006d ae500f        	ldw	x,#20495
 337  0070 cd0000        	call	_GPIO_Init
 339  0073 85            	popw	x
 340                     ; 104 }
 343  0074 81            	ret
 368                     ; 106 void CLK_Config(void)
 368                     ; 107 {
 369                     	switch	.text
 370  0075               _CLK_Config:
 374                     ; 108   CLK_DeInit();  
 376  0075 cd0000        	call	_CLK_DeInit
 378                     ; 110 	CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV2);
 380  0078 a608          	ld	a,#8
 381  007a cd0000        	call	_CLK_SYSCLKConfig
 383                     ; 112 }
 386  007d 81            	ret
 425                     ; 113 void 	Timer_Config(void)
 425                     ; 114 {
 426                     	switch	.text
 427  007e               _Timer_Config:
 431                     ; 116 	TIM1_DeInit();
 433  007e cd0000        	call	_TIM1_DeInit
 435                     ; 117 	TIM1_TimeBaseInit(	0,																	//不分频，即8MHZ
 435                     ; 118 											TIM1_COUNTERMODE_CENTERALIGNED1 ,		//中央对齐模式
 435                     ; 119 											200,																//设置输出频率 20KHZ
 435                     ; 120 											3);																	//重复计数器，每两个周期产生一次更新，频率为10KHZ。此功能用于红外通讯模块
 437  0081 4b03          	push	#3
 438  0083 ae00c8        	ldw	x,#200
 439  0086 89            	pushw	x
 440  0087 4b20          	push	#32
 441  0089 5f            	clrw	x
 442  008a cd0000        	call	_TIM1_TimeBaseInit
 444  008d 5b04          	addw	sp,#4
 445                     ; 121 	TIM1_OC3Init(	TIM1_OCMODE_PWM2,													//TIM1_CNT<TIM1_CCR1时为无效电平
 445                     ; 122 								TIM1_OUTPUTSTATE_DISABLE, 									//OC3信号输出到引脚(这里先禁用输出)
 445                     ; 123 								TIM1_OUTPUTNSTATE_DISABLE,								//
 445                     ; 124 								Timer1_Pulse,														//设置占空比
 445                     ; 125 								TIM1_OCPOLARITY_LOW,											//OC1低电平有效
 445                     ; 126 								TIM1_OCNPOLARITY_LOW,
 445                     ; 127 								TIM1_OCIDLESTATE_RESET,										//空闲状态OC1=0							
 445                     ; 128 								
 445                     ; 129 								TIM1_OCNIDLESTATE_RESET);
 447  008f 4b00          	push	#0
 448  0091 4b00          	push	#0
 449  0093 4b88          	push	#136
 450  0095 4b22          	push	#34
 451  0097 b601          	ld	a,_Timer1_Pulse
 452  0099 5f            	clrw	x
 453  009a 97            	ld	xl,a
 454  009b 89            	pushw	x
 455  009c 4b00          	push	#0
 456  009e ae7000        	ldw	x,#28672
 457  00a1 cd0000        	call	_TIM1_OC3Init
 459  00a4 5b07          	addw	sp,#7
 460                     ; 130 	 TIM1_Cmd(ENABLE);																			//使能计数器
 462  00a6 a601          	ld	a,#1
 463  00a8 cd0000        	call	_TIM1_Cmd
 465                     ; 131 	 TIM1_CtrlPWMOutputs(ENABLE);														// TIM1 Main Output Enable
 467  00ab a601          	ld	a,#1
 468  00ad cd0000        	call	_TIM1_CtrlPWMOutputs
 470                     ; 134 	TIM2_DeInit();
 472  00b0 cd0000        	call	_TIM2_DeInit
 474                     ; 136 	TIM2_TimeBaseInit(TIM2_PRESCALER_64, 65535);	//timer2的时钟：125KHZ
 476  00b3 aeffff        	ldw	x,#65535
 477  00b6 89            	pushw	x
 478  00b7 a606          	ld	a,#6
 479  00b9 cd0000        	call	_TIM2_TimeBaseInit
 481  00bc 85            	popw	x
 482                     ; 137 	TIM2_ICInit(TIM2_CHANNEL_3,										//
 482                     ; 138 							TIM2_ICPOLARITY_FALLING,					//下降沿捕获
 482                     ; 139 							TIM2_ICSELECTION_DIRECTTI,	//CC1 channel is configured as input, IC1 is mapped on TI1FP1
 482                     ; 140 							TIM2_ICPSC_DIV1,	//No prescaler, capture is made each time an edge is detected on the capture input
 482                     ; 141 							3);																//滤波采样8次
 484  00bd 4b03          	push	#3
 485  00bf 4b00          	push	#0
 486  00c1 4b01          	push	#1
 487  00c3 ae0244        	ldw	x,#580
 488  00c6 cd0000        	call	_TIM2_ICInit
 490  00c9 5b03          	addw	sp,#3
 491                     ; 143 	TIM2_ITConfig(TIM2_IT_CC3|TIM2_IT_UPDATE,ENABLE);	//使能更新中断和捕获中断
 493  00cb ae0901        	ldw	x,#2305
 494  00ce cd0000        	call	_TIM2_ITConfig
 496                     ; 144 	TIM2_Cmd(ENABLE);
 498  00d1 a601          	ld	a,#1
 499  00d3 cd0000        	call	_TIM2_Cmd
 501                     ; 149 	TIM4_TimeBaseInit(TIM4_PRESCALER_32,249);	//1ms---(x-1)*32=8000
 503  00d6 ae05f9        	ldw	x,#1529
 504  00d9 cd0000        	call	_TIM4_TimeBaseInit
 506                     ; 151   TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 508  00dc a601          	ld	a,#1
 509  00de cd0000        	call	_TIM4_ClearFlag
 511                     ; 153   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);  
 513  00e1 ae0101        	ldw	x,#257
 514  00e4 cd0000        	call	_TIM4_ITConfig
 516                     ; 155   enableInterrupts();
 519  00e7 9a            rim
 521                     ; 158   TIM4_Cmd(ENABLE);
 524  00e8 a601          	ld	a,#1
 525  00ea cd0000        	call	_TIM4_Cmd
 527                     ; 162 }
 530  00ed 81            	ret
 572                     	xdef	_main
 573                     	xdef	_Tasks_1ms_TimeCritical
 574                     	xdef	_TimeCounters_10ms
 575                     	xdef	_TimeCounters_1ms
 576                     	xdef	_Timer_Config
 577                     	xdef	_CLK_Config
 578                     	xdef	_GPIO_Config_SystemOn
 579                     	xdef	_Timer1_Pulse
 580                     	switch	.ubsct
 581  0001               _TCnt_10ms:
 582  0001 00            	ds.b	1
 583                     	xdef	_TCnt_10ms
 584                     	xdef	_Timebase_cnt
 585                     	xref	_PID_set
 586                     	xref	_Comm_Init
 587                     	xref	_Alarm
 588                     	xref	_MT_Control
 589                     	xref	_Key_Scan
 590                     	xref	_Sensor_OA_Scan
 591                     	xref	_Motor_Init
 592                     	xref.b	_pt_Alarm_Speaker_cnt
 593                     	xref.b	_pt_Keyscan_cnt
 594                     	xref.b	_Indcator_cnt
 595                     	xref	_TIM4_ClearFlag
 596                     	xref	_TIM4_ITConfig
 597                     	xref	_TIM4_Cmd
 598                     	xref	_TIM4_TimeBaseInit
 599                     	xref	_TIM2_ITConfig
 600                     	xref	_TIM2_Cmd
 601                     	xref	_TIM2_ICInit
 602                     	xref	_TIM2_TimeBaseInit
 603                     	xref	_TIM2_DeInit
 604                     	xref	_TIM1_CtrlPWMOutputs
 605                     	xref	_TIM1_Cmd
 606                     	xref	_TIM1_OC3Init
 607                     	xref	_TIM1_TimeBaseInit
 608                     	xref	_TIM1_DeInit
 609                     	xref	_GPIO_Init
 610                     	xref	_CLK_SYSCLKConfig
 611                     	xref	_CLK_DeInit
 631                     	end
