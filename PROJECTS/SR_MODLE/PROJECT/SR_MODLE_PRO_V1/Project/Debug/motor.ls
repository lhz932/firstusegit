   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
  20                     	bsct
  21  0000               _MT:
  22  0000 00            	dc.b	0
  23  0001 000000000000  	ds.b	10
  54                     ; 55 static void Obstacle_Avoidance_Sensor_Init(void)
  54                     ; 56 {
  56                     .text:	section	.text,new
  57  0000               L3_Obstacle_Avoidance_Sensor_Init:
  61                     ; 57 	GPIO_Init(OBSTACLE_AVOIDANCE_SENSOR_PORT,
  61                     ; 58 						OBSTACLE_AVOIDANCE_SENSOR_A|OBSTACLE_AVOIDANCE_SENSOR_B,
  61                     ; 59 						GPIO_MODE_IN_PU_NO_IT);				
  63  0000 4b40          	push	#64
  64  0002 4b06          	push	#6
  65  0004 ae5000        	ldw	x,#20480
  66  0007 cd0000        	call	_GPIO_Init
  68  000a 85            	popw	x
  69                     ; 61 }
  72  000b 81            	ret	
  96                     ; 62 static void Speed_Sensor_Init(void)
  96                     ; 63 {
  97                     .text:	section	.text,new
  98  0000               L32_Speed_Sensor_Init:
 102                     ; 64 	GPIO_Init(SPEED_SENSOR_PORT,SPEED_SENSOR,GPIO_MODE_IN_PU_NO_IT);
 104  0000 4b40          	push	#64
 105  0002 4b10          	push	#16
 106  0004 ae500f        	ldw	x,#20495
 107  0007 cd0000        	call	_GPIO_Init
 109  000a 85            	popw	x
 110                     ; 65 }
 113  000b 81            	ret	
 138                     ; 66 static void Key_Init(void)
 138                     ; 67 {
 139                     .text:	section	.text,new
 140  0000               L53_Key_Init:
 144                     ; 68 	GPIO_Init(KEY_PORT,KEY_A|KEY_B,GPIO_MODE_IN_PU_NO_IT);
 146  0000 4b40          	push	#64
 147  0002 4b0c          	push	#12
 148  0004 ae500f        	ldw	x,#20495
 149  0007 cd0000        	call	_GPIO_Init
 151  000a 85            	popw	x
 152                     ; 69 	PT_INIT(&pt_Keyscan);
 154  000b 5f            	clrw	x
 155  000c bf05          	ldw	_pt_Keyscan,x
 156                     ; 70 }
 160  000e 81            	ret	
 186                     ; 71 static void Alarm_Init(void)
 186                     ; 72 {
 187                     .text:	section	.text,new
 188  0000               L74_Alarm_Init:
 192                     ; 73 	GPIO_Init(ALARM_PORT,ALARM,GPIO_MODE_OUT_PP_HIGH_SLOW);
 194  0000 4bd0          	push	#208
 195  0002 4b08          	push	#8
 196  0004 ae5000        	ldw	x,#20480
 197  0007 cd0000        	call	_GPIO_Init
 199  000a 85            	popw	x
 200                     ; 75 	PT_INIT(&pt_Alarm_Speaker);
 202  000b 5f            	clrw	x
 203  000c bf03          	ldw	_pt_Alarm_Speaker,x
 204                     ; 76 	PT_INIT(&pt_Alarm_Light);
 207  000e bf01          	ldw	_pt_Alarm_Light,x
 208                     ; 77 }
 212  0010 81            	ret	
 242                     ; 80 void Motor_Init(void)
 242                     ; 81 {
 243                     .text:	section	.text,new
 244  0000               _Motor_Init:
 248                     ; 83 	GPIO_Init(L298N_IN_PORT,L298N_IN1|L298N_IN2,GPIO_MODE_OUT_PP_LOW_SLOW);
 250  0000 4bc0          	push	#192
 251  0002 4b60          	push	#96
 252  0004 ae500f        	ldw	x,#20495
 253  0007 cd0000        	call	_GPIO_Init
 255  000a 85            	popw	x
 256                     ; 84 	GPIO_Init(MOTOR_PWM_PORT,MOTOR_PWM,GPIO_MODE_OUT_PP_LOW_SLOW);
 258  000b 4bc0          	push	#192
 259  000d 4b08          	push	#8
 260  000f ae500a        	ldw	x,#20490
 261  0012 cd0000        	call	_GPIO_Init
 263  0015 4f            	clr	a
 264  0016 85            	popw	x
 265                     ; 86 	TIM1_Cmd(DISABLE);																			//stop计数器
 267  0017 cd0000        	call	_TIM1_Cmd
 269                     ; 87 	TIM1_CtrlPWMOutputs(DISABLE);														// TIM1 Main Output disable
 271  001a 4f            	clr	a
 272  001b cd0000        	call	_TIM1_CtrlPWMOutputs
 274                     ; 89 	Obstacle_Avoidance_Sensor_Init();
 276  001e cd0000        	call	L3_Obstacle_Avoidance_Sensor_Init
 278                     ; 90 	Speed_Sensor_Init();
 280  0021 cd0000        	call	L32_Speed_Sensor_Init
 282                     ; 91 	Key_Init();
 284  0024 cd0000        	call	L53_Key_Init
 286                     ; 92 	Alarm_Init();
 289                     ; 97 }
 292  0027 cc0000        	jp	L74_Alarm_Init
 351                     ; 99 void Motor_Start(Motor_Direction_Typedef dir)
 351                     ; 100 {
 352                     .text:	section	.text,new
 353  0000               _Motor_Start:
 357                     ; 101 	if(dir){
 359  0000 4d            	tnz	a
 360  0001 270d          	jreq	L711
 361                     ; 102 		GPIO_WriteHigh(L298N_IN_PORT,L298N_IN1);
 363  0003 4b40          	push	#64
 364  0005 ae500f        	ldw	x,#20495
 365  0008 cd0000        	call	_GPIO_WriteHigh
 367  000b 84            	pop	a
 368                     ; 103 		GPIO_WriteLow(L298N_IN_PORT,L298N_IN2);
 370  000c 4b20          	push	#32
 373  000e 200b          	jra	L121
 374  0010               L711:
 375                     ; 105 		GPIO_WriteHigh(L298N_IN_PORT,L298N_IN2);
 377  0010 4b20          	push	#32
 378  0012 ae500f        	ldw	x,#20495
 379  0015 cd0000        	call	_GPIO_WriteHigh
 381  0018 84            	pop	a
 382                     ; 106 		GPIO_WriteLow(L298N_IN_PORT,L298N_IN1);
 384  0019 4b40          	push	#64
 386  001b               L121:
 387  001b ae500f        	ldw	x,#20495
 388  001e cd0000        	call	_GPIO_WriteLow
 389  0021 84            	pop	a
 390                     ; 109 	TIM1_Cmd(ENABLE);																			//使能计数器
 392  0022 a601          	ld	a,#1
 393  0024 cd0000        	call	_TIM1_Cmd
 395                     ; 110 	TIM1_CtrlPWMOutputs(ENABLE);													// TIM1 Main Output Enable
 397  0027 a601          	ld	a,#1
 399                     ; 111 }
 402  0029 cc0000        	jp	_TIM1_CtrlPWMOutputs
 428                     ; 112 void Motor_Stop(void)
 428                     ; 113 {
 429                     .text:	section	.text,new
 430  0000               _Motor_Stop:
 434                     ; 114 	TIM1_Cmd(DISABLE);																			//stop计数器
 436  0000 4f            	clr	a
 437  0001 cd0000        	call	_TIM1_Cmd
 439                     ; 115 	TIM1_CtrlPWMOutputs(DISABLE);														// TIM1 Main Output disable
 441  0004 4f            	clr	a
 442  0005 cd0000        	call	_TIM1_CtrlPWMOutputs
 444                     ; 116 	GPIO_WriteLow(L298N_IN_PORT,L298N_IN1);
 446  0008 4b40          	push	#64
 447  000a ae500f        	ldw	x,#20495
 448  000d cd0000        	call	_GPIO_WriteLow
 450  0010 84            	pop	a
 451                     ; 117 	GPIO_WriteLow(L298N_IN_PORT,L298N_IN2);
 453  0011 4b20          	push	#32
 454  0013 ae500f        	ldw	x,#20495
 455  0016 cd0000        	call	_GPIO_WriteLow
 457  0019 84            	pop	a
 458                     ; 118 }
 461  001a 81            	ret	
 486                     ; 121 void Sensor_OA_Scan(void)
 486                     ; 122 {
 487                     .text:	section	.text,new
 488  0000               _Sensor_OA_Scan:
 492                     ; 123 	if(GPIO_ReadInputPin(OBSTACLE_AVOIDANCE_SENSOR_PORT,OBSTACLE_AVOIDANCE_SENSOR_A)){	//
 494  0000 4b02          	push	#2
 495  0002 ae5000        	ldw	x,#20480
 496  0005 cd0000        	call	_GPIO_ReadInputPin
 498  0008 5b01          	addw	sp,#1
 499  000a 4d            	tnz	a
 500  000b 2704          	jreq	L341
 501                     ; 124 		MT.Sensor_OA_A=0;	
 503  000d 3f05          	clr	_MT+5
 505  000f 2004          	jra	L541
 506  0011               L341:
 507                     ; 126 		MT.Sensor_OA_A=1;
 509  0011 35010005      	mov	_MT+5,#1
 510  0015               L541:
 511                     ; 128 	if(GPIO_ReadInputPin(OBSTACLE_AVOIDANCE_SENSOR_PORT,OBSTACLE_AVOIDANCE_SENSOR_B)){	//
 513  0015 4b04          	push	#4
 514  0017 ae5000        	ldw	x,#20480
 515  001a cd0000        	call	_GPIO_ReadInputPin
 517  001d 5b01          	addw	sp,#1
 518  001f 4d            	tnz	a
 519  0020 2703          	jreq	L741
 520                     ; 129 		MT.Sensor_OA_B=0;	
 522  0022 3f06          	clr	_MT+6
 525  0024 81            	ret	
 526  0025               L741:
 527                     ; 131 		MT.Sensor_OA_B=1;
 529  0025 35010006      	mov	_MT+6,#1
 530                     ; 133 }
 533  0029 81            	ret	
 571                     ; 136 PT_THREAD(Key_Scan(void))
 571                     ; 137 {
 572                     .text:	section	.text,new
 573  0000               _Key_Scan:
 575  0000 88            	push	a
 576       00000001      OFST:	set	1
 579                     ; 138 	PT_BEGIN(&pt_Keyscan);
 583  0001 be05          	ldw	x,_pt_Keyscan
 585                     ; 155 			MT.Key_B=1;
 586  0003 2717          	jreq	L351
 587  0005 1d008f        	subw	x,#143
 588  0008 2726          	jreq	L551
 589  000a 1d0002        	subw	x,#2
 590  000d 273d          	jreq	L751
 591  000f 1d0007        	subw	x,#7
 592  0012 2761          	jreq	L161
 593  0014 1d0002        	subw	x,#2
 594  0017 2778          	jreq	L361
 595  0019 cc00a6        	jra	L502
 596  001c               L351:
 597                     ; 140 	if(GPIO_ReadInputPin(KEY_PORT,KEY_A)){	//按键动作
 600  001c 4b04          	push	#4
 601  001e ae500f        	ldw	x,#20495
 602  0021 cd0000        	call	_GPIO_ReadInputPin
 604  0024 5b01          	addw	sp,#1
 605  0026 4d            	tnz	a
 606  0027 2738          	jreq	L702
 607                     ; 142 		pt_Keyscan_cnt=0;
 609  0029 3f08          	clr	_pt_Keyscan_cnt
 610                     ; 143 		PT_WAIT_UNTIL(&pt_Keyscan,pt_Keyscan_cnt>5);
 612  002b ae008f        	ldw	x,#143
 613  002e bf05          	ldw	_pt_Keyscan,x
 614  0030               L551:
 618  0030 b608          	ld	a,_pt_Keyscan_cnt
 619  0032 a106          	cp	a,#6
 620  0034 2404          	jruge	L512
 623  0036 4f            	clr	a
 626  0037 5b01          	addw	sp,#1
 627  0039 81            	ret	
 628  003a               L512:
 629                     ; 144 		if(GPIO_ReadInputPin(KEY_PORT,KEY_A)){	//有效的按键动作
 631  003a 4b04          	push	#4
 632  003c ae500f        	ldw	x,#20495
 633  003f cd0000        	call	_GPIO_ReadInputPin
 635  0042 5b01          	addw	sp,#1
 636  0044 4d            	tnz	a
 637  0045 271a          	jreq	L702
 638                     ; 145 			PT_WAIT_UNTIL(&pt_Keyscan,GPIO_ReadInputPin(KEY_PORT,KEY_A)==0);	//等待按键释放
 640  0047 ae0091        	ldw	x,#145
 641  004a bf05          	ldw	_pt_Keyscan,x
 642  004c               L751:
 646  004c 4b04          	push	#4
 647  004e ae500f        	ldw	x,#20495
 648  0051 cd0000        	call	_GPIO_ReadInputPin
 650  0054 5b01          	addw	sp,#1
 651  0056 4d            	tnz	a
 652  0057 2704          	jreq	L522
 655  0059 4f            	clr	a
 658  005a 5b01          	addw	sp,#1
 659  005c 81            	ret	
 660  005d               L522:
 661                     ; 146 			MT.Key_A=1;
 663  005d 35010008      	mov	_MT+8,#1
 664  0061               L702:
 665                     ; 149 	if(GPIO_ReadInputPin(KEY_PORT,KEY_B)){	//按键动作
 667  0061 4b08          	push	#8
 668  0063 ae500f        	ldw	x,#20495
 669  0066 cd0000        	call	_GPIO_ReadInputPin
 671  0069 5b01          	addw	sp,#1
 672  006b 4d            	tnz	a
 673  006c 2738          	jreq	L502
 674                     ; 151 		pt_Keyscan_cnt=0;
 676  006e 3f08          	clr	_pt_Keyscan_cnt
 677                     ; 152 		PT_WAIT_UNTIL(&pt_Keyscan,pt_Keyscan_cnt>5);
 679  0070 ae0098        	ldw	x,#152
 680  0073 bf05          	ldw	_pt_Keyscan,x
 681  0075               L161:
 685  0075 b608          	ld	a,_pt_Keyscan_cnt
 686  0077 a106          	cp	a,#6
 687  0079 2404          	jruge	L532
 690  007b 4f            	clr	a
 693  007c 5b01          	addw	sp,#1
 694  007e 81            	ret	
 695  007f               L532:
 696                     ; 153 		if(GPIO_ReadInputPin(KEY_PORT,KEY_B)){
 698  007f 4b08          	push	#8
 699  0081 ae500f        	ldw	x,#20495
 700  0084 cd0000        	call	_GPIO_ReadInputPin
 702  0087 5b01          	addw	sp,#1
 703  0089 4d            	tnz	a
 704  008a 271a          	jreq	L502
 705                     ; 154 			PT_WAIT_UNTIL(&pt_Keyscan,GPIO_ReadInputPin(KEY_PORT,KEY_B)==0);	//等待按键释放
 707  008c ae009a        	ldw	x,#154
 708  008f bf05          	ldw	_pt_Keyscan,x
 709  0091               L361:
 713  0091 4b08          	push	#8
 714  0093 ae500f        	ldw	x,#20495
 715  0096 cd0000        	call	_GPIO_ReadInputPin
 717  0099 5b01          	addw	sp,#1
 718  009b 4d            	tnz	a
 719  009c 2704          	jreq	L542
 722  009e 4f            	clr	a
 725  009f 5b01          	addw	sp,#1
 726  00a1 81            	ret	
 727  00a2               L542:
 728                     ; 155 			MT.Key_B=1;
 730  00a2 35010009      	mov	_MT+9,#1
 731  00a6               L502:
 732                     ; 159 	PT_END(&pt_Keyscan);
 737  00a6 5f            	clrw	x
 738  00a7 bf05          	ldw	_pt_Keyscan,x
 742  00a9 a602          	ld	a,#2
 745  00ab 5b01          	addw	sp,#1
 746  00ad 81            	ret	
 772                     ; 162 void MT_Control(void)
 772                     ; 163 {
 773                     .text:	section	.text,new
 774  0000               _MT_Control:
 778                     ; 164 	if(MT.Key_A&&(MT.Sensor_OA_A==0)){	//正向满足运行条件
 780  0000 b608          	ld	a,_MT+8
 781  0002 2719          	jreq	L752
 783  0004 b605          	ld	a,_MT+5
 784  0006 2615          	jrne	L752
 785                     ; 165 		MT.Key_A=0;	//清除按键指令	
 787  0008 b708          	ld	_MT+8,a
 788                     ; 166 		if(MT.status==MT_STOPPED){				//停止状态可以直接启动
 790  000a 3d00          	tnz	_MT
 791  000c 260a          	jrne	L162
 792                     ; 167 			Motor_Start(MOTOR_FORWARD);
 794  000e 4c            	inc	a
 795  000f cd0000        	call	_Motor_Start
 797                     ; 168 			MT.status=MT_RUNNING_FORWARD;		//更新运行状态
 799  0012 35010000      	mov	_MT,#1
 801  0016 2005          	jra	L752
 802  0018               L162:
 803                     ; 170 			Motor_Stop();
 805  0018 cd0000        	call	_Motor_Stop
 807                     ; 171 			MT.status=MT_STOPPED;						//更新运行状态
 809  001b 3f00          	clr	_MT
 810  001d               L752:
 811                     ; 175 	if(MT.Key_B&&(MT.Sensor_OA_B==0)){	//反向满足运行条件
 813  001d b609          	ld	a,_MT+9
 814  001f 2718          	jreq	L562
 816  0021 b606          	ld	a,_MT+6
 817  0023 2614          	jrne	L562
 818                     ; 176 		MT.Key_B=0;	//清除按键指令	
 820  0025 b709          	ld	_MT+9,a
 821                     ; 177 		if(MT.status==MT_STOPPED){				//停止状态可以直接启动
 823  0027 3d00          	tnz	_MT
 824  0029 2609          	jrne	L762
 825                     ; 178 			Motor_Start(MOTOR_BACKWARD);
 827  002b cd0000        	call	_Motor_Start
 829                     ; 179 			MT.status=MT_RUNNING_BACKWARD;		//更新运行状态
 831  002e 35110000      	mov	_MT,#17
 833  0032 2005          	jra	L562
 834  0034               L762:
 835                     ; 181 			Motor_Stop();
 837  0034 cd0000        	call	_Motor_Stop
 839                     ; 182 			MT.status=MT_STOPPED;						//更新运行状态
 841  0037 3f00          	clr	_MT
 842  0039               L562:
 843                     ; 186 	if((MT.status==MT_RUNNING_FORWARD)&&(MT.Sensor_OA_A==1))	//正向急停
 845  0039 b600          	ld	a,_MT
 846  003b 4a            	dec	a
 847  003c 260a          	jrne	L372
 849  003e b605          	ld	a,_MT+5
 850  0040 4a            	dec	a
 851  0041 2605          	jrne	L372
 852                     ; 188 		Motor_Stop();
 854  0043 cd0000        	call	_Motor_Stop
 856                     ; 189 		MT.status=MT_STOPPED;						//更新运行状态
 858  0046 3f00          	clr	_MT
 859  0048               L372:
 860                     ; 191 	if((MT.status==MT_RUNNING_BACKWARD)&&(MT.Sensor_OA_B==1))	//反向急停
 862  0048 b600          	ld	a,_MT
 863  004a a111          	cp	a,#17
 864  004c 260a          	jrne	L572
 866  004e b606          	ld	a,_MT+6
 867  0050 4a            	dec	a
 868  0051 2605          	jrne	L572
 869                     ; 193 		Motor_Stop();
 871  0053 cd0000        	call	_Motor_Stop
 873                     ; 194 		MT.status=MT_STOPPED;						//更新运行状态
 875  0056 3f00          	clr	_MT
 876  0058               L572:
 877                     ; 198 }
 880  0058 81            	ret	
 918                     ; 199 PT_THREAD(Alarm_Speaker(void))
 918                     ; 200 {
 919                     .text:	section	.text,new
 920  0000               _Alarm_Speaker:
 922  0000 88            	push	a
 923       00000001      OFST:	set	1
 926                     ; 201 	PT_BEGIN(&pt_Alarm_Speaker);
 930  0001 be03          	ldw	x,_pt_Alarm_Speaker
 932                     ; 209 	GPIO_WriteHigh(ALARM_PORT,ALARM);
 933  0003 270c          	jreq	L772
 934  0005 1d00cc        	subw	x,#204
 935  0008 270e          	jreq	L103
 936  000a 1d0004        	subw	x,#4
 937  000d 2723          	jreq	L303
 938  000f 2034          	jra	L523
 939  0011               L772:
 940                     ; 203 	pt_Alarm_Speaker_cnt=0;
 943  0011 3f07          	clr	_pt_Alarm_Speaker_cnt
 944                     ; 204 	PT_WAIT_UNTIL(&pt_Alarm_Speaker,pt_Alarm_Speaker_cnt>30);
 946  0013 ae00cc        	ldw	x,#204
 947  0016 bf03          	ldw	_pt_Alarm_Speaker,x
 948  0018               L103:
 952  0018 b607          	ld	a,_pt_Alarm_Speaker_cnt
 953  001a a11f          	cp	a,#31
 954  001c 2404          	jruge	L333
 957  001e 4f            	clr	a
 960  001f 5b01          	addw	sp,#1
 961  0021 81            	ret	
 962  0022               L333:
 963                     ; 205 	GPIO_WriteLow(ALARM_PORT,ALARM);
 965  0022 4b08          	push	#8
 966  0024 ae5000        	ldw	x,#20480
 967  0027 cd0000        	call	_GPIO_WriteLow
 969  002a 3f07          	clr	_pt_Alarm_Speaker_cnt
 970  002c ae00d0        	ldw	x,#208
 971  002f bf03          	ldw	_pt_Alarm_Speaker,x
 972  0031 84            	pop	a
 973                     ; 207 	pt_Alarm_Speaker_cnt=0;
 975                     ; 208 	PT_WAIT_UNTIL(&pt_Alarm_Speaker,pt_Alarm_Speaker_cnt>50);
 977  0032               L303:
 981  0032 b607          	ld	a,_pt_Alarm_Speaker_cnt
 982  0034 a133          	cp	a,#51
 983  0036 2404          	jruge	L143
 986  0038 4f            	clr	a
 989  0039 5b01          	addw	sp,#1
 990  003b 81            	ret	
 991  003c               L143:
 992                     ; 209 	GPIO_WriteHigh(ALARM_PORT,ALARM);
 994  003c 4b08          	push	#8
 995  003e ae5000        	ldw	x,#20480
 996  0041 cd0000        	call	_GPIO_WriteHigh
 998  0044 84            	pop	a
 999  0045               L523:
1000                     ; 211 	PT_END(&pt_Alarm_Speaker);
1005  0045 5f            	clrw	x
1006  0046 bf03          	ldw	_pt_Alarm_Speaker,x
1010  0048 a602          	ld	a,#2
1013  004a 5b01          	addw	sp,#1
1014  004c 81            	ret	
1040                     ; 216 void Alarm(void)
1040                     ; 217 {
1041                     .text:	section	.text,new
1042  0000               _Alarm:
1046                     ; 218 	if(MT.status&0x01)	//if running
1048  0000 7201000003    	btjf	_MT,#0,L353
1049                     ; 220 		Alarm_Speaker();
1054  0005 cc0000        	jp	_Alarm_Speaker
1055  0008               L353:
1056                     ; 222 		GPIO_WriteHigh(ALARM_PORT,ALARM);
1058  0008 4b08          	push	#8
1059  000a ae5000        	ldw	x,#20480
1060  000d cd0000        	call	_GPIO_WriteHigh
1062  0010 84            	pop	a
1063                     ; 224 }
1066  0011 81            	ret	
1265                     	xdef	_Alarm_Speaker
1266                     	xdef	_MT
1267                     	switch	.ubsct
1268  0000               _pt_Alarm_Light_cnt:
1269  0000 00            	ds.b	1
1270                     	xdef	_pt_Alarm_Light_cnt
1271  0001               _pt_Alarm_Light:
1272  0001 0000          	ds.b	2
1273                     	xdef	_pt_Alarm_Light
1274  0003               _pt_Alarm_Speaker:
1275  0003 0000          	ds.b	2
1276                     	xdef	_pt_Alarm_Speaker
1277  0005               _pt_Keyscan:
1278  0005 0000          	ds.b	2
1279                     	xdef	_pt_Keyscan
1280                     	xdef	_Alarm
1281                     	xdef	_MT_Control
1282                     	xdef	_Key_Scan
1283                     	xdef	_Sensor_OA_Scan
1284                     	xdef	_Motor_Stop
1285                     	xdef	_Motor_Start
1286                     	xdef	_Motor_Init
1287  0007               _pt_Alarm_Speaker_cnt:
1288  0007 00            	ds.b	1
1289                     	xdef	_pt_Alarm_Speaker_cnt
1290  0008               _pt_Keyscan_cnt:
1291  0008 00            	ds.b	1
1292                     	xdef	_pt_Keyscan_cnt
1293                     	xref	_TIM1_CtrlPWMOutputs
1294                     	xref	_TIM1_Cmd
1295                     	xref	_GPIO_ReadInputPin
1296                     	xref	_GPIO_WriteLow
1297                     	xref	_GPIO_WriteHigh
1298                     	xref	_GPIO_Init
1318                     	end
