   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
  20                     	bsct
  21  0000               _Timebase_cnt:
  22  0000 00            	dc.b	0
  52                     ; 17 void Tasks_1ms_TimeCritical(void)
  52                     ; 18 {
  54                     .text:	section	.text,new
  55  0000               _Tasks_1ms_TimeCritical:
  59                     ; 20 }
  62  0000 81            	ret	
  87                     ; 22 void TimeCounters_1ms(void)
  87                     ; 23 {
  88                     .text:	section	.text,new
  89  0000               _TimeCounters_1ms:
  93                     ; 24 	if(Timebase_cnt>0)
  95  0000 3d00          	tnz	_Timebase_cnt
  96  0002 2704          	jreq	L13
  97                     ; 26 		Timebase_cnt--;
  99  0004 3a00          	dec	_Timebase_cnt
 100                     ; 27 		TCnt_10ms++;
 102  0006 3c00          	inc	_TCnt_10ms
 103  0008               L13:
 104                     ; 34 }
 107  0008 81            	ret	
 132                     ; 36 void TimeCounters_10ms(void)
 132                     ; 37 {
 133                     .text:	section	.text,new
 134  0000               _TimeCounters_10ms:
 138                     ; 38 	if(TCnt_10ms>9)
 140  0000 b600          	ld	a,_TCnt_10ms
 141  0002 a00a          	sub	a,#10
 142  0004 2504          	jrult	L34
 143                     ; 40 		TCnt_10ms-=10;
 145  0006 b700          	ld	_TCnt_10ms,a
 146                     ; 43 		Indcator_cnt++;
 148  0008 3c00          	inc	_Indcator_cnt
 149  000a               L34:
 150                     ; 47 }
 153  000a 81            	ret	
 183                     ; 49 main()
 183                     ; 50 {
 184                     .text:	section	.text,new
 185  0000               _main:
 189                     ; 51 	GPIO_Config_SystemOn();
 191  0000 cd0000        	call	_GPIO_Config_SystemOn
 193                     ; 52 	CLK_Config();	//Configure the Fcpu to 8MHz,Fmaster=8MHz	
 195  0003 cd0000        	call	_CLK_Config
 197                     ; 53 	Timer_Config();
 199  0006 cd0000        	call	_Timer_Config
 201                     ; 55 	Indicator_Init();
 203  0009 cd0000        	call	_Indicator_Init
 205  000c               L55:
 206                     ; 59 			TimeCounters_1ms();
 208  000c cd0000        	call	_TimeCounters_1ms
 210                     ; 60 			TimeCounters_10ms();
 212  000f cd0000        	call	_TimeCounters_10ms
 214                     ; 62 			Indicator_Running();
 216  0012 cd0000        	call	_Indicator_Running
 219  0015 20f5          	jra	L55
 244                     ; 68 void GPIO_Config_SystemOn(void)
 244                     ; 69 {
 245                     .text:	section	.text,new
 246  0000               _GPIO_Config_SystemOn:
 250                     ; 71 	GPIO_Init(GPIOA,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 252  0000 4b40          	push	#64
 253  0002 4bff          	push	#255
 254  0004 ae5000        	ldw	x,#20480
 255  0007 cd0000        	call	_GPIO_Init
 257  000a 85            	popw	x
 258                     ; 72 	GPIO_Init(GPIOB,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 260  000b 4b40          	push	#64
 261  000d 4bff          	push	#255
 262  000f ae5005        	ldw	x,#20485
 263  0012 cd0000        	call	_GPIO_Init
 265  0015 85            	popw	x
 266                     ; 73 	GPIO_Init(GPIOC,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 268  0016 4b40          	push	#64
 269  0018 4bff          	push	#255
 270  001a ae500a        	ldw	x,#20490
 271  001d cd0000        	call	_GPIO_Init
 273  0020 85            	popw	x
 274                     ; 74 	GPIO_Init(GPIOD,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);	
 276  0021 4b40          	push	#64
 277  0023 4bff          	push	#255
 278  0025 ae500f        	ldw	x,#20495
 279  0028 cd0000        	call	_GPIO_Init
 281  002b 85            	popw	x
 282                     ; 75 }
 285  002c 81            	ret	
 310                     ; 77 void CLK_Config(void)
 310                     ; 78 {
 311                     .text:	section	.text,new
 312  0000               _CLK_Config:
 316                     ; 79   CLK_DeInit();  
 318  0000 cd0000        	call	_CLK_DeInit
 320                     ; 81 	CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV2);
 322  0003 a608          	ld	a,#8
 324                     ; 83 }
 327  0005 cc0000        	jp	_CLK_SYSCLKConfig
 360                     ; 84 void 	Timer_Config(void)
 360                     ; 85 {
 361                     .text:	section	.text,new
 362  0000               _Timer_Config:
 366                     ; 87 	TIM1_DeInit();
 368  0000 cd0000        	call	_TIM1_DeInit
 370                     ; 88 	TIM1_TimeBaseInit(	0,																	//不分频，即8MHZ
 370                     ; 89 											TIM1_COUNTERMODE_CENTERALIGNED1 ,		//中央对齐模式
 370                     ; 90 											200,																//设置输出频率 20K
 370                     ; 91 											0);																	//重复计数器
 372  0003 4b00          	push	#0
 373  0005 ae00c8        	ldw	x,#200
 374  0008 89            	pushw	x
 375  0009 4b20          	push	#32
 376  000b 5f            	clrw	x
 377  000c cd0000        	call	_TIM1_TimeBaseInit
 379  000f 5b04          	addw	sp,#4
 380                     ; 92 	TIM1_OC3Init(	TIM1_OCMODE_PWM2,													//TIM1_CNT<TIM1_CCR1时为无效电平
 380                     ; 93 								TIM1_OUTPUTSTATE_ENABLE, 									//OC3信号输出到引脚
 380                     ; 94 								TIM1_OUTPUTNSTATE_DISABLE,								//
 380                     ; 95 								120,																			//设置占空比
 380                     ; 96 								TIM1_OCPOLARITY_LOW,											//OC1高电平有效
 380                     ; 97 								TIM1_OCNPOLARITY_LOW,
 380                     ; 98 								TIM1_OCIDLESTATE_RESET,										//空闲状态OC1=0							
 380                     ; 99 								
 380                     ; 100 								TIM1_OCNIDLESTATE_RESET);
 382  0011 4b00          	push	#0
 383  0013 4b00          	push	#0
 384  0015 4b88          	push	#136
 385  0017 4b22          	push	#34
 386  0019 ae0078        	ldw	x,#120
 387  001c 89            	pushw	x
 388  001d 4b00          	push	#0
 389  001f ae7011        	ldw	x,#28689
 390  0022 cd0000        	call	_TIM1_OC3Init
 392  0025 5b07          	addw	sp,#7
 393                     ; 101 	 TIM1_Cmd(ENABLE);																			//使能计数器
 395  0027 a601          	ld	a,#1
 396  0029 cd0000        	call	_TIM1_Cmd
 398                     ; 102 	 TIM1_CtrlPWMOutputs(ENABLE);														// TIM1 Main Output Enable
 400  002c a601          	ld	a,#1
 401  002e cd0000        	call	_TIM1_CtrlPWMOutputs
 403                     ; 110 	TIM4_TimeBaseInit(TIM4_PRESCALER_32,249);	//1ms---(x-1)*32=8000
 405  0031 ae05f9        	ldw	x,#1529
 406  0034 cd0000        	call	_TIM4_TimeBaseInit
 408                     ; 112   TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 410  0037 a601          	ld	a,#1
 411  0039 cd0000        	call	_TIM4_ClearFlag
 413                     ; 114   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);  
 415  003c ae0101        	ldw	x,#257
 416  003f cd0000        	call	_TIM4_ITConfig
 418                     ; 116   enableInterrupts();
 421  0042 9a            	rim	
 423                     ; 119   TIM4_Cmd(ENABLE);
 426  0043 a601          	ld	a,#1
 428                     ; 123 }
 431  0045 cc0000        	jp	_TIM4_Cmd
 464                     	xdef	_main
 465                     	xdef	_Tasks_1ms_TimeCritical
 466                     	xdef	_TimeCounters_10ms
 467                     	xdef	_TimeCounters_1ms
 468                     	xdef	_Timer_Config
 469                     	xdef	_CLK_Config
 470                     	xdef	_GPIO_Config_SystemOn
 471                     	switch	.ubsct
 472  0000               _TCnt_10ms:
 473  0000 00            	ds.b	1
 474                     	xdef	_TCnt_10ms
 475                     	xdef	_Timebase_cnt
 476                     	xref	_Indicator_Running
 477                     	xref	_Indicator_Init
 478                     	xref.b	_Indcator_cnt
 479                     	xref	_TIM4_ClearFlag
 480                     	xref	_TIM4_ITConfig
 481                     	xref	_TIM4_Cmd
 482                     	xref	_TIM4_TimeBaseInit
 483                     	xref	_TIM1_CtrlPWMOutputs
 484                     	xref	_TIM1_Cmd
 485                     	xref	_TIM1_OC3Init
 486                     	xref	_TIM1_TimeBaseInit
 487                     	xref	_TIM1_DeInit
 488                     	xref	_GPIO_Init
 489                     	xref	_CLK_SYSCLKConfig
 490                     	xref	_CLK_DeInit
 510                     	end
