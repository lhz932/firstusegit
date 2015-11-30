   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
  20                     	bsct
  21  0000               _Timebase_cnt:
  22  0000 00            	dc.b	0
  23  0001               _Timer1_Period:
  24  0001 b4            	dc.b	180
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
 140                     ; 40 void TimeCounters_10ms(void)
 140                     ; 41 {
 141                     .text:	section	.text,new
 142  0000               _TimeCounters_10ms:
 146                     ; 42 	if(TCnt_10ms>9)
 148  0000 b600          	ld	a,_TCnt_10ms
 149  0002 a00a          	sub	a,#10
 150  0004 250a          	jrult	L34
 151                     ; 44 		TCnt_10ms-=10;
 153  0006 b700          	ld	_TCnt_10ms,a
 154                     ; 47 		Indcator_cnt++;
 156  0008 3c00          	inc	_Indcator_cnt
 157                     ; 51 		Sensor_OA_Scan();
 159  000a cd0000        	call	_Sensor_OA_Scan
 161                     ; 52 		MT_Control();
 163  000d cd0000        	call	_MT_Control
 165  0010               L34:
 166                     ; 55 }
 169  0010 81            	ret	
 199                     ; 57 main()
 199                     ; 58 {
 200                     .text:	section	.text,new
 201  0000               _main:
 205                     ; 59 	GPIO_Config_SystemOn();
 207  0000 cd0000        	call	_GPIO_Config_SystemOn
 209                     ; 60 	CLK_Config();	//Configure the Fcpu to 8MHz,Fmaster=8MHz	
 211  0003 cd0000        	call	_CLK_Config
 213                     ; 61 	Timer_Config();
 215  0006 cd0000        	call	_Timer_Config
 217                     ; 62 	Motor_Init();
 219  0009 cd0000        	call	_Motor_Init
 221  000c               L55:
 222                     ; 68 			TimeCounters_1ms();
 224  000c cd0000        	call	_TimeCounters_1ms
 226                     ; 69 			TimeCounters_10ms();
 228  000f cd0000        	call	_TimeCounters_10ms
 230                     ; 73 			Key_Scan();
 232  0012 cd0000        	call	_Key_Scan
 235  0015 20f5          	jra	L55
 260                     ; 79 void GPIO_Config_SystemOn(void)
 260                     ; 80 {
 261                     .text:	section	.text,new
 262  0000               _GPIO_Config_SystemOn:
 266                     ; 82 	GPIO_Init(GPIOA,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 268  0000 4b40          	push	#64
 269  0002 4bff          	push	#255
 270  0004 ae5000        	ldw	x,#20480
 271  0007 cd0000        	call	_GPIO_Init
 273  000a 85            	popw	x
 274                     ; 83 	GPIO_Init(GPIOB,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 276  000b 4b40          	push	#64
 277  000d 4bff          	push	#255
 278  000f ae5005        	ldw	x,#20485
 279  0012 cd0000        	call	_GPIO_Init
 281  0015 85            	popw	x
 282                     ; 84 	GPIO_Init(GPIOC,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 284  0016 4b40          	push	#64
 285  0018 4bff          	push	#255
 286  001a ae500a        	ldw	x,#20490
 287  001d cd0000        	call	_GPIO_Init
 289  0020 85            	popw	x
 290                     ; 85 	GPIO_Init(GPIOD,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);	
 292  0021 4b40          	push	#64
 293  0023 4bff          	push	#255
 294  0025 ae500f        	ldw	x,#20495
 295  0028 cd0000        	call	_GPIO_Init
 297  002b 85            	popw	x
 298                     ; 86 }
 301  002c 81            	ret	
 326                     ; 88 void CLK_Config(void)
 326                     ; 89 {
 327                     .text:	section	.text,new
 328  0000               _CLK_Config:
 332                     ; 90   CLK_DeInit();  
 334  0000 cd0000        	call	_CLK_DeInit
 336                     ; 92 	CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV2);
 338  0003 a608          	ld	a,#8
 340                     ; 94 }
 343  0005 cc0000        	jp	_CLK_SYSCLKConfig
 375                     ; 95 void 	Timer_Config(void)
 375                     ; 96 {
 376                     .text:	section	.text,new
 377  0000               _Timer_Config:
 381                     ; 98 	TIM1_DeInit();
 383  0000 cd0000        	call	_TIM1_DeInit
 385                     ; 99 	TIM1_TimeBaseInit(	0,																	//不分频，即8MHZ
 385                     ; 100 											TIM1_COUNTERMODE_CENTERALIGNED1 ,		//中央对齐模式
 385                     ; 101 											200,																//设置输出频率 20K
 385                     ; 102 											0);																	//重复计数器
 387  0003 4b00          	push	#0
 388  0005 ae00c8        	ldw	x,#200
 389  0008 89            	pushw	x
 390  0009 4b20          	push	#32
 391  000b 5f            	clrw	x
 392  000c cd0000        	call	_TIM1_TimeBaseInit
 394  000f 5b04          	addw	sp,#4
 395                     ; 103 	TIM1_OC3Init(	TIM1_OCMODE_PWM2,													//TIM1_CNT<TIM1_CCR1时为无效电平
 395                     ; 104 								TIM1_OUTPUTSTATE_ENABLE, 									//OC3信号输出到引脚
 395                     ; 105 								TIM1_OUTPUTNSTATE_DISABLE,								//
 395                     ; 106 								Timer1_Period,														//设置占空比
 395                     ; 107 								TIM1_OCPOLARITY_LOW,											//OC1高电平有效
 395                     ; 108 								TIM1_OCNPOLARITY_LOW,
 395                     ; 109 								TIM1_OCIDLESTATE_RESET,										//空闲状态OC1=0							
 395                     ; 110 								
 395                     ; 111 								TIM1_OCNIDLESTATE_RESET);
 397  0011 4b00          	push	#0
 398  0013 4b00          	push	#0
 399  0015 4b88          	push	#136
 400  0017 4b22          	push	#34
 401  0019 b601          	ld	a,_Timer1_Period
 402  001b 5f            	clrw	x
 403  001c 97            	ld	xl,a
 404  001d 89            	pushw	x
 405  001e 4b00          	push	#0
 406  0020 ae7011        	ldw	x,#28689
 407  0023 cd0000        	call	_TIM1_OC3Init
 409  0026 5b07          	addw	sp,#7
 410                     ; 121 	TIM4_TimeBaseInit(TIM4_PRESCALER_32,249);	//1ms---(x-1)*32=8000
 412  0028 ae05f9        	ldw	x,#1529
 413  002b cd0000        	call	_TIM4_TimeBaseInit
 415                     ; 123   TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 417  002e a601          	ld	a,#1
 418  0030 cd0000        	call	_TIM4_ClearFlag
 420                     ; 125   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);  
 422  0033 ae0101        	ldw	x,#257
 423  0036 cd0000        	call	_TIM4_ITConfig
 425                     ; 127   enableInterrupts();
 428  0039 9a            	rim	
 430                     ; 130   TIM4_Cmd(ENABLE);
 433  003a a601          	ld	a,#1
 435                     ; 134 }
 438  003c cc0000        	jp	_TIM4_Cmd
 480                     	xdef	_main
 481                     	xdef	_Tasks_1ms_TimeCritical
 482                     	xdef	_TimeCounters_10ms
 483                     	xdef	_TimeCounters_1ms
 484                     	xdef	_Timer_Config
 485                     	xdef	_CLK_Config
 486                     	xdef	_GPIO_Config_SystemOn
 487                     	xdef	_Timer1_Period
 488                     	switch	.ubsct
 489  0000               _TCnt_10ms:
 490  0000 00            	ds.b	1
 491                     	xdef	_TCnt_10ms
 492                     	xdef	_Timebase_cnt
 493                     	xref	_MT_Control
 494                     	xref	_Key_Scan
 495                     	xref	_Sensor_OA_Scan
 496                     	xref	_Motor_Init
 497                     	xref.b	_pt_Keyscan_cnt
 498                     	xref.b	_Indcator_cnt
 499                     	xref	_TIM4_ClearFlag
 500                     	xref	_TIM4_ITConfig
 501                     	xref	_TIM4_Cmd
 502                     	xref	_TIM4_TimeBaseInit
 503                     	xref	_TIM1_OC3Init
 504                     	xref	_TIM1_TimeBaseInit
 505                     	xref	_TIM1_DeInit
 506                     	xref	_GPIO_Init
 507                     	xref	_CLK_SYSCLKConfig
 508                     	xref	_CLK_DeInit
 528                     	end
