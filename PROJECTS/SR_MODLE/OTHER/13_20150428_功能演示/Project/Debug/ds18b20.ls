   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
  49                     ; 25 void Ds18b20_Init(void)
  49                     ; 26 {
  51                     	switch	.text
  52  0000               _Ds18b20_Init:
  56                     ; 27 	GPIO_Init(DS18B20_PORT,DS18B20_DATA,GPIO_MODE_IN_PU_NO_IT);	
  58  0000 4b40          	push	#64
  59  0002 4b10          	push	#16
  60  0004 ae500f        	ldw	x,#20495
  61  0007 cd0000        	call	_GPIO_Init
  63  000a 85            	popw	x
  64                     ; 28 }
  67  000b 81            	ret	
  98                     ; 33 uint8_t Ds18b20_Reset(void)
  98                     ; 34 {
  99                     	switch	.text
 100  000c               _Ds18b20_Reset:
 104                     ; 35 	disableInterrupts();	//禁用中断
 107  000c 9b            	sim	
 109                     ; 36 	DS18B20_MODE_OUT();		//推挽输出
 112  000d 72185011      	bset	20497,#4
 113                     ; 37 	GPIO_WriteLow(DS18B20_PORT,DS18B20_DATA);	//输出低电平
 115  0011 4b10          	push	#16
 116  0013 ae500f        	ldw	x,#20495
 117  0016 cd0000        	call	_GPIO_WriteLow
 119  0019 84            	pop	a
 120                     ; 38 	delay_10us(58);		//延时至少480us
 122  001a a63a          	ld	a,#58
 123  001c cd0000        	call	_delay_10us
 125                     ; 39 	GPIO_WriteHigh(DS18B20_PORT,DS18B20_DATA);	//输出高电平
 127  001f 4b10          	push	#16
 128  0021 ae500f        	ldw	x,#20495
 129  0024 cd0000        	call	_GPIO_WriteHigh
 131  0027 84            	pop	a
 132                     ; 40 	delay_10us(7);	//等待存在脉冲
 134  0028 a607          	ld	a,#7
 135  002a cd0000        	call	_delay_10us
 137                     ; 41 	DS18B20_MODE_IN();	//上拉输入
 139  002d 72195011      	bres	20497,#4
 140                     ; 42 	if(GPIO_ReadInputPin(DS18B20_PORT,DS18B20_DATA))	//没有存在脉冲
 142  0031 ad28          	call	LC002
 143  0033 2711          	jreq	L13
 144                     ; 44 		delay_10us(7);	//再等待一段时间
 146  0035 a607          	ld	a,#7
 147  0037 cd0000        	call	_delay_10us
 149                     ; 45 		if(GPIO_ReadInputPin(DS18B20_PORT,DS18B20_DATA))	//没有存在脉冲
 151  003a ad1f          	call	LC002
 152  003c 2704          	jreq	L33
 153                     ; 47 			enableInterrupts();
 156  003e 9a            	rim	
 158                     ; 48 			return 1;
 161  003f a601          	ld	a,#1
 164  0041 81            	ret	
 165  0042               L33:
 166                     ; 52 			delay_10us(58-7-7);
 168  0042 a62c          	ld	a,#44
 169  0044 2002          	jp	LC001
 170  0046               L13:
 171                     ; 61 		delay_10us(51);
 173  0046 a633          	ld	a,#51
 174  0048               LC001:
 175  0048 cd0000        	call	_delay_10us
 177                     ; 62 		GPIO_WriteHigh(DS18B20_PORT,DS18B20_DATA);	//输出高电平
 179  004b 4b10          	push	#16
 180  004d ae500f        	ldw	x,#20495
 181  0050 cd0000        	call	_GPIO_WriteHigh
 183  0053 72185011      	bset	20497,#4
 184  0057 9a            	rim	
 185  0058 84            	pop	a
 186                     ; 63 		DS18B20_MODE_OUT();		//推挽输出
 188                     ; 64 		enableInterrupts();		
 192                     ; 65 		return 0;
 195  0059 4f            	clr	a
 198  005a 81            	ret	
 199  005b               LC002:
 200  005b 4b10          	push	#16
 201  005d ae500f        	ldw	x,#20495
 202  0060 cd0000        	call	_GPIO_ReadInputPin
 204  0063 5b01          	addw	sp,#1
 205  0065 4d            	tnz	a
 206  0066 81            	ret	
 235                     ; 69 void Ds18b20_MasterWrite_0(void)
 235                     ; 70 {
 236                     	switch	.text
 237  0067               _Ds18b20_MasterWrite_0:
 241                     ; 71 	disableInterrupts();	//禁用中断
 244  0067 9b            	sim	
 246                     ; 72 	GPIO_WriteLow(DS18B20_PORT,DS18B20_DATA);	//输出低电平
 249  0068 4b10          	push	#16
 250  006a ae500f        	ldw	x,#20495
 251  006d cd0000        	call	_GPIO_WriteLow
 253  0070 84            	pop	a
 254                     ; 73 	delay_10us(7);
 256  0071 a607          	ld	a,#7
 257  0073 cd0000        	call	_delay_10us
 259                     ; 74 	GPIO_WriteHigh(DS18B20_PORT,DS18B20_DATA);	//输出高电平
 261  0076 4b10          	push	#16
 262  0078 ae500f        	ldw	x,#20495
 263  007b cd0000        	call	_GPIO_WriteHigh
 265  007e 9a            	rim	
 266  007f 84            	pop	a
 267                     ; 75 	enableInterrupts();	
 271                     ; 76 }
 275  0080 81            	ret	
 315                     ; 77 void Ds18b20_MasterWrite_1(void)
 315                     ; 78 {
 316                     	switch	.text
 317  0081               _Ds18b20_MasterWrite_1:
 319  0081 88            	push	a
 320       00000001      OFST:	set	1
 323                     ; 80 	disableInterrupts();	//禁用中断
 326  0082 9b            	sim	
 328                     ; 81 	GPIO_WriteLow(DS18B20_PORT,DS18B20_DATA);	//输出低电平
 331  0083 4b10          	push	#16
 332  0085 ae500f        	ldw	x,#20495
 333  0088 cd0000        	call	_GPIO_WriteLow
 335  008b 84            	pop	a
 336                     ; 83 	for(i=0;i<8;i++);	//延时至少1us
 338  008c 0f01          	clr	(OFST+0,sp)
 340  008e               L76:
 344  008e 0c01          	inc	(OFST+0,sp)
 348  0090 7b01          	ld	a,(OFST+0,sp)
 349  0092 a108          	cp	a,#8
 350  0094 25f8          	jrult	L76
 351                     ; 84 	GPIO_WriteHigh(DS18B20_PORT,DS18B20_DATA);	//输出高电平
 353  0096 4b10          	push	#16
 354  0098 ae500f        	ldw	x,#20495
 355  009b cd0000        	call	_GPIO_WriteHigh
 357  009e 9a            	rim	
 358  009f 84            	pop	a
 359                     ; 85 	enableInterrupts();
 363                     ; 86 	delay_10us(6);
 366  00a0 a606          	ld	a,#6
 367  00a2 cd0000        	call	_delay_10us
 369                     ; 87 }
 372  00a5 84            	pop	a
 373  00a6 81            	ret	
 414                     ; 89 uint8_t Ds18b20_MasterRead(void)
 414                     ; 90 {
 415                     	switch	.text
 416  00a7               _Ds18b20_MasterRead:
 418  00a7 88            	push	a
 419       00000001      OFST:	set	1
 422                     ; 92 	disableInterrupts();	//禁用中断
 425  00a8 9b            	sim	
 427                     ; 93 	GPIO_WriteLow(DS18B20_PORT,DS18B20_DATA);	//输出低电平
 430  00a9 4b10          	push	#16
 431  00ab ae500f        	ldw	x,#20495
 432  00ae cd0000        	call	_GPIO_WriteLow
 434  00b1 84            	pop	a
 435                     ; 95 	for(i=0;i<8;i++);	//延时至少1us
 437  00b2 0f01          	clr	(OFST+0,sp)
 439  00b4               L311:
 443  00b4 0c01          	inc	(OFST+0,sp)
 447  00b6 7b01          	ld	a,(OFST+0,sp)
 448  00b8 a108          	cp	a,#8
 449  00ba 25f8          	jrult	L311
 450                     ; 96 	GPIO_WriteHigh(DS18B20_PORT,DS18B20_DATA);	//输出高电平	
 452  00bc 4b10          	push	#16
 453  00be ae500f        	ldw	x,#20495
 454  00c1 cd0000        	call	_GPIO_WriteHigh
 456  00c4 84            	pop	a
 457                     ; 97 	for(i=0;i<3;i++);
 459  00c5 0f01          	clr	(OFST+0,sp)
 461  00c7               L121:
 465  00c7 0c01          	inc	(OFST+0,sp)
 469  00c9 7b01          	ld	a,(OFST+0,sp)
 470  00cb a103          	cp	a,#3
 471  00cd 25f8          	jrult	L121
 472                     ; 98 	DS18B20_MODE_IN();	//设置为输入	
 474  00cf 72195011      	bres	20497,#4
 475                     ; 99 	if(GPIO_ReadInputPin(DS18B20_PORT,DS18B20_DATA))
 477  00d3 4b10          	push	#16
 478  00d5 ae500f        	ldw	x,#20495
 479  00d8 cd0000        	call	_GPIO_ReadInputPin
 481  00db 5b01          	addw	sp,#1
 482  00dd 4d            	tnz	a
 483  00de 2707          	jreq	L721
 484                     ; 101 		enableInterrupts();		
 487  00e0 ad0b          	call	LC003
 489                     ; 104 		return 1;
 491  00e2 a601          	ld	a,#1
 494  00e4 5b01          	addw	sp,#1
 495  00e6 81            	ret	
 496  00e7               L721:
 497                     ; 107 		enableInterrupts();		
 500  00e7 ad04          	call	LC003
 502                     ; 110 		return 0;
 504  00e9 4f            	clr	a
 507  00ea 5b01          	addw	sp,#1
 508  00ec 81            	ret	
 509  00ed               LC003:
 510  00ed 9a            	rim	
 512                     ; 102 		DS18B20_MODE_OUT();		//推挽输出
 515  00ee 72185011      	bset	20497,#4
 516                     ; 103 		delay_10us(6);		
 518  00f2 a606          	ld	a,#6
 519  00f4 cc0000        	jp	_delay_10us
 565                     ; 114 void Ds18b20_MasterWriteOneByte(uint8_t data)
 565                     ; 115 {
 566                     	switch	.text
 567  00f7               _Ds18b20_MasterWriteOneByte:
 569  00f7 88            	push	a
 570  00f8 88            	push	a
 571       00000001      OFST:	set	1
 574                     ; 118 	for(i=0;i<8;i++)
 576  00f9 0f01          	clr	(OFST+0,sp)
 578  00fb               L551:
 579                     ; 120 		if(data&0x01)
 581  00fb 7b02          	ld	a,(OFST+1,sp)
 582  00fd a501          	bcp	a,#1
 583  00ff 2705          	jreq	L361
 584                     ; 121 			Ds18b20_MasterWrite_1();
 586  0101 cd0081        	call	_Ds18b20_MasterWrite_1
 589  0104 2003          	jra	L561
 590  0106               L361:
 591                     ; 123 			Ds18b20_MasterWrite_0();			
 593  0106 cd0067        	call	_Ds18b20_MasterWrite_0
 595  0109               L561:
 596                     ; 124 		data>>=1;
 598  0109 0402          	srl	(OFST+1,sp)
 599                     ; 118 	for(i=0;i<8;i++)
 601  010b 0c01          	inc	(OFST+0,sp)
 605  010d 7b01          	ld	a,(OFST+0,sp)
 606  010f a108          	cp	a,#8
 607  0111 25e8          	jrult	L551
 608                     ; 126 }
 611  0113 85            	popw	x
 612  0114 81            	ret	
 657                     ; 128 uint8_t Ds18b20_MasterReadOneByte(void)
 657                     ; 129 {
 658                     	switch	.text
 659  0115               _Ds18b20_MasterReadOneByte:
 661  0115 89            	pushw	x
 662       00000002      OFST:	set	2
 665                     ; 131 	m=0;
 667  0116 0f02          	clr	(OFST+0,sp)
 669                     ; 132 	for(i=0;i<8;i++)
 671  0118 0f01          	clr	(OFST-1,sp)
 673  011a               L112:
 674                     ; 134 			m>>=1;
 676  011a 0402          	srl	(OFST+0,sp)
 678                     ; 135 			if(Ds18b20_MasterRead())
 680  011c ad89          	call	_Ds18b20_MasterRead
 682  011e 4d            	tnz	a
 683  011f 2706          	jreq	L712
 684                     ; 136 				m|=0x80;			
 686  0121 7b02          	ld	a,(OFST+0,sp)
 687  0123 aa80          	or	a,#128
 688  0125 6b02          	ld	(OFST+0,sp),a
 690  0127               L712:
 691                     ; 132 	for(i=0;i<8;i++)
 693  0127 0c01          	inc	(OFST-1,sp)
 697  0129 7b01          	ld	a,(OFST-1,sp)
 698  012b a108          	cp	a,#8
 699  012d 25eb          	jrult	L112
 700                     ; 138 	return m;
 702  012f 7b02          	ld	a,(OFST+0,sp)
 705  0131 85            	popw	x
 706  0132 81            	ret	
 820                     ; 171 uint8_t Ds18b20_SearchROM(void)
 820                     ; 172 {
 821                     	switch	.text
 822  0133               _Ds18b20_SearchROM:
 824  0133 5218          	subw	sp,#24
 825       00000018      OFST:	set	24
 828                     ; 178 	for(i=0;i<8;i++)
 830  0135 0f17          	clr	(OFST-1,sp)
 832  0137               L113:
 833                     ; 180 		for(j=0;j<8;j++)
 835  0137 0f18          	clr	(OFST+0,sp)
 837  0139               L713:
 838                     ; 182 			ROM_Buf[i][j]=0;
 840  0139 7b17          	ld	a,(OFST-1,sp)
 841  013b 97            	ld	xl,a
 842  013c a608          	ld	a,#8
 843  013e 42            	mul	x,a
 844  013f 01            	rrwa	x,a
 845  0140 1b18          	add	a,(OFST+0,sp)
 846  0142 2401          	jrnc	L011
 847  0144 5c            	incw	x
 848  0145               L011:
 849  0145 02            	rlwa	x,a
 850  0146 6f00          	clr	(_ROM_Buf,x)
 851                     ; 180 		for(j=0;j<8;j++)
 853  0148 0c18          	inc	(OFST+0,sp)
 857  014a 7b18          	ld	a,(OFST+0,sp)
 858  014c a108          	cp	a,#8
 859  014e 25e9          	jrult	L713
 860                     ; 185 		ROM_Mark[i]=0;
 862  0150 96            	ldw	x,sp
 863  0151 cd03eb        	call	LC009
 864  0154 1b17          	add	a,(OFST-1,sp)
 865  0156 2401          	jrnc	L211
 866  0158 5c            	incw	x
 867  0159               L211:
 868  0159 02            	rlwa	x,a
 869  015a 7f            	clr	(x)
 870                     ; 178 	for(i=0;i<8;i++)
 872  015b 0c17          	inc	(OFST-1,sp)
 876  015d 7b17          	ld	a,(OFST-1,sp)
 877  015f a108          	cp	a,#8
 878  0161 25d4          	jrult	L113
 879                     ; 189 	m8=0;
 881                     ; 190 	Ds18b20_Reset();
 883  0163 cd000c        	call	_Ds18b20_Reset
 885                     ; 191 	Ds18b20_MasterWriteOneByte(SEARCH_ROM);	//发送SEARCH_ROM 命令	
 887  0166 a6f0          	ld	a,#240
 888  0168 ad8d          	call	_Ds18b20_MasterWriteOneByte
 890                     ; 193 	for(j=0;j<64;j++){
 892  016a 0f18          	clr	(OFST+0,sp)
 894  016c               L523:
 895                     ; 194 		m8=Ds18b20_MasterRead();	//读1bit 原码
 897  016c cd00a7        	call	_Ds18b20_MasterRead
 899  016f 48            	sll	a
 900  0170 6b14          	ld	(OFST-4,sp),a
 902                     ; 195 		m8<<=1;
 905                     ; 196 		m8|=Ds18b20_MasterRead();	//读1bit 补码
 907  0172 cd00a7        	call	_Ds18b20_MasterRead
 909  0175 1a14          	or	a,(OFST-4,sp)
 910  0177 6b14          	ld	(OFST-4,sp),a
 912                     ; 198 		zheng=(uint8_t)(j/8);
 914  0179 5f            	clrw	x
 915  017a 7b18          	ld	a,(OFST+0,sp)
 916  017c cd03e5        	call	LC008
 917  017f 6b15          	ld	(OFST-3,sp),a
 919                     ; 199 		yu=(uint8_t)(j%8);
 921  0181 7b18          	ld	a,(OFST+0,sp)
 922  0183 a407          	and	a,#7
 923  0185 6b16          	ld	(OFST-2,sp),a
 925                     ; 200 		switch(m8){	//总线上仍有多个18B20连接
 927  0187 7b14          	ld	a,(OFST-4,sp)
 929                     ; 215 			default:	break;
 930  0189 270e          	jreq	L122
 931  018b 4a            	dec	a
 932  018c 273f          	jreq	L322
 933  018e 4a            	dec	a
 934  018f 2759          	jreq	L522
 935  0191 4a            	dec	a
 936  0192 2603cc027e    	jreq	L062
 937  0197 206c          	jra	L533
 938  0199               L122:
 939                     ; 201 			case	0:	Ds18b20_MasterWrite_0();	
 941  0199 cd0067        	call	_Ds18b20_MasterWrite_0
 943                     ; 202 								ROM_Temp[zheng]&=(uint8_t)(~(1<<yu));	//记录该位的值
 945  019c 96            	ldw	x,sp
 946  019d cd03df        	call	LC007
 947  01a0 1b15          	add	a,(OFST-3,sp)
 948  01a2 2401          	jrnc	L621
 949  01a4 5c            	incw	x
 950  01a5               L621:
 951  01a5 02            	rlwa	x,a
 952  01a6 7b16          	ld	a,(OFST-2,sp)
 953  01a8 cd03d6        	call	LC006
 954  01ab 2705          	jreq	L031
 955  01ad               L231:
 956  01ad 48            	sll	a
 957  01ae 905a          	decw	y
 958  01b0 26fb          	jrne	L231
 959  01b2               L031:
 960  01b2 43            	cpl	a
 961  01b3 f4            	and	a,(x)
 962  01b4 f7            	ld	(x),a
 963                     ; 203 								ROM_Mark[zheng]|=(uint8_t)(1<<yu);		//该位有总线冲突，做好标记
 965  01b5 96            	ldw	x,sp
 966  01b6 cd03eb        	call	LC009
 967  01b9 1b15          	add	a,(OFST-3,sp)
 968  01bb 2401          	jrnc	L431
 969  01bd 5c            	incw	x
 970  01be               L431:
 971  01be 02            	rlwa	x,a
 972  01bf 7b16          	ld	a,(OFST-2,sp)
 973  01c1 cd03d6        	call	LC006
 974  01c4 273d          	jreq	L651
 975  01c6               L041:
 976  01c6 48            	sll	a
 977  01c7 905a          	decw	y
 978  01c9 26fb          	jrne	L041
 979                     ; 204 								break;
 981  01cb 2036          	jp	L651
 982  01cd               L322:
 983                     ; 206 			case	1:	Ds18b20_MasterWrite_0();	
 985  01cd cd0067        	call	_Ds18b20_MasterWrite_0
 987                     ; 207 								ROM_Temp[zheng]&=(uint8_t)(~(1<<yu));	//记录该位的值								
 989  01d0 96            	ldw	x,sp
 990  01d1 cd03df        	call	LC007
 991  01d4 1b15          	add	a,(OFST-3,sp)
 992  01d6 2401          	jrnc	L441
 993  01d8 5c            	incw	x
 994  01d9               L441:
 995  01d9 02            	rlwa	x,a
 996  01da 7b16          	ld	a,(OFST-2,sp)
 997  01dc cd03d6        	call	LC006
 998  01df 2705          	jreq	L641
 999  01e1               L051:
1000  01e1 48            	sll	a
1001  01e2 905a          	decw	y
1002  01e4 26fb          	jrne	L051
1003  01e6               L641:
1004  01e6 43            	cpl	a
1005  01e7 f4            	and	a,(x)
1006                     ; 208 								break;
1008  01e8 201a          	jp	LC004
1009  01ea               L522:
1010                     ; 210 			case	2:	Ds18b20_MasterWrite_1();	
1012  01ea cd0081        	call	_Ds18b20_MasterWrite_1
1014                     ; 211 								ROM_Temp[zheng]|=(uint8_t)((1<<yu));	//记录该位的值								
1016  01ed 96            	ldw	x,sp
1017  01ee cd03df        	call	LC007
1018  01f1 1b15          	add	a,(OFST-3,sp)
1019  01f3 2401          	jrnc	L451
1020  01f5 5c            	incw	x
1021  01f6               L451:
1022  01f6 02            	rlwa	x,a
1023  01f7 7b16          	ld	a,(OFST-2,sp)
1024  01f9 cd03d6        	call	LC006
1025  01fc 2705          	jreq	L651
1026  01fe               L061:
1027  01fe 48            	sll	a
1028  01ff 905a          	decw	y
1029  0201 26fb          	jrne	L061
1030  0203               L651:
1031  0203 fa            	or	a,(x)
1032  0204               LC004:
1033  0204 f7            	ld	(x),a
1034                     ; 212 								break;
1036                     ; 213 			case	3:	//总线上没有18B20连接
1036                     ; 214 								return 0;
1039                     ; 215 			default:	break;
1041  0205               L533:
1042                     ; 193 	for(j=0;j<64;j++){
1044  0205 0c18          	inc	(OFST+0,sp)
1048  0207 7b18          	ld	a,(OFST+0,sp)
1049  0209 a140          	cp	a,#64
1050  020b 2403cc016c    	jrult	L523
1051                     ; 219 	for(i=0;i<8;i++){
1053  0210 4f            	clr	a
1054  0211 6b17          	ld	(OFST-1,sp),a
1056  0213               L733:
1057                     ; 220 		ROM_Buf[0][i]=ROM_Temp[i];	//保存读到的第一个ROM值
1059  0213 5f            	clrw	x
1060  0214 97            	ld	xl,a
1061  0215 89            	pushw	x
1062  0216 96            	ldw	x,sp
1063  0217 1c000e        	addw	x,#OFST-10
1064  021a 9f            	ld	a,xl
1065  021b 5e            	swapw	x
1066  021c 1b19          	add	a,(OFST+1,sp)
1067  021e 2401          	jrnc	L261
1068  0220 5c            	incw	x
1069  0221               L261:
1070  0221 02            	rlwa	x,a
1071  0222 f6            	ld	a,(x)
1072  0223 85            	popw	x
1073  0224 e700          	ld	(_ROM_Buf,x),a
1074                     ; 219 	for(i=0;i<8;i++){
1076  0226 0c17          	inc	(OFST-1,sp)
1080  0228 7b17          	ld	a,(OFST-1,sp)
1081  022a a108          	cp	a,#8
1082  022c 25e5          	jrult	L733
1083                     ; 224 		for(k=1;k<8;k++){
1085  022e a601          	ld	a,#1
1086  0230 6b03          	ld	(OFST-21,sp),a
1088  0232               L543:
1089                     ; 226 			m8=0;	//标记有没有未识别的ROM
1091  0232 0f14          	clr	(OFST-4,sp)
1093                     ; 227 			for(i=8;i>0;i--){
1095  0234 a608          	ld	a,#8
1096  0236 6b17          	ld	(OFST-1,sp),a
1098  0238               L353:
1099                     ; 228 				if(ROM_Mark[i-1]){	//仍有未识别的ROM,识别冲突位的位置（最高位为1的位置）
1101  0238 96            	ldw	x,sp
1102  0239 1c0004        	addw	x,#OFST-20
1103  023c 1f01          	ldw	(OFST-23,sp),x
1105  023e 5f            	clrw	x
1106  023f 97            	ld	xl,a
1107  0240 5a            	decw	x
1108  0241 72fb01        	addw	x,(OFST-23,sp)
1109  0244 7d            	tnz	(x)
1110  0245 2732          	jreq	L163
1111                     ; 229 					zheng=(uint8_t)(i-1);			
1113  0247 4a            	dec	a
1114  0248 6b15          	ld	(OFST-3,sp),a
1116                     ; 230 					m8=1;
1118  024a a601          	ld	a,#1
1119  024c 6b14          	ld	(OFST-4,sp),a
1121                     ; 231 					m81=ROM_Mark[i-1];
1123  024e 96            	ldw	x,sp
1124  024f 1c0004        	addw	x,#OFST-20
1125  0252 1f01          	ldw	(OFST-23,sp),x
1127  0254 5f            	clrw	x
1128  0255 7b17          	ld	a,(OFST-1,sp)
1129  0257 97            	ld	xl,a
1130  0258 5a            	decw	x
1131  0259 72fb01        	addw	x,(OFST-23,sp)
1132  025c f6            	ld	a,(x)
1133  025d 6b17          	ld	(OFST-1,sp),a
1135                     ; 232 					for(j=0;j<8;j++){					
1137  025f 0f18          	clr	(OFST+0,sp)
1139  0261               L363:
1140                     ; 233 						if(m81&0x80){
1142  0261 7b17          	ld	a,(OFST-1,sp)
1143  0263 2a08          	jrpl	L173
1144                     ; 234 							yu=(uint8_t)(7-j);
1146  0265 a607          	ld	a,#7
1147  0267 1018          	sub	a,(OFST+0,sp)
1148  0269 6b16          	ld	(OFST-2,sp),a
1150                     ; 235 							break;
1152  026b 201a          	jra	L753
1153  026d               L173:
1154                     ; 237 						m81<<=1;
1156  026d 0817          	sll	(OFST-1,sp)
1158                     ; 232 					for(j=0;j<8;j++){					
1160  026f 0c18          	inc	(OFST+0,sp)
1164  0271 7b18          	ld	a,(OFST+0,sp)
1165  0273 a108          	cp	a,#8
1166  0275 25ea          	jrult	L363
1167  0277 200e          	jra	L753
1168  0279               L163:
1169                     ; 241 					if(i==1){		//已全部识别
1171  0279 4a            	dec	a
1172  027a 2605          	jrne	L373
1173                     ; 242 						return k;
1175  027c 7b03          	ld	a,(OFST-21,sp)
1177  027e               L062:
1179  027e 5b18          	addw	sp,#24
1180  0280 81            	ret	
1181  0281               L373:
1182                     ; 227 			for(i=8;i>0;i--){
1184  0281 0a17          	dec	(OFST-1,sp)
1188  0283 7b17          	ld	a,(OFST-1,sp)
1189  0285 26b1          	jrne	L353
1190  0287               L753:
1191                     ; 247 			if(m8){	//有未识别的ROM	
1193  0287 7b14          	ld	a,(OFST-4,sp)
1194  0289 2603cc03c7    	jreq	L773
1195                     ; 248 				Ds18b20_Reset();
1197  028e cd000c        	call	_Ds18b20_Reset
1199                     ; 249 				Ds18b20_MasterWriteOneByte(SEARCH_ROM);	//发送SEARCH_ROM 命令
1201  0291 a6f0          	ld	a,#240
1202  0293 cd00f7        	call	_Ds18b20_MasterWriteOneByte
1204                     ; 251 				m8=(uint8_t)((zheng<<3)+yu);	//计算冲突位
1206  0296 7b15          	ld	a,(OFST-3,sp)
1207  0298 48            	sll	a
1208  0299 48            	sll	a
1209  029a 48            	sll	a
1210  029b 1b16          	add	a,(OFST-2,sp)
1211  029d 6b14          	ld	(OFST-4,sp),a
1213                     ; 252 				ROM_Mark[zheng]&=(uint8_t)(~(1<<yu));		//清除该位总线标记
1215  029f 96            	ldw	x,sp
1216  02a0 cd03eb        	call	LC009
1217  02a3 1b15          	add	a,(OFST-3,sp)
1218  02a5 2401          	jrnc	L071
1219  02a7 5c            	incw	x
1220  02a8               L071:
1221  02a8 02            	rlwa	x,a
1222  02a9 7b16          	ld	a,(OFST-2,sp)
1223  02ab cd03d6        	call	LC006
1224  02ae 2705          	jreq	L271
1225  02b0               L471:
1226  02b0 48            	sll	a
1227  02b1 905a          	decw	y
1228  02b3 26fb          	jrne	L471
1229  02b5               L271:
1230  02b5 43            	cpl	a
1231  02b6 f4            	and	a,(x)
1232  02b7 f7            	ld	(x),a
1233                     ; 253 				if(m8){
1235  02b8 7b14          	ld	a,(OFST-4,sp)
1236  02ba 2603cc0399    	jreq	L104
1237                     ; 255 					for(j=0;j<m8;j++){
1239  02bf 0f18          	clr	(OFST+0,sp)
1242  02c1 2040          	jra	L704
1243  02c3               L304:
1244                     ; 256 						zheng=(uint8_t)(j/8);
1246  02c3 5f            	clrw	x
1247  02c4 cd03e5        	call	LC008
1248  02c7 6b15          	ld	(OFST-3,sp),a
1250                     ; 257 						yu=(uint8_t)(j%8);
1252  02c9 7b18          	ld	a,(OFST+0,sp)
1253  02cb a407          	and	a,#7
1254  02cd 6b16          	ld	(OFST-2,sp),a
1256                     ; 258 						Ds18b20_MasterRead();	//读1bit 原码
1258  02cf cd00a7        	call	_Ds18b20_MasterRead
1260                     ; 259 						Ds18b20_MasterRead();	//读1bit 补码
1262  02d2 cd00a7        	call	_Ds18b20_MasterRead
1264                     ; 260 						if(ROM_Temp[zheng]&(1<<yu)){
1266  02d5 96            	ldw	x,sp
1267  02d6 cd03df        	call	LC007
1268  02d9 1b15          	add	a,(OFST-3,sp)
1269  02db 2401          	jrnc	L202
1270  02dd 5c            	incw	x
1271  02de               L202:
1272  02de 02            	rlwa	x,a
1273  02df f6            	ld	a,(x)
1274  02e0 5f            	clrw	x
1275  02e1 97            	ld	xl,a
1276  02e2 1f01          	ldw	(OFST-23,sp),x
1278  02e4 ae0001        	ldw	x,#1
1279  02e7 7b16          	ld	a,(OFST-2,sp)
1280  02e9 2704          	jreq	L402
1281  02eb               L602:
1282  02eb 58            	sllw	x
1283  02ec 4a            	dec	a
1284  02ed 26fc          	jrne	L602
1285  02ef               L402:
1286  02ef 01            	rrwa	x,a
1287  02f0 1402          	and	a,(OFST-22,sp)
1288  02f2 01            	rrwa	x,a
1289  02f3 1401          	and	a,(OFST-23,sp)
1290  02f5 01            	rrwa	x,a
1291  02f6 5d            	tnzw	x
1292  02f7 2705          	jreq	L314
1293                     ; 261 							Ds18b20_MasterWrite_1();
1295  02f9 cd0081        	call	_Ds18b20_MasterWrite_1
1298  02fc 2003          	jra	L514
1299  02fe               L314:
1300                     ; 263 							Ds18b20_MasterWrite_0();
1302  02fe cd0067        	call	_Ds18b20_MasterWrite_0
1304  0301               L514:
1305                     ; 255 					for(j=0;j<m8;j++){
1307  0301 0c18          	inc	(OFST+0,sp)
1309  0303               L704:
1312  0303 7b18          	ld	a,(OFST+0,sp)
1313  0305 1114          	cp	a,(OFST-4,sp)
1314  0307 25ba          	jrult	L304
1315                     ; 266 					Ds18b20_MasterRead();	//读1bit 原码
1317  0309 cd00a7        	call	_Ds18b20_MasterRead
1319                     ; 267 					Ds18b20_MasterRead();	//读1bit 补码
1321  030c cd00a7        	call	_Ds18b20_MasterRead
1323                     ; 268 					Ds18b20_MasterWrite_1();//冲突位发送1			
1325  030f cd0081        	call	_Ds18b20_MasterWrite_1
1327                     ; 269 					zheng=(uint8_t)(m8/8);
1329  0312 7b14          	ld	a,(OFST-4,sp)
1330  0314 5f            	clrw	x
1331  0315 cd03e5        	call	LC008
1332  0318 6b15          	ld	(OFST-3,sp),a
1334                     ; 270 					yu=(uint8_t)(m8%8);
1336  031a 7b14          	ld	a,(OFST-4,sp)
1337  031c a407          	and	a,#7
1338  031e 6b16          	ld	(OFST-2,sp),a
1340                     ; 271 					ROM_Temp[zheng]|=(uint8_t)(1<<yu);	//记录该位的值	
1342  0320 96            	ldw	x,sp
1343  0321 cd03df        	call	LC007
1344  0324 1b15          	add	a,(OFST-3,sp)
1345  0326 2401          	jrnc	L222
1346  0328 5c            	incw	x
1347  0329               L222:
1348  0329 02            	rlwa	x,a
1349  032a 7b16          	ld	a,(OFST-2,sp)
1350  032c cd03d6        	call	LC006
1351  032f 2705          	jreq	L422
1352  0331               L622:
1353  0331 48            	sll	a
1354  0332 905a          	decw	y
1355  0334 26fb          	jrne	L622
1356  0336               L422:
1357  0336 fa            	or	a,(x)
1358  0337 f7            	ld	(x),a
1359                     ; 273 					for(j=(uint8_t)(m8+1);j<64;j++){
1361  0338 7b14          	ld	a,(OFST-4,sp)
1362  033a 4c            	inc	a
1363  033b 6b18          	ld	(OFST+0,sp),a
1366  033d 2054          	jra	L324
1367  033f               L714:
1368                     ; 274 						zheng=(uint8_t)(j/8);
1370  033f 5f            	clrw	x
1371  0340 cd03e5        	call	LC008
1372  0343 6b15          	ld	(OFST-3,sp),a
1374                     ; 275 						yu=(uint8_t)(j%8);
1376  0345 7b18          	ld	a,(OFST+0,sp)
1377  0347 a407          	and	a,#7
1378  0349 6b16          	ld	(OFST-2,sp),a
1380                     ; 276 						m81=Ds18b20_MasterRead();//读1bit 原码
1382  034b cd00a7        	call	_Ds18b20_MasterRead
1384  034e 6b17          	ld	(OFST-1,sp),a
1386                     ; 277 						if(m81){	
1388  0350 96            	ldw	x,sp
1389  0351 2717          	jreq	L724
1390                     ; 278 							ROM_Temp[zheng]|=(uint8_t)(1<<yu);	//记录该位的值	
1392  0353 cd03df        	call	LC007
1393  0356 1b15          	add	a,(OFST-3,sp)
1394  0358 2401          	jrnc	L232
1395  035a 5c            	incw	x
1396  035b               L232:
1397  035b 02            	rlwa	x,a
1398  035c 7b16          	ld	a,(OFST-2,sp)
1399  035e ad76          	call	LC006
1400  0360 2705          	jreq	L432
1401  0362               L632:
1402  0362 48            	sll	a
1403  0363 905a          	decw	y
1404  0365 26fb          	jrne	L632
1405  0367               L432:
1406  0367 fa            	or	a,(x)
1408  0368 2015          	jra	L134
1409  036a               L724:
1410                     ; 280 							ROM_Temp[zheng]&=(uint8_t)(~(1<<yu));	//记录该位的值
1412  036a ad73          	call	LC007
1413  036c 1b15          	add	a,(OFST-3,sp)
1414  036e 2401          	jrnc	L042
1415  0370 5c            	incw	x
1416  0371               L042:
1417  0371 02            	rlwa	x,a
1418  0372 7b16          	ld	a,(OFST-2,sp)
1419  0374 ad60          	call	LC006
1420  0376 2705          	jreq	L242
1421  0378               L442:
1422  0378 48            	sll	a
1423  0379 905a          	decw	y
1424  037b 26fb          	jrne	L442
1425  037d               L242:
1426  037d 43            	cpl	a
1427  037e f4            	and	a,(x)
1428  037f               L134:
1429  037f f7            	ld	(x),a
1430                     ; 282 						Ds18b20_MasterRead();	//读1bit 补码
1432  0380 cd00a7        	call	_Ds18b20_MasterRead
1434                     ; 283 						if(m81){
1436  0383 7b17          	ld	a,(OFST-1,sp)
1437  0385 2705          	jreq	L334
1438                     ; 284 							Ds18b20_MasterWrite_1();
1440  0387 cd0081        	call	_Ds18b20_MasterWrite_1
1443  038a 2003          	jra	L534
1444  038c               L334:
1445                     ; 286 							Ds18b20_MasterWrite_0();
1447  038c cd0067        	call	_Ds18b20_MasterWrite_0
1449  038f               L534:
1450                     ; 273 					for(j=(uint8_t)(m8+1);j<64;j++){
1452  038f 0c18          	inc	(OFST+0,sp)
1454  0391 7b18          	ld	a,(OFST+0,sp)
1455  0393               L324:
1458  0393 a140          	cp	a,#64
1459  0395 25a8          	jrult	L714
1461  0397 2006          	jra	L734
1462  0399               L104:
1463                     ; 290 					ROM_Temp[7]|=0x80;	//最高位置1
1465  0399 7b13          	ld	a,(OFST-5,sp)
1466  039b aa80          	or	a,#128
1467  039d 6b13          	ld	(OFST-5,sp),a
1469  039f               L734:
1470                     ; 292 				for(j=0;j<8;j++){
1472  039f 0f18          	clr	(OFST+0,sp)
1474  03a1               L144:
1475                     ; 293 				ROM_Buf[k][j]=ROM_Temp[j];	//保存读到的R OM值
1477  03a1 7b03          	ld	a,(OFST-21,sp)
1478  03a3 97            	ld	xl,a
1479  03a4 a608          	ld	a,#8
1480  03a6 42            	mul	x,a
1481  03a7 01            	rrwa	x,a
1482  03a8 1b18          	add	a,(OFST+0,sp)
1483  03aa 2401          	jrnc	L452
1484  03ac 5c            	incw	x
1485  03ad               L452:
1486  03ad 02            	rlwa	x,a
1487  03ae 89            	pushw	x
1488  03af 96            	ldw	x,sp
1489  03b0 1c000e        	addw	x,#OFST-10
1490  03b3 9f            	ld	a,xl
1491  03b4 5e            	swapw	x
1492  03b5 1b1a          	add	a,(OFST+2,sp)
1493  03b7 2401          	jrnc	L652
1494  03b9 5c            	incw	x
1495  03ba               L652:
1496  03ba 02            	rlwa	x,a
1497  03bb f6            	ld	a,(x)
1498  03bc 85            	popw	x
1499  03bd e700          	ld	(_ROM_Buf,x),a
1500                     ; 292 				for(j=0;j<8;j++){
1502  03bf 0c18          	inc	(OFST+0,sp)
1506  03c1 7b18          	ld	a,(OFST+0,sp)
1507  03c3 a108          	cp	a,#8
1508  03c5 25da          	jrult	L144
1509  03c7               L773:
1510                     ; 224 		for(k=1;k<8;k++){
1512  03c7 0c03          	inc	(OFST-21,sp)
1516  03c9 7b03          	ld	a,(OFST-21,sp)
1517  03cb a108          	cp	a,#8
1518  03cd 2403cc0232    	jrult	L543
1519                     ; 297 	return 0;	
1521  03d2 4f            	clr	a
1523  03d3 cc027e        	jra	L062
1524  03d6               LC006:
1525  03d6 905f          	clrw	y
1526  03d8 9097          	ld	yl,a
1527  03da a601          	ld	a,#1
1528  03dc 905d          	tnzw	y
1529  03de 81            	ret	
1530  03df               LC007:
1531  03df 1c000c        	addw	x,#OFST-12
1532  03e2 9f            	ld	a,xl
1533  03e3 5e            	swapw	x
1534  03e4 81            	ret	
1535  03e5               LC008:
1536  03e5 97            	ld	xl,a
1537  03e6 57            	sraw	x
1538  03e7 57            	sraw	x
1539  03e8 57            	sraw	x
1540  03e9 9f            	ld	a,xl
1541  03ea 81            	ret	
1542  03eb               LC009:
1543  03eb 1c0004        	addw	x,#OFST-20
1544  03ee 9f            	ld	a,xl
1545  03ef 5e            	swapw	x
1546  03f0 81            	ret	
1572                     	xdef	_Ds18b20_SearchROM
1573                     	switch	.ubsct
1574  0000               _ROM_Buf:
1575  0000 000000000000  	ds.b	64
1576                     	xdef	_ROM_Buf
1577                     	xdef	_Ds18b20_MasterReadOneByte
1578                     	xdef	_Ds18b20_MasterWriteOneByte
1579                     	xdef	_Ds18b20_MasterRead
1580                     	xdef	_Ds18b20_MasterWrite_1
1581                     	xdef	_Ds18b20_MasterWrite_0
1582                     	xdef	_Ds18b20_Reset
1583                     	xdef	_Ds18b20_Init
1584                     	xref	_delay_10us
1585                     	xref	_GPIO_ReadInputPin
1586                     	xref	_GPIO_WriteLow
1587                     	xref	_GPIO_WriteHigh
1588                     	xref	_GPIO_Init
1608                     	end
