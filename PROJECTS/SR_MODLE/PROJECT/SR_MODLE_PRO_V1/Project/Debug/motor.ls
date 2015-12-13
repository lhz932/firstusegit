   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
  21                     	bsct
  22  0000               _MT:
  23  0000 00            	dc.b	0
  24  0001 000000000000  	ds.b	10
  25  000b               _Speed_Pulse_Status:
  26  000b 00            	dc.b	0
  57                     ; 63 static void Obstacle_Avoidance_Sensor_Init(void)
  57                     ; 64 {
  59                     .text:	section	.text,new
  60  0000               L3_Obstacle_Avoidance_Sensor_Init:
  64                     ; 65 	GPIO_Init(OBSTACLE_AVOIDANCE_SENSOR_PORT,
  64                     ; 66 						OBSTACLE_AVOIDANCE_SENSOR_A|OBSTACLE_AVOIDANCE_SENSOR_B,
  64                     ; 67 						GPIO_MODE_IN_PU_NO_IT);				
  66  0000 4b40          	push	#64
  67  0002 4b06          	push	#6
  68  0004 ae5000        	ldw	x,#20480
  69  0007 cd0000        	call	_GPIO_Init
  71  000a 85            	popw	x
  72                     ; 69 }
  75  000b 81            	ret	
  99                     ; 70 static void Speed_Sensor_Init(void)
  99                     ; 71 {
 100                     .text:	section	.text,new
 101  0000               L32_Speed_Sensor_Init:
 105                     ; 72 	GPIO_Init(SPEED_SENSOR_PORT,SPEED_SENSOR,GPIO_MODE_IN_PU_NO_IT);
 107  0000 4b40          	push	#64
 108  0002 4b08          	push	#8
 109  0004 ae5000        	ldw	x,#20480
 110  0007 cd0000        	call	_GPIO_Init
 112  000a 85            	popw	x
 113                     ; 73 }
 116  000b 81            	ret	
 141                     ; 74 static void Key_Init(void)
 141                     ; 75 {
 142                     .text:	section	.text,new
 143  0000               L53_Key_Init:
 147                     ; 76 	GPIO_Init(KEY_PORT,KEY_A|KEY_B,GPIO_MODE_IN_PU_NO_IT);
 149  0000 4b40          	push	#64
 150  0002 4b30          	push	#48
 151  0004 ae5005        	ldw	x,#20485
 152  0007 cd0000        	call	_GPIO_Init
 154  000a 85            	popw	x
 155                     ; 77 	PT_INIT(&pt_Keyscan);
 157  000b 5f            	clrw	x
 158  000c bf05          	ldw	_pt_Keyscan,x
 159                     ; 78 }
 163  000e 81            	ret	
 189                     ; 79 static void Alarm_Init(void)
 189                     ; 80 {
 190                     .text:	section	.text,new
 191  0000               L74_Alarm_Init:
 195                     ; 81 	GPIO_Init(ALARM_PORT,ALARM,GPIO_MODE_OUT_PP_HIGH_SLOW);
 197  0000 4bd0          	push	#208
 198  0002 4b10          	push	#16
 199  0004 ae500f        	ldw	x,#20495
 200  0007 cd0000        	call	_GPIO_Init
 202  000a 85            	popw	x
 203                     ; 83 	PT_INIT(&pt_Alarm_Speaker);
 205  000b 5f            	clrw	x
 206  000c bf03          	ldw	_pt_Alarm_Speaker,x
 207                     ; 84 	PT_INIT(&pt_Alarm_Light);
 210  000e bf01          	ldw	_pt_Alarm_Light,x
 211                     ; 85 }
 215  0010 81            	ret	
 245                     ; 88 void Motor_Init(void)
 245                     ; 89 {
 246                     .text:	section	.text,new
 247  0000               _Motor_Init:
 251                     ; 91 	GPIO_Init(L298N_IN_PORT,L298N_IN1|L298N_IN2,GPIO_MODE_OUT_PP_LOW_SLOW);
 253  0000 4bc0          	push	#192
 254  0002 4b60          	push	#96
 255  0004 ae500f        	ldw	x,#20495
 256  0007 cd0000        	call	_GPIO_Init
 258  000a 85            	popw	x
 259                     ; 92 	GPIO_Init(MOTOR_PWM_PORT,MOTOR_PWM,GPIO_MODE_OUT_PP_LOW_SLOW);
 261  000b 4bc0          	push	#192
 262  000d 4b08          	push	#8
 263  000f ae500a        	ldw	x,#20490
 264  0012 cd0000        	call	_GPIO_Init
 266  0015 4f            	clr	a
 267  0016 85            	popw	x
 268                     ; 94 	TIM1_Cmd(DISABLE);																			//stop计数器
 270  0017 cd0000        	call	_TIM1_Cmd
 272                     ; 95 	TIM1_CtrlPWMOutputs(DISABLE);														// TIM1 Main Output disable
 274  001a 4f            	clr	a
 275  001b cd0000        	call	_TIM1_CtrlPWMOutputs
 277                     ; 97 	Obstacle_Avoidance_Sensor_Init();
 279  001e cd0000        	call	L3_Obstacle_Avoidance_Sensor_Init
 281                     ; 98 	Speed_Sensor_Init();
 283  0021 cd0000        	call	L32_Speed_Sensor_Init
 285                     ; 99 	Key_Init();
 287  0024 cd0000        	call	L53_Key_Init
 289                     ; 100 	Alarm_Init();
 292                     ; 105 }
 295  0027 cc0000        	jp	L74_Alarm_Init
 354                     ; 107 void Motor_Start(Motor_Direction_Typedef dir)
 354                     ; 108 {
 355                     .text:	section	.text,new
 356  0000               _Motor_Start:
 360                     ; 109 	if(dir){
 362  0000 4d            	tnz	a
 363  0001 270d          	jreq	L711
 364                     ; 110 		GPIO_WriteHigh(L298N_IN_PORT,L298N_IN1);
 366  0003 4b20          	push	#32
 367  0005 ae500f        	ldw	x,#20495
 368  0008 cd0000        	call	_GPIO_WriteHigh
 370  000b 84            	pop	a
 371                     ; 111 		GPIO_WriteLow(L298N_IN_PORT,L298N_IN2);
 373  000c 4b40          	push	#64
 376  000e 200b          	jra	L121
 377  0010               L711:
 378                     ; 113 		GPIO_WriteHigh(L298N_IN_PORT,L298N_IN2);
 380  0010 4b40          	push	#64
 381  0012 ae500f        	ldw	x,#20495
 382  0015 cd0000        	call	_GPIO_WriteHigh
 384  0018 84            	pop	a
 385                     ; 114 		GPIO_WriteLow(L298N_IN_PORT,L298N_IN1);
 387  0019 4b20          	push	#32
 389  001b               L121:
 390  001b ae500f        	ldw	x,#20495
 391  001e cd0000        	call	_GPIO_WriteLow
 392  0021 84            	pop	a
 393                     ; 117 	TIM1_Cmd(ENABLE);																			//使能计数器
 395  0022 a601          	ld	a,#1
 396  0024 cd0000        	call	_TIM1_Cmd
 398                     ; 118 	TIM1_CtrlPWMOutputs(ENABLE);													// TIM1 Main Output Enable
 400  0027 a601          	ld	a,#1
 402                     ; 119 }
 405  0029 cc0000        	jp	_TIM1_CtrlPWMOutputs
 431                     ; 120 void Motor_Stop(void)
 431                     ; 121 {
 432                     .text:	section	.text,new
 433  0000               _Motor_Stop:
 437                     ; 122 	TIM1_Cmd(DISABLE);																			//stop计数器
 439  0000 4f            	clr	a
 440  0001 cd0000        	call	_TIM1_Cmd
 442                     ; 123 	TIM1_CtrlPWMOutputs(DISABLE);														// TIM1 Main Output disable
 444  0004 4f            	clr	a
 445  0005 cd0000        	call	_TIM1_CtrlPWMOutputs
 447                     ; 124 	GPIO_WriteLow(L298N_IN_PORT,L298N_IN1);
 449  0008 4b20          	push	#32
 450  000a ae500f        	ldw	x,#20495
 451  000d cd0000        	call	_GPIO_WriteLow
 453  0010 84            	pop	a
 454                     ; 125 	GPIO_WriteLow(L298N_IN_PORT,L298N_IN2);
 456  0011 4b40          	push	#64
 457  0013 ae500f        	ldw	x,#20495
 458  0016 cd0000        	call	_GPIO_WriteLow
 460  0019 84            	pop	a
 461                     ; 126 }
 464  001a 81            	ret	
 489                     ; 129 void Sensor_OA_Scan(void)
 489                     ; 130 {
 490                     .text:	section	.text,new
 491  0000               _Sensor_OA_Scan:
 495                     ; 131 	if(GPIO_ReadInputPin(OBSTACLE_AVOIDANCE_SENSOR_PORT,OBSTACLE_AVOIDANCE_SENSOR_A)){	//
 497  0000 4b02          	push	#2
 498  0002 ae5000        	ldw	x,#20480
 499  0005 cd0000        	call	_GPIO_ReadInputPin
 501  0008 5b01          	addw	sp,#1
 502  000a 4d            	tnz	a
 503  000b 2704          	jreq	L341
 504                     ; 132 		MT.Sensor_OA_A=0;	
 506  000d 3f05          	clr	_MT+5
 508  000f 2004          	jra	L541
 509  0011               L341:
 510                     ; 134 		MT.Sensor_OA_A=1;
 512  0011 35010005      	mov	_MT+5,#1
 513  0015               L541:
 514                     ; 136 	if(GPIO_ReadInputPin(OBSTACLE_AVOIDANCE_SENSOR_PORT,OBSTACLE_AVOIDANCE_SENSOR_B)){	//
 516  0015 4b04          	push	#4
 517  0017 ae5000        	ldw	x,#20480
 518  001a cd0000        	call	_GPIO_ReadInputPin
 520  001d 5b01          	addw	sp,#1
 521  001f 4d            	tnz	a
 522  0020 2703          	jreq	L741
 523                     ; 137 		MT.Sensor_OA_B=0;	
 525  0022 3f06          	clr	_MT+6
 528  0024 81            	ret	
 529  0025               L741:
 530                     ; 139 		MT.Sensor_OA_B=1;
 532  0025 35010006      	mov	_MT+6,#1
 533                     ; 141 }
 536  0029 81            	ret	
 574                     ; 144 PT_THREAD(Key_Scan(void))
 574                     ; 145 {
 575                     .text:	section	.text,new
 576  0000               _Key_Scan:
 578  0000 88            	push	a
 579       00000001      OFST:	set	1
 582                     ; 146 	PT_BEGIN(&pt_Keyscan);
 586  0001 be05          	ldw	x,_pt_Keyscan
 588                     ; 163 			MT.Key_B=1;
 589  0003 2716          	jreq	L351
 590  0005 1d0097        	subw	x,#151
 591  0008 271c          	jreq	L551
 592  000a 1d0002        	subw	x,#2
 593  000d 2728          	jreq	L751
 594  000f 1d0007        	subw	x,#7
 595  0012 2738          	jreq	L161
 596  0014 1d0002        	subw	x,#2
 597  0017 2744          	jreq	L361
 598  0019 204c          	jra	L502
 599  001b               L351:
 600                     ; 148 	if(GPIO_ReadInputPin(KEY_PORT,KEY_A)){	//按键动作
 603  001b ad52          	call	LC001
 604  001d 2722          	jreq	L702
 605                     ; 150 		pt_Keyscan_cnt=0;
 607  001f 3f0c          	clr	_pt_Keyscan_cnt
 608                     ; 151 		PT_WAIT_UNTIL(&pt_Keyscan,pt_Keyscan_cnt>5);
 610  0021 ae0097        	ldw	x,#151
 611  0024 bf05          	ldw	_pt_Keyscan,x
 612  0026               L551:
 616  0026 b60c          	ld	a,_pt_Keyscan_cnt
 617  0028 a106          	cp	a,#6
 618  002a 2402          	jruge	L512
 621  002c 2059          	jp	LC003
 622  002e               L512:
 623                     ; 152 		if(GPIO_ReadInputPin(KEY_PORT,KEY_A)){	//有效的按键动作
 625  002e ad3f          	call	LC001
 626  0030 270f          	jreq	L702
 627                     ; 153 			PT_WAIT_UNTIL(&pt_Keyscan,GPIO_ReadInputPin(KEY_PORT,KEY_A)==0);	//等待按键释放
 629  0032 ae0099        	ldw	x,#153
 630  0035 bf05          	ldw	_pt_Keyscan,x
 631  0037               L751:
 635  0037 ad36          	call	LC001
 636  0039 2702          	jreq	L522
 639  003b 204a          	jp	LC003
 640  003d               L522:
 641                     ; 154 			MT.Key_A=1;
 643  003d 35010008      	mov	_MT+8,#1
 644  0041               L702:
 645                     ; 157 	if(GPIO_ReadInputPin(KEY_PORT,KEY_B)){	//按键动作
 647  0041 ad38          	call	LC002
 648  0043 2722          	jreq	L502
 649                     ; 159 		pt_Keyscan_cnt=0;
 651  0045 3f0c          	clr	_pt_Keyscan_cnt
 652                     ; 160 		PT_WAIT_UNTIL(&pt_Keyscan,pt_Keyscan_cnt>5);
 654  0047 ae00a0        	ldw	x,#160
 655  004a bf05          	ldw	_pt_Keyscan,x
 656  004c               L161:
 660  004c b60c          	ld	a,_pt_Keyscan_cnt
 661  004e a106          	cp	a,#6
 662  0050 2402          	jruge	L532
 665  0052 2033          	jp	LC003
 666  0054               L532:
 667                     ; 161 		if(GPIO_ReadInputPin(KEY_PORT,KEY_B)){
 669  0054 ad25          	call	LC002
 670  0056 270f          	jreq	L502
 671                     ; 162 			PT_WAIT_UNTIL(&pt_Keyscan,GPIO_ReadInputPin(KEY_PORT,KEY_B)==0);	//等待按键释放
 673  0058 ae00a2        	ldw	x,#162
 674  005b bf05          	ldw	_pt_Keyscan,x
 675  005d               L361:
 679  005d ad1c          	call	LC002
 680  005f 2702          	jreq	L542
 683  0061 2024          	jp	LC003
 684  0063               L542:
 685                     ; 163 			MT.Key_B=1;
 687  0063 35010009      	mov	_MT+9,#1
 688  0067               L502:
 689                     ; 167 	PT_END(&pt_Keyscan);
 694  0067 5f            	clrw	x
 695  0068 bf05          	ldw	_pt_Keyscan,x
 699  006a a602          	ld	a,#2
 702  006c 5b01          	addw	sp,#1
 703  006e 81            	ret	
 704  006f               LC001:
 705  006f 4b10          	push	#16
 706  0071 ae5005        	ldw	x,#20485
 707  0074 cd0000        	call	_GPIO_ReadInputPin
 709  0077 5b01          	addw	sp,#1
 710  0079 4d            	tnz	a
 711  007a 81            	ret	
 712  007b               LC002:
 713  007b 4b20          	push	#32
 714  007d ae5005        	ldw	x,#20485
 715  0080 cd0000        	call	_GPIO_ReadInputPin
 717  0083 5b01          	addw	sp,#1
 718  0085 4d            	tnz	a
 719  0086 81            	ret	
 720  0087               LC003:
 721  0087 4f            	clr	a
 722                     ; 162 			PT_WAIT_UNTIL(&pt_Keyscan,GPIO_ReadInputPin(KEY_PORT,KEY_B)==0);	//等待按键释放
 724  0088 5b01          	addw	sp,#1
 725  008a 81            	ret	
 751                     ; 173 void MT_Control(void)
 751                     ; 174 {
 752                     .text:	section	.text,new
 753  0000               _MT_Control:
 757                     ; 175 	if(MT.Key_A&&(MT.Sensor_OA_A==0)){	//正向满足运行条件
 759  0000 b608          	ld	a,_MT+8
 760  0002 2719          	jreq	L752
 762  0004 b605          	ld	a,_MT+5
 763  0006 2615          	jrne	L752
 764                     ; 176 		MT.Key_A=0;	//清除按键指令	
 766  0008 b708          	ld	_MT+8,a
 767                     ; 177 		if(MT.status==MT_STOPPED){				//停止状态可以直接启动
 769  000a 3d00          	tnz	_MT
 770  000c 260a          	jrne	L162
 771                     ; 178 			Motor_Start(MOTOR_FORWARD);
 773  000e 4c            	inc	a
 774  000f cd0000        	call	_Motor_Start
 776                     ; 179 			MT.status=MT_RUNNING_FORWARD;		//更新运行状态
 778  0012 35010000      	mov	_MT,#1
 780  0016 2005          	jra	L752
 781  0018               L162:
 782                     ; 181 			Motor_Stop();
 784  0018 cd0000        	call	_Motor_Stop
 786                     ; 182 			MT.status=MT_STOPPED;						//更新运行状态
 788  001b 3f00          	clr	_MT
 789  001d               L752:
 790                     ; 186 	if(MT.Key_B&&(MT.Sensor_OA_B==0)){	//反向满足运行条件
 792  001d b609          	ld	a,_MT+9
 793  001f 2718          	jreq	L562
 795  0021 b606          	ld	a,_MT+6
 796  0023 2614          	jrne	L562
 797                     ; 187 		MT.Key_B=0;	//清除按键指令	
 799  0025 b709          	ld	_MT+9,a
 800                     ; 188 		if(MT.status==MT_STOPPED){				//停止状态可以直接启动
 802  0027 3d00          	tnz	_MT
 803  0029 2609          	jrne	L762
 804                     ; 189 			Motor_Start(MOTOR_BACKWARD);
 806  002b cd0000        	call	_Motor_Start
 808                     ; 190 			MT.status=MT_RUNNING_BACKWARD;		//更新运行状态
 810  002e 35110000      	mov	_MT,#17
 812  0032 2005          	jra	L562
 813  0034               L762:
 814                     ; 192 			Motor_Stop();
 816  0034 cd0000        	call	_Motor_Stop
 818                     ; 193 			MT.status=MT_STOPPED;						//更新运行状态
 820  0037 3f00          	clr	_MT
 821  0039               L562:
 822                     ; 197 	if((MT.status==MT_RUNNING_FORWARD)&&(MT.Sensor_OA_A==1))	//正向急停
 824  0039 b600          	ld	a,_MT
 825  003b 4a            	dec	a
 826  003c 260a          	jrne	L372
 828  003e b605          	ld	a,_MT+5
 829  0040 4a            	dec	a
 830  0041 2605          	jrne	L372
 831                     ; 199 		Motor_Stop();
 833  0043 cd0000        	call	_Motor_Stop
 835                     ; 200 		MT.status=MT_STOPPED;						//更新运行状态
 837  0046 3f00          	clr	_MT
 838  0048               L372:
 839                     ; 202 	if((MT.status==MT_RUNNING_BACKWARD)&&(MT.Sensor_OA_B==1))	//反向急停
 841  0048 b600          	ld	a,_MT
 842  004a a111          	cp	a,#17
 843  004c 260a          	jrne	L572
 845  004e b606          	ld	a,_MT+6
 846  0050 4a            	dec	a
 847  0051 2605          	jrne	L572
 848                     ; 204 		Motor_Stop();
 850  0053 cd0000        	call	_Motor_Stop
 852                     ; 205 		MT.status=MT_STOPPED;						//更新运行状态
 854  0056 3f00          	clr	_MT
 855  0058               L572:
 856                     ; 209 }
 859  0058 81            	ret	
 897                     ; 210 PT_THREAD(Alarm_Speaker(void))
 897                     ; 211 {
 898                     .text:	section	.text,new
 899  0000               _Alarm_Speaker:
 901  0000 88            	push	a
 902       00000001      OFST:	set	1
 905                     ; 212 	PT_BEGIN(&pt_Alarm_Speaker);
 909  0001 be03          	ldw	x,_pt_Alarm_Speaker
 911                     ; 220 	GPIO_WriteHigh(ALARM_PORT,ALARM);
 912  0003 270c          	jreq	L772
 913  0005 1d00d7        	subw	x,#215
 914  0008 270e          	jreq	L103
 915  000a 1d0004        	subw	x,#4
 916  000d 2723          	jreq	L303
 917  000f 2034          	jra	L523
 918  0011               L772:
 919                     ; 214 	pt_Alarm_Speaker_cnt=0;
 922  0011 3f0b          	clr	_pt_Alarm_Speaker_cnt
 923                     ; 215 	PT_WAIT_UNTIL(&pt_Alarm_Speaker,pt_Alarm_Speaker_cnt>30);
 925  0013 ae00d7        	ldw	x,#215
 926  0016 bf03          	ldw	_pt_Alarm_Speaker,x
 927  0018               L103:
 931  0018 b60b          	ld	a,_pt_Alarm_Speaker_cnt
 932  001a a11f          	cp	a,#31
 933  001c 2404          	jruge	L333
 936  001e 4f            	clr	a
 939  001f 5b01          	addw	sp,#1
 940  0021 81            	ret	
 941  0022               L333:
 942                     ; 216 	GPIO_WriteLow(ALARM_PORT,ALARM);
 944  0022 4b10          	push	#16
 945  0024 ae500f        	ldw	x,#20495
 946  0027 cd0000        	call	_GPIO_WriteLow
 948  002a 3f0b          	clr	_pt_Alarm_Speaker_cnt
 949  002c ae00db        	ldw	x,#219
 950  002f bf03          	ldw	_pt_Alarm_Speaker,x
 951  0031 84            	pop	a
 952                     ; 218 	pt_Alarm_Speaker_cnt=0;
 954                     ; 219 	PT_WAIT_UNTIL(&pt_Alarm_Speaker,pt_Alarm_Speaker_cnt>50);
 956  0032               L303:
 960  0032 b60b          	ld	a,_pt_Alarm_Speaker_cnt
 961  0034 a133          	cp	a,#51
 962  0036 2404          	jruge	L143
 965  0038 4f            	clr	a
 968  0039 5b01          	addw	sp,#1
 969  003b 81            	ret	
 970  003c               L143:
 971                     ; 220 	GPIO_WriteHigh(ALARM_PORT,ALARM);
 973  003c 4b10          	push	#16
 974  003e ae500f        	ldw	x,#20495
 975  0041 cd0000        	call	_GPIO_WriteHigh
 977  0044 84            	pop	a
 978  0045               L523:
 979                     ; 222 	PT_END(&pt_Alarm_Speaker);
 984  0045 5f            	clrw	x
 985  0046 bf03          	ldw	_pt_Alarm_Speaker,x
 989  0048 a602          	ld	a,#2
 992  004a 5b01          	addw	sp,#1
 993  004c 81            	ret	
1019                     ; 227 void Alarm(void)
1019                     ; 228 {
1020                     .text:	section	.text,new
1021  0000               _Alarm:
1025                     ; 229 	if(MT.status&0x01)	//if running
1027  0000 7201000003    	btjf	_MT,#0,L353
1028                     ; 231 		Alarm_Speaker();
1033  0005 cc0000        	jp	_Alarm_Speaker
1034  0008               L353:
1035                     ; 233 		GPIO_WriteHigh(ALARM_PORT,ALARM);
1037  0008 4b10          	push	#16
1038  000a ae500f        	ldw	x,#20495
1039  000d cd0000        	call	_GPIO_WriteHigh
1041  0010 84            	pop	a
1042                     ; 235 }
1045  0011 81            	ret	
1299                     	xdef	_Alarm_Speaker
1300                     	switch	.ubsct
1301  0000               _pt_Alarm_Light_cnt:
1302  0000 00            	ds.b	1
1303                     	xdef	_pt_Alarm_Light_cnt
1304  0001               _pt_Alarm_Light:
1305  0001 0000          	ds.b	2
1306                     	xdef	_pt_Alarm_Light
1307  0003               _pt_Alarm_Speaker:
1308  0003 0000          	ds.b	2
1309                     	xdef	_pt_Alarm_Speaker
1310  0005               _pt_Keyscan:
1311  0005 0000          	ds.b	2
1312                     	xdef	_pt_Keyscan
1313                     	xdef	_Alarm
1314                     	xdef	_MT_Control
1315                     	xdef	_Key_Scan
1316                     	xdef	_Sensor_OA_Scan
1317                     	xdef	_Motor_Stop
1318                     	xdef	_Motor_Start
1319                     	xdef	_Motor_Init
1320  0007               _Speed_Pulse_cnt:
1321  0007 0000          	ds.b	2
1322                     	xdef	_Speed_Pulse_cnt
1323  0009               _Speed_Origin:
1324  0009 0000          	ds.b	2
1325                     	xdef	_Speed_Origin
1326                     	xdef	_Speed_Pulse_Status
1327  000b               _pt_Alarm_Speaker_cnt:
1328  000b 00            	ds.b	1
1329                     	xdef	_pt_Alarm_Speaker_cnt
1330  000c               _pt_Keyscan_cnt:
1331  000c 00            	ds.b	1
1332                     	xdef	_pt_Keyscan_cnt
1333                     	xdef	_MT
1334                     	xref	_TIM1_CtrlPWMOutputs
1335                     	xref	_TIM1_Cmd
1336                     	xref	_GPIO_ReadInputPin
1337                     	xref	_GPIO_WriteLow
1338                     	xref	_GPIO_WriteHigh
1339                     	xref	_GPIO_Init
1359                     	end
