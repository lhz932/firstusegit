   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
  20                     	bsct
  21  0000               _MT:
  22  0000 00            	dc.b	0
  23  0001 000000000000  	ds.b	11
  24  000c               _Speed_Pulse_Status:
  25  000c 00            	dc.b	0
  56                     ; 64 static void Obstacle_Avoidance_Sensor_Init(void)
  56                     ; 65 {
  58                     .text:	section	.text,new
  59  0000               L3_Obstacle_Avoidance_Sensor_Init:
  63                     ; 66 	GPIO_Init(OBSTACLE_AVOIDANCE_SENSOR_PORT,
  63                     ; 67 						OBSTACLE_AVOIDANCE_SENSOR_A|OBSTACLE_AVOIDANCE_SENSOR_B,
  63                     ; 68 						GPIO_MODE_IN_PU_NO_IT);				
  65  0000 4b40          	push	#64
  66  0002 4b06          	push	#6
  67  0004 ae5000        	ldw	x,#20480
  68  0007 cd0000        	call	_GPIO_Init
  70  000a 85            	popw	x
  71                     ; 70 }
  74  000b 81            	ret	
  98                     ; 71 static void Speed_Sensor_Init(void)
  98                     ; 72 {
  99                     .text:	section	.text,new
 100  0000               L32_Speed_Sensor_Init:
 104                     ; 73 	GPIO_Init(SPEED_SENSOR_PORT,SPEED_SENSOR,GPIO_MODE_IN_PU_NO_IT);
 106  0000 4b40          	push	#64
 107  0002 4b08          	push	#8
 108  0004 ae5000        	ldw	x,#20480
 109  0007 cd0000        	call	_GPIO_Init
 111  000a 85            	popw	x
 112                     ; 74 }
 115  000b 81            	ret	
 140                     ; 75 static void Key_Init(void)
 140                     ; 76 {
 141                     .text:	section	.text,new
 142  0000               L53_Key_Init:
 146                     ; 77 	GPIO_Init(KEY_PORT,KEY_A|KEY_B,GPIO_MODE_IN_PU_NO_IT);
 148  0000 4b40          	push	#64
 149  0002 4b30          	push	#48
 150  0004 ae5005        	ldw	x,#20485
 151  0007 cd0000        	call	_GPIO_Init
 153  000a 85            	popw	x
 154                     ; 78 	PT_INIT(&pt_Keyscan);
 156  000b 5f            	clrw	x
 157  000c bf05          	ldw	_pt_Keyscan,x
 158                     ; 79 }
 162  000e 81            	ret	
 188                     ; 80 static void Alarm_Init(void)
 188                     ; 81 {
 189                     .text:	section	.text,new
 190  0000               L74_Alarm_Init:
 194                     ; 82 	GPIO_Init(ALARM_PORT,ALARM,GPIO_MODE_OUT_PP_HIGH_SLOW);
 196  0000 4bd0          	push	#208
 197  0002 4b10          	push	#16
 198  0004 ae500f        	ldw	x,#20495
 199  0007 cd0000        	call	_GPIO_Init
 201  000a 85            	popw	x
 202                     ; 84 	PT_INIT(&pt_Alarm_Speaker);
 204  000b 5f            	clrw	x
 205  000c bf03          	ldw	_pt_Alarm_Speaker,x
 206                     ; 85 	PT_INIT(&pt_Alarm_Light);
 209  000e bf01          	ldw	_pt_Alarm_Light,x
 210                     ; 86 }
 214  0010 81            	ret	
 244                     ; 89 void Motor_Init(void)
 244                     ; 90 {
 245                     .text:	section	.text,new
 246  0000               _Motor_Init:
 250                     ; 92 	GPIO_Init(L298N_IN_PORT,L298N_IN1|L298N_IN2,GPIO_MODE_OUT_PP_LOW_SLOW);
 252  0000 4bc0          	push	#192
 253  0002 4b60          	push	#96
 254  0004 ae500f        	ldw	x,#20495
 255  0007 cd0000        	call	_GPIO_Init
 257  000a 85            	popw	x
 258                     ; 93 	GPIO_Init(MOTOR_PWM_PORT,MOTOR_PWM,GPIO_MODE_OUT_PP_LOW_SLOW);
 260  000b 4bc0          	push	#192
 261  000d 4b08          	push	#8
 262  000f ae500a        	ldw	x,#20490
 263  0012 cd0000        	call	_GPIO_Init
 265  0015 85            	popw	x
 266                     ; 97 	TIM1_CCxCmd(TIM1_CHANNEL_3,DISABLE);
 268  0016 ae0200        	ldw	x,#512
 269  0019 cd0000        	call	_TIM1_CCxCmd
 271                     ; 99 	Obstacle_Avoidance_Sensor_Init();
 273  001c cd0000        	call	L3_Obstacle_Avoidance_Sensor_Init
 275                     ; 100 	Speed_Sensor_Init();
 277  001f cd0000        	call	L32_Speed_Sensor_Init
 279                     ; 101 	Key_Init();
 281  0022 cd0000        	call	L53_Key_Init
 283                     ; 102 	Alarm_Init();
 285  0025 cd0000        	call	L74_Alarm_Init
 287                     ; 104 	MT.status=MT_STOPPED;
 289  0028 35010000      	mov	_MT,#1
 290                     ; 105 	MT.last_status=MT_LAST_FORWARD;
 292  002c 35020001      	mov	_MT+1,#2
 293                     ; 109 }
 296  0030 81            	ret	
 355                     ; 111 void Motor_Start(Motor_Direction_Typedef dir)
 355                     ; 112 {
 356                     .text:	section	.text,new
 357  0000               _Motor_Start:
 361                     ; 113 	if(dir){
 363  0000 4d            	tnz	a
 364  0001 2717          	jreq	L711
 365                     ; 114 		GPIO_WriteHigh(L298N_IN_PORT,L298N_IN1);
 367  0003 4b20          	push	#32
 368  0005 ae500f        	ldw	x,#20495
 369  0008 cd0000        	call	_GPIO_WriteHigh
 371  000b 84            	pop	a
 372                     ; 115 		GPIO_WriteLow(L298N_IN_PORT,L298N_IN2);
 374  000c 4b40          	push	#64
 375  000e ae500f        	ldw	x,#20495
 376  0011 cd0000        	call	_GPIO_WriteLow
 378  0014 35020000      	mov	_MT,#2
 379                     ; 119 		MT.status=MT_RUNNING_FORWARD;
 382  0018 2015          	jra	L121
 383  001a               L711:
 384                     ; 121 		GPIO_WriteHigh(L298N_IN_PORT,L298N_IN2);
 386  001a 4b40          	push	#64
 387  001c ae500f        	ldw	x,#20495
 388  001f cd0000        	call	_GPIO_WriteHigh
 390  0022 84            	pop	a
 391                     ; 122 		GPIO_WriteLow(L298N_IN_PORT,L298N_IN1);
 393  0023 4b20          	push	#32
 394  0025 ae500f        	ldw	x,#20495
 395  0028 cd0000        	call	_GPIO_WriteLow
 397  002b 35040000      	mov	_MT,#4
 398                     ; 126 		MT.status=MT_RUNNING_BACKWARD;
 400  002f               L121:
 401  002f ae0201        	ldw	x,#513
 402  0032 84            	pop	a
 403                     ; 130 	TIM1_CCxCmd(TIM1_CHANNEL_3,ENABLE);
 406                     ; 132 }
 409  0033 cc0000        	jp	_TIM1_CCxCmd
 435                     ; 133 void Motor_Stop(void)
 435                     ; 134 {
 436                     .text:	section	.text,new
 437  0000               _Motor_Stop:
 441                     ; 137 	TIM1_CCxCmd(TIM1_CHANNEL_3,DISABLE);
 443  0000 ae0200        	ldw	x,#512
 444  0003 cd0000        	call	_TIM1_CCxCmd
 446                     ; 139 	GPIO_WriteLow(L298N_IN_PORT,L298N_IN1);
 448  0006 4b20          	push	#32
 449  0008 ae500f        	ldw	x,#20495
 450  000b cd0000        	call	_GPIO_WriteLow
 452  000e 84            	pop	a
 453                     ; 140 	GPIO_WriteLow(L298N_IN_PORT,L298N_IN2);
 455  000f 4b40          	push	#64
 456  0011 ae500f        	ldw	x,#20495
 457  0014 cd0000        	call	_GPIO_WriteLow
 459  0017 84            	pop	a
 460                     ; 142 	if(MT.status==MT_RUNNING_FORWARD){
 462  0018 b600          	ld	a,_MT
 463  001a a102          	cp	a,#2
 464  001c 2606          	jrne	L331
 465                     ; 143 		MT.last_status=MT_LAST_FORWARD;
 467  001e 35020001      	mov	_MT+1,#2
 469  0022 2008          	jra	L531
 470  0024               L331:
 471                     ; 144 	}else if(MT.status==MT_RUNNING_BACKWARD){
 473  0024 a104          	cp	a,#4
 474  0026 2604          	jrne	L531
 475                     ; 145 		MT.last_status=MT_LAST_BACKWARD;
 477  0028 35040001      	mov	_MT+1,#4
 478  002c               L531:
 479                     ; 147 	MT.status=MT_STOPPED;	
 481  002c 35010000      	mov	_MT,#1
 482                     ; 148 }
 485  0030 81            	ret	
 510                     ; 151 void Sensor_OA_Scan(void)
 510                     ; 152 {
 511                     .text:	section	.text,new
 512  0000               _Sensor_OA_Scan:
 516                     ; 153 	if(GPIO_ReadInputPin(OBSTACLE_AVOIDANCE_SENSOR_PORT,OBSTACLE_AVOIDANCE_SENSOR_A)){	//
 518  0000 4b02          	push	#2
 519  0002 ae5000        	ldw	x,#20480
 520  0005 cd0000        	call	_GPIO_ReadInputPin
 522  0008 5b01          	addw	sp,#1
 523  000a 4d            	tnz	a
 524  000b 2704          	jreq	L151
 525                     ; 154 		MT.Sensor_OA_A=0;	
 527  000d 3f06          	clr	_MT+6
 529  000f 2004          	jra	L351
 530  0011               L151:
 531                     ; 156 		MT.Sensor_OA_A=1;
 533  0011 35010006      	mov	_MT+6,#1
 534  0015               L351:
 535                     ; 158 	if(GPIO_ReadInputPin(OBSTACLE_AVOIDANCE_SENSOR_PORT,OBSTACLE_AVOIDANCE_SENSOR_B)){	//
 537  0015 4b04          	push	#4
 538  0017 ae5000        	ldw	x,#20480
 539  001a cd0000        	call	_GPIO_ReadInputPin
 541  001d 5b01          	addw	sp,#1
 542  001f 4d            	tnz	a
 543  0020 2703          	jreq	L551
 544                     ; 159 		MT.Sensor_OA_B=0;	
 546  0022 3f07          	clr	_MT+7
 549  0024 81            	ret	
 550  0025               L551:
 551                     ; 161 		MT.Sensor_OA_B=1;
 553  0025 35010007      	mov	_MT+7,#1
 554                     ; 163 }
 557  0029 81            	ret	
 595                     ; 166 PT_THREAD(Key_Scan(void))
 595                     ; 167 {
 596                     .text:	section	.text,new
 597  0000               _Key_Scan:
 599  0000 88            	push	a
 600       00000001      OFST:	set	1
 603                     ; 168 	PT_BEGIN(&pt_Keyscan);
 607  0001 be05          	ldw	x,_pt_Keyscan
 609                     ; 185 			MT.Key_B=1;
 610  0003 2717          	jreq	L161
 611  0005 1d00ad        	subw	x,#173
 612  0008 2726          	jreq	L361
 613  000a 1d0002        	subw	x,#2
 614  000d 273d          	jreq	L561
 615  000f 1d0007        	subw	x,#7
 616  0012 2761          	jreq	L761
 617  0014 1d0002        	subw	x,#2
 618  0017 2778          	jreq	L171
 619  0019 cc00a6        	jra	L312
 620  001c               L161:
 621                     ; 170 	if(GPIO_ReadInputPin(KEY_PORT,KEY_A)){	//按键动作
 624  001c 4b10          	push	#16
 625  001e ae5005        	ldw	x,#20485
 626  0021 cd0000        	call	_GPIO_ReadInputPin
 628  0024 5b01          	addw	sp,#1
 629  0026 4d            	tnz	a
 630  0027 2738          	jreq	L512
 631                     ; 172 		pt_Keyscan_cnt=0;
 633  0029 3f0c          	clr	_pt_Keyscan_cnt
 634                     ; 173 		PT_WAIT_UNTIL(&pt_Keyscan,pt_Keyscan_cnt>5);
 636  002b ae00ad        	ldw	x,#173
 637  002e bf05          	ldw	_pt_Keyscan,x
 638  0030               L361:
 642  0030 b60c          	ld	a,_pt_Keyscan_cnt
 643  0032 a106          	cp	a,#6
 644  0034 2404          	jruge	L322
 647  0036 4f            	clr	a
 650  0037 5b01          	addw	sp,#1
 651  0039 81            	ret	
 652  003a               L322:
 653                     ; 174 		if(GPIO_ReadInputPin(KEY_PORT,KEY_A)){	//有效的按键动作
 655  003a 4b10          	push	#16
 656  003c ae5005        	ldw	x,#20485
 657  003f cd0000        	call	_GPIO_ReadInputPin
 659  0042 5b01          	addw	sp,#1
 660  0044 4d            	tnz	a
 661  0045 271a          	jreq	L512
 662                     ; 175 			PT_WAIT_UNTIL(&pt_Keyscan,GPIO_ReadInputPin(KEY_PORT,KEY_A)==0);	//等待按键释放
 664  0047 ae00af        	ldw	x,#175
 665  004a bf05          	ldw	_pt_Keyscan,x
 666  004c               L561:
 670  004c 4b10          	push	#16
 671  004e ae5005        	ldw	x,#20485
 672  0051 cd0000        	call	_GPIO_ReadInputPin
 674  0054 5b01          	addw	sp,#1
 675  0056 4d            	tnz	a
 676  0057 2704          	jreq	L332
 679  0059 4f            	clr	a
 682  005a 5b01          	addw	sp,#1
 683  005c 81            	ret	
 684  005d               L332:
 685                     ; 176 			MT.Key_A=1;
 687  005d 35010009      	mov	_MT+9,#1
 688  0061               L512:
 689                     ; 179 	if(GPIO_ReadInputPin(KEY_PORT,KEY_B)){	//按键动作
 691  0061 4b20          	push	#32
 692  0063 ae5005        	ldw	x,#20485
 693  0066 cd0000        	call	_GPIO_ReadInputPin
 695  0069 5b01          	addw	sp,#1
 696  006b 4d            	tnz	a
 697  006c 2738          	jreq	L312
 698                     ; 181 		pt_Keyscan_cnt=0;
 700  006e 3f0c          	clr	_pt_Keyscan_cnt
 701                     ; 182 		PT_WAIT_UNTIL(&pt_Keyscan,pt_Keyscan_cnt>5);
 703  0070 ae00b6        	ldw	x,#182
 704  0073 bf05          	ldw	_pt_Keyscan,x
 705  0075               L761:
 709  0075 b60c          	ld	a,_pt_Keyscan_cnt
 710  0077 a106          	cp	a,#6
 711  0079 2404          	jruge	L342
 714  007b 4f            	clr	a
 717  007c 5b01          	addw	sp,#1
 718  007e 81            	ret	
 719  007f               L342:
 720                     ; 183 		if(GPIO_ReadInputPin(KEY_PORT,KEY_B)){
 722  007f 4b20          	push	#32
 723  0081 ae5005        	ldw	x,#20485
 724  0084 cd0000        	call	_GPIO_ReadInputPin
 726  0087 5b01          	addw	sp,#1
 727  0089 4d            	tnz	a
 728  008a 271a          	jreq	L312
 729                     ; 184 			PT_WAIT_UNTIL(&pt_Keyscan,GPIO_ReadInputPin(KEY_PORT,KEY_B)==0);	//等待按键释放
 731  008c ae00b8        	ldw	x,#184
 732  008f bf05          	ldw	_pt_Keyscan,x
 733  0091               L171:
 737  0091 4b20          	push	#32
 738  0093 ae5005        	ldw	x,#20485
 739  0096 cd0000        	call	_GPIO_ReadInputPin
 741  0099 5b01          	addw	sp,#1
 742  009b 4d            	tnz	a
 743  009c 2704          	jreq	L352
 746  009e 4f            	clr	a
 749  009f 5b01          	addw	sp,#1
 750  00a1 81            	ret	
 751  00a2               L352:
 752                     ; 185 			MT.Key_B=1;
 754  00a2 3501000a      	mov	_MT+10,#1
 755  00a6               L312:
 756                     ; 189 	PT_END(&pt_Keyscan);
 761  00a6 5f            	clrw	x
 762  00a7 bf05          	ldw	_pt_Keyscan,x
 766  00a9 a602          	ld	a,#2
 769  00ab 5b01          	addw	sp,#1
 770  00ad 81            	ret	
 808                     ; 196 PT_THREAD(Alarm_Speaker(void))
 808                     ; 197 {
 809                     .text:	section	.text,new
 810  0000               _Alarm_Speaker:
 812  0000 88            	push	a
 813       00000001      OFST:	set	1
 816                     ; 198 	PT_BEGIN(&pt_Alarm_Speaker);
 820  0001 be03          	ldw	x,_pt_Alarm_Speaker
 822                     ; 206 	GPIO_WriteHigh(ALARM_PORT,ALARM);
 823  0003 270c          	jreq	L552
 824  0005 1d00c9        	subw	x,#201
 825  0008 270e          	jreq	L752
 826  000a 1d0004        	subw	x,#4
 827  000d 2723          	jreq	L162
 828  000f 2034          	jra	L303
 829  0011               L552:
 830                     ; 200 	pt_Alarm_Speaker_cnt=0;
 833  0011 3f0b          	clr	_pt_Alarm_Speaker_cnt
 834                     ; 201 	PT_WAIT_UNTIL(&pt_Alarm_Speaker,pt_Alarm_Speaker_cnt>30);
 836  0013 ae00c9        	ldw	x,#201
 837  0016 bf03          	ldw	_pt_Alarm_Speaker,x
 838  0018               L752:
 842  0018 b60b          	ld	a,_pt_Alarm_Speaker_cnt
 843  001a a11f          	cp	a,#31
 844  001c 2404          	jruge	L113
 847  001e 4f            	clr	a
 850  001f 5b01          	addw	sp,#1
 851  0021 81            	ret	
 852  0022               L113:
 853                     ; 202 	GPIO_WriteLow(ALARM_PORT,ALARM);
 855  0022 4b10          	push	#16
 856  0024 ae500f        	ldw	x,#20495
 857  0027 cd0000        	call	_GPIO_WriteLow
 859  002a 3f0b          	clr	_pt_Alarm_Speaker_cnt
 860  002c ae00cd        	ldw	x,#205
 861  002f bf03          	ldw	_pt_Alarm_Speaker,x
 862  0031 84            	pop	a
 863                     ; 204 	pt_Alarm_Speaker_cnt=0;
 865                     ; 205 	PT_WAIT_UNTIL(&pt_Alarm_Speaker,pt_Alarm_Speaker_cnt>50);
 867  0032               L162:
 871  0032 b60b          	ld	a,_pt_Alarm_Speaker_cnt
 872  0034 a133          	cp	a,#51
 873  0036 2404          	jruge	L713
 876  0038 4f            	clr	a
 879  0039 5b01          	addw	sp,#1
 880  003b 81            	ret	
 881  003c               L713:
 882                     ; 206 	GPIO_WriteHigh(ALARM_PORT,ALARM);
 884  003c 4b10          	push	#16
 885  003e ae500f        	ldw	x,#20495
 886  0041 cd0000        	call	_GPIO_WriteHigh
 888  0044 84            	pop	a
 889  0045               L303:
 890                     ; 208 	PT_END(&pt_Alarm_Speaker);
 895  0045 5f            	clrw	x
 896  0046 bf03          	ldw	_pt_Alarm_Speaker,x
 900  0048 a602          	ld	a,#2
 903  004a 5b01          	addw	sp,#1
 904  004c 81            	ret	
 930                     ; 214 void Alarm(void)
 930                     ; 215 {
 931                     .text:	section	.text,new
 932  0000               _Alarm:
 936                     ; 216 	if((MT.status==MT_RUNNING_FORWARD)||(MT.status==MT_RUNNING_BACKWARD))	//if running
 938  0000 b600          	ld	a,_MT
 939  0002 a102          	cp	a,#2
 940  0004 2704          	jreq	L333
 942  0006 a104          	cp	a,#4
 943  0008 2603          	jrne	L133
 944  000a               L333:
 945                     ; 218 		Alarm_Speaker();
 949                     ; 222 }
 952  000a cc0000        	jp	_Alarm_Speaker
 953  000d               L133:
 954                     ; 220 		GPIO_WriteHigh(ALARM_PORT,ALARM);
 956  000d 4b10          	push	#16
 957  000f ae500f        	ldw	x,#20495
 958  0012 cd0000        	call	_GPIO_WriteHigh
 960  0015 84            	pop	a
 962  0016 81            	ret	
1001                     ; 224 static void MT_Speed_Set(void)
1001                     ; 225 {
1002                     .text:	section	.text,new
1003  0000               L733_MT_Speed_Set:
1005  0000 88            	push	a
1006       00000001      OFST:	set	1
1009                     ; 227 	if(IR_GetCode(&code)==0){
1011  0001 96            	ldw	x,sp
1012  0002 5c            	incw	x
1013  0003 cd0000        	call	_IR_GetCode
1015  0006 4d            	tnz	a
1016  0007 2703cc008a    	jrne	L304
1017                     ; 228 		switch(code){
1019  000c 7b01          	ld	a,(OFST+0,sp)
1021                     ; 253 			default:	break;
1022  000e a03d          	sub	a,#61
1023  0010 2752          	jreq	L553
1024  0012 a048          	sub	a,#72
1025  0014 2736          	jreq	L743
1026  0016 a012          	sub	a,#18
1027  0018 271a          	jreq	L143
1028  001a a030          	sub	a,#48
1029  001c 273e          	jreq	L353
1030  001e a008          	sub	a,#8
1031  0020 271a          	jreq	L343
1032  0022 a00e          	sub	a,#14
1033  0024 2755          	jreq	L753
1034  0026 a00a          	sub	a,#10
1035  0028 271a          	jreq	L543
1036  002a a008          	sub	a,#8
1037  002c 2726          	jreq	L153
1038  002e a00e          	sub	a,#14
1039  0030 274e          	jreq	L163
1040  0032 2056          	jra	L304
1041  0034               L143:
1042                     ; 229 			case IR_0:	TIM1_SetCompare3(135);break;
1044  0034 ae0087        	ldw	x,#135
1045  0037 cd0000        	call	_TIM1_SetCompare3
1049  003a 204e          	jra	L304
1050  003c               L343:
1051                     ; 230 			case IR_1:	TIM1_SetCompare3(145);break;
1053  003c ae0091        	ldw	x,#145
1054  003f cd0000        	call	_TIM1_SetCompare3
1058  0042 2046          	jra	L304
1059  0044               L543:
1060                     ; 231 			case IR_2:	TIM1_SetCompare3(155);break;
1062  0044 ae009b        	ldw	x,#155
1063  0047 cd0000        	call	_TIM1_SetCompare3
1067  004a 203e          	jra	L304
1068  004c               L743:
1069                     ; 232 			case IR_3:	TIM1_SetCompare3(170);break;
1071  004c ae00aa        	ldw	x,#170
1072  004f cd0000        	call	_TIM1_SetCompare3
1076  0052 2036          	jra	L304
1077  0054               L153:
1078                     ; 233 			case IR_4:	TIM1_SetCompare3(185);break;
1080  0054 ae00b9        	ldw	x,#185
1081  0057 cd0000        	call	_TIM1_SetCompare3
1085  005a 202e          	jra	L304
1086  005c               L353:
1087                     ; 234 			case IR_5:	TIM1_SetCompare3(200);break;
1089  005c ae00c8        	ldw	x,#200
1090  005f cd0000        	call	_TIM1_SetCompare3
1094  0062 2026          	jra	L304
1095  0064               L553:
1096                     ; 235 			case IR_PLAY_PAUSE:	if(MT.status==MT_STOPPED){
1098  0064 b600          	ld	a,_MT
1099  0066 4a            	dec	a
1100  0067 260d          	jrne	L114
1101                     ; 236 														if(MT.last_status==MT_LAST_FORWARD){
1103  0069 b601          	ld	a,_MT+1
1104  006b a102          	cp	a,#2
1105                     ; 237 															Motor_Start(MOTOR_FORWARD);
1108  006d 2716          	jreq	LC002
1109                     ; 238 														}else if(MT.last_status==MT_LAST_BACKWARD){
1111  006f a104          	cp	a,#4
1112                     ; 239 															Motor_Start(MOTOR_BACKWARD);
1114  0071               LC003:
1115  0071 2617          	jrne	L304
1117  0073 4f            	clr	a
1119  0074 2011          	jp	LC001
1120  0076               L114:
1121                     ; 242 														Motor_Stop();
1123  0076 cd0000        	call	_Motor_Stop
1125  0079 200f          	jra	L304
1126  007b               L753:
1127                     ; 245 			case IR_PREV:	if(MT.status==MT_STOPPED){
1129  007b b600          	ld	a,_MT
1130  007d 4a            	dec	a
1131                     ; 246 											Motor_Start(MOTOR_BACKWARD);
1133  007e 20f1          	jp	LC003
1134  0080               L163:
1135                     ; 249 			case IR_NEXT:	if(MT.status==MT_STOPPED){
1137  0080 b600          	ld	a,_MT
1138  0082 4a            	dec	a
1139  0083 2605          	jrne	L304
1140                     ; 250 											Motor_Start(MOTOR_FORWARD);
1142  0085               LC002:
1144  0085 a601          	ld	a,#1
1145  0087               LC001:
1146  0087 cd0000        	call	_Motor_Start
1148                     ; 253 			default:	break;
1150  008a               L304:
1151                     ; 256 }
1154  008a 84            	pop	a
1155  008b 81            	ret	
1182                     ; 258 void MT_Control(void)
1182                     ; 259 {
1183                     .text:	section	.text,new
1184  0000               _MT_Control:
1188                     ; 260 	MT_Speed_Set();
1190  0000 cd0000        	call	L733_MT_Speed_Set
1192                     ; 261 	if(MT.Key_A&&(MT.Sensor_OA_A==0)){	//正向满足运行条件
1194  0003 b609          	ld	a,_MT+9
1195  0005 2714          	jreq	L734
1197  0007 b606          	ld	a,_MT+6
1198  0009 2610          	jrne	L734
1199                     ; 262 		MT.Key_A=0;	//清除按键指令	
1201  000b b709          	ld	_MT+9,a
1202                     ; 263 		if(MT.status==MT_STOPPED){				//停止状态可以直接启动
1204  000d b600          	ld	a,_MT
1205  000f 4a            	dec	a
1206  0010 2606          	jrne	L144
1207                     ; 264 			Motor_Start(MOTOR_FORWARD);
1209  0012 4c            	inc	a
1210  0013 cd0000        	call	_Motor_Start
1213  0016 2003          	jra	L734
1214  0018               L144:
1215                     ; 267 			Motor_Stop();
1217  0018 cd0000        	call	_Motor_Stop
1219  001b               L734:
1220                     ; 272 	if(MT.Key_B&&(MT.Sensor_OA_B==0)){	//反向满足运行条件
1222  001b b60a          	ld	a,_MT+10
1223  001d 2713          	jreq	L544
1225  001f b607          	ld	a,_MT+7
1226  0021 260f          	jrne	L544
1227                     ; 273 		MT.Key_B=0;	//清除按键指令	
1229  0023 b70a          	ld	_MT+10,a
1230                     ; 274 		if(MT.status==MT_STOPPED){				//停止状态可以直接启动
1232  0025 b600          	ld	a,_MT
1233  0027 4a            	dec	a
1234  0028 2605          	jrne	L744
1235                     ; 275 			Motor_Start(MOTOR_BACKWARD);
1237  002a cd0000        	call	_Motor_Start
1240  002d 2003          	jra	L544
1241  002f               L744:
1242                     ; 278 			Motor_Stop();
1244  002f cd0000        	call	_Motor_Stop
1246  0032               L544:
1247                     ; 283 	if((MT.status==MT_RUNNING_FORWARD)&&(MT.Sensor_OA_A==1))	//正向急停
1249  0032 b600          	ld	a,_MT
1250  0034 a102          	cp	a,#2
1251  0036 2608          	jrne	L354
1253  0038 b606          	ld	a,_MT+6
1254  003a 4a            	dec	a
1255  003b 2603          	jrne	L354
1256                     ; 285 		Motor_Stop();
1258  003d cd0000        	call	_Motor_Stop
1260  0040               L354:
1261                     ; 288 	if((MT.status==MT_RUNNING_BACKWARD)&&(MT.Sensor_OA_B==1))	//反向急停
1263  0040 b600          	ld	a,_MT
1264  0042 a104          	cp	a,#4
1265  0044 2608          	jrne	L554
1267  0046 b607          	ld	a,_MT+7
1268  0048 4a            	dec	a
1269  0049 2603          	jrne	L554
1270                     ; 290 		Motor_Stop();
1272  004b cd0000        	call	_Motor_Stop
1274  004e               L554:
1275                     ; 295 }
1278  004e 81            	ret	
1562                     	xdef	_Alarm_Speaker
1563                     	switch	.ubsct
1564  0000               _pt_Alarm_Light_cnt:
1565  0000 00            	ds.b	1
1566                     	xdef	_pt_Alarm_Light_cnt
1567  0001               _pt_Alarm_Light:
1568  0001 0000          	ds.b	2
1569                     	xdef	_pt_Alarm_Light
1570  0003               _pt_Alarm_Speaker:
1571  0003 0000          	ds.b	2
1572                     	xdef	_pt_Alarm_Speaker
1573  0005               _pt_Keyscan:
1574  0005 0000          	ds.b	2
1575                     	xdef	_pt_Keyscan
1576                     	xref	_IR_GetCode
1577                     	xdef	_Alarm
1578                     	xdef	_MT_Control
1579                     	xdef	_Key_Scan
1580                     	xdef	_Sensor_OA_Scan
1581                     	xdef	_Motor_Stop
1582                     	xdef	_Motor_Start
1583                     	xdef	_Motor_Init
1584  0007               _Speed_Pulse_cnt:
1585  0007 0000          	ds.b	2
1586                     	xdef	_Speed_Pulse_cnt
1587  0009               _Speed_Origin:
1588  0009 0000          	ds.b	2
1589                     	xdef	_Speed_Origin
1590                     	xdef	_Speed_Pulse_Status
1591  000b               _pt_Alarm_Speaker_cnt:
1592  000b 00            	ds.b	1
1593                     	xdef	_pt_Alarm_Speaker_cnt
1594  000c               _pt_Keyscan_cnt:
1595  000c 00            	ds.b	1
1596                     	xdef	_pt_Keyscan_cnt
1597                     	xdef	_MT
1598                     	xref	_TIM1_SetCompare3
1599                     	xref	_TIM1_CCxCmd
1600                     	xref	_GPIO_ReadInputPin
1601                     	xref	_GPIO_WriteLow
1602                     	xref	_GPIO_WriteHigh
1603                     	xref	_GPIO_Init
1623                     	end
