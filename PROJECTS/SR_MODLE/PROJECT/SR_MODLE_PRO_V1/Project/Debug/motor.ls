   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
  17                     	bsct
  18  0000               _MT:
  19  0000 00            	dc.b	0
  20  0001 000000000000  	ds.b	10
  51                     ; 55 static void Obstacle_Avoidance_Sensor_Init(void)
  51                     ; 56 {
  53                     .text:	section	.text,new
  54  0000               L3_Obstacle_Avoidance_Sensor_Init:
  58                     ; 57 	GPIO_Init(OBSTACLE_AVOIDANCE_SENSOR_PORT,
  58                     ; 58 						OBSTACLE_AVOIDANCE_SENSOR_A|OBSTACLE_AVOIDANCE_SENSOR_B,
  58                     ; 59 						GPIO_MODE_IN_PU_NO_IT);				
  60  0000 4b40          	push	#64
  61  0002 4b06          	push	#6
  62  0004 ae5000        	ldw	x,#20480
  63  0007 cd0000        	call	_GPIO_Init
  65  000a 85            	popw	x
  66                     ; 61 }
  69  000b 81            	ret
  93                     ; 62 static void Speed_Sensor_Init(void)
  93                     ; 63 {
  94                     .text:	section	.text,new
  95  0000               L32_Speed_Sensor_Init:
  99                     ; 64 	GPIO_Init(SPEED_SENSOR_PORT,SPEED_SENSOR,GPIO_MODE_IN_PU_NO_IT);
 101  0000 4b40          	push	#64
 102  0002 4b08          	push	#8
 103  0004 ae5000        	ldw	x,#20480
 104  0007 cd0000        	call	_GPIO_Init
 106  000a 85            	popw	x
 107                     ; 65 }
 110  000b 81            	ret
 135                     ; 66 static void Key_Init(void)
 135                     ; 67 {
 136                     .text:	section	.text,new
 137  0000               L53_Key_Init:
 141                     ; 68 	GPIO_Init(KEY_PORT,KEY_A|KEY_B,GPIO_MODE_IN_PU_NO_IT);
 143  0000 4b40          	push	#64
 144  0002 4b30          	push	#48
 145  0004 ae5005        	ldw	x,#20485
 146  0007 cd0000        	call	_GPIO_Init
 148  000a 85            	popw	x
 149                     ; 69 	PT_INIT(&pt_Keyscan);
 151  000b 5f            	clrw	x
 152  000c bf05          	ldw	_pt_Keyscan,x
 153                     ; 70 }
 157  000e 81            	ret
 183                     ; 71 static void Alarm_Init(void)
 183                     ; 72 {
 184                     .text:	section	.text,new
 185  0000               L74_Alarm_Init:
 189                     ; 73 	GPIO_Init(ALARM_PORT,ALARM,GPIO_MODE_OUT_PP_HIGH_SLOW);
 191  0000 4bd0          	push	#208
 192  0002 4b10          	push	#16
 193  0004 ae500f        	ldw	x,#20495
 194  0007 cd0000        	call	_GPIO_Init
 196  000a 85            	popw	x
 197                     ; 75 	PT_INIT(&pt_Alarm_Speaker);
 199  000b 5f            	clrw	x
 200  000c bf03          	ldw	_pt_Alarm_Speaker,x
 201                     ; 76 	PT_INIT(&pt_Alarm_Light);
 204  000e 5f            	clrw	x
 205  000f bf01          	ldw	_pt_Alarm_Light,x
 206                     ; 77 }
 210  0011 81            	ret
 240                     ; 80 void Motor_Init(void)
 240                     ; 81 {
 241                     .text:	section	.text,new
 242  0000               _Motor_Init:
 246                     ; 83 	GPIO_Init(L298N_IN_PORT,L298N_IN1|L298N_IN2,GPIO_MODE_OUT_PP_LOW_SLOW);
 248  0000 4bc0          	push	#192
 249  0002 4b60          	push	#96
 250  0004 ae500f        	ldw	x,#20495
 251  0007 cd0000        	call	_GPIO_Init
 253  000a 85            	popw	x
 254                     ; 84 	GPIO_Init(MOTOR_PWM_PORT,MOTOR_PWM,GPIO_MODE_OUT_PP_LOW_SLOW);
 256  000b 4bc0          	push	#192
 257  000d 4b08          	push	#8
 258  000f ae500a        	ldw	x,#20490
 259  0012 cd0000        	call	_GPIO_Init
 261  0015 85            	popw	x
 262                     ; 86 	TIM1_Cmd(DISABLE);																			//stop计数器
 264  0016 4f            	clr	a
 265  0017 cd0000        	call	_TIM1_Cmd
 267                     ; 87 	TIM1_CtrlPWMOutputs(DISABLE);														// TIM1 Main Output disable
 269  001a 4f            	clr	a
 270  001b cd0000        	call	_TIM1_CtrlPWMOutputs
 272                     ; 89 	Obstacle_Avoidance_Sensor_Init();
 274  001e cd0000        	call	L3_Obstacle_Avoidance_Sensor_Init
 276                     ; 90 	Speed_Sensor_Init();
 278  0021 cd0000        	call	L32_Speed_Sensor_Init
 280                     ; 91 	Key_Init();
 282  0024 cd0000        	call	L53_Key_Init
 284                     ; 92 	Alarm_Init();
 286  0027 cd0000        	call	L74_Alarm_Init
 288                     ; 97 }
 291  002a 81            	ret
 350                     ; 99 void Motor_Start(Motor_Direction_Typedef dir)
 350                     ; 100 {
 351                     .text:	section	.text,new
 352  0000               _Motor_Start:
 356                     ; 101 	if(dir){
 358  0000 4d            	tnz	a
 359  0001 2714          	jreq	L711
 360                     ; 102 		GPIO_WriteHigh(L298N_IN_PORT,L298N_IN1);
 362  0003 4b20          	push	#32
 363  0005 ae500f        	ldw	x,#20495
 364  0008 cd0000        	call	_GPIO_WriteHigh
 366  000b 84            	pop	a
 367                     ; 103 		GPIO_WriteLow(L298N_IN_PORT,L298N_IN2);
 369  000c 4b40          	push	#64
 370  000e ae500f        	ldw	x,#20495
 371  0011 cd0000        	call	_GPIO_WriteLow
 373  0014 84            	pop	a
 375  0015 2012          	jra	L121
 376  0017               L711:
 377                     ; 105 		GPIO_WriteHigh(L298N_IN_PORT,L298N_IN2);
 379  0017 4b40          	push	#64
 380  0019 ae500f        	ldw	x,#20495
 381  001c cd0000        	call	_GPIO_WriteHigh
 383  001f 84            	pop	a
 384                     ; 106 		GPIO_WriteLow(L298N_IN_PORT,L298N_IN1);
 386  0020 4b20          	push	#32
 387  0022 ae500f        	ldw	x,#20495
 388  0025 cd0000        	call	_GPIO_WriteLow
 390  0028 84            	pop	a
 391  0029               L121:
 392                     ; 109 	TIM1_Cmd(ENABLE);																			//使能计数器
 394  0029 a601          	ld	a,#1
 395  002b cd0000        	call	_TIM1_Cmd
 397                     ; 110 	TIM1_CtrlPWMOutputs(ENABLE);													// TIM1 Main Output Enable
 399  002e a601          	ld	a,#1
 400  0030 cd0000        	call	_TIM1_CtrlPWMOutputs
 402                     ; 111 }
 405  0033 81            	ret
 431                     ; 112 void Motor_Stop(void)
 431                     ; 113 {
 432                     .text:	section	.text,new
 433  0000               _Motor_Stop:
 437                     ; 114 	TIM1_Cmd(DISABLE);																			//stop计数器
 439  0000 4f            	clr	a
 440  0001 cd0000        	call	_TIM1_Cmd
 442                     ; 115 	TIM1_CtrlPWMOutputs(DISABLE);														// TIM1 Main Output disable
 444  0004 4f            	clr	a
 445  0005 cd0000        	call	_TIM1_CtrlPWMOutputs
 447                     ; 116 	GPIO_WriteLow(L298N_IN_PORT,L298N_IN1);
 449  0008 4b20          	push	#32
 450  000a ae500f        	ldw	x,#20495
 451  000d cd0000        	call	_GPIO_WriteLow
 453  0010 84            	pop	a
 454                     ; 117 	GPIO_WriteLow(L298N_IN_PORT,L298N_IN2);
 456  0011 4b40          	push	#64
 457  0013 ae500f        	ldw	x,#20495
 458  0016 cd0000        	call	_GPIO_WriteLow
 460  0019 84            	pop	a
 461                     ; 118 }
 464  001a 81            	ret
 489                     ; 121 void Sensor_OA_Scan(void)
 489                     ; 122 {
 490                     .text:	section	.text,new
 491  0000               _Sensor_OA_Scan:
 495                     ; 123 	if(GPIO_ReadInputPin(OBSTACLE_AVOIDANCE_SENSOR_PORT,OBSTACLE_AVOIDANCE_SENSOR_A)){	//
 497  0000 4b02          	push	#2
 498  0002 ae5000        	ldw	x,#20480
 499  0005 cd0000        	call	_GPIO_ReadInputPin
 501  0008 5b01          	addw	sp,#1
 502  000a 4d            	tnz	a
 503  000b 2704          	jreq	L341
 504                     ; 124 		MT.Sensor_OA_A=0;	
 506  000d 3f05          	clr	_MT+5
 508  000f 2004          	jra	L541
 509  0011               L341:
 510                     ; 126 		MT.Sensor_OA_A=1;
 512  0011 35010005      	mov	_MT+5,#1
 513  0015               L541:
 514                     ; 128 	if(GPIO_ReadInputPin(OBSTACLE_AVOIDANCE_SENSOR_PORT,OBSTACLE_AVOIDANCE_SENSOR_B)){	//
 516  0015 4b04          	push	#4
 517  0017 ae5000        	ldw	x,#20480
 518  001a cd0000        	call	_GPIO_ReadInputPin
 520  001d 5b01          	addw	sp,#1
 521  001f 4d            	tnz	a
 522  0020 2704          	jreq	L741
 523                     ; 129 		MT.Sensor_OA_B=0;	
 525  0022 3f06          	clr	_MT+6
 527  0024 2004          	jra	L151
 528  0026               L741:
 529                     ; 131 		MT.Sensor_OA_B=1;
 531  0026 35010006      	mov	_MT+6,#1
 532  002a               L151:
 533                     ; 133 }
 536  002a 81            	ret
 574                     ; 136 PT_THREAD(Key_Scan(void))
 574                     ; 137 {
 575                     .text:	section	.text,new
 576  0000               _Key_Scan:
 578  0000 88            	push	a
 579       00000001      OFST:	set	1
 582                     ; 138 	PT_BEGIN(&pt_Keyscan);
 586  0001 be05          	ldw	x,_pt_Keyscan
 588                     ; 155 			MT.Key_B=1;
 589  0003 5d            	tnzw	x
 590  0004 2717          	jreq	L351
 591  0006 1d008f        	subw	x,#143
 592  0009 2726          	jreq	L551
 593  000b 1d0002        	subw	x,#2
 594  000e 273d          	jreq	L751
 595  0010 1d0007        	subw	x,#7
 596  0013 2761          	jreq	L161
 597  0015 1d0002        	subw	x,#2
 598  0018 2778          	jreq	L361
 599  001a cc00a7        	jra	L502
 600  001d               L351:
 601                     ; 140 	if(GPIO_ReadInputPin(KEY_PORT,KEY_A)){	//按键动作
 604  001d 4b10          	push	#16
 605  001f ae5005        	ldw	x,#20485
 606  0022 cd0000        	call	_GPIO_ReadInputPin
 608  0025 5b01          	addw	sp,#1
 609  0027 4d            	tnz	a
 610  0028 2738          	jreq	L702
 611                     ; 142 		pt_Keyscan_cnt=0;
 613  002a 3f08          	clr	_pt_Keyscan_cnt
 614                     ; 143 		PT_WAIT_UNTIL(&pt_Keyscan,pt_Keyscan_cnt>5);
 616  002c ae008f        	ldw	x,#143
 617  002f bf05          	ldw	_pt_Keyscan,x
 618  0031               L551:
 622  0031 b608          	ld	a,_pt_Keyscan_cnt
 623  0033 a106          	cp	a,#6
 624  0035 2404          	jruge	L512
 627  0037 4f            	clr	a
 630  0038 5b01          	addw	sp,#1
 631  003a 81            	ret
 632  003b               L512:
 633                     ; 144 		if(GPIO_ReadInputPin(KEY_PORT,KEY_A)){	//有效的按键动作
 635  003b 4b10          	push	#16
 636  003d ae5005        	ldw	x,#20485
 637  0040 cd0000        	call	_GPIO_ReadInputPin
 639  0043 5b01          	addw	sp,#1
 640  0045 4d            	tnz	a
 641  0046 271a          	jreq	L702
 642                     ; 145 			PT_WAIT_UNTIL(&pt_Keyscan,GPIO_ReadInputPin(KEY_PORT,KEY_A)==0);	//等待按键释放
 644  0048 ae0091        	ldw	x,#145
 645  004b bf05          	ldw	_pt_Keyscan,x
 646  004d               L751:
 650  004d 4b10          	push	#16
 651  004f ae5005        	ldw	x,#20485
 652  0052 cd0000        	call	_GPIO_ReadInputPin
 654  0055 5b01          	addw	sp,#1
 655  0057 4d            	tnz	a
 656  0058 2704          	jreq	L522
 659  005a 4f            	clr	a
 662  005b 5b01          	addw	sp,#1
 663  005d 81            	ret
 664  005e               L522:
 665                     ; 146 			MT.Key_A=1;
 667  005e 35010008      	mov	_MT+8,#1
 668  0062               L702:
 669                     ; 149 	if(GPIO_ReadInputPin(KEY_PORT,KEY_B)){	//按键动作
 671  0062 4b20          	push	#32
 672  0064 ae5005        	ldw	x,#20485
 673  0067 cd0000        	call	_GPIO_ReadInputPin
 675  006a 5b01          	addw	sp,#1
 676  006c 4d            	tnz	a
 677  006d 2738          	jreq	L502
 678                     ; 151 		pt_Keyscan_cnt=0;
 680  006f 3f08          	clr	_pt_Keyscan_cnt
 681                     ; 152 		PT_WAIT_UNTIL(&pt_Keyscan,pt_Keyscan_cnt>5);
 683  0071 ae0098        	ldw	x,#152
 684  0074 bf05          	ldw	_pt_Keyscan,x
 685  0076               L161:
 689  0076 b608          	ld	a,_pt_Keyscan_cnt
 690  0078 a106          	cp	a,#6
 691  007a 2404          	jruge	L532
 694  007c 4f            	clr	a
 697  007d 5b01          	addw	sp,#1
 698  007f 81            	ret
 699  0080               L532:
 700                     ; 153 		if(GPIO_ReadInputPin(KEY_PORT,KEY_B)){
 702  0080 4b20          	push	#32
 703  0082 ae5005        	ldw	x,#20485
 704  0085 cd0000        	call	_GPIO_ReadInputPin
 706  0088 5b01          	addw	sp,#1
 707  008a 4d            	tnz	a
 708  008b 271a          	jreq	L502
 709                     ; 154 			PT_WAIT_UNTIL(&pt_Keyscan,GPIO_ReadInputPin(KEY_PORT,KEY_B)==0);	//等待按键释放
 711  008d ae009a        	ldw	x,#154
 712  0090 bf05          	ldw	_pt_Keyscan,x
 713  0092               L361:
 717  0092 4b20          	push	#32
 718  0094 ae5005        	ldw	x,#20485
 719  0097 cd0000        	call	_GPIO_ReadInputPin
 721  009a 5b01          	addw	sp,#1
 722  009c 4d            	tnz	a
 723  009d 2704          	jreq	L542
 726  009f 4f            	clr	a
 729  00a0 5b01          	addw	sp,#1
 730  00a2 81            	ret
 731  00a3               L542:
 732                     ; 155 			MT.Key_B=1;
 734  00a3 35010009      	mov	_MT+9,#1
 735  00a7               L502:
 736                     ; 159 	PT_END(&pt_Keyscan);
 741  00a7 5f            	clrw	x
 742  00a8 bf05          	ldw	_pt_Keyscan,x
 746  00aa a602          	ld	a,#2
 749  00ac 5b01          	addw	sp,#1
 750  00ae 81            	ret
 776                     ; 162 void MT_Control(void)
 776                     ; 163 {
 777                     .text:	section	.text,new
 778  0000               _MT_Control:
 782                     ; 164 	if(MT.Key_A&&(MT.Sensor_OA_A==0)){	//正向满足运行条件
 784  0000 3d08          	tnz	_MT+8
 785  0002 271a          	jreq	L752
 787  0004 3d05          	tnz	_MT+5
 788  0006 2616          	jrne	L752
 789                     ; 165 		MT.Key_A=0;	//清除按键指令	
 791  0008 3f08          	clr	_MT+8
 792                     ; 166 		if(MT.status==MT_STOPPED){				//停止状态可以直接启动
 794  000a 3d00          	tnz	_MT
 795  000c 260b          	jrne	L162
 796                     ; 167 			Motor_Start(MOTOR_FORWARD);
 798  000e a601          	ld	a,#1
 799  0010 cd0000        	call	_Motor_Start
 801                     ; 168 			MT.status=MT_RUNNING_FORWARD;		//更新运行状态
 803  0013 35010000      	mov	_MT,#1
 805  0017 2005          	jra	L752
 806  0019               L162:
 807                     ; 170 			Motor_Stop();
 809  0019 cd0000        	call	_Motor_Stop
 811                     ; 171 			MT.status=MT_STOPPED;						//更新运行状态
 813  001c 3f00          	clr	_MT
 814  001e               L752:
 815                     ; 175 	if(MT.Key_B&&(MT.Sensor_OA_B==0)){	//反向满足运行条件
 817  001e 3d09          	tnz	_MT+9
 818  0020 2719          	jreq	L562
 820  0022 3d06          	tnz	_MT+6
 821  0024 2615          	jrne	L562
 822                     ; 176 		MT.Key_B=0;	//清除按键指令	
 824  0026 3f09          	clr	_MT+9
 825                     ; 177 		if(MT.status==MT_STOPPED){				//停止状态可以直接启动
 827  0028 3d00          	tnz	_MT
 828  002a 260a          	jrne	L762
 829                     ; 178 			Motor_Start(MOTOR_BACKWARD);
 831  002c 4f            	clr	a
 832  002d cd0000        	call	_Motor_Start
 834                     ; 179 			MT.status=MT_RUNNING_BACKWARD;		//更新运行状态
 836  0030 35110000      	mov	_MT,#17
 838  0034 2005          	jra	L562
 839  0036               L762:
 840                     ; 181 			Motor_Stop();
 842  0036 cd0000        	call	_Motor_Stop
 844                     ; 182 			MT.status=MT_STOPPED;						//更新运行状态
 846  0039 3f00          	clr	_MT
 847  003b               L562:
 848                     ; 186 	if((MT.status==MT_RUNNING_FORWARD)&&(MT.Sensor_OA_A==1))	//正向急停
 850  003b b600          	ld	a,_MT
 851  003d a101          	cp	a,#1
 852  003f 260b          	jrne	L372
 854  0041 b605          	ld	a,_MT+5
 855  0043 a101          	cp	a,#1
 856  0045 2605          	jrne	L372
 857                     ; 188 		Motor_Stop();
 859  0047 cd0000        	call	_Motor_Stop
 861                     ; 189 		MT.status=MT_STOPPED;						//更新运行状态
 863  004a 3f00          	clr	_MT
 864  004c               L372:
 865                     ; 191 	if((MT.status==MT_RUNNING_BACKWARD)&&(MT.Sensor_OA_B==1))	//反向急停
 867  004c b600          	ld	a,_MT
 868  004e a111          	cp	a,#17
 869  0050 260b          	jrne	L572
 871  0052 b606          	ld	a,_MT+6
 872  0054 a101          	cp	a,#1
 873  0056 2605          	jrne	L572
 874                     ; 193 		Motor_Stop();
 876  0058 cd0000        	call	_Motor_Stop
 878                     ; 194 		MT.status=MT_STOPPED;						//更新运行状态
 880  005b 3f00          	clr	_MT
 881  005d               L572:
 882                     ; 198 }
 885  005d 81            	ret
 923                     ; 199 PT_THREAD(Alarm_Speaker(void))
 923                     ; 200 {
 924                     .text:	section	.text,new
 925  0000               _Alarm_Speaker:
 927  0000 88            	push	a
 928       00000001      OFST:	set	1
 931                     ; 201 	PT_BEGIN(&pt_Alarm_Speaker);
 935  0001 be03          	ldw	x,_pt_Alarm_Speaker
 937                     ; 209 	GPIO_WriteHigh(ALARM_PORT,ALARM);
 938  0003 5d            	tnzw	x
 939  0004 270c          	jreq	L772
 940  0006 1d00cc        	subw	x,#204
 941  0009 270e          	jreq	L103
 942  000b 1d0004        	subw	x,#4
 943  000e 2723          	jreq	L303
 944  0010 2034          	jra	L523
 945  0012               L772:
 946                     ; 203 	pt_Alarm_Speaker_cnt=0;
 949  0012 3f07          	clr	_pt_Alarm_Speaker_cnt
 950                     ; 204 	PT_WAIT_UNTIL(&pt_Alarm_Speaker,pt_Alarm_Speaker_cnt>30);
 952  0014 ae00cc        	ldw	x,#204
 953  0017 bf03          	ldw	_pt_Alarm_Speaker,x
 954  0019               L103:
 958  0019 b607          	ld	a,_pt_Alarm_Speaker_cnt
 959  001b a11f          	cp	a,#31
 960  001d 2404          	jruge	L333
 963  001f 4f            	clr	a
 966  0020 5b01          	addw	sp,#1
 967  0022 81            	ret
 968  0023               L333:
 969                     ; 205 	GPIO_WriteLow(ALARM_PORT,ALARM);
 971  0023 4b10          	push	#16
 972  0025 ae500f        	ldw	x,#20495
 973  0028 cd0000        	call	_GPIO_WriteLow
 975  002b 84            	pop	a
 976                     ; 207 	pt_Alarm_Speaker_cnt=0;
 978  002c 3f07          	clr	_pt_Alarm_Speaker_cnt
 979                     ; 208 	PT_WAIT_UNTIL(&pt_Alarm_Speaker,pt_Alarm_Speaker_cnt>50);
 981  002e ae00d0        	ldw	x,#208
 982  0031 bf03          	ldw	_pt_Alarm_Speaker,x
 983  0033               L303:
 987  0033 b607          	ld	a,_pt_Alarm_Speaker_cnt
 988  0035 a133          	cp	a,#51
 989  0037 2404          	jruge	L143
 992  0039 4f            	clr	a
 995  003a 5b01          	addw	sp,#1
 996  003c 81            	ret
 997  003d               L143:
 998                     ; 209 	GPIO_WriteHigh(ALARM_PORT,ALARM);
1000  003d 4b10          	push	#16
1001  003f ae500f        	ldw	x,#20495
1002  0042 cd0000        	call	_GPIO_WriteHigh
1004  0045 84            	pop	a
1005  0046               L523:
1006                     ; 211 	PT_END(&pt_Alarm_Speaker);
1011  0046 5f            	clrw	x
1012  0047 bf03          	ldw	_pt_Alarm_Speaker,x
1016  0049 a602          	ld	a,#2
1019  004b 5b01          	addw	sp,#1
1020  004d 81            	ret
1046                     ; 216 void Alarm(void)
1046                     ; 217 {
1047                     .text:	section	.text,new
1048  0000               _Alarm:
1052                     ; 218 	if(MT.status&0x01)	//if running
1054  0000 b600          	ld	a,_MT
1055  0002 a501          	bcp	a,#1
1056  0004 2705          	jreq	L353
1057                     ; 220 		Alarm_Speaker();
1059  0006 cd0000        	call	_Alarm_Speaker
1062  0009 2009          	jra	L553
1063  000b               L353:
1064                     ; 222 		GPIO_WriteHigh(ALARM_PORT,ALARM);
1066  000b 4b10          	push	#16
1067  000d ae500f        	ldw	x,#20495
1068  0010 cd0000        	call	_GPIO_WriteHigh
1070  0013 84            	pop	a
1071  0014               L553:
1072                     ; 224 }
1075  0014 81            	ret
1274                     	xdef	_Alarm_Speaker
1275                     	xdef	_MT
1276                     	switch	.ubsct
1277  0000               _pt_Alarm_Light_cnt:
1278  0000 00            	ds.b	1
1279                     	xdef	_pt_Alarm_Light_cnt
1280  0001               _pt_Alarm_Light:
1281  0001 0000          	ds.b	2
1282                     	xdef	_pt_Alarm_Light
1283  0003               _pt_Alarm_Speaker:
1284  0003 0000          	ds.b	2
1285                     	xdef	_pt_Alarm_Speaker
1286  0005               _pt_Keyscan:
1287  0005 0000          	ds.b	2
1288                     	xdef	_pt_Keyscan
1289                     	xdef	_Alarm
1290                     	xdef	_MT_Control
1291                     	xdef	_Key_Scan
1292                     	xdef	_Sensor_OA_Scan
1293                     	xdef	_Motor_Stop
1294                     	xdef	_Motor_Start
1295                     	xdef	_Motor_Init
1296  0007               _pt_Alarm_Speaker_cnt:
1297  0007 00            	ds.b	1
1298                     	xdef	_pt_Alarm_Speaker_cnt
1299  0008               _pt_Keyscan_cnt:
1300  0008 00            	ds.b	1
1301                     	xdef	_pt_Keyscan_cnt
1302                     	xref	_TIM1_CtrlPWMOutputs
1303                     	xref	_TIM1_Cmd
1304                     	xref	_GPIO_ReadInputPin
1305                     	xref	_GPIO_WriteLow
1306                     	xref	_GPIO_WriteHigh
1307                     	xref	_GPIO_Init
1327                     	end
