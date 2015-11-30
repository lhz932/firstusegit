   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
  20                     	bsct
  21  0000               _MT:
  22  0000 00            	dc.b	0
  23  0001 000000000000  	ds.b	10
  54                     ; 49 static void Obstacle_Avoidance_Sensor_Init(void)
  54                     ; 50 {
  56                     .text:	section	.text,new
  57  0000               L3_Obstacle_Avoidance_Sensor_Init:
  61                     ; 51 	GPIO_Init(OBSTACLE_AVOIDANCE_SENSOR_PORT,
  61                     ; 52 						OBSTACLE_AVOIDANCE_SENSOR_A|OBSTACLE_AVOIDANCE_SENSOR_B,
  61                     ; 53 						GPIO_MODE_IN_PU_NO_IT);				
  63  0000 4b40          	push	#64
  64  0002 4b06          	push	#6
  65  0004 ae5000        	ldw	x,#20480
  66  0007 cd0000        	call	_GPIO_Init
  68  000a 85            	popw	x
  69                     ; 55 }
  72  000b 81            	ret	
  96                     ; 56 static void Speed_Sensor_Init(void)
  96                     ; 57 {
  97                     .text:	section	.text,new
  98  0000               L32_Speed_Sensor_Init:
 102                     ; 58 	GPIO_Init(SPEED_SENSOR_PORT,SPEED_SENSOR,GPIO_MODE_IN_PU_NO_IT);
 104  0000 4b40          	push	#64
 105  0002 4b10          	push	#16
 106  0004 ae500f        	ldw	x,#20495
 107  0007 cd0000        	call	_GPIO_Init
 109  000a 85            	popw	x
 110                     ; 59 }
 113  000b 81            	ret	
 138                     ; 60 static void Key_Init(void)
 138                     ; 61 {
 139                     .text:	section	.text,new
 140  0000               L53_Key_Init:
 144                     ; 62 	GPIO_Init(KEY_PORT,KEY_A|KEY_B,GPIO_MODE_IN_PU_NO_IT);
 146  0000 4b40          	push	#64
 147  0002 4b0c          	push	#12
 148  0004 ae500f        	ldw	x,#20495
 149  0007 cd0000        	call	_GPIO_Init
 151  000a 85            	popw	x
 152                     ; 63 	PT_INIT(&pt_Keyscan);
 154  000b 5f            	clrw	x
 155  000c bf00          	ldw	_pt_Keyscan,x
 156                     ; 64 }
 160  000e 81            	ret	
 184                     ; 65 static void Alarm_Init(void)
 184                     ; 66 {
 185                     .text:	section	.text,new
 186  0000               L74_Alarm_Init:
 190                     ; 67 	GPIO_Init(ALARM_PORT,ALARM,GPIO_MODE_OUT_PP_HIGH_SLOW);
 192  0000 4bd0          	push	#208
 193  0002 4b08          	push	#8
 194  0004 ae5000        	ldw	x,#20480
 195  0007 cd0000        	call	_GPIO_Init
 197  000a 85            	popw	x
 198                     ; 68 }
 201  000b 81            	ret	
 231                     ; 71 void Motor_Init(void)
 231                     ; 72 {
 232                     .text:	section	.text,new
 233  0000               _Motor_Init:
 237                     ; 74 	GPIO_Init(L298N_IN_PORT,L298N_IN1|L298N_IN2,GPIO_MODE_OUT_PP_LOW_SLOW);
 239  0000 4bc0          	push	#192
 240  0002 4b30          	push	#48
 241  0004 ae5005        	ldw	x,#20485
 242  0007 cd0000        	call	_GPIO_Init
 244  000a 85            	popw	x
 245                     ; 75 	GPIO_Init(MOTOR_PWM_PORT,MOTOR_PWM,GPIO_MODE_OUT_PP_LOW_SLOW);
 247  000b 4bc0          	push	#192
 248  000d 4b08          	push	#8
 249  000f ae500a        	ldw	x,#20490
 250  0012 cd0000        	call	_GPIO_Init
 252  0015 4f            	clr	a
 253  0016 85            	popw	x
 254                     ; 77 	TIM1_Cmd(DISABLE);																			//stop计数器
 256  0017 cd0000        	call	_TIM1_Cmd
 258                     ; 78 	TIM1_CtrlPWMOutputs(DISABLE);														// TIM1 Main Output disable
 260  001a 4f            	clr	a
 261  001b cd0000        	call	_TIM1_CtrlPWMOutputs
 263                     ; 80 	Obstacle_Avoidance_Sensor_Init();
 265  001e cd0000        	call	L3_Obstacle_Avoidance_Sensor_Init
 267                     ; 81 	Speed_Sensor_Init();
 269  0021 cd0000        	call	L32_Speed_Sensor_Init
 271                     ; 82 	Key_Init();
 273  0024 cd0000        	call	L53_Key_Init
 275                     ; 83 	Alarm_Init();
 278                     ; 88 }
 281  0027 cc0000        	jp	L74_Alarm_Init
 340                     ; 90 void Motor_Start(Motor_Direction_Typedef dir)
 340                     ; 91 {
 341                     .text:	section	.text,new
 342  0000               _Motor_Start:
 346                     ; 92 	if(dir){
 348  0000 4d            	tnz	a
 349  0001 270d          	jreq	L711
 350                     ; 93 		GPIO_WriteHigh(L298N_IN_PORT,L298N_IN1);
 352  0003 4b10          	push	#16
 353  0005 ae5005        	ldw	x,#20485
 354  0008 cd0000        	call	_GPIO_WriteHigh
 356  000b 84            	pop	a
 357                     ; 94 		GPIO_WriteLow(L298N_IN_PORT,L298N_IN2);
 359  000c 4b20          	push	#32
 362  000e 200b          	jra	L121
 363  0010               L711:
 364                     ; 96 		GPIO_WriteHigh(L298N_IN_PORT,L298N_IN2);
 366  0010 4b20          	push	#32
 367  0012 ae5005        	ldw	x,#20485
 368  0015 cd0000        	call	_GPIO_WriteHigh
 370  0018 84            	pop	a
 371                     ; 97 		GPIO_WriteLow(L298N_IN_PORT,L298N_IN1);
 373  0019 4b10          	push	#16
 375  001b               L121:
 376  001b ae5005        	ldw	x,#20485
 377  001e cd0000        	call	_GPIO_WriteLow
 378  0021 84            	pop	a
 379                     ; 100 	TIM1_Cmd(ENABLE);																			//使能计数器
 381  0022 a601          	ld	a,#1
 382  0024 cd0000        	call	_TIM1_Cmd
 384                     ; 101 	TIM1_CtrlPWMOutputs(ENABLE);													// TIM1 Main Output Enable
 386  0027 a601          	ld	a,#1
 388                     ; 102 }
 391  0029 cc0000        	jp	_TIM1_CtrlPWMOutputs
 417                     ; 103 void Motor_Stop(void)
 417                     ; 104 {
 418                     .text:	section	.text,new
 419  0000               _Motor_Stop:
 423                     ; 105 	TIM1_Cmd(DISABLE);																			//stop计数器
 425  0000 4f            	clr	a
 426  0001 cd0000        	call	_TIM1_Cmd
 428                     ; 106 	TIM1_CtrlPWMOutputs(DISABLE);														// TIM1 Main Output disable
 430  0004 4f            	clr	a
 431  0005 cd0000        	call	_TIM1_CtrlPWMOutputs
 433                     ; 107 	GPIO_WriteLow(L298N_IN_PORT,L298N_IN1);
 435  0008 4b10          	push	#16
 436  000a ae5005        	ldw	x,#20485
 437  000d cd0000        	call	_GPIO_WriteLow
 439  0010 84            	pop	a
 440                     ; 108 	GPIO_WriteLow(L298N_IN_PORT,L298N_IN2);
 442  0011 4b20          	push	#32
 443  0013 ae5005        	ldw	x,#20485
 444  0016 cd0000        	call	_GPIO_WriteLow
 446  0019 84            	pop	a
 447                     ; 109 }
 450  001a 81            	ret	
 475                     ; 112 void Sensor_OA_Scan(void)
 475                     ; 113 {
 476                     .text:	section	.text,new
 477  0000               _Sensor_OA_Scan:
 481                     ; 114 	if(GPIO_ReadInputPin(OBSTACLE_AVOIDANCE_SENSOR_PORT,OBSTACLE_AVOIDANCE_SENSOR_A)){	//
 483  0000 4b02          	push	#2
 484  0002 ae5000        	ldw	x,#20480
 485  0005 cd0000        	call	_GPIO_ReadInputPin
 487  0008 5b01          	addw	sp,#1
 488  000a 4d            	tnz	a
 489  000b 2704          	jreq	L341
 490                     ; 115 		MT.Sensor_OA_A=0;	
 492  000d 3f05          	clr	_MT+5
 494  000f 2004          	jra	L541
 495  0011               L341:
 496                     ; 117 		MT.Sensor_OA_A=1;
 498  0011 35010005      	mov	_MT+5,#1
 499  0015               L541:
 500                     ; 119 	if(GPIO_ReadInputPin(OBSTACLE_AVOIDANCE_SENSOR_PORT,OBSTACLE_AVOIDANCE_SENSOR_B)){	//
 502  0015 4b04          	push	#4
 503  0017 ae5000        	ldw	x,#20480
 504  001a cd0000        	call	_GPIO_ReadInputPin
 506  001d 5b01          	addw	sp,#1
 507  001f 4d            	tnz	a
 508  0020 2703          	jreq	L741
 509                     ; 120 		MT.Sensor_OA_B=0;	
 511  0022 3f06          	clr	_MT+6
 514  0024 81            	ret	
 515  0025               L741:
 516                     ; 122 		MT.Sensor_OA_B=1;
 518  0025 35010006      	mov	_MT+6,#1
 519                     ; 124 }
 522  0029 81            	ret	
 560                     ; 127 PT_THREAD(Key_Scan(void))
 560                     ; 128 {
 561                     .text:	section	.text,new
 562  0000               _Key_Scan:
 564  0000 88            	push	a
 565       00000001      OFST:	set	1
 568                     ; 129 	PT_BEGIN(&pt_Keyscan);
 572  0001 be00          	ldw	x,_pt_Keyscan
 574                     ; 146 			MT.Key_B=1;
 575  0003 2717          	jreq	L351
 576  0005 1d0086        	subw	x,#134
 577  0008 2726          	jreq	L551
 578  000a 1d0002        	subw	x,#2
 579  000d 273d          	jreq	L751
 580  000f 1d0007        	subw	x,#7
 581  0012 2761          	jreq	L161
 582  0014 1d0002        	subw	x,#2
 583  0017 2778          	jreq	L361
 584  0019 cc00a6        	jra	L502
 585  001c               L351:
 586                     ; 131 	if(GPIO_ReadInputPin(KEY_PORT,KEY_A)){	//按键动作
 589  001c 4b04          	push	#4
 590  001e ae500f        	ldw	x,#20495
 591  0021 cd0000        	call	_GPIO_ReadInputPin
 593  0024 5b01          	addw	sp,#1
 594  0026 4d            	tnz	a
 595  0027 2738          	jreq	L702
 596                     ; 133 		pt_Keyscan_cnt=0;
 598  0029 3f02          	clr	_pt_Keyscan_cnt
 599                     ; 134 		PT_WAIT_UNTIL(&pt_Keyscan,pt_Keyscan_cnt>5);
 601  002b ae0086        	ldw	x,#134
 602  002e bf00          	ldw	_pt_Keyscan,x
 603  0030               L551:
 607  0030 b602          	ld	a,_pt_Keyscan_cnt
 608  0032 a106          	cp	a,#6
 609  0034 2404          	jruge	L512
 612  0036 4f            	clr	a
 615  0037 5b01          	addw	sp,#1
 616  0039 81            	ret	
 617  003a               L512:
 618                     ; 135 		if(GPIO_ReadInputPin(KEY_PORT,KEY_A)){	//有效的按键动作
 620  003a 4b04          	push	#4
 621  003c ae500f        	ldw	x,#20495
 622  003f cd0000        	call	_GPIO_ReadInputPin
 624  0042 5b01          	addw	sp,#1
 625  0044 4d            	tnz	a
 626  0045 271a          	jreq	L702
 627                     ; 136 			PT_WAIT_UNTIL(&pt_Keyscan,GPIO_ReadInputPin(KEY_PORT,KEY_A)==0);	//等待按键释放
 629  0047 ae0088        	ldw	x,#136
 630  004a bf00          	ldw	_pt_Keyscan,x
 631  004c               L751:
 635  004c 4b04          	push	#4
 636  004e ae500f        	ldw	x,#20495
 637  0051 cd0000        	call	_GPIO_ReadInputPin
 639  0054 5b01          	addw	sp,#1
 640  0056 4d            	tnz	a
 641  0057 2704          	jreq	L522
 644  0059 4f            	clr	a
 647  005a 5b01          	addw	sp,#1
 648  005c 81            	ret	
 649  005d               L522:
 650                     ; 137 			MT.Key_A=1;
 652  005d 35010008      	mov	_MT+8,#1
 653  0061               L702:
 654                     ; 140 	if(GPIO_ReadInputPin(KEY_PORT,KEY_B)){	//按键动作
 656  0061 4b08          	push	#8
 657  0063 ae500f        	ldw	x,#20495
 658  0066 cd0000        	call	_GPIO_ReadInputPin
 660  0069 5b01          	addw	sp,#1
 661  006b 4d            	tnz	a
 662  006c 2738          	jreq	L502
 663                     ; 142 		pt_Keyscan_cnt=0;
 665  006e 3f02          	clr	_pt_Keyscan_cnt
 666                     ; 143 		PT_WAIT_UNTIL(&pt_Keyscan,pt_Keyscan_cnt>5);
 668  0070 ae008f        	ldw	x,#143
 669  0073 bf00          	ldw	_pt_Keyscan,x
 670  0075               L161:
 674  0075 b602          	ld	a,_pt_Keyscan_cnt
 675  0077 a106          	cp	a,#6
 676  0079 2404          	jruge	L532
 679  007b 4f            	clr	a
 682  007c 5b01          	addw	sp,#1
 683  007e 81            	ret	
 684  007f               L532:
 685                     ; 144 		if(GPIO_ReadInputPin(KEY_PORT,KEY_B)){
 687  007f 4b08          	push	#8
 688  0081 ae500f        	ldw	x,#20495
 689  0084 cd0000        	call	_GPIO_ReadInputPin
 691  0087 5b01          	addw	sp,#1
 692  0089 4d            	tnz	a
 693  008a 271a          	jreq	L502
 694                     ; 145 			PT_WAIT_UNTIL(&pt_Keyscan,GPIO_ReadInputPin(KEY_PORT,KEY_B)==0);	//等待按键释放
 696  008c ae0091        	ldw	x,#145
 697  008f bf00          	ldw	_pt_Keyscan,x
 698  0091               L361:
 702  0091 4b08          	push	#8
 703  0093 ae500f        	ldw	x,#20495
 704  0096 cd0000        	call	_GPIO_ReadInputPin
 706  0099 5b01          	addw	sp,#1
 707  009b 4d            	tnz	a
 708  009c 2704          	jreq	L542
 711  009e 4f            	clr	a
 714  009f 5b01          	addw	sp,#1
 715  00a1 81            	ret	
 716  00a2               L542:
 717                     ; 146 			MT.Key_B=1;
 719  00a2 35010009      	mov	_MT+9,#1
 720  00a6               L502:
 721                     ; 150 	PT_END(&pt_Keyscan);
 726  00a6 5f            	clrw	x
 727  00a7 bf00          	ldw	_pt_Keyscan,x
 731  00a9 a602          	ld	a,#2
 734  00ab 5b01          	addw	sp,#1
 735  00ad 81            	ret	
 761                     ; 153 void MT_Control(void)
 761                     ; 154 {
 762                     .text:	section	.text,new
 763  0000               _MT_Control:
 767                     ; 155 	if(MT.Key_A&&(MT.Sensor_OA_A==0)){	//正向满足运行条件
 769  0000 b608          	ld	a,_MT+8
 770  0002 2719          	jreq	L752
 772  0004 b605          	ld	a,_MT+5
 773  0006 2615          	jrne	L752
 774                     ; 156 		MT.Key_A=0;	//清除按键指令	
 776  0008 b708          	ld	_MT+8,a
 777                     ; 157 		if(MT.status==MT_STOPPED){				//停止状态可以直接启动
 779  000a 3d00          	tnz	_MT
 780  000c 260a          	jrne	L162
 781                     ; 158 			Motor_Start(MOTOR_FORWARD);
 783  000e 4c            	inc	a
 784  000f cd0000        	call	_Motor_Start
 786                     ; 159 			MT.status=MT_RUNNING_FORWARD;		//更新运行状态
 788  0012 35010000      	mov	_MT,#1
 790  0016 2005          	jra	L752
 791  0018               L162:
 792                     ; 161 			Motor_Stop();
 794  0018 cd0000        	call	_Motor_Stop
 796                     ; 162 			MT.status=MT_STOPPED;						//更新运行状态
 798  001b 3f00          	clr	_MT
 799  001d               L752:
 800                     ; 166 	if(MT.Key_B&&(MT.Sensor_OA_B==0)){	//反向满足运行条件
 802  001d b609          	ld	a,_MT+9
 803  001f 2717          	jreq	L562
 805  0021 b606          	ld	a,_MT+6
 806  0023 2613          	jrne	L562
 807                     ; 167 		MT.Key_B=0;	//清除按键指令	
 809  0025 b709          	ld	_MT+9,a
 810                     ; 168 		if(MT.status==MT_STOPPED){				//停止状态可以直接启动
 812  0027 3d00          	tnz	_MT
 813  0029 2608          	jrne	L762
 814                     ; 169 			Motor_Start(MOTOR_BACKWARD);
 816  002b cd0000        	call	_Motor_Start
 818                     ; 170 			MT.status=MT_RUNNING_BACKWARD;		//更新运行状态
 820  002e 35110000      	mov	_MT,#17
 823  0032 81            	ret	
 824  0033               L762:
 825                     ; 172 			Motor_Stop();
 827  0033 cd0000        	call	_Motor_Stop
 829                     ; 173 			MT.status=MT_STOPPED;						//更新运行状态
 831  0036 3f00          	clr	_MT
 832  0038               L562:
 833                     ; 176 }
 836  0038 81            	ret	
 996                     	xdef	_MT
 997                     	switch	.ubsct
 998  0000               _pt_Keyscan:
 999  0000 0000          	ds.b	2
1000                     	xdef	_pt_Keyscan
1001                     	xdef	_MT_Control
1002                     	xdef	_Key_Scan
1003                     	xdef	_Sensor_OA_Scan
1004                     	xdef	_Motor_Stop
1005                     	xdef	_Motor_Start
1006                     	xdef	_Motor_Init
1007  0002               _pt_Keyscan_cnt:
1008  0002 00            	ds.b	1
1009                     	xdef	_pt_Keyscan_cnt
1010                     	xref	_TIM1_CtrlPWMOutputs
1011                     	xref	_TIM1_Cmd
1012                     	xref	_GPIO_ReadInputPin
1013                     	xref	_GPIO_WriteLow
1014                     	xref	_GPIO_WriteHigh
1015                     	xref	_GPIO_Init
1035                     	end
