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
  89                     ; 26 void TimeCounters_1ms(void)
  89                     ; 27 {
  90                     .text:	section	.text,new
  91  0000               _TimeCounters_1ms:
  95                     ; 28 	if(Timebase_cnt>0)
  97  0000 3d00          	tnz	_Timebase_cnt
  98  0002 2704          	jreq	L13
  99                     ; 30 		Timebase_cnt--;
 101  0004 3a00          	dec	_Timebase_cnt
 102                     ; 31 		TCnt_10ms++;
 104  0006 3c00          	inc	_TCnt_10ms
 105  0008               L13:
 106                     ; 38 }
 109  0008 81            	ret	
 134                     ; 40 void TimeCounters_10ms(void)
 134                     ; 41 {
 135                     .text:	section	.text,new
 136  0000               _TimeCounters_10ms:
 140                     ; 42 	if(TCnt_10ms>9)
 142  0000 b600          	ld	a,_TCnt_10ms
 143  0002 a00a          	sub	a,#10
 144  0004 2504          	jrult	L34
 145                     ; 44 		TCnt_10ms-=10;
 147  0006 b700          	ld	_TCnt_10ms,a
 148                     ; 47 		Indcator_cnt++;
 150  0008 3c00          	inc	_Indcator_cnt
 151  000a               L34:
 152                     ; 55 }
 155  000a 81            	ret	
 186                     ; 57 main()
 186                     ; 58 {
 187                     .text:	section	.text,new
 188  0000               _main:
 192                     ; 59 	GPIO_Config_SystemOn();
 194  0000 cd0000        	call	_GPIO_Config_SystemOn
 196                     ; 60 	CLK_Config();	//Configure the Fcpu to 8MHz,Fmaster=8MHz	
 198  0003 cd0000        	call	_CLK_Config
 200                     ; 61 	Timer_Config();
 202  0006 cd0000        	call	_Timer_Config
 204                     ; 62 	Motor_Init();
 206  0009 cd0000        	call	_Motor_Init
 208                     ; 64 	Indicator_Init();
 210  000c cd0000        	call	_Indicator_Init
 212  000f               L55:
 213                     ; 68 			TimeCounters_1ms();
 215  000f cd0000        	call	_TimeCounters_1ms
 217                     ; 69 			TimeCounters_10ms();
 219  0012 cd0000        	call	_TimeCounters_10ms
 221                     ; 71 			Indicator_Running();
 223  0015 cd0000        	call	_Indicator_Running
 226  0018 20f5          	jra	L55
 251                     ; 77 void GPIO_Config_SystemOn(void)
 251                     ; 78 {
 252                     .text:	section	.text,new
 253  0000               _GPIO_Config_SystemOn:
 257                     ; 80 	GPIO_Init(GPIOA,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 259  0000 4b40          	push	#64
 260  0002 4bff          	push	#255
 261  0004 ae5000        	ldw	x,#20480
 262  0007 cd0000        	call	_GPIO_Init
 264  000a 85            	popw	x
 265                     ; 81 	GPIO_Init(GPIOB,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 267  000b 4b40          	push	#64
 268  000d 4bff          	push	#255
 269  000f ae5005        	ldw	x,#20485
 270  0012 cd0000        	call	_GPIO_Init
 272  0015 85            	popw	x
 273                     ; 82 	GPIO_Init(GPIOC,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 275  0016 4b40          	push	#64
 276  0018 4bff          	push	#255
 277  001a ae500a        	ldw	x,#20490
 278  001d cd0000        	call	_GPIO_Init
 280  0020 85            	popw	x
 281                     ; 83 	GPIO_Init(GPIOD,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);	
 283  0021 4b40          	push	#64
 284  0023 4bff          	push	#255
 285  0025 ae500f        	ldw	x,#20495
 286  0028 cd0000        	call	_GPIO_Init
 288  002b 85            	popw	x
 289                     ; 84 }
 292  002c 81            	ret	
 317                     ; 86 void CLK_Config(void)
 317                     ; 87 {
 318                     .text:	section	.text,new
 319  0000               _CLK_Config:
 323                     ; 88   CLK_DeInit();  
 325  0000 cd0000        	call	_CLK_DeInit
 327                     ; 90 	CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV2);
 329  0003 a608          	ld	a,#8
 331                     ; 92 }
 334  0005 cc0000        	jp	_CLK_SYSCLKConfig
 366                     ; 93 void 	Timer_Config(void)
 366                     ; 94 {
 367                     .text:	section	.text,new
 368  0000               _Timer_Config:
 372                     ; 96 	TIM1_DeInit();
 374  0000 cd0000        	call	_TIM1_DeInit
 376                     ; 97 	TIM1_TimeBaseInit(	0,																	//不分频，即8MHZ
 376                     ; 98 											TIM1_COUNTERMODE_CENTERALIGNED1 ,		//中央对齐模式
 376                     ; 99 											200,																//设置输出频率 20K
 376                     ; 100 											0);																	//重复计数器
 378  0003 4b00          	push	#0
 379  0005 ae00c8        	ldw	x,#200
 380  0008 89            	pushw	x
 381  0009 4b20          	push	#32
 382  000b 5f            	clrw	x
 383  000c cd0000        	call	_TIM1_TimeBaseInit
 385  000f 5b04          	addw	sp,#4
 386                     ; 101 	TIM1_OC3Init(	TIM1_OCMODE_PWM2,													//TIM1_CNT<TIM1_CCR1时为无效电平
 386                     ; 102 								TIM1_OUTPUTSTATE_ENABLE, 									//OC3信号输出到引脚
 386                     ; 103 								TIM1_OUTPUTNSTATE_DISABLE,								//
 386                     ; 104 								Timer1_Period,														//设置占空比
 386                     ; 105 								TIM1_OCPOLARITY_LOW,											//OC1高电平有效
 386                     ; 106 								TIM1_OCNPOLARITY_LOW,
 386                     ; 107 								TIM1_OCIDLESTATE_RESET,										//空闲状态OC1=0							
 386                     ; 108 								
 386                     ; 109 								TIM1_OCNIDLESTATE_RESET);
 388  0011 4b00          	push	#0
 389  0013 4b00          	push	#0
 390  0015 4b88          	push	#136
 391  0017 4b22          	push	#34
 392  0019 b601          	ld	a,_Timer1_Period
 393  001b 5f            	clrw	x
 394  001c 97            	ld	xl,a
 395  001d 89            	pushw	x
 396  001e 4b00          	push	#0
 397  0020 ae7011        	ldw	x,#28689
 398  0023 cd0000        	call	_TIM1_OC3Init
 400  0026 5b07          	addw	sp,#7
 401                     ; 119 	TIM4_TimeBaseInit(TIM4_PRESCALER_32,249);	//1ms---(x-1)*32=8000
 403  0028 ae05f9        	ldw	x,#1529
 404  002b cd0000        	call	_TIM4_TimeBaseInit
 406                     ; 121   TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 408  002e a601          	ld	a,#1
 409  0030 cd0000        	call	_TIM4_ClearFlag
 411                     ; 123   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);  
 413  0033 ae0101        	ldw	x,#257
 414  0036 cd0000        	call	_TIM4_ITConfig
 416                     ; 125   enableInterrupts();
 419  0039 9a            	rim	
 421                     ; 128   TIM4_Cmd(ENABLE);
 424  003a a601          	ld	a,#1
 426                     ; 132 }
 429  003c cc0000        	jp	_TIM4_Cmd
 471                     	xdef	_main
 472                     	xdef	_Tasks_1ms_TimeCritical
 473                     	xdef	_TimeCounters_10ms
 474                     	xdef	_TimeCounters_1ms
 475                     	xdef	_Timer_Config
 476                     	xdef	_CLK_Config
 477                     	xdef	_GPIO_Config_SystemOn
 478                     	xdef	_Timer1_Period
 479                     	switch	.ubsct
 480  0000               _TCnt_10ms:
 481  0000 00            	ds.b	1
 482                     	xdef	_TCnt_10ms
 483                     	xdef	_Timebase_cnt
 484                     	xref	_Motor_Init
 485                     	xref	_Indicator_Running
 486                     	xref	_Indicator_Init
 487                     	xref.b	_Indcator_cnt
 488                     	xref	_TIM4_ClearFlag
 489                     	xref	_TIM4_ITConfig
 490                     	xref	_TIM4_Cmd
 491                     	xref	_TIM4_TimeBaseInit
 492                     	xref	_TIM1_OC3Init
 493                     	xref	_TIM1_TimeBaseInit
 494                     	xref	_TIM1_DeInit
 495                     	xref	_GPIO_Init
 496                     	xref	_CLK_SYSCLKConfig
 497                     	xref	_CLK_DeInit
 517                     	end
