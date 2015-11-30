   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
  20                     	bsct
  21  0000               _MT:
  22  0000 00            	dc.b	0
  23  0001 000000000000  	ds.b	10
  54                     ; 46 static void Obstacle_Avoidance_Sensor_Init(void)
  54                     ; 47 {
  56                     .text:	section	.text,new
  57  0000               L3_Obstacle_Avoidance_Sensor_Init:
  61                     ; 48 	GPIO_Init(OBSTACLE_AVOIDANCE_SENSOR_PORT,
  61                     ; 49 						OBSTACLE_AVOIDANCE_SENSOR_A|OBSTACLE_AVOIDANCE_SENSOR_B,
  61                     ; 50 						GPIO_MODE_IN_PU_NO_IT);				
  63  0000 4b40          	push	#64
  64  0002 4b06          	push	#6
  65  0004 ae5000        	ldw	x,#20480
  66  0007 cd0000        	call	_GPIO_Init
  68  000a 85            	popw	x
  69                     ; 52 }
  72  000b 81            	ret	
  96                     ; 53 static void Speed_Sensor_Init(void)
  96                     ; 54 {
  97                     .text:	section	.text,new
  98  0000               L32_Speed_Sensor_Init:
 102                     ; 55 	GPIO_Init(SPEED_SENSOR_PORT,SPEED_SENSOR,GPIO_MODE_IN_PU_NO_IT);
 104  0000 4b40          	push	#64
 105  0002 4b10          	push	#16
 106  0004 ae500f        	ldw	x,#20495
 107  0007 cd0000        	call	_GPIO_Init
 109  000a 85            	popw	x
 110                     ; 56 }
 113  000b 81            	ret	
 137                     ; 57 static void Key_Init(void)
 137                     ; 58 {
 138                     .text:	section	.text,new
 139  0000               L53_Key_Init:
 143                     ; 59 	GPIO_Init(KEY_PORT,KEY_A|KEY_B,GPIO_MODE_IN_PU_NO_IT);
 145  0000 4b40          	push	#64
 146  0002 4b0c          	push	#12
 147  0004 ae500f        	ldw	x,#20495
 148  0007 cd0000        	call	_GPIO_Init
 150  000a 85            	popw	x
 151                     ; 60 }
 154  000b 81            	ret	
 178                     ; 61 static void Alarm_Init(void)
 178                     ; 62 {
 179                     .text:	section	.text,new
 180  0000               L74_Alarm_Init:
 184                     ; 63 	GPIO_Init(ALARM_PORT,ALARM,GPIO_MODE_OUT_PP_HIGH_SLOW);
 186  0000 4bd0          	push	#208
 187  0002 4b08          	push	#8
 188  0004 ae5000        	ldw	x,#20480
 189  0007 cd0000        	call	_GPIO_Init
 191  000a 85            	popw	x
 192                     ; 64 }
 195  000b 81            	ret	
 225                     ; 67 void Motor_Init(void)
 225                     ; 68 {
 226                     .text:	section	.text,new
 227  0000               _Motor_Init:
 231                     ; 70 	GPIO_Init(L298N_IN_PORT,L298N_IN1|L298N_IN2,GPIO_MODE_OUT_PP_LOW_SLOW);
 233  0000 4bc0          	push	#192
 234  0002 4b30          	push	#48
 235  0004 ae5005        	ldw	x,#20485
 236  0007 cd0000        	call	_GPIO_Init
 238  000a 85            	popw	x
 239                     ; 71 	GPIO_Init(MOTOR_PWM_PORT,MOTOR_PWM,GPIO_MODE_OUT_PP_LOW_SLOW);
 241  000b 4bc0          	push	#192
 242  000d 4b08          	push	#8
 243  000f ae500a        	ldw	x,#20490
 244  0012 cd0000        	call	_GPIO_Init
 246  0015 4f            	clr	a
 247  0016 85            	popw	x
 248                     ; 73 	TIM1_Cmd(DISABLE);																			//stop计数器
 250  0017 cd0000        	call	_TIM1_Cmd
 252                     ; 74 	TIM1_CtrlPWMOutputs(DISABLE);														// TIM1 Main Output disable
 254  001a 4f            	clr	a
 255  001b cd0000        	call	_TIM1_CtrlPWMOutputs
 257                     ; 76 	Obstacle_Avoidance_Sensor_Init();
 259  001e cd0000        	call	L3_Obstacle_Avoidance_Sensor_Init
 261                     ; 77 	Speed_Sensor_Init();
 263  0021 cd0000        	call	L32_Speed_Sensor_Init
 265                     ; 78 	Key_Init();
 267  0024 cd0000        	call	L53_Key_Init
 269                     ; 79 	Alarm_Init();
 272                     ; 82 }
 275  0027 cc0000        	jp	L74_Alarm_Init
 334                     ; 84 void Motor_Start(Motor_Direction_Typedef dir)
 334                     ; 85 {
 335                     .text:	section	.text,new
 336  0000               _Motor_Start:
 340                     ; 86 	if(dir){
 342  0000 4d            	tnz	a
 343  0001 270d          	jreq	L711
 344                     ; 87 		GPIO_WriteHigh(L298N_IN_PORT,L298N_IN1);
 346  0003 4b10          	push	#16
 347  0005 ae5005        	ldw	x,#20485
 348  0008 cd0000        	call	_GPIO_WriteHigh
 350  000b 84            	pop	a
 351                     ; 88 		GPIO_WriteLow(L298N_IN_PORT,L298N_IN2);
 353  000c 4b20          	push	#32
 356  000e 200b          	jra	L121
 357  0010               L711:
 358                     ; 90 		GPIO_WriteHigh(L298N_IN_PORT,L298N_IN2);
 360  0010 4b20          	push	#32
 361  0012 ae5005        	ldw	x,#20485
 362  0015 cd0000        	call	_GPIO_WriteHigh
 364  0018 84            	pop	a
 365                     ; 91 		GPIO_WriteLow(L298N_IN_PORT,L298N_IN1);
 367  0019 4b10          	push	#16
 369  001b               L121:
 370  001b ae5005        	ldw	x,#20485
 371  001e cd0000        	call	_GPIO_WriteLow
 372  0021 84            	pop	a
 373                     ; 94 	TIM1_Cmd(ENABLE);																			//使能计数器
 375  0022 a601          	ld	a,#1
 376  0024 cd0000        	call	_TIM1_Cmd
 378                     ; 95 	TIM1_CtrlPWMOutputs(ENABLE);													// TIM1 Main Output Enable
 380  0027 a601          	ld	a,#1
 382                     ; 96 }
 385  0029 cc0000        	jp	_TIM1_CtrlPWMOutputs
 411                     ; 97 void Motor_Stop(void)
 411                     ; 98 {
 412                     .text:	section	.text,new
 413  0000               _Motor_Stop:
 417                     ; 99 	TIM1_Cmd(DISABLE);																			//stop计数器
 419  0000 4f            	clr	a
 420  0001 cd0000        	call	_TIM1_Cmd
 422                     ; 100 	TIM1_CtrlPWMOutputs(DISABLE);														// TIM1 Main Output disable
 424  0004 4f            	clr	a
 425  0005 cd0000        	call	_TIM1_CtrlPWMOutputs
 427                     ; 101 	GPIO_WriteLow(L298N_IN_PORT,L298N_IN1);
 429  0008 4b10          	push	#16
 430  000a ae5005        	ldw	x,#20485
 431  000d cd0000        	call	_GPIO_WriteLow
 433  0010 84            	pop	a
 434                     ; 102 	GPIO_WriteLow(L298N_IN_PORT,L298N_IN2);
 436  0011 4b20          	push	#32
 437  0013 ae5005        	ldw	x,#20485
 438  0016 cd0000        	call	_GPIO_WriteLow
 440  0019 84            	pop	a
 441                     ; 103 }
 444  001a 81            	ret	
 468                     ; 105 void Signal_Scan(void)
 468                     ; 106 {
 469                     .text:	section	.text,new
 470  0000               _Signal_Scan:
 474                     ; 107 	GPIO_ReadInputPin(OBSTACLE_AVOIDANCE_SENSOR_PORT,OBSTACLE_AVOIDANCE_SENSOR_A);
 476  0000 4b02          	push	#2
 477  0002 ae5000        	ldw	x,#20480
 478  0005 cd0000        	call	_GPIO_ReadInputPin
 480  0008 84            	pop	a
 481                     ; 108 }
 484  0009 81            	ret	
 580                     	xdef	_Signal_Scan
 581                     	xdef	_MT
 582                     	xdef	_Motor_Stop
 583                     	xdef	_Motor_Start
 584                     	xdef	_Motor_Init
 585                     	xref	_TIM1_CtrlPWMOutputs
 586                     	xref	_TIM1_Cmd
 587                     	xref	_GPIO_ReadInputPin
 588                     	xref	_GPIO_WriteLow
 589                     	xref	_GPIO_WriteHigh
 590                     	xref	_GPIO_Init
 609                     	end
