   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
  16                     	bsct
  17  0000               _MT:
  18  0000 00            	dc.b	0
  19  0001 000000000000  	ds.b	10
  20  000b               _Speed_Pulse_Status:
  21  000b 00            	dc.b	0
  52                     ; 64 static void Obstacle_Avoidance_Sensor_Init(void)
  52                     ; 65 {
  54                     	switch	.text
  55  0000               L3_Obstacle_Avoidance_Sensor_Init:
  59                     ; 66 	GPIO_Init(OBSTACLE_AVOIDANCE_SENSOR_PORT,
  59                     ; 67 						OBSTACLE_AVOIDANCE_SENSOR_A|OBSTACLE_AVOIDANCE_SENSOR_B,
  59                     ; 68 						GPIO_MODE_IN_PU_NO_IT);				
  61  0000 4b40          	push	#64
  62  0002 4b06          	push	#6
  63  0004 ae5000        	ldw	x,#20480
  64  0007 cd0000        	call	_GPIO_Init
  66  000a 85            	popw	x
  67                     ; 70 }
  70  000b 81            	ret
  94                     ; 71 static void Speed_Sensor_Init(void)
  94                     ; 72 {
  95                     	switch	.text
  96  000c               L32_Speed_Sensor_Init:
 100                     ; 73 	GPIO_Init(SPEED_SENSOR_PORT,SPEED_SENSOR,GPIO_MODE_IN_PU_NO_IT);
 102  000c 4b40          	push	#64
 103  000e 4b08          	push	#8
 104  0010 ae5000        	ldw	x,#20480
 105  0013 cd0000        	call	_GPIO_Init
 107  0016 85            	popw	x
 108                     ; 74 }
 111  0017 81            	ret
 136                     ; 75 static void Key_Init(void)
 136                     ; 76 {
 137                     	switch	.text
 138  0018               L53_Key_Init:
 142                     ; 77 	GPIO_Init(KEY_PORT,KEY_A|KEY_B,GPIO_MODE_IN_PU_NO_IT);
 144  0018 4b40          	push	#64
 145  001a 4b30          	push	#48
 146  001c ae5005        	ldw	x,#20485
 147  001f cd0000        	call	_GPIO_Init
 149  0022 85            	popw	x
 150                     ; 78 	PT_INIT(&pt_Keyscan);
 152  0023 5f            	clrw	x
 153  0024 bf05          	ldw	_pt_Keyscan,x
 154                     ; 79 }
 158  0026 81            	ret
 184                     ; 80 static void Alarm_Init(void)
 184                     ; 81 {
 185                     	switch	.text
 186  0027               L74_Alarm_Init:
 190                     ; 82 	GPIO_Init(ALARM_PORT,ALARM,GPIO_MODE_OUT_PP_HIGH_SLOW);
 192  0027 4bd0          	push	#208
 193  0029 4b10          	push	#16
 194  002b ae500f        	ldw	x,#20495
 195  002e cd0000        	call	_GPIO_Init
 197  0031 85            	popw	x
 198                     ; 84 	PT_INIT(&pt_Alarm_Speaker);
 200  0032 5f            	clrw	x
 201  0033 bf03          	ldw	_pt_Alarm_Speaker,x
 202                     ; 85 	PT_INIT(&pt_Alarm_Light);
 205  0035 5f            	clrw	x
 206  0036 bf01          	ldw	_pt_Alarm_Light,x
 207                     ; 86 }
 211  0038 81            	ret
 241                     ; 89 void Motor_Init(void)
 241                     ; 90 {
 242                     	switch	.text
 243  0039               _Motor_Init:
 247                     ; 92 	GPIO_Init(L298N_IN_PORT,L298N_IN1|L298N_IN2,GPIO_MODE_OUT_PP_LOW_SLOW);
 249  0039 4bc0          	push	#192
 250  003b 4b60          	push	#96
 251  003d ae500f        	ldw	x,#20495
 252  0040 cd0000        	call	_GPIO_Init
 254  0043 85            	popw	x
 255                     ; 93 	GPIO_Init(MOTOR_PWM_PORT,MOTOR_PWM,GPIO_MODE_OUT_PP_LOW_SLOW);
 257  0044 4bc0          	push	#192
 258  0046 4b08          	push	#8
 259  0048 ae500a        	ldw	x,#20490
 260  004b cd0000        	call	_GPIO_Init
 262  004e 85            	popw	x
 263                     ; 95 	TIM1_Cmd(DISABLE);																			//stop计数器
 265  004f 4f            	clr	a
 266  0050 cd0000        	call	_TIM1_Cmd
 268                     ; 96 	TIM1_CtrlPWMOutputs(DISABLE);														// TIM1 Main Output disable
 270  0053 4f            	clr	a
 271  0054 cd0000        	call	_TIM1_CtrlPWMOutputs
 273                     ; 98 	Obstacle_Avoidance_Sensor_Init();
 275  0057 ada7          	call	L3_Obstacle_Avoidance_Sensor_Init
 277                     ; 99 	Speed_Sensor_Init();
 279  0059 adb1          	call	L32_Speed_Sensor_Init
 281                     ; 100 	Key_Init();
 283  005b adbb          	call	L53_Key_Init
 285                     ; 101 	Alarm_Init();
 287  005d adc8          	call	L74_Alarm_Init
 289                     ; 106 }
 292  005f 81            	ret
 351                     ; 108 void Motor_Start(Motor_Direction_Typedef dir)
 351                     ; 109 {
 352                     	switch	.text
 353  0060               _Motor_Start:
 357                     ; 110 	if(dir){
 359  0060 4d            	tnz	a
 360  0061 2714          	jreq	L711
 361                     ; 111 		GPIO_WriteHigh(L298N_IN_PORT,L298N_IN1);
 363  0063 4b20          	push	#32
 364  0065 ae500f        	ldw	x,#20495
 365  0068 cd0000        	call	_GPIO_WriteHigh
 367  006b 84            	pop	a
 368                     ; 112 		GPIO_WriteLow(L298N_IN_PORT,L298N_IN2);
 370  006c 4b40          	push	#64
 371  006e ae500f        	ldw	x,#20495
 372  0071 cd0000        	call	_GPIO_WriteLow
 374  0074 84            	pop	a
 376  0075 2012          	jra	L121
 377  0077               L711:
 378                     ; 114 		GPIO_WriteHigh(L298N_IN_PORT,L298N_IN2);
 380  0077 4b40          	push	#64
 381  0079 ae500f        	ldw	x,#20495
 382  007c cd0000        	call	_GPIO_WriteHigh
 384  007f 84            	pop	a
 385                     ; 115 		GPIO_WriteLow(L298N_IN_PORT,L298N_IN1);
 387  0080 4b20          	push	#32
 388  0082 ae500f        	ldw	x,#20495
 389  0085 cd0000        	call	_GPIO_WriteLow
 391  0088 84            	pop	a
 392  0089               L121:
 393                     ; 118 	TIM1_Cmd(ENABLE);																			//使能计数器
 395  0089 a601          	ld	a,#1
 396  008b cd0000        	call	_TIM1_Cmd
 398                     ; 119 	TIM1_CtrlPWMOutputs(ENABLE);													// TIM1 Main Output Enable
 400  008e a601          	ld	a,#1
 401  0090 cd0000        	call	_TIM1_CtrlPWMOutputs
 403                     ; 120 }
 406  0093 81            	ret
 432                     ; 121 void Motor_Stop(void)
 432                     ; 122 {
 433                     	switch	.text
 434  0094               _Motor_Stop:
 438                     ; 123 	TIM1_Cmd(DISABLE);																			//stop计数器
 440  0094 4f            	clr	a
 441  0095 cd0000        	call	_TIM1_Cmd
 443                     ; 124 	TIM1_CtrlPWMOutputs(DISABLE);														// TIM1 Main Output disable
 445  0098 4f            	clr	a
 446  0099 cd0000        	call	_TIM1_CtrlPWMOutputs
 448                     ; 125 	GPIO_WriteLow(L298N_IN_PORT,L298N_IN1);
 450  009c 4b20          	push	#32
 451  009e ae500f        	ldw	x,#20495
 452  00a1 cd0000        	call	_GPIO_WriteLow
 454  00a4 84            	pop	a
 455                     ; 126 	GPIO_WriteLow(L298N_IN_PORT,L298N_IN2);
 457  00a5 4b40          	push	#64
 458  00a7 ae500f        	ldw	x,#20495
 459  00aa cd0000        	call	_GPIO_WriteLow
 461  00ad 84            	pop	a
 462                     ; 127 }
 465  00ae 81            	ret
 490                     ; 130 void Sensor_OA_Scan(void)
 490                     ; 131 {
 491                     	switch	.text
 492  00af               _Sensor_OA_Scan:
 496                     ; 132 	if(GPIO_ReadInputPin(OBSTACLE_AVOIDANCE_SENSOR_PORT,OBSTACLE_AVOIDANCE_SENSOR_A)){	//
 498  00af 4b02          	push	#2
 499  00b1 ae5000        	ldw	x,#20480
 500  00b4 cd0000        	call	_GPIO_ReadInputPin
 502  00b7 5b01          	addw	sp,#1
 503  00b9 4d            	tnz	a
 504  00ba 2704          	jreq	L341
 505                     ; 133 		MT.Sensor_OA_A=0;	
 507  00bc 3f05          	clr	_MT+5
 509  00be 2004          	jra	L541
 510  00c0               L341:
 511                     ; 135 		MT.Sensor_OA_A=1;
 513  00c0 35010005      	mov	_MT+5,#1
 514  00c4               L541:
 515                     ; 137 	if(GPIO_ReadInputPin(OBSTACLE_AVOIDANCE_SENSOR_PORT,OBSTACLE_AVOIDANCE_SENSOR_B)){	//
 517  00c4 4b04          	push	#4
 518  00c6 ae5000        	ldw	x,#20480
 519  00c9 cd0000        	call	_GPIO_ReadInputPin
 521  00cc 5b01          	addw	sp,#1
 522  00ce 4d            	tnz	a
 523  00cf 2704          	jreq	L741
 524                     ; 138 		MT.Sensor_OA_B=0;	
 526  00d1 3f06          	clr	_MT+6
 528  00d3 2004          	jra	L151
 529  00d5               L741:
 530                     ; 140 		MT.Sensor_OA_B=1;
 532  00d5 35010006      	mov	_MT+6,#1
 533  00d9               L151:
 534                     ; 142 }
 537  00d9 81            	ret
 575                     ; 145 PT_THREAD(Key_Scan(void))
 575                     ; 146 {
 576                     	switch	.text
 577  00da               _Key_Scan:
 579  00da 88            	push	a
 580       00000001      OFST:	set	1
 583                     ; 147 	PT_BEGIN(&pt_Keyscan);
 587  00db be05          	ldw	x,_pt_Keyscan
 589                     ; 164 			MT.Key_B=1;
 590  00dd 5d            	tnzw	x
 591  00de 2717          	jreq	L351
 592  00e0 1d0098        	subw	x,#152
 593  00e3 2726          	jreq	L551
 594  00e5 1d0002        	subw	x,#2
 595  00e8 273d          	jreq	L751
 596  00ea 1d0007        	subw	x,#7
 597  00ed 2761          	jreq	L161
 598  00ef 1d0002        	subw	x,#2
 599  00f2 2778          	jreq	L361
 600  00f4 cc0181        	jra	L502
 601  00f7               L351:
 602                     ; 149 	if(GPIO_ReadInputPin(KEY_PORT,KEY_A)){	//按键动作
 605  00f7 4b10          	push	#16
 606  00f9 ae5005        	ldw	x,#20485
 607  00fc cd0000        	call	_GPIO_ReadInputPin
 609  00ff 5b01          	addw	sp,#1
 610  0101 4d            	tnz	a
 611  0102 2738          	jreq	L702
 612                     ; 151 		pt_Keyscan_cnt=0;
 614  0104 3f0c          	clr	_pt_Keyscan_cnt
 615                     ; 152 		PT_WAIT_UNTIL(&pt_Keyscan,pt_Keyscan_cnt>5);
 617  0106 ae0098        	ldw	x,#152
 618  0109 bf05          	ldw	_pt_Keyscan,x
 619  010b               L551:
 623  010b b60c          	ld	a,_pt_Keyscan_cnt
 624  010d a106          	cp	a,#6
 625  010f 2404          	jruge	L512
 628  0111 4f            	clr	a
 631  0112 5b01          	addw	sp,#1
 632  0114 81            	ret
 633  0115               L512:
 634                     ; 153 		if(GPIO_ReadInputPin(KEY_PORT,KEY_A)){	//有效的按键动作
 636  0115 4b10          	push	#16
 637  0117 ae5005        	ldw	x,#20485
 638  011a cd0000        	call	_GPIO_ReadInputPin
 640  011d 5b01          	addw	sp,#1
 641  011f 4d            	tnz	a
 642  0120 271a          	jreq	L702
 643                     ; 154 			PT_WAIT_UNTIL(&pt_Keyscan,GPIO_ReadInputPin(KEY_PORT,KEY_A)==0);	//等待按键释放
 645  0122 ae009a        	ldw	x,#154
 646  0125 bf05          	ldw	_pt_Keyscan,x
 647  0127               L751:
 651  0127 4b10          	push	#16
 652  0129 ae5005        	ldw	x,#20485
 653  012c cd0000        	call	_GPIO_ReadInputPin
 655  012f 5b01          	addw	sp,#1
 656  0131 4d            	tnz	a
 657  0132 2704          	jreq	L522
 660  0134 4f            	clr	a
 663  0135 5b01          	addw	sp,#1
 664  0137 81            	ret
 665  0138               L522:
 666                     ; 155 			MT.Key_A=1;
 668  0138 35010008      	mov	_MT+8,#1
 669  013c               L702:
 670                     ; 158 	if(GPIO_ReadInputPin(KEY_PORT,KEY_B)){	//按键动作
 672  013c 4b20          	push	#32
 673  013e ae5005        	ldw	x,#20485
 674  0141 cd0000        	call	_GPIO_ReadInputPin
 676  0144 5b01          	addw	sp,#1
 677  0146 4d            	tnz	a
 678  0147 2738          	jreq	L502
 679                     ; 160 		pt_Keyscan_cnt=0;
 681  0149 3f0c          	clr	_pt_Keyscan_cnt
 682                     ; 161 		PT_WAIT_UNTIL(&pt_Keyscan,pt_Keyscan_cnt>5);
 684  014b ae00a1        	ldw	x,#161
 685  014e bf05          	ldw	_pt_Keyscan,x
 686  0150               L161:
 690  0150 b60c          	ld	a,_pt_Keyscan_cnt
 691  0152 a106          	cp	a,#6
 692  0154 2404          	jruge	L532
 695  0156 4f            	clr	a
 698  0157 5b01          	addw	sp,#1
 699  0159 81            	ret
 700  015a               L532:
 701                     ; 162 		if(GPIO_ReadInputPin(KEY_PORT,KEY_B)){
 703  015a 4b20          	push	#32
 704  015c ae5005        	ldw	x,#20485
 705  015f cd0000        	call	_GPIO_ReadInputPin
 707  0162 5b01          	addw	sp,#1
 708  0164 4d            	tnz	a
 709  0165 271a          	jreq	L502
 710                     ; 163 			PT_WAIT_UNTIL(&pt_Keyscan,GPIO_ReadInputPin(KEY_PORT,KEY_B)==0);	//等待按键释放
 712  0167 ae00a3        	ldw	x,#163
 713  016a bf05          	ldw	_pt_Keyscan,x
 714  016c               L361:
 718  016c 4b20          	push	#32
 719  016e ae5005        	ldw	x,#20485
 720  0171 cd0000        	call	_GPIO_ReadInputPin
 722  0174 5b01          	addw	sp,#1
 723  0176 4d            	tnz	a
 724  0177 2704          	jreq	L542
 727  0179 4f            	clr	a
 730  017a 5b01          	addw	sp,#1
 731  017c 81            	ret
 732  017d               L542:
 733                     ; 164 			MT.Key_B=1;
 735  017d 35010009      	mov	_MT+9,#1
 736  0181               L502:
 737                     ; 168 	PT_END(&pt_Keyscan);
 742  0181 5f            	clrw	x
 743  0182 bf05          	ldw	_pt_Keyscan,x
 747  0184 a602          	ld	a,#2
 750  0186 5b01          	addw	sp,#1
 751  0188 81            	ret
 777                     ; 174 void MT_Control(void)
 777                     ; 175 {
 778                     	switch	.text
 779  0189               _MT_Control:
 783                     ; 176 	if(MT.Key_A&&(MT.Sensor_OA_A==0)){	//正向满足运行条件
 785  0189 3d08          	tnz	_MT+8
 786  018b 271a          	jreq	L752
 788  018d 3d05          	tnz	_MT+5
 789  018f 2616          	jrne	L752
 790                     ; 177 		MT.Key_A=0;	//清除按键指令	
 792  0191 3f08          	clr	_MT+8
 793                     ; 178 		if(MT.status==MT_STOPPED){				//停止状态可以直接启动
 795  0193 3d00          	tnz	_MT
 796  0195 260b          	jrne	L162
 797                     ; 179 			Motor_Start(MOTOR_FORWARD);
 799  0197 a601          	ld	a,#1
 800  0199 cd0060        	call	_Motor_Start
 802                     ; 180 			MT.status=MT_RUNNING_FORWARD;		//更新运行状态
 804  019c 35010000      	mov	_MT,#1
 806  01a0 2005          	jra	L752
 807  01a2               L162:
 808                     ; 182 			Motor_Stop();
 810  01a2 cd0094        	call	_Motor_Stop
 812                     ; 183 			MT.status=MT_STOPPED;						//更新运行状态
 814  01a5 3f00          	clr	_MT
 815  01a7               L752:
 816                     ; 187 	if(MT.Key_B&&(MT.Sensor_OA_B==0)){	//反向满足运行条件
 818  01a7 3d09          	tnz	_MT+9
 819  01a9 2719          	jreq	L562
 821  01ab 3d06          	tnz	_MT+6
 822  01ad 2615          	jrne	L562
 823                     ; 188 		MT.Key_B=0;	//清除按键指令	
 825  01af 3f09          	clr	_MT+9
 826                     ; 189 		if(MT.status==MT_STOPPED){				//停止状态可以直接启动
 828  01b1 3d00          	tnz	_MT
 829  01b3 260a          	jrne	L762
 830                     ; 190 			Motor_Start(MOTOR_BACKWARD);
 832  01b5 4f            	clr	a
 833  01b6 cd0060        	call	_Motor_Start
 835                     ; 191 			MT.status=MT_RUNNING_BACKWARD;		//更新运行状态
 837  01b9 35110000      	mov	_MT,#17
 839  01bd 2005          	jra	L562
 840  01bf               L762:
 841                     ; 193 			Motor_Stop();
 843  01bf cd0094        	call	_Motor_Stop
 845                     ; 194 			MT.status=MT_STOPPED;						//更新运行状态
 847  01c2 3f00          	clr	_MT
 848  01c4               L562:
 849                     ; 198 	if((MT.status==MT_RUNNING_FORWARD)&&(MT.Sensor_OA_A==1))	//正向急停
 851  01c4 b600          	ld	a,_MT
 852  01c6 a101          	cp	a,#1
 853  01c8 260b          	jrne	L372
 855  01ca b605          	ld	a,_MT+5
 856  01cc a101          	cp	a,#1
 857  01ce 2605          	jrne	L372
 858                     ; 200 		Motor_Stop();
 860  01d0 cd0094        	call	_Motor_Stop
 862                     ; 201 		MT.status=MT_STOPPED;						//更新运行状态
 864  01d3 3f00          	clr	_MT
 865  01d5               L372:
 866                     ; 203 	if((MT.status==MT_RUNNING_BACKWARD)&&(MT.Sensor_OA_B==1))	//反向急停
 868  01d5 b600          	ld	a,_MT
 869  01d7 a111          	cp	a,#17
 870  01d9 260b          	jrne	L572
 872  01db b606          	ld	a,_MT+6
 873  01dd a101          	cp	a,#1
 874  01df 2605          	jrne	L572
 875                     ; 205 		Motor_Stop();
 877  01e1 cd0094        	call	_Motor_Stop
 879                     ; 206 		MT.status=MT_STOPPED;						//更新运行状态
 881  01e4 3f00          	clr	_MT
 882  01e6               L572:
 883                     ; 210 }
 886  01e6 81            	ret
 924                     ; 211 PT_THREAD(Alarm_Speaker(void))
 924                     ; 212 {
 925                     	switch	.text
 926  01e7               _Alarm_Speaker:
 928  01e7 88            	push	a
 929       00000001      OFST:	set	1
 932                     ; 213 	PT_BEGIN(&pt_Alarm_Speaker);
 936  01e8 be03          	ldw	x,_pt_Alarm_Speaker
 938                     ; 221 	GPIO_WriteHigh(ALARM_PORT,ALARM);
 939  01ea 5d            	tnzw	x
 940  01eb 270c          	jreq	L772
 941  01ed 1d00d8        	subw	x,#216
 942  01f0 270e          	jreq	L103
 943  01f2 1d0004        	subw	x,#4
 944  01f5 2723          	jreq	L303
 945  01f7 2034          	jra	L523
 946  01f9               L772:
 947                     ; 215 	pt_Alarm_Speaker_cnt=0;
 950  01f9 3f0b          	clr	_pt_Alarm_Speaker_cnt
 951                     ; 216 	PT_WAIT_UNTIL(&pt_Alarm_Speaker,pt_Alarm_Speaker_cnt>30);
 953  01fb ae00d8        	ldw	x,#216
 954  01fe bf03          	ldw	_pt_Alarm_Speaker,x
 955  0200               L103:
 959  0200 b60b          	ld	a,_pt_Alarm_Speaker_cnt
 960  0202 a11f          	cp	a,#31
 961  0204 2404          	jruge	L333
 964  0206 4f            	clr	a
 967  0207 5b01          	addw	sp,#1
 968  0209 81            	ret
 969  020a               L333:
 970                     ; 217 	GPIO_WriteLow(ALARM_PORT,ALARM);
 972  020a 4b10          	push	#16
 973  020c ae500f        	ldw	x,#20495
 974  020f cd0000        	call	_GPIO_WriteLow
 976  0212 84            	pop	a
 977                     ; 219 	pt_Alarm_Speaker_cnt=0;
 979  0213 3f0b          	clr	_pt_Alarm_Speaker_cnt
 980                     ; 220 	PT_WAIT_UNTIL(&pt_Alarm_Speaker,pt_Alarm_Speaker_cnt>50);
 982  0215 ae00dc        	ldw	x,#220
 983  0218 bf03          	ldw	_pt_Alarm_Speaker,x
 984  021a               L303:
 988  021a b60b          	ld	a,_pt_Alarm_Speaker_cnt
 989  021c a133          	cp	a,#51
 990  021e 2404          	jruge	L143
 993  0220 4f            	clr	a
 996  0221 5b01          	addw	sp,#1
 997  0223 81            	ret
 998  0224               L143:
 999                     ; 221 	GPIO_WriteHigh(ALARM_PORT,ALARM);
1001  0224 4b10          	push	#16
1002  0226 ae500f        	ldw	x,#20495
1003  0229 cd0000        	call	_GPIO_WriteHigh
1005  022c 84            	pop	a
1006  022d               L523:
1007                     ; 223 	PT_END(&pt_Alarm_Speaker);
1012  022d 5f            	clrw	x
1013  022e bf03          	ldw	_pt_Alarm_Speaker,x
1017  0230 a602          	ld	a,#2
1020  0232 5b01          	addw	sp,#1
1021  0234 81            	ret
1047                     ; 228 void Alarm(void)
1047                     ; 229 {
1048                     	switch	.text
1049  0235               _Alarm:
1053                     ; 230 	if(MT.status&0x01)	//if running
1055  0235 b600          	ld	a,_MT
1056  0237 a501          	bcp	a,#1
1057  0239 2704          	jreq	L353
1058                     ; 232 		Alarm_Speaker();
1060  023b adaa          	call	_Alarm_Speaker
1063  023d 2009          	jra	L553
1064  023f               L353:
1065                     ; 234 		GPIO_WriteHigh(ALARM_PORT,ALARM);
1067  023f 4b10          	push	#16
1068  0241 ae500f        	ldw	x,#20495
1069  0244 cd0000        	call	_GPIO_WriteHigh
1071  0247 84            	pop	a
1072  0248               L553:
1073                     ; 236 }
1076  0248 81            	ret
1330                     	xdef	_Alarm_Speaker
1331                     	switch	.ubsct
1332  0000               _pt_Alarm_Light_cnt:
1333  0000 00            	ds.b	1
1334                     	xdef	_pt_Alarm_Light_cnt
1335  0001               _pt_Alarm_Light:
1336  0001 0000          	ds.b	2
1337                     	xdef	_pt_Alarm_Light
1338  0003               _pt_Alarm_Speaker:
1339  0003 0000          	ds.b	2
1340                     	xdef	_pt_Alarm_Speaker
1341  0005               _pt_Keyscan:
1342  0005 0000          	ds.b	2
1343                     	xdef	_pt_Keyscan
1344                     	xdef	_Alarm
1345                     	xdef	_MT_Control
1346                     	xdef	_Key_Scan
1347                     	xdef	_Sensor_OA_Scan
1348                     	xdef	_Motor_Stop
1349                     	xdef	_Motor_Start
1350                     	xdef	_Motor_Init
1351  0007               _Speed_Pulse_cnt:
1352  0007 0000          	ds.b	2
1353                     	xdef	_Speed_Pulse_cnt
1354  0009               _Speed_Origin:
1355  0009 0000          	ds.b	2
1356                     	xdef	_Speed_Origin
1357                     	xdef	_Speed_Pulse_Status
1358  000b               _pt_Alarm_Speaker_cnt:
1359  000b 00            	ds.b	1
1360                     	xdef	_pt_Alarm_Speaker_cnt
1361  000c               _pt_Keyscan_cnt:
1362  000c 00            	ds.b	1
1363                     	xdef	_pt_Keyscan_cnt
1364                     	xdef	_MT
1365                     	xref	_TIM1_CtrlPWMOutputs
1366                     	xref	_TIM1_Cmd
1367                     	xref	_GPIO_ReadInputPin
1368                     	xref	_GPIO_WriteLow
1369                     	xref	_GPIO_WriteHigh
1370                     	xref	_GPIO_Init
1390                     	end
