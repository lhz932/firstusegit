   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
  16                     	bsct
  17  0000               _MT:
  18  0000 00            	dc.b	0
  19  0001 000000000000  	ds.b	11
  20  000c               _Speed_Pulse_Status:
  21  000c 00            	dc.b	0
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
 263                     ; 97 	TIM1_CCxCmd(TIM1_CHANNEL_3,DISABLE);
 265  004f ae0200        	ldw	x,#512
 266  0052 cd0000        	call	_TIM1_CCxCmd
 268                     ; 99 	Obstacle_Avoidance_Sensor_Init();
 270  0055 ada9          	call	L3_Obstacle_Avoidance_Sensor_Init
 272                     ; 100 	Speed_Sensor_Init();
 274  0057 adb3          	call	L32_Speed_Sensor_Init
 276                     ; 101 	Key_Init();
 278  0059 adbd          	call	L53_Key_Init
 280                     ; 102 	Alarm_Init();
 282  005b adca          	call	L74_Alarm_Init
 284                     ; 104 	MT.status=MT_STOPPED;
 286  005d 35010000      	mov	_MT,#1
 287                     ; 105 	MT.last_status=MT_LAST_FORWARD;
 289  0061 35020001      	mov	_MT+1,#2
 290                     ; 109 }
 293  0065 81            	ret
 352                     ; 111 void Motor_Start(Motor_Direction_Typedef dir)
 352                     ; 112 {
 353                     	switch	.text
 354  0066               _Motor_Start:
 358                     ; 113 	if(dir){
 360  0066 4d            	tnz	a
 361  0067 2718          	jreq	L711
 362                     ; 114 		GPIO_WriteHigh(L298N_IN_PORT,L298N_IN1);
 364  0069 4b20          	push	#32
 365  006b ae500f        	ldw	x,#20495
 366  006e cd0000        	call	_GPIO_WriteHigh
 368  0071 84            	pop	a
 369                     ; 115 		GPIO_WriteLow(L298N_IN_PORT,L298N_IN2);
 371  0072 4b40          	push	#64
 372  0074 ae500f        	ldw	x,#20495
 373  0077 cd0000        	call	_GPIO_WriteLow
 375  007a 84            	pop	a
 376                     ; 119 		MT.status=MT_RUNNING_FORWARD;
 378  007b 35020000      	mov	_MT,#2
 380  007f 2016          	jra	L121
 381  0081               L711:
 382                     ; 121 		GPIO_WriteHigh(L298N_IN_PORT,L298N_IN2);
 384  0081 4b40          	push	#64
 385  0083 ae500f        	ldw	x,#20495
 386  0086 cd0000        	call	_GPIO_WriteHigh
 388  0089 84            	pop	a
 389                     ; 122 		GPIO_WriteLow(L298N_IN_PORT,L298N_IN1);
 391  008a 4b20          	push	#32
 392  008c ae500f        	ldw	x,#20495
 393  008f cd0000        	call	_GPIO_WriteLow
 395  0092 84            	pop	a
 396                     ; 126 		MT.status=MT_RUNNING_BACKWARD;
 398  0093 35040000      	mov	_MT,#4
 399  0097               L121:
 400                     ; 130 	TIM1_CCxCmd(TIM1_CHANNEL_3,ENABLE);
 402  0097 ae0201        	ldw	x,#513
 403  009a cd0000        	call	_TIM1_CCxCmd
 405                     ; 132 }
 408  009d 81            	ret
 434                     ; 133 void Motor_Stop(void)
 434                     ; 134 {
 435                     	switch	.text
 436  009e               _Motor_Stop:
 440                     ; 137 	TIM1_CCxCmd(TIM1_CHANNEL_3,DISABLE);
 442  009e ae0200        	ldw	x,#512
 443  00a1 cd0000        	call	_TIM1_CCxCmd
 445                     ; 139 	GPIO_WriteLow(L298N_IN_PORT,L298N_IN1);
 447  00a4 4b20          	push	#32
 448  00a6 ae500f        	ldw	x,#20495
 449  00a9 cd0000        	call	_GPIO_WriteLow
 451  00ac 84            	pop	a
 452                     ; 140 	GPIO_WriteLow(L298N_IN_PORT,L298N_IN2);
 454  00ad 4b40          	push	#64
 455  00af ae500f        	ldw	x,#20495
 456  00b2 cd0000        	call	_GPIO_WriteLow
 458  00b5 84            	pop	a
 459                     ; 142 	if(MT.status==MT_RUNNING_FORWARD){
 461  00b6 b600          	ld	a,_MT
 462  00b8 a102          	cp	a,#2
 463  00ba 2606          	jrne	L331
 464                     ; 143 		MT.last_status=MT_LAST_FORWARD;
 466  00bc 35020001      	mov	_MT+1,#2
 468  00c0 200a          	jra	L531
 469  00c2               L331:
 470                     ; 144 	}else if(MT.status==MT_RUNNING_BACKWARD){
 472  00c2 b600          	ld	a,_MT
 473  00c4 a104          	cp	a,#4
 474  00c6 2604          	jrne	L531
 475                     ; 145 		MT.last_status=MT_LAST_BACKWARD;
 477  00c8 35040001      	mov	_MT+1,#4
 478  00cc               L531:
 479                     ; 147 	MT.status=MT_STOPPED;	
 481  00cc 35010000      	mov	_MT,#1
 482                     ; 148 }
 485  00d0 81            	ret
 510                     ; 151 void Sensor_OA_Scan(void)
 510                     ; 152 {
 511                     	switch	.text
 512  00d1               _Sensor_OA_Scan:
 516                     ; 153 	if(GPIO_ReadInputPin(OBSTACLE_AVOIDANCE_SENSOR_PORT,OBSTACLE_AVOIDANCE_SENSOR_A)){	//
 518  00d1 4b02          	push	#2
 519  00d3 ae5000        	ldw	x,#20480
 520  00d6 cd0000        	call	_GPIO_ReadInputPin
 522  00d9 5b01          	addw	sp,#1
 523  00db 4d            	tnz	a
 524  00dc 2704          	jreq	L151
 525                     ; 154 		MT.Sensor_OA_A=0;	
 527  00de 3f06          	clr	_MT+6
 529  00e0 2004          	jra	L351
 530  00e2               L151:
 531                     ; 156 		MT.Sensor_OA_A=1;
 533  00e2 35010006      	mov	_MT+6,#1
 534  00e6               L351:
 535                     ; 158 	if(GPIO_ReadInputPin(OBSTACLE_AVOIDANCE_SENSOR_PORT,OBSTACLE_AVOIDANCE_SENSOR_B)){	//
 537  00e6 4b04          	push	#4
 538  00e8 ae5000        	ldw	x,#20480
 539  00eb cd0000        	call	_GPIO_ReadInputPin
 541  00ee 5b01          	addw	sp,#1
 542  00f0 4d            	tnz	a
 543  00f1 2704          	jreq	L551
 544                     ; 159 		MT.Sensor_OA_B=0;	
 546  00f3 3f07          	clr	_MT+7
 548  00f5 2004          	jra	L751
 549  00f7               L551:
 550                     ; 161 		MT.Sensor_OA_B=1;
 552  00f7 35010007      	mov	_MT+7,#1
 553  00fb               L751:
 554                     ; 163 }
 557  00fb 81            	ret
 595                     ; 166 PT_THREAD(Key_Scan(void))
 595                     ; 167 {
 596                     	switch	.text
 597  00fc               _Key_Scan:
 599  00fc 88            	push	a
 600       00000001      OFST:	set	1
 603                     ; 168 	PT_BEGIN(&pt_Keyscan);
 607  00fd be05          	ldw	x,_pt_Keyscan
 609                     ; 185 			MT.Key_B=1;
 610  00ff 5d            	tnzw	x
 611  0100 2717          	jreq	L161
 612  0102 1d00ad        	subw	x,#173
 613  0105 2726          	jreq	L361
 614  0107 1d0002        	subw	x,#2
 615  010a 273d          	jreq	L561
 616  010c 1d0007        	subw	x,#7
 617  010f 2761          	jreq	L761
 618  0111 1d0002        	subw	x,#2
 619  0114 2778          	jreq	L171
 620  0116 cc01a3        	jra	L312
 621  0119               L161:
 622                     ; 170 	if(GPIO_ReadInputPin(KEY_PORT,KEY_A)){	//按键动作
 625  0119 4b10          	push	#16
 626  011b ae5005        	ldw	x,#20485
 627  011e cd0000        	call	_GPIO_ReadInputPin
 629  0121 5b01          	addw	sp,#1
 630  0123 4d            	tnz	a
 631  0124 2738          	jreq	L512
 632                     ; 172 		pt_Keyscan_cnt=0;
 634  0126 3f0c          	clr	_pt_Keyscan_cnt
 635                     ; 173 		PT_WAIT_UNTIL(&pt_Keyscan,pt_Keyscan_cnt>5);
 637  0128 ae00ad        	ldw	x,#173
 638  012b bf05          	ldw	_pt_Keyscan,x
 639  012d               L361:
 643  012d b60c          	ld	a,_pt_Keyscan_cnt
 644  012f a106          	cp	a,#6
 645  0131 2404          	jruge	L322
 648  0133 4f            	clr	a
 651  0134 5b01          	addw	sp,#1
 652  0136 81            	ret
 653  0137               L322:
 654                     ; 174 		if(GPIO_ReadInputPin(KEY_PORT,KEY_A)){	//有效的按键动作
 656  0137 4b10          	push	#16
 657  0139 ae5005        	ldw	x,#20485
 658  013c cd0000        	call	_GPIO_ReadInputPin
 660  013f 5b01          	addw	sp,#1
 661  0141 4d            	tnz	a
 662  0142 271a          	jreq	L512
 663                     ; 175 			PT_WAIT_UNTIL(&pt_Keyscan,GPIO_ReadInputPin(KEY_PORT,KEY_A)==0);	//等待按键释放
 665  0144 ae00af        	ldw	x,#175
 666  0147 bf05          	ldw	_pt_Keyscan,x
 667  0149               L561:
 671  0149 4b10          	push	#16
 672  014b ae5005        	ldw	x,#20485
 673  014e cd0000        	call	_GPIO_ReadInputPin
 675  0151 5b01          	addw	sp,#1
 676  0153 4d            	tnz	a
 677  0154 2704          	jreq	L332
 680  0156 4f            	clr	a
 683  0157 5b01          	addw	sp,#1
 684  0159 81            	ret
 685  015a               L332:
 686                     ; 176 			MT.Key_A=1;
 688  015a 35010009      	mov	_MT+9,#1
 689  015e               L512:
 690                     ; 179 	if(GPIO_ReadInputPin(KEY_PORT,KEY_B)){	//按键动作
 692  015e 4b20          	push	#32
 693  0160 ae5005        	ldw	x,#20485
 694  0163 cd0000        	call	_GPIO_ReadInputPin
 696  0166 5b01          	addw	sp,#1
 697  0168 4d            	tnz	a
 698  0169 2738          	jreq	L312
 699                     ; 181 		pt_Keyscan_cnt=0;
 701  016b 3f0c          	clr	_pt_Keyscan_cnt
 702                     ; 182 		PT_WAIT_UNTIL(&pt_Keyscan,pt_Keyscan_cnt>5);
 704  016d ae00b6        	ldw	x,#182
 705  0170 bf05          	ldw	_pt_Keyscan,x
 706  0172               L761:
 710  0172 b60c          	ld	a,_pt_Keyscan_cnt
 711  0174 a106          	cp	a,#6
 712  0176 2404          	jruge	L342
 715  0178 4f            	clr	a
 718  0179 5b01          	addw	sp,#1
 719  017b 81            	ret
 720  017c               L342:
 721                     ; 183 		if(GPIO_ReadInputPin(KEY_PORT,KEY_B)){
 723  017c 4b20          	push	#32
 724  017e ae5005        	ldw	x,#20485
 725  0181 cd0000        	call	_GPIO_ReadInputPin
 727  0184 5b01          	addw	sp,#1
 728  0186 4d            	tnz	a
 729  0187 271a          	jreq	L312
 730                     ; 184 			PT_WAIT_UNTIL(&pt_Keyscan,GPIO_ReadInputPin(KEY_PORT,KEY_B)==0);	//等待按键释放
 732  0189 ae00b8        	ldw	x,#184
 733  018c bf05          	ldw	_pt_Keyscan,x
 734  018e               L171:
 738  018e 4b20          	push	#32
 739  0190 ae5005        	ldw	x,#20485
 740  0193 cd0000        	call	_GPIO_ReadInputPin
 742  0196 5b01          	addw	sp,#1
 743  0198 4d            	tnz	a
 744  0199 2704          	jreq	L352
 747  019b 4f            	clr	a
 750  019c 5b01          	addw	sp,#1
 751  019e 81            	ret
 752  019f               L352:
 753                     ; 185 			MT.Key_B=1;
 755  019f 3501000a      	mov	_MT+10,#1
 756  01a3               L312:
 757                     ; 189 	PT_END(&pt_Keyscan);
 762  01a3 5f            	clrw	x
 763  01a4 bf05          	ldw	_pt_Keyscan,x
 767  01a6 a602          	ld	a,#2
 770  01a8 5b01          	addw	sp,#1
 771  01aa 81            	ret
 809                     ; 196 PT_THREAD(Alarm_Speaker(void))
 809                     ; 197 {
 810                     	switch	.text
 811  01ab               _Alarm_Speaker:
 813  01ab 88            	push	a
 814       00000001      OFST:	set	1
 817                     ; 198 	PT_BEGIN(&pt_Alarm_Speaker);
 821  01ac be03          	ldw	x,_pt_Alarm_Speaker
 823                     ; 206 	GPIO_WriteHigh(ALARM_PORT,ALARM);
 824  01ae 5d            	tnzw	x
 825  01af 270c          	jreq	L552
 826  01b1 1d00c9        	subw	x,#201
 827  01b4 270e          	jreq	L752
 828  01b6 1d0004        	subw	x,#4
 829  01b9 2723          	jreq	L162
 830  01bb 2034          	jra	L303
 831  01bd               L552:
 832                     ; 200 	pt_Alarm_Speaker_cnt=0;
 835  01bd 3f0b          	clr	_pt_Alarm_Speaker_cnt
 836                     ; 201 	PT_WAIT_UNTIL(&pt_Alarm_Speaker,pt_Alarm_Speaker_cnt>30);
 838  01bf ae00c9        	ldw	x,#201
 839  01c2 bf03          	ldw	_pt_Alarm_Speaker,x
 840  01c4               L752:
 844  01c4 b60b          	ld	a,_pt_Alarm_Speaker_cnt
 845  01c6 a11f          	cp	a,#31
 846  01c8 2404          	jruge	L113
 849  01ca 4f            	clr	a
 852  01cb 5b01          	addw	sp,#1
 853  01cd 81            	ret
 854  01ce               L113:
 855                     ; 202 	GPIO_WriteLow(ALARM_PORT,ALARM);
 857  01ce 4b10          	push	#16
 858  01d0 ae500f        	ldw	x,#20495
 859  01d3 cd0000        	call	_GPIO_WriteLow
 861  01d6 84            	pop	a
 862                     ; 204 	pt_Alarm_Speaker_cnt=0;
 864  01d7 3f0b          	clr	_pt_Alarm_Speaker_cnt
 865                     ; 205 	PT_WAIT_UNTIL(&pt_Alarm_Speaker,pt_Alarm_Speaker_cnt>50);
 867  01d9 ae00cd        	ldw	x,#205
 868  01dc bf03          	ldw	_pt_Alarm_Speaker,x
 869  01de               L162:
 873  01de b60b          	ld	a,_pt_Alarm_Speaker_cnt
 874  01e0 a133          	cp	a,#51
 875  01e2 2404          	jruge	L713
 878  01e4 4f            	clr	a
 881  01e5 5b01          	addw	sp,#1
 882  01e7 81            	ret
 883  01e8               L713:
 884                     ; 206 	GPIO_WriteHigh(ALARM_PORT,ALARM);
 886  01e8 4b10          	push	#16
 887  01ea ae500f        	ldw	x,#20495
 888  01ed cd0000        	call	_GPIO_WriteHigh
 890  01f0 84            	pop	a
 891  01f1               L303:
 892                     ; 208 	PT_END(&pt_Alarm_Speaker);
 897  01f1 5f            	clrw	x
 898  01f2 bf03          	ldw	_pt_Alarm_Speaker,x
 902  01f4 a602          	ld	a,#2
 905  01f6 5b01          	addw	sp,#1
 906  01f8 81            	ret
 932                     ; 214 void Alarm(void)
 932                     ; 215 {
 933                     	switch	.text
 934  01f9               _Alarm:
 938                     ; 216 	if((MT.status==MT_RUNNING_FORWARD)||(MT.status==MT_RUNNING_BACKWARD))	//if running
 940  01f9 b600          	ld	a,_MT
 941  01fb a102          	cp	a,#2
 942  01fd 2706          	jreq	L333
 944  01ff b600          	ld	a,_MT
 945  0201 a104          	cp	a,#4
 946  0203 2603          	jrne	L133
 947  0205               L333:
 948                     ; 218 		Alarm_Speaker();
 950  0205 ada4          	call	_Alarm_Speaker
 953  0207               L533:
 954                     ; 222 }
 957  0207 81            	ret
 958  0208               L133:
 959                     ; 220 		GPIO_WriteHigh(ALARM_PORT,ALARM);
 961  0208 4b10          	push	#16
 962  020a ae500f        	ldw	x,#20495
 963  020d cd0000        	call	_GPIO_WriteHigh
 965  0210 84            	pop	a
 966  0211 20f4          	jra	L533
1005                     ; 224 static void MT_Speed_Set(void)
1005                     ; 225 {
1006                     	switch	.text
1007  0213               L733_MT_Speed_Set:
1009  0213 88            	push	a
1010       00000001      OFST:	set	1
1013                     ; 227 	if(IR_GetCode(&code)==0){
1015  0214 96            	ldw	x,sp
1016  0215 1c0001        	addw	x,#OFST+0
1017  0218 cd0000        	call	_IR_GetCode
1019  021b 4d            	tnz	a
1020  021c 2703          	jreq	L04
1021  021e cc02b4        	jp	L304
1022  0221               L04:
1023                     ; 228 		switch(code){
1025  0221 7b01          	ld	a,(OFST+0,sp)
1027                     ; 253 			default:	break;
1028  0223 a03d          	sub	a,#61
1029  0225 2752          	jreq	L553
1030  0227 a048          	sub	a,#72
1031  0229 2736          	jreq	L743
1032  022b a012          	sub	a,#18
1033  022d 271a          	jreq	L143
1034  022f a030          	sub	a,#48
1035  0231 273e          	jreq	L353
1036  0233 a008          	sub	a,#8
1037  0235 271a          	jreq	L343
1038  0237 a00e          	sub	a,#14
1039  0239 2762          	jreq	L753
1040  023b a00a          	sub	a,#10
1041  023d 271a          	jreq	L543
1042  023f a008          	sub	a,#8
1043  0241 2726          	jreq	L153
1044  0243 a00e          	sub	a,#14
1045  0245 2762          	jreq	L163
1046  0247 206b          	jra	L304
1047  0249               L143:
1048                     ; 229 			case IR_0:	TIM1_SetCompare3(135);break;
1050  0249 ae0087        	ldw	x,#135
1051  024c cd0000        	call	_TIM1_SetCompare3
1055  024f 2063          	jra	L304
1056  0251               L343:
1057                     ; 230 			case IR_1:	TIM1_SetCompare3(145);break;
1059  0251 ae0091        	ldw	x,#145
1060  0254 cd0000        	call	_TIM1_SetCompare3
1064  0257 205b          	jra	L304
1065  0259               L543:
1066                     ; 231 			case IR_2:	TIM1_SetCompare3(155);break;
1068  0259 ae009b        	ldw	x,#155
1069  025c cd0000        	call	_TIM1_SetCompare3
1073  025f 2053          	jra	L304
1074  0261               L743:
1075                     ; 232 			case IR_3:	TIM1_SetCompare3(170);break;
1077  0261 ae00aa        	ldw	x,#170
1078  0264 cd0000        	call	_TIM1_SetCompare3
1082  0267 204b          	jra	L304
1083  0269               L153:
1084                     ; 233 			case IR_4:	TIM1_SetCompare3(185);break;
1086  0269 ae00b9        	ldw	x,#185
1087  026c cd0000        	call	_TIM1_SetCompare3
1091  026f 2043          	jra	L304
1092  0271               L353:
1093                     ; 234 			case IR_5:	TIM1_SetCompare3(200);break;
1095  0271 ae00c8        	ldw	x,#200
1096  0274 cd0000        	call	_TIM1_SetCompare3
1100  0277 203b          	jra	L304
1101  0279               L553:
1102                     ; 235 			case IR_PLAY_PAUSE:	if(MT.status==MT_STOPPED){
1104  0279 b600          	ld	a,_MT
1105  027b a101          	cp	a,#1
1106  027d 2619          	jrne	L114
1107                     ; 236 														if(MT.last_status==MT_LAST_FORWARD){
1109  027f b601          	ld	a,_MT+1
1110  0281 a102          	cp	a,#2
1111  0283 2607          	jrne	L314
1112                     ; 237 															Motor_Start(MOTOR_FORWARD);
1114  0285 a601          	ld	a,#1
1115  0287 cd0066        	call	_Motor_Start
1118  028a 2028          	jra	L304
1119  028c               L314:
1120                     ; 238 														}else if(MT.last_status==MT_LAST_BACKWARD){
1122  028c b601          	ld	a,_MT+1
1123  028e a104          	cp	a,#4
1124  0290 2622          	jrne	L304
1125                     ; 239 															Motor_Start(MOTOR_BACKWARD);
1127  0292 4f            	clr	a
1128  0293 cd0066        	call	_Motor_Start
1130  0296 201c          	jra	L304
1131  0298               L114:
1132                     ; 242 														Motor_Stop();
1134  0298 cd009e        	call	_Motor_Stop
1136  029b 2017          	jra	L304
1137  029d               L753:
1138                     ; 245 			case IR_PREV:	if(MT.status==MT_STOPPED){
1140  029d b600          	ld	a,_MT
1141  029f a101          	cp	a,#1
1142  02a1 2611          	jrne	L304
1143                     ; 246 											Motor_Start(MOTOR_BACKWARD);
1145  02a3 4f            	clr	a
1146  02a4 cd0066        	call	_Motor_Start
1148  02a7 200b          	jra	L304
1149  02a9               L163:
1150                     ; 249 			case IR_NEXT:	if(MT.status==MT_STOPPED){
1152  02a9 b600          	ld	a,_MT
1153  02ab a101          	cp	a,#1
1154  02ad 2605          	jrne	L304
1155                     ; 250 											Motor_Start(MOTOR_FORWARD);
1157  02af a601          	ld	a,#1
1158  02b1 cd0066        	call	_Motor_Start
1160  02b4               L363:
1161                     ; 253 			default:	break;
1163  02b4               L704:
1164  02b4               L304:
1165                     ; 256 }
1168  02b4 84            	pop	a
1169  02b5 81            	ret
1196                     ; 258 void MT_Control(void)
1196                     ; 259 {
1197                     	switch	.text
1198  02b6               _MT_Control:
1202                     ; 260 	MT_Speed_Set();
1204  02b6 cd0213        	call	L733_MT_Speed_Set
1206                     ; 261 	if(MT.Key_A&&(MT.Sensor_OA_A==0)){	//正向满足运行条件
1208  02b9 3d09          	tnz	_MT+9
1209  02bb 2716          	jreq	L734
1211  02bd 3d06          	tnz	_MT+6
1212  02bf 2612          	jrne	L734
1213                     ; 262 		MT.Key_A=0;	//清除按键指令	
1215  02c1 3f09          	clr	_MT+9
1216                     ; 263 		if(MT.status==MT_STOPPED){				//停止状态可以直接启动
1218  02c3 b600          	ld	a,_MT
1219  02c5 a101          	cp	a,#1
1220  02c7 2607          	jrne	L144
1221                     ; 264 			Motor_Start(MOTOR_FORWARD);
1223  02c9 a601          	ld	a,#1
1224  02cb cd0066        	call	_Motor_Start
1227  02ce 2003          	jra	L734
1228  02d0               L144:
1229                     ; 267 			Motor_Stop();
1231  02d0 cd009e        	call	_Motor_Stop
1233  02d3               L734:
1234                     ; 272 	if(MT.Key_B&&(MT.Sensor_OA_B==0)){	//反向满足运行条件
1236  02d3 3d0a          	tnz	_MT+10
1237  02d5 2715          	jreq	L544
1239  02d7 3d07          	tnz	_MT+7
1240  02d9 2611          	jrne	L544
1241                     ; 273 		MT.Key_B=0;	//清除按键指令	
1243  02db 3f0a          	clr	_MT+10
1244                     ; 274 		if(MT.status==MT_STOPPED){				//停止状态可以直接启动
1246  02dd b600          	ld	a,_MT
1247  02df a101          	cp	a,#1
1248  02e1 2606          	jrne	L744
1249                     ; 275 			Motor_Start(MOTOR_BACKWARD);
1251  02e3 4f            	clr	a
1252  02e4 cd0066        	call	_Motor_Start
1255  02e7 2003          	jra	L544
1256  02e9               L744:
1257                     ; 278 			Motor_Stop();
1259  02e9 cd009e        	call	_Motor_Stop
1261  02ec               L544:
1262                     ; 283 	if((MT.status==MT_RUNNING_FORWARD)&&(MT.Sensor_OA_A==1))	//正向急停
1264  02ec b600          	ld	a,_MT
1265  02ee a102          	cp	a,#2
1266  02f0 2609          	jrne	L354
1268  02f2 b606          	ld	a,_MT+6
1269  02f4 a101          	cp	a,#1
1270  02f6 2603          	jrne	L354
1271                     ; 285 		Motor_Stop();
1273  02f8 cd009e        	call	_Motor_Stop
1275  02fb               L354:
1276                     ; 288 	if((MT.status==MT_RUNNING_BACKWARD)&&(MT.Sensor_OA_B==1))	//反向急停
1278  02fb b600          	ld	a,_MT
1279  02fd a104          	cp	a,#4
1280  02ff 2609          	jrne	L554
1282  0301 b607          	ld	a,_MT+7
1283  0303 a101          	cp	a,#1
1284  0305 2603          	jrne	L554
1285                     ; 290 		Motor_Stop();
1287  0307 cd009e        	call	_Motor_Stop
1289  030a               L554:
1290                     ; 295 }
1293  030a 81            	ret
1577                     	xdef	_Alarm_Speaker
1578                     	switch	.ubsct
1579  0000               _pt_Alarm_Light_cnt:
1580  0000 00            	ds.b	1
1581                     	xdef	_pt_Alarm_Light_cnt
1582  0001               _pt_Alarm_Light:
1583  0001 0000          	ds.b	2
1584                     	xdef	_pt_Alarm_Light
1585  0003               _pt_Alarm_Speaker:
1586  0003 0000          	ds.b	2
1587                     	xdef	_pt_Alarm_Speaker
1588  0005               _pt_Keyscan:
1589  0005 0000          	ds.b	2
1590                     	xdef	_pt_Keyscan
1591                     	xref	_IR_GetCode
1592                     	xdef	_Alarm
1593                     	xdef	_MT_Control
1594                     	xdef	_Key_Scan
1595                     	xdef	_Sensor_OA_Scan
1596                     	xdef	_Motor_Stop
1597                     	xdef	_Motor_Start
1598                     	xdef	_Motor_Init
1599  0007               _Speed_Pulse_cnt:
1600  0007 0000          	ds.b	2
1601                     	xdef	_Speed_Pulse_cnt
1602  0009               _Speed_Origin:
1603  0009 0000          	ds.b	2
1604                     	xdef	_Speed_Origin
1605                     	xdef	_Speed_Pulse_Status
1606  000b               _pt_Alarm_Speaker_cnt:
1607  000b 00            	ds.b	1
1608                     	xdef	_pt_Alarm_Speaker_cnt
1609  000c               _pt_Keyscan_cnt:
1610  000c 00            	ds.b	1
1611                     	xdef	_pt_Keyscan_cnt
1612                     	xdef	_MT
1613                     	xref	_TIM1_SetCompare3
1614                     	xref	_TIM1_CCxCmd
1615                     	xref	_GPIO_ReadInputPin
1616                     	xref	_GPIO_WriteLow
1617                     	xref	_GPIO_WriteHigh
1618                     	xref	_GPIO_Init
1638                     	end
