   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
  21                     	bsct
  22  0000               _MT:
  23  0000 00            	dc.b	0
  24  0001 000000000000  	ds.b	11
  25  000c               _Speed_Pulse_Status:
  26  000c 00            	dc.b	0
  57                     ; 64 static void Obstacle_Avoidance_Sensor_Init(void)
  57                     ; 65 {
  59                     .text:	section	.text,new
  60  0000               L3_Obstacle_Avoidance_Sensor_Init:
  64                     ; 66 	GPIO_Init(OBSTACLE_AVOIDANCE_SENSOR_PORT,
  64                     ; 67 						OBSTACLE_AVOIDANCE_SENSOR_A|OBSTACLE_AVOIDANCE_SENSOR_B,
  64                     ; 68 						GPIO_MODE_IN_PU_NO_IT);				
  66  0000 4b40          	push	#64
  67  0002 4b06          	push	#6
  68  0004 ae5000        	ldw	x,#20480
  69  0007 cd0000        	call	_GPIO_Init
  71  000a 85            	popw	x
  72                     ; 70 }
  75  000b 81            	ret	
  99                     ; 71 static void Speed_Sensor_Init(void)
  99                     ; 72 {
 100                     .text:	section	.text,new
 101  0000               L32_Speed_Sensor_Init:
 105                     ; 73 	GPIO_Init(SPEED_SENSOR_PORT,SPEED_SENSOR,GPIO_MODE_IN_PU_NO_IT);
 107  0000 4b40          	push	#64
 108  0002 4b08          	push	#8
 109  0004 ae5000        	ldw	x,#20480
 110  0007 cd0000        	call	_GPIO_Init
 112  000a 85            	popw	x
 113                     ; 74 }
 116  000b 81            	ret	
 141                     ; 75 static void Key_Init(void)
 141                     ; 76 {
 142                     .text:	section	.text,new
 143  0000               L53_Key_Init:
 147                     ; 77 	GPIO_Init(KEY_PORT,KEY_A|KEY_B,GPIO_MODE_IN_PU_NO_IT);
 149  0000 4b40          	push	#64
 150  0002 4b30          	push	#48
 151  0004 ae5005        	ldw	x,#20485
 152  0007 cd0000        	call	_GPIO_Init
 154  000a 85            	popw	x
 155                     ; 78 	PT_INIT(&pt_Keyscan);
 157  000b 5f            	clrw	x
 158  000c bf05          	ldw	_pt_Keyscan,x
 159                     ; 79 }
 163  000e 81            	ret	
 189                     ; 80 static void Alarm_Init(void)
 189                     ; 81 {
 190                     .text:	section	.text,new
 191  0000               L74_Alarm_Init:
 195                     ; 82 	GPIO_Init(ALARM_PORT,ALARM,GPIO_MODE_OUT_PP_HIGH_SLOW);
 197  0000 4bd0          	push	#208
 198  0002 4b10          	push	#16
 199  0004 ae500f        	ldw	x,#20495
 200  0007 cd0000        	call	_GPIO_Init
 202  000a 85            	popw	x
 203                     ; 84 	PT_INIT(&pt_Alarm_Speaker);
 205  000b 5f            	clrw	x
 206  000c bf03          	ldw	_pt_Alarm_Speaker,x
 207                     ; 85 	PT_INIT(&pt_Alarm_Light);
 210  000e bf01          	ldw	_pt_Alarm_Light,x
 211                     ; 86 }
 215  0010 81            	ret	
 245                     ; 89 void Motor_Init(void)
 245                     ; 90 {
 246                     .text:	section	.text,new
 247  0000               _Motor_Init:
 251                     ; 92 	GPIO_Init(L298N_IN_PORT,L298N_IN1|L298N_IN2,GPIO_MODE_OUT_PP_LOW_SLOW);
 253  0000 4bc0          	push	#192
 254  0002 4b60          	push	#96
 255  0004 ae500f        	ldw	x,#20495
 256  0007 cd0000        	call	_GPIO_Init
 258  000a 85            	popw	x
 259                     ; 93 	GPIO_Init(MOTOR_PWM_PORT,MOTOR_PWM,GPIO_MODE_OUT_PP_LOW_SLOW);
 261  000b 4bc0          	push	#192
 262  000d 4b08          	push	#8
 263  000f ae500a        	ldw	x,#20490
 264  0012 cd0000        	call	_GPIO_Init
 266  0015 85            	popw	x
 267                     ; 97 	TIM1_CCxCmd(TIM1_CHANNEL_3,DISABLE);
 269  0016 ae0200        	ldw	x,#512
 270  0019 cd0000        	call	_TIM1_CCxCmd
 272                     ; 99 	Obstacle_Avoidance_Sensor_Init();
 274  001c cd0000        	call	L3_Obstacle_Avoidance_Sensor_Init
 276                     ; 100 	Speed_Sensor_Init();
 278  001f cd0000        	call	L32_Speed_Sensor_Init
 280                     ; 101 	Key_Init();
 282  0022 cd0000        	call	L53_Key_Init
 284                     ; 102 	Alarm_Init();
 286  0025 cd0000        	call	L74_Alarm_Init
 288                     ; 104 	MT.status=MT_STOPPED;
 290  0028 35010000      	mov	_MT,#1
 291                     ; 105 	MT.last_status=MT_LAST_FORWARD;
 293  002c 35020001      	mov	_MT+1,#2
 294                     ; 109 }
 297  0030 81            	ret	
 356                     ; 111 void Motor_Start(Motor_Direction_Typedef dir)
 356                     ; 112 {
 357                     .text:	section	.text,new
 358  0000               _Motor_Start:
 362                     ; 113 	if(dir){
 364  0000 4d            	tnz	a
 365  0001 2717          	jreq	L711
 366                     ; 114 		GPIO_WriteHigh(L298N_IN_PORT,L298N_IN1);
 368  0003 4b20          	push	#32
 369  0005 ae500f        	ldw	x,#20495
 370  0008 cd0000        	call	_GPIO_WriteHigh
 372  000b 84            	pop	a
 373                     ; 115 		GPIO_WriteLow(L298N_IN_PORT,L298N_IN2);
 375  000c 4b40          	push	#64
 376  000e ae500f        	ldw	x,#20495
 377  0011 cd0000        	call	_GPIO_WriteLow
 379  0014 35020000      	mov	_MT,#2
 380                     ; 119 		MT.status=MT_RUNNING_FORWARD;
 383  0018 2015          	jra	L121
 384  001a               L711:
 385                     ; 121 		GPIO_WriteHigh(L298N_IN_PORT,L298N_IN2);
 387  001a 4b40          	push	#64
 388  001c ae500f        	ldw	x,#20495
 389  001f cd0000        	call	_GPIO_WriteHigh
 391  0022 84            	pop	a
 392                     ; 122 		GPIO_WriteLow(L298N_IN_PORT,L298N_IN1);
 394  0023 4b20          	push	#32
 395  0025 ae500f        	ldw	x,#20495
 396  0028 cd0000        	call	_GPIO_WriteLow
 398  002b 35040000      	mov	_MT,#4
 399                     ; 126 		MT.status=MT_RUNNING_BACKWARD;
 401  002f               L121:
 402  002f ae0201        	ldw	x,#513
 403  0032 84            	pop	a
 404                     ; 130 	TIM1_CCxCmd(TIM1_CHANNEL_3,ENABLE);
 407                     ; 132 }
 410  0033 cc0000        	jp	_TIM1_CCxCmd
 436                     ; 133 void Motor_Stop(void)
 436                     ; 134 {
 437                     .text:	section	.text,new
 438  0000               _Motor_Stop:
 442                     ; 137 	TIM1_CCxCmd(TIM1_CHANNEL_3,DISABLE);
 444  0000 ae0200        	ldw	x,#512
 445  0003 cd0000        	call	_TIM1_CCxCmd
 447                     ; 139 	GPIO_WriteLow(L298N_IN_PORT,L298N_IN1);
 449  0006 4b20          	push	#32
 450  0008 ae500f        	ldw	x,#20495
 451  000b cd0000        	call	_GPIO_WriteLow
 453  000e 84            	pop	a
 454                     ; 140 	GPIO_WriteLow(L298N_IN_PORT,L298N_IN2);
 456  000f 4b40          	push	#64
 457  0011 ae500f        	ldw	x,#20495
 458  0014 cd0000        	call	_GPIO_WriteLow
 460  0017 84            	pop	a
 461                     ; 142 	if(MT.status==MT_RUNNING_FORWARD){
 463  0018 b600          	ld	a,_MT
 464  001a a102          	cp	a,#2
 465  001c 2606          	jrne	L331
 466                     ; 143 		MT.last_status=MT_LAST_FORWARD;
 468  001e 35020001      	mov	_MT+1,#2
 470  0022 2008          	jra	L531
 471  0024               L331:
 472                     ; 144 	}else if(MT.status==MT_RUNNING_BACKWARD){
 474  0024 a104          	cp	a,#4
 475  0026 2604          	jrne	L531
 476                     ; 145 		MT.last_status=MT_LAST_BACKWARD;
 478  0028 35040001      	mov	_MT+1,#4
 479  002c               L531:
 480                     ; 147 	MT.status=MT_STOPPED;	
 482  002c 35010000      	mov	_MT,#1
 483                     ; 148 }
 486  0030 81            	ret	
 511                     ; 151 void Sensor_OA_Scan(void)
 511                     ; 152 {
 512                     .text:	section	.text,new
 513  0000               _Sensor_OA_Scan:
 517                     ; 153 	if(GPIO_ReadInputPin(OBSTACLE_AVOIDANCE_SENSOR_PORT,OBSTACLE_AVOIDANCE_SENSOR_A)){	//
 519  0000 4b02          	push	#2
 520  0002 ae5000        	ldw	x,#20480
 521  0005 cd0000        	call	_GPIO_ReadInputPin
 523  0008 5b01          	addw	sp,#1
 524  000a 4d            	tnz	a
 525  000b 2704          	jreq	L151
 526                     ; 154 		MT.Sensor_OA_A=0;	
 528  000d 3f06          	clr	_MT+6
 530  000f 2004          	jra	L351
 531  0011               L151:
 532                     ; 156 		MT.Sensor_OA_A=1;
 534  0011 35010006      	mov	_MT+6,#1
 535  0015               L351:
 536                     ; 158 	if(GPIO_ReadInputPin(OBSTACLE_AVOIDANCE_SENSOR_PORT,OBSTACLE_AVOIDANCE_SENSOR_B)){	//
 538  0015 4b04          	push	#4
 539  0017 ae5000        	ldw	x,#20480
 540  001a cd0000        	call	_GPIO_ReadInputPin
 542  001d 5b01          	addw	sp,#1
 543  001f 4d            	tnz	a
 544  0020 2703          	jreq	L551
 545                     ; 159 		MT.Sensor_OA_B=0;	
 547  0022 3f07          	clr	_MT+7
 550  0024 81            	ret	
 551  0025               L551:
 552                     ; 161 		MT.Sensor_OA_B=1;
 554  0025 35010007      	mov	_MT+7,#1
 555                     ; 163 }
 558  0029 81            	ret	
 596                     ; 166 PT_THREAD(Key_Scan(void))
 596                     ; 167 {
 597                     .text:	section	.text,new
 598  0000               _Key_Scan:
 600  0000 88            	push	a
 601       00000001      OFST:	set	1
 604                     ; 168 	PT_BEGIN(&pt_Keyscan);
 608  0001 be05          	ldw	x,_pt_Keyscan
 610                     ; 185 			MT.Key_B=1;
 611  0003 2716          	jreq	L161
 612  0005 1d00ad        	subw	x,#173
 613  0008 271c          	jreq	L361
 614  000a 1d0002        	subw	x,#2
 615  000d 2728          	jreq	L561
 616  000f 1d0007        	subw	x,#7
 617  0012 2738          	jreq	L761
 618  0014 1d0002        	subw	x,#2
 619  0017 2744          	jreq	L171
 620  0019 204c          	jra	L312
 621  001b               L161:
 622                     ; 170 	if(GPIO_ReadInputPin(KEY_PORT,KEY_A)){	//按键动作
 625  001b ad52          	call	LC001
 626  001d 2722          	jreq	L512
 627                     ; 172 		pt_Keyscan_cnt=0;
 629  001f 3f0c          	clr	_pt_Keyscan_cnt
 630                     ; 173 		PT_WAIT_UNTIL(&pt_Keyscan,pt_Keyscan_cnt>5);
 632  0021 ae00ad        	ldw	x,#173
 633  0024 bf05          	ldw	_pt_Keyscan,x
 634  0026               L361:
 638  0026 b60c          	ld	a,_pt_Keyscan_cnt
 639  0028 a106          	cp	a,#6
 640  002a 2402          	jruge	L322
 643  002c 2059          	jp	LC003
 644  002e               L322:
 645                     ; 174 		if(GPIO_ReadInputPin(KEY_PORT,KEY_A)){	//有效的按键动作
 647  002e ad3f          	call	LC001
 648  0030 270f          	jreq	L512
 649                     ; 175 			PT_WAIT_UNTIL(&pt_Keyscan,GPIO_ReadInputPin(KEY_PORT,KEY_A)==0);	//等待按键释放
 651  0032 ae00af        	ldw	x,#175
 652  0035 bf05          	ldw	_pt_Keyscan,x
 653  0037               L561:
 657  0037 ad36          	call	LC001
 658  0039 2702          	jreq	L332
 661  003b 204a          	jp	LC003
 662  003d               L332:
 663                     ; 176 			MT.Key_A=1;
 665  003d 35010009      	mov	_MT+9,#1
 666  0041               L512:
 667                     ; 179 	if(GPIO_ReadInputPin(KEY_PORT,KEY_B)){	//按键动作
 669  0041 ad38          	call	LC002
 670  0043 2722          	jreq	L312
 671                     ; 181 		pt_Keyscan_cnt=0;
 673  0045 3f0c          	clr	_pt_Keyscan_cnt
 674                     ; 182 		PT_WAIT_UNTIL(&pt_Keyscan,pt_Keyscan_cnt>5);
 676  0047 ae00b6        	ldw	x,#182
 677  004a bf05          	ldw	_pt_Keyscan,x
 678  004c               L761:
 682  004c b60c          	ld	a,_pt_Keyscan_cnt
 683  004e a106          	cp	a,#6
 684  0050 2402          	jruge	L342
 687  0052 2033          	jp	LC003
 688  0054               L342:
 689                     ; 183 		if(GPIO_ReadInputPin(KEY_PORT,KEY_B)){
 691  0054 ad25          	call	LC002
 692  0056 270f          	jreq	L312
 693                     ; 184 			PT_WAIT_UNTIL(&pt_Keyscan,GPIO_ReadInputPin(KEY_PORT,KEY_B)==0);	//等待按键释放
 695  0058 ae00b8        	ldw	x,#184
 696  005b bf05          	ldw	_pt_Keyscan,x
 697  005d               L171:
 701  005d ad1c          	call	LC002
 702  005f 2702          	jreq	L352
 705  0061 2024          	jp	LC003
 706  0063               L352:
 707                     ; 185 			MT.Key_B=1;
 709  0063 3501000a      	mov	_MT+10,#1
 710  0067               L312:
 711                     ; 189 	PT_END(&pt_Keyscan);
 716  0067 5f            	clrw	x
 717  0068 bf05          	ldw	_pt_Keyscan,x
 721  006a a602          	ld	a,#2
 724  006c 5b01          	addw	sp,#1
 725  006e 81            	ret	
 726  006f               LC001:
 727  006f 4b10          	push	#16
 728  0071 ae5005        	ldw	x,#20485
 729  0074 cd0000        	call	_GPIO_ReadInputPin
 731  0077 5b01          	addw	sp,#1
 732  0079 4d            	tnz	a
 733  007a 81            	ret	
 734  007b               LC002:
 735  007b 4b20          	push	#32
 736  007d ae5005        	ldw	x,#20485
 737  0080 cd0000        	call	_GPIO_ReadInputPin
 739  0083 5b01          	addw	sp,#1
 740  0085 4d            	tnz	a
 741  0086 81            	ret	
 742  0087               LC003:
 743  0087 4f            	clr	a
 744                     ; 184 			PT_WAIT_UNTIL(&pt_Keyscan,GPIO_ReadInputPin(KEY_PORT,KEY_B)==0);	//等待按键释放
 746  0088 5b01          	addw	sp,#1
 747  008a 81            	ret	
 785                     ; 196 PT_THREAD(Alarm_Speaker(void))
 785                     ; 197 {
 786                     .text:	section	.text,new
 787  0000               _Alarm_Speaker:
 789  0000 88            	push	a
 790       00000001      OFST:	set	1
 793                     ; 198 	PT_BEGIN(&pt_Alarm_Speaker);
 797  0001 be03          	ldw	x,_pt_Alarm_Speaker
 799                     ; 206 	GPIO_WriteHigh(ALARM_PORT,ALARM);
 800  0003 270c          	jreq	L552
 801  0005 1d00c9        	subw	x,#201
 802  0008 270e          	jreq	L752
 803  000a 1d0004        	subw	x,#4
 804  000d 2723          	jreq	L162
 805  000f 2034          	jra	L303
 806  0011               L552:
 807                     ; 200 	pt_Alarm_Speaker_cnt=0;
 810  0011 3f0b          	clr	_pt_Alarm_Speaker_cnt
 811                     ; 201 	PT_WAIT_UNTIL(&pt_Alarm_Speaker,pt_Alarm_Speaker_cnt>30);
 813  0013 ae00c9        	ldw	x,#201
 814  0016 bf03          	ldw	_pt_Alarm_Speaker,x
 815  0018               L752:
 819  0018 b60b          	ld	a,_pt_Alarm_Speaker_cnt
 820  001a a11f          	cp	a,#31
 821  001c 2404          	jruge	L113
 824  001e 4f            	clr	a
 827  001f 5b01          	addw	sp,#1
 828  0021 81            	ret	
 829  0022               L113:
 830                     ; 202 	GPIO_WriteLow(ALARM_PORT,ALARM);
 832  0022 4b10          	push	#16
 833  0024 ae500f        	ldw	x,#20495
 834  0027 cd0000        	call	_GPIO_WriteLow
 836  002a 3f0b          	clr	_pt_Alarm_Speaker_cnt
 837  002c ae00cd        	ldw	x,#205
 838  002f bf03          	ldw	_pt_Alarm_Speaker,x
 839  0031 84            	pop	a
 840                     ; 204 	pt_Alarm_Speaker_cnt=0;
 842                     ; 205 	PT_WAIT_UNTIL(&pt_Alarm_Speaker,pt_Alarm_Speaker_cnt>50);
 844  0032               L162:
 848  0032 b60b          	ld	a,_pt_Alarm_Speaker_cnt
 849  0034 a133          	cp	a,#51
 850  0036 2404          	jruge	L713
 853  0038 4f            	clr	a
 856  0039 5b01          	addw	sp,#1
 857  003b 81            	ret	
 858  003c               L713:
 859                     ; 206 	GPIO_WriteHigh(ALARM_PORT,ALARM);
 861  003c 4b10          	push	#16
 862  003e ae500f        	ldw	x,#20495
 863  0041 cd0000        	call	_GPIO_WriteHigh
 865  0044 84            	pop	a
 866  0045               L303:
 867                     ; 208 	PT_END(&pt_Alarm_Speaker);
 872  0045 5f            	clrw	x
 873  0046 bf03          	ldw	_pt_Alarm_Speaker,x
 877  0048 a602          	ld	a,#2
 880  004a 5b01          	addw	sp,#1
 881  004c 81            	ret	
 907                     ; 214 void Alarm(void)
 907                     ; 215 {
 908                     .text:	section	.text,new
 909  0000               _Alarm:
 913                     ; 216 	if((MT.status==MT_RUNNING_FORWARD)||(MT.status==MT_RUNNING_BACKWARD))	//if running
 915  0000 b600          	ld	a,_MT
 916  0002 a102          	cp	a,#2
 917  0004 2704          	jreq	L333
 919  0006 a104          	cp	a,#4
 920  0008 2603          	jrne	L133
 921  000a               L333:
 922                     ; 218 		Alarm_Speaker();
 926                     ; 222 }
 929  000a cc0000        	jp	_Alarm_Speaker
 930  000d               L133:
 931                     ; 220 		GPIO_WriteHigh(ALARM_PORT,ALARM);
 933  000d 4b10          	push	#16
 934  000f ae500f        	ldw	x,#20495
 935  0012 cd0000        	call	_GPIO_WriteHigh
 937  0015 84            	pop	a
 939  0016 81            	ret	
 978                     ; 224 static void MT_Speed_Set(void)
 978                     ; 225 {
 979                     .text:	section	.text,new
 980  0000               L733_MT_Speed_Set:
 982  0000 88            	push	a
 983       00000001      OFST:	set	1
 986                     ; 227 	if(IR_GetCode(&code)==0){
 988  0001 96            	ldw	x,sp
 989  0002 5c            	incw	x
 990  0003 cd0000        	call	_IR_GetCode
 992  0006 4d            	tnz	a
 993  0007 2703cc008a    	jrne	L304
 994                     ; 228 		switch(code){
 996  000c 7b01          	ld	a,(OFST+0,sp)
 998                     ; 253 			default:	break;
 999  000e a03d          	sub	a,#61
1000  0010 2752          	jreq	L553
1001  0012 a048          	sub	a,#72
1002  0014 2736          	jreq	L743
1003  0016 a012          	sub	a,#18
1004  0018 271a          	jreq	L143
1005  001a a030          	sub	a,#48
1006  001c 273e          	jreq	L353
1007  001e a008          	sub	a,#8
1008  0020 271a          	jreq	L343
1009  0022 a00e          	sub	a,#14
1010  0024 2755          	jreq	L753
1011  0026 a00a          	sub	a,#10
1012  0028 271a          	jreq	L543
1013  002a a008          	sub	a,#8
1014  002c 2726          	jreq	L153
1015  002e a00e          	sub	a,#14
1016  0030 274e          	jreq	L163
1017  0032 2056          	jra	L304
1018  0034               L143:
1019                     ; 229 			case IR_0:	TIM1_SetCompare3(135);break;
1021  0034 ae0087        	ldw	x,#135
1022  0037 cd0000        	call	_TIM1_SetCompare3
1026  003a 204e          	jra	L304
1027  003c               L343:
1028                     ; 230 			case IR_1:	TIM1_SetCompare3(145);break;
1030  003c ae0091        	ldw	x,#145
1031  003f cd0000        	call	_TIM1_SetCompare3
1035  0042 2046          	jra	L304
1036  0044               L543:
1037                     ; 231 			case IR_2:	TIM1_SetCompare3(155);break;
1039  0044 ae009b        	ldw	x,#155
1040  0047 cd0000        	call	_TIM1_SetCompare3
1044  004a 203e          	jra	L304
1045  004c               L743:
1046                     ; 232 			case IR_3:	TIM1_SetCompare3(170);break;
1048  004c ae00aa        	ldw	x,#170
1049  004f cd0000        	call	_TIM1_SetCompare3
1053  0052 2036          	jra	L304
1054  0054               L153:
1055                     ; 233 			case IR_4:	TIM1_SetCompare3(185);break;
1057  0054 ae00b9        	ldw	x,#185
1058  0057 cd0000        	call	_TIM1_SetCompare3
1062  005a 202e          	jra	L304
1063  005c               L353:
1064                     ; 234 			case IR_5:	TIM1_SetCompare3(200);break;
1066  005c ae00c8        	ldw	x,#200
1067  005f cd0000        	call	_TIM1_SetCompare3
1071  0062 2026          	jra	L304
1072  0064               L553:
1073                     ; 235 			case IR_PLAY_PAUSE:	if(MT.status==MT_STOPPED){
1075  0064 b600          	ld	a,_MT
1076  0066 4a            	dec	a
1077  0067 260d          	jrne	L114
1078                     ; 236 														if(MT.last_status==MT_LAST_FORWARD){
1080  0069 b601          	ld	a,_MT+1
1081  006b a102          	cp	a,#2
1082                     ; 237 															Motor_Start(MOTOR_FORWARD);
1085  006d 2716          	jreq	LC005
1086                     ; 238 														}else if(MT.last_status==MT_LAST_BACKWARD){
1088  006f a104          	cp	a,#4
1089                     ; 239 															Motor_Start(MOTOR_BACKWARD);
1091  0071               LC006:
1092  0071 2617          	jrne	L304
1094  0073 4f            	clr	a
1096  0074 2011          	jp	LC004
1097  0076               L114:
1098                     ; 242 														Motor_Stop();
1100  0076 cd0000        	call	_Motor_Stop
1102  0079 200f          	jra	L304
1103  007b               L753:
1104                     ; 245 			case IR_PREV:	if(MT.status==MT_STOPPED){
1106  007b b600          	ld	a,_MT
1107  007d 4a            	dec	a
1108                     ; 246 											Motor_Start(MOTOR_BACKWARD);
1110  007e 20f1          	jp	LC006
1111  0080               L163:
1112                     ; 249 			case IR_NEXT:	if(MT.status==MT_STOPPED){
1114  0080 b600          	ld	a,_MT
1115  0082 4a            	dec	a
1116  0083 2605          	jrne	L304
1117                     ; 250 											Motor_Start(MOTOR_FORWARD);
1119  0085               LC005:
1121  0085 a601          	ld	a,#1
1122  0087               LC004:
1123  0087 cd0000        	call	_Motor_Start
1125                     ; 253 			default:	break;
1127  008a               L304:
1128                     ; 256 }
1131  008a 84            	pop	a
1132  008b 81            	ret	
1159                     ; 258 void MT_Control(void)
1159                     ; 259 {
1160                     .text:	section	.text,new
1161  0000               _MT_Control:
1165                     ; 260 	MT_Speed_Set();
1167  0000 cd0000        	call	L733_MT_Speed_Set
1169                     ; 261 	if(MT.Key_A&&(MT.Sensor_OA_A==0)){	//正向满足运行条件
1171  0003 b609          	ld	a,_MT+9
1172  0005 2714          	jreq	L734
1174  0007 b606          	ld	a,_MT+6
1175  0009 2610          	jrne	L734
1176                     ; 262 		MT.Key_A=0;	//清除按键指令	
1178  000b b709          	ld	_MT+9,a
1179                     ; 263 		if(MT.status==MT_STOPPED){				//停止状态可以直接启动
1181  000d b600          	ld	a,_MT
1182  000f 4a            	dec	a
1183  0010 2606          	jrne	L144
1184                     ; 264 			Motor_Start(MOTOR_FORWARD);
1186  0012 4c            	inc	a
1187  0013 cd0000        	call	_Motor_Start
1190  0016 2003          	jra	L734
1191  0018               L144:
1192                     ; 267 			Motor_Stop();
1194  0018 cd0000        	call	_Motor_Stop
1196  001b               L734:
1197                     ; 272 	if(MT.Key_B&&(MT.Sensor_OA_B==0)){	//反向满足运行条件
1199  001b b60a          	ld	a,_MT+10
1200  001d 2713          	jreq	L544
1202  001f b607          	ld	a,_MT+7
1203  0021 260f          	jrne	L544
1204                     ; 273 		MT.Key_B=0;	//清除按键指令	
1206  0023 b70a          	ld	_MT+10,a
1207                     ; 274 		if(MT.status==MT_STOPPED){				//停止状态可以直接启动
1209  0025 b600          	ld	a,_MT
1210  0027 4a            	dec	a
1211  0028 2605          	jrne	L744
1212                     ; 275 			Motor_Start(MOTOR_BACKWARD);
1214  002a cd0000        	call	_Motor_Start
1217  002d 2003          	jra	L544
1218  002f               L744:
1219                     ; 278 			Motor_Stop();
1221  002f cd0000        	call	_Motor_Stop
1223  0032               L544:
1224                     ; 283 	if((MT.status==MT_RUNNING_FORWARD)&&(MT.Sensor_OA_A==1))	//正向急停
1226  0032 b600          	ld	a,_MT
1227  0034 a102          	cp	a,#2
1228  0036 2608          	jrne	L354
1230  0038 b606          	ld	a,_MT+6
1231  003a 4a            	dec	a
1232  003b 2603          	jrne	L354
1233                     ; 285 		Motor_Stop();
1235  003d cd0000        	call	_Motor_Stop
1237  0040               L354:
1238                     ; 288 	if((MT.status==MT_RUNNING_BACKWARD)&&(MT.Sensor_OA_B==1))	//反向急停
1240  0040 b600          	ld	a,_MT
1241  0042 a104          	cp	a,#4
1242  0044 2608          	jrne	L554
1244  0046 b607          	ld	a,_MT+7
1245  0048 4a            	dec	a
1246  0049 2603          	jrne	L554
1247                     ; 290 		Motor_Stop();
1249  004b cd0000        	call	_Motor_Stop
1251  004e               L554:
1252                     ; 295 }
1255  004e 81            	ret	
1539                     	xdef	_Alarm_Speaker
1540                     	switch	.ubsct
1541  0000               _pt_Alarm_Light_cnt:
1542  0000 00            	ds.b	1
1543                     	xdef	_pt_Alarm_Light_cnt
1544  0001               _pt_Alarm_Light:
1545  0001 0000          	ds.b	2
1546                     	xdef	_pt_Alarm_Light
1547  0003               _pt_Alarm_Speaker:
1548  0003 0000          	ds.b	2
1549                     	xdef	_pt_Alarm_Speaker
1550  0005               _pt_Keyscan:
1551  0005 0000          	ds.b	2
1552                     	xdef	_pt_Keyscan
1553                     	xref	_IR_GetCode
1554                     	xdef	_Alarm
1555                     	xdef	_MT_Control
1556                     	xdef	_Key_Scan
1557                     	xdef	_Sensor_OA_Scan
1558                     	xdef	_Motor_Stop
1559                     	xdef	_Motor_Start
1560                     	xdef	_Motor_Init
1561  0007               _Speed_Pulse_cnt:
1562  0007 0000          	ds.b	2
1563                     	xdef	_Speed_Pulse_cnt
1564  0009               _Speed_Origin:
1565  0009 0000          	ds.b	2
1566                     	xdef	_Speed_Origin
1567                     	xdef	_Speed_Pulse_Status
1568  000b               _pt_Alarm_Speaker_cnt:
1569  000b 00            	ds.b	1
1570                     	xdef	_pt_Alarm_Speaker_cnt
1571  000c               _pt_Keyscan_cnt:
1572  000c 00            	ds.b	1
1573                     	xdef	_pt_Keyscan_cnt
1574                     	xdef	_MT
1575                     	xref	_TIM1_SetCompare3
1576                     	xref	_TIM1_CCxCmd
1577                     	xref	_GPIO_ReadInputPin
1578                     	xref	_GPIO_WriteLow
1579                     	xref	_GPIO_WriteHigh
1580                     	xref	_GPIO_Init
1600                     	end
