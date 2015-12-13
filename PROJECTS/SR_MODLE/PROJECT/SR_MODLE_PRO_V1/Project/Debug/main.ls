   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
  17                     	bsct
  18  0000               _Timebase_cnt:
  19  0000 00            	dc.b	0
  20  0001               _Timer1_Period:
  21  0001 96            	dc.b	150
  51                     ; 21 void Tasks_1ms_TimeCritical(void)
  51                     ; 22 {
  53                     .text:	section	.text,new
  54  0000               _Tasks_1ms_TimeCritical:
  58                     ; 24 }
  61  0000 81            	ret
  87                     ; 26 void TimeCounters_1ms(void)
  87                     ; 27 {
  88                     .text:	section	.text,new
  89  0000               _TimeCounters_1ms:
  93                     ; 28 	if(Timebase_cnt>0)
  95  0000 3d00          	tnz	_Timebase_cnt
  96  0002 2706          	jreq	L13
  97                     ; 30 		Timebase_cnt--;
  99  0004 3a00          	dec	_Timebase_cnt
 100                     ; 31 		TCnt_10ms++;
 102  0006 3c00          	inc	_TCnt_10ms
 103                     ; 34 		pt_Keyscan_cnt++;
 105  0008 3c00          	inc	_pt_Keyscan_cnt
 106  000a               L13:
 107                     ; 38 }
 110  000a 81            	ret
 138                     ; 40 void TimeCounters_10ms(void)
 138                     ; 41 {
 139                     .text:	section	.text,new
 140  0000               _TimeCounters_10ms:
 144                     ; 42 	if(TCnt_10ms>9)
 146  0000 b600          	ld	a,_TCnt_10ms
 147  0002 a10a          	cp	a,#10
 148  0004 2510          	jrult	L34
 149                     ; 44 		TCnt_10ms-=10;
 151  0006 b600          	ld	a,_TCnt_10ms
 152  0008 a00a          	sub	a,#10
 153  000a b700          	ld	_TCnt_10ms,a
 154                     ; 47 		Indcator_cnt++;
 156  000c 3c00          	inc	_Indcator_cnt
 157                     ; 48 		pt_Alarm_Speaker_cnt++;
 159  000e 3c00          	inc	_pt_Alarm_Speaker_cnt
 160                     ; 51 		Sensor_OA_Scan();
 162  0010 cd0000        	call	_Sensor_OA_Scan
 164                     ; 52 		MT_Control();
 166  0013 cd0000        	call	_MT_Control
 168  0016               L34:
 169                     ; 55 }
 172  0016 81            	ret
 203                     ; 57 main()
 203                     ; 58 {
 204                     .text:	section	.text,new
 205  0000               _main:
 209                     ; 59 	GPIO_Config_SystemOn();
 211  0000 cd0000        	call	_GPIO_Config_SystemOn
 213                     ; 60 	CLK_Config();	//Configure the Fcpu to 8MHz,Fmaster=8MHz	
 215  0003 cd0000        	call	_CLK_Config
 217                     ; 61 	Timer_Config();
 219  0006 cd0000        	call	_Timer_Config
 221                     ; 62 	Motor_Init();
 223  0009 cd0000        	call	_Motor_Init
 225  000c               L55:
 226                     ; 68 			TimeCounters_1ms();
 228  000c cd0000        	call	_TimeCounters_1ms
 230                     ; 69 			TimeCounters_10ms();
 232  000f cd0000        	call	_TimeCounters_10ms
 234                     ; 73 			Key_Scan();
 236  0012 cd0000        	call	_Key_Scan
 238                     ; 74 			Alarm();
 240  0015 cd0000        	call	_Alarm
 243  0018 20f2          	jra	L55
 268                     ; 80 void GPIO_Config_SystemOn(void)
 268                     ; 81 {
 269                     .text:	section	.text,new
 270  0000               _GPIO_Config_SystemOn:
 274                     ; 83 	GPIO_Init(GPIOA,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 276  0000 4b40          	push	#64
 277  0002 4bff          	push	#255
 278  0004 ae5000        	ldw	x,#20480
 279  0007 cd0000        	call	_GPIO_Init
 281  000a 85            	popw	x
 282                     ; 84 	GPIO_Init(GPIOB,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 284  000b 4b40          	push	#64
 285  000d 4bff          	push	#255
 286  000f ae5005        	ldw	x,#20485
 287  0012 cd0000        	call	_GPIO_Init
 289  0015 85            	popw	x
 290                     ; 85 	GPIO_Init(GPIOC,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 292  0016 4b40          	push	#64
 293  0018 4bff          	push	#255
 294  001a ae500a        	ldw	x,#20490
 295  001d cd0000        	call	_GPIO_Init
 297  0020 85            	popw	x
 298                     ; 86 	GPIO_Init(GPIOD,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);	
 300  0021 4b40          	push	#64
 301  0023 4bff          	push	#255
 302  0025 ae500f        	ldw	x,#20495
 303  0028 cd0000        	call	_GPIO_Init
 305  002b 85            	popw	x
 306                     ; 87 }
 309  002c 81            	ret
 334                     ; 89 void CLK_Config(void)
 334                     ; 90 {
 335                     .text:	section	.text,new
 336  0000               _CLK_Config:
 340                     ; 91   CLK_DeInit();  
 342  0000 cd0000        	call	_CLK_DeInit
 344                     ; 93 	CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV2);
 346  0003 a608          	ld	a,#8
 347  0005 cd0000        	call	_CLK_SYSCLKConfig
 349                     ; 95 }
 352  0008 81            	ret
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
 437  0039 9a            rim
 439                     ; 131   TIM4_Cmd(ENABLE);
 442  003a a601          	ld	a,#1
 443  003c cd0000        	call	_TIM4_Cmd
 445                     ; 135 }
 448  003f 81            	ret
 490                     	xdef	_main
 491                     	xdef	_Tasks_1ms_TimeCritical
 492                     	xdef	_TimeCounters_10ms
 493                     	xdef	_TimeCounters_1ms
 494                     	xdef	_Timer_Config
 495                     	xdef	_CLK_Config
 496                     	xdef	_GPIO_Config_SystemOn
 497                     	xdef	_Timer1_Period
 498                     	switch	.ubsct
 499  0000               _TCnt_10ms:
 500  0000 00            	ds.b	1
 501                     	xdef	_TCnt_10ms
 502                     	xdef	_Timebase_cnt
 503                     	xref	_Alarm
 504                     	xref	_MT_Control
 505                     	xref	_Key_Scan
 506                     	xref	_Sensor_OA_Scan
 507                     	xref	_Motor_Init
 508                     	xref.b	_pt_Alarm_Speaker_cnt
 509                     	xref.b	_pt_Keyscan_cnt
 510                     	xref.b	_Indcator_cnt
 511                     	xref	_TIM4_ClearFlag
 512                     	xref	_TIM4_ITConfig
 513                     	xref	_TIM4_Cmd
 514                     	xref	_TIM4_TimeBaseInit
 515                     	xref	_TIM1_OC3Init
 516                     	xref	_TIM1_TimeBaseInit
 517                     	xref	_TIM1_DeInit
 518                     	xref	_GPIO_Init
 519                     	xref	_CLK_SYSCLKConfig
 520                     	xref	_CLK_DeInit
 540                     	end
