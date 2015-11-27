   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
  20                     .const:	section	.text
  21  0000               _mask_low:
  22  0000 00            	dc.b	0
  23  0001 01            	dc.b	1
  24  0002 03            	dc.b	3
  25  0003 07            	dc.b	7
  26  0004 0f            	dc.b	15
  27  0005 1f            	dc.b	31
  28  0006 3f            	dc.b	63
  29  0007 7f            	dc.b	127
  30  0008               _mask_high:
  31  0008 fe            	dc.b	254
  32  0009 fc            	dc.b	252
  33  000a f8            	dc.b	248
  34  000b f0            	dc.b	240
  35  000c e0            	dc.b	224
  36  000d c0            	dc.b	192
  37  000e 80            	dc.b	128
  38  000f 00            	dc.b	0
  68                     ; 41 void Nokia5110_PortInit(void)
  68                     ; 42 {
  70                     	switch	.text
  71  0000               _Nokia5110_PortInit:
  75                     ; 43 		GPIO_Init(NOKIA5110_PORT,NOKIA5110_RST,GPIO_MODE_OUT_PP_HIGH_SLOW);
  77  0000 4bd0          	push	#208
  78  0002 4b80          	push	#128
  79  0004 ae500a        	ldw	x,#20490
  80  0007 cd0000        	call	_GPIO_Init
  82  000a 85            	popw	x
  83                     ; 44 		GPIO_Init(NOKIA5110_PORT,NOKIA5110_CE,GPIO_MODE_OUT_PP_HIGH_SLOW);
  85  000b 4bd0          	push	#208
  86  000d 4b40          	push	#64
  87  000f ae500a        	ldw	x,#20490
  88  0012 cd0000        	call	_GPIO_Init
  90  0015 85            	popw	x
  91                     ; 45 		GPIO_Init(NOKIA5110_PORT,NOKIA5110_DC,GPIO_MODE_OUT_PP_LOW_SLOW);
  93  0016 4bc0          	push	#192
  94  0018 4b20          	push	#32
  95  001a ae500a        	ldw	x,#20490
  96  001d cd0000        	call	_GPIO_Init
  98  0020 85            	popw	x
  99                     ; 46 		GPIO_Init(NOKIA5110_PORT,NOKIA5110_DIN,GPIO_MODE_OUT_PP_LOW_SLOW);
 101  0021 4bc0          	push	#192
 102  0023 4b10          	push	#16
 103  0025 ae500a        	ldw	x,#20490
 104  0028 cd0000        	call	_GPIO_Init
 106  002b 85            	popw	x
 107                     ; 47 		GPIO_Init(NOKIA5110_PORT,NOKIA5110_CLK,GPIO_MODE_OUT_PP_LOW_SLOW);
 109  002c 4bc0          	push	#192
 110  002e 4b08          	push	#8
 111  0030 ae500a        	ldw	x,#20490
 112  0033 cd0000        	call	_GPIO_Init
 114  0036 85            	popw	x
 115                     ; 48 }
 118  0037 81            	ret	
 170                     ; 49 static void write_byte(unsigned char dat,unsigned char iscmd)
 170                     ; 50 {
 171                     	switch	.text
 172  0038               L32_write_byte:
 174  0038 89            	pushw	x
 175  0039 88            	push	a
 176       00000001      OFST:	set	1
 179                     ; 52 	NOKIA5110_CE_LOW();	
 181  003a 721d500a      	bres	20490,#6
 182                     ; 54 	if(iscmd==1)	NOKIA5110_DC_LOW(); 	//命令
 184  003e 9f            	ld	a,xl
 185  003f 4a            	dec	a
 186  0040 2606          	jrne	L35
 189  0042 721b500a      	bres	20490,#5
 191  0046 2004          	jra	L55
 192  0048               L35:
 193                     ; 55 	else					NOKIA5110_DC_HIGH();	//数据
 195  0048 721a500a      	bset	20490,#5
 196  004c               L55:
 197                     ; 57 	for(i=0;i<8;i++)
 199  004c 0f01          	clr	(OFST+0,sp)
 201  004e               L75:
 202                     ; 59 		NOKIA5110_CLK_LOW();
 204  004e 7217500a      	bres	20490,#3
 205                     ; 61 		if(dat&0x80)	NOKIA5110_DIN_HIGH();
 207  0052 7b02          	ld	a,(OFST+1,sp)
 208  0054 2a06          	jrpl	L56
 211  0056 7218500a      	bset	20490,#4
 213  005a 2004          	jra	L76
 214  005c               L56:
 215                     ; 62 		else					NOKIA5110_DIN_LOW();			
 217  005c 7219500a      	bres	20490,#4
 218  0060               L76:
 219                     ; 64 		NOKIA5110_CLK_HIGH();
 221  0060 7216500a      	bset	20490,#3
 222                     ; 65 		dat<<=1;
 224  0064 0802          	sll	(OFST+1,sp)
 225                     ; 57 	for(i=0;i<8;i++)
 227  0066 0c01          	inc	(OFST+0,sp)
 231  0068 7b01          	ld	a,(OFST+0,sp)
 232  006a a108          	cp	a,#8
 233  006c 25e0          	jrult	L75
 234                     ; 67 	NOKIA5110_CE_HIGH();
 236  006e 721c500a      	bset	20490,#6
 237                     ; 68 }
 240  0072 5b03          	addw	sp,#3
 241  0074 81            	ret	
 286                     ; 69 void LCD_Clear(void)
 286                     ; 70 {
 287                     	switch	.text
 288  0075               _LCD_Clear:
 290  0075 5204          	subw	sp,#4
 291       00000004      OFST:	set	4
 294                     ; 72 	write_byte(0X80,1);	//set X address
 296  0077 ae8001        	ldw	x,#32769
 297  007a adbc          	call	L32_write_byte
 299                     ; 73 	write_byte(0X40,1);	//set Y address
 301  007c ae4001        	ldw	x,#16385
 302  007f adb7          	call	L32_write_byte
 304                     ; 74 	for(i=0;i<504;i++)
 306  0081 5f            	clrw	x
 307  0082 1f03          	ldw	(OFST-1,sp),x
 309  0084               L311:
 310                     ; 76 		write_byte(0X00,0);
 312  0084 5f            	clrw	x
 313  0085 adb1          	call	L32_write_byte
 315                     ; 74 	for(i=0;i<504;i++)
 317  0087 1e03          	ldw	x,(OFST-1,sp)
 318  0089 5c            	incw	x
 319  008a 1f03          	ldw	(OFST-1,sp),x
 323  008c a301f8        	cpw	x,#504
 324  008f 25f3          	jrult	L311
 325                     ; 78 	for(j=0;j<6;j++){
 327  0091 5f            	clrw	x
 328  0092 1f01          	ldw	(OFST-3,sp),x
 330  0094               L121:
 331                     ; 79 		for(i=0;i<84;i++){
 333  0094 5f            	clrw	x
 334  0095 1f03          	ldw	(OFST-1,sp),x
 336  0097               L721:
 337                     ; 80 			lcd_buf[j][i]=0;			
 339  0097 1e01          	ldw	x,(OFST-3,sp)
 340  0099 90ae0054      	ldw	y,#84
 341  009d cd0000        	call	c_imul
 343  00a0 72fb03        	addw	x,(OFST-1,sp)
 344  00a3 724f0000      	clr	(L3_lcd_buf,x)
 345                     ; 79 		for(i=0;i<84;i++){
 347  00a7 1e03          	ldw	x,(OFST-1,sp)
 348  00a9 5c            	incw	x
 349  00aa 1f03          	ldw	(OFST-1,sp),x
 353  00ac a30054        	cpw	x,#84
 354  00af 25e6          	jrult	L721
 355                     ; 78 	for(j=0;j<6;j++){
 357  00b1 1e01          	ldw	x,(OFST-3,sp)
 358  00b3 5c            	incw	x
 359  00b4 1f01          	ldw	(OFST-3,sp),x
 363  00b6 a30006        	cpw	x,#6
 364  00b9 25d9          	jrult	L121
 365                     ; 83 }
 368  00bb 5b04          	addw	sp,#4
 369  00bd 81            	ret	
 396                     ; 84 void Nokia5110_Init(void)
 396                     ; 85 {
 397                     	switch	.text
 398  00be               _Nokia5110_Init:
 402                     ; 87 	Nokia5110_PortInit();	//端口初始化
 404  00be cd0000        	call	_Nokia5110_PortInit
 406                     ; 91 	NOKIA5110_RST_LOW();
 408  00c1 721f500a      	bres	20490,#7
 409                     ; 92 	delay_ms(2);
 411  00c5 a602          	ld	a,#2
 412  00c7 cd0000        	call	_delay_ms
 414                     ; 93 	NOKIA5110_RST_HIGH();
 416  00ca 721e500a      	bset	20490,#7
 417                     ; 95 	write_byte(0x21,1);	//PD-0:chip active; V-0:horizontal addressing;
 419  00ce ae2101        	ldw	x,#8449
 420  00d1 cd0038        	call	L32_write_byte
 422                     ; 97 	write_byte(0x90,1);	//write Vop to register.Vop=6.06+0.06*(0xc8&0x80)=
 424  00d4 ae9001        	ldw	x,#36865
 425  00d7 cd0038        	call	L32_write_byte
 427                     ; 101 	write_byte(0x20,1);	//H-1:use basic instruction set
 429  00da ae2001        	ldw	x,#8193
 430  00dd cd0038        	call	L32_write_byte
 432                     ; 102 	write_byte(0X0C,1);	//set display configuratin,DE-10:normal mode
 434  00e0 ae0c01        	ldw	x,#3073
 435  00e3 cd0038        	call	L32_write_byte
 437                     ; 104 	LCD_Clear();
 440                     ; 127 }
 443  00e6 208d          	jp	_LCD_Clear
 496                     ; 133 static void set_adress(uint8_t x,uint8_t y)
 496                     ; 134 {
 497                     	switch	.text
 498  00e8               L541_set_adress:
 500  00e8 89            	pushw	x
 501  00e9 88            	push	a
 502       00000001      OFST:	set	1
 505                     ; 136 	assert_param(x<84);
 507                     ; 137 	assert_param(y<6);
 509                     ; 138 	m=(uint8_t)(x|0x80);
 511  00ea 9e            	ld	a,xh
 512  00eb aa80          	or	a,#128
 513  00ed 6b01          	ld	(OFST+0,sp),a
 515                     ; 139 	write_byte(m,1);	//set X address
 517  00ef ae0001        	ldw	x,#1
 518  00f2 95            	ld	xh,a
 519  00f3 cd0038        	call	L32_write_byte
 521                     ; 140 	m=(uint8_t)(y|0x40);
 523  00f6 7b03          	ld	a,(OFST+2,sp)
 524  00f8 aa40          	or	a,#64
 525  00fa 6b01          	ld	(OFST+0,sp),a
 527                     ; 141 	write_byte(m,1);	//set Y address
 529  00fc ae0001        	ldw	x,#1
 530  00ff 95            	ld	xh,a
 531  0100 cd0038        	call	L32_write_byte
 533                     ; 142 }
 536  0103 5b03          	addw	sp,#3
 537  0105 81            	ret	
 680                     ; 166 static uint8_t print_oneChineseWord(uint8_t Row,uint8_t Column,uint8_t *pString)
 680                     ; 167 {
 681                     	switch	.text
 682  0106               L571_print_oneChineseWord:
 684  0106 89            	pushw	x
 685  0107 520c          	subw	sp,#12
 686       0000000c      OFST:	set	12
 689                     ; 172 	i=0;
 691  0109 0f0c          	clr	(OFST+0,sp)
 694  010b cc0322        	jra	L572
 695  010e               L172:
 696                     ; 175 		if((*pString==*FontIndex[i])&&(*(pString+1)==*(FontIndex[i]+1)))																										//找到字库数据
 698  010e 5f            	clrw	x
 699  010f 97            	ld	xl,a
 700  0110 58            	sllw	x
 701  0111 1611          	ldw	y,(OFST+5,sp)
 702  0113 ee00          	ldw	x,(_FontIndex,x)
 703  0115 90f6          	ld	a,(y)
 704  0117 f1            	cp	a,(x)
 705  0118 2703cc0320    	jrne	L103
 707  011d 7b0c          	ld	a,(OFST+0,sp)
 708  011f 5f            	clrw	x
 709  0120 97            	ld	xl,a
 710  0121 58            	sllw	x
 711  0122 ee00          	ldw	x,(_FontIndex,x)
 712  0124 90e601        	ld	a,(1,y)
 713  0127 e101          	cp	a,(1,x)
 714  0129 26ef          	jrne	L103
 715                     ; 178 			i<<=1;	//i*2
 717  012b 080c          	sll	(OFST+0,sp)
 719                     ; 179 			p=&FontLib[i][0];	
 721  012d 7b0c          	ld	a,(OFST+0,sp)
 722  012f 97            	ld	xl,a
 723  0130 a60c          	ld	a,#12
 724  0132 42            	mul	x,a
 725  0133 1c0000        	addw	x,#_FontLib
 726  0136 1f08          	ldw	(OFST-4,sp),x
 728                     ; 182 			shang_begin=(uint8_t)(Row/8);
 730  0138 5f            	clrw	x
 731  0139 7b0d          	ld	a,(OFST+1,sp)
 732  013b 97            	ld	xl,a
 733  013c 57            	sraw	x
 734  013d 57            	sraw	x
 735  013e 57            	sraw	x
 736  013f 9f            	ld	a,xl
 737  0140 6b06          	ld	(OFST-6,sp),a
 739                     ; 183 			yushu_begin=(uint8_t)(Row%8);
 741  0142 7b0d          	ld	a,(OFST+1,sp)
 742  0144 a407          	and	a,#7
 743  0146 6b04          	ld	(OFST-8,sp),a
 745                     ; 184 			shang_end=(uint8_t)((Row+12-1)/8);
 747  0148 5f            	clrw	x
 748  0149 7b0d          	ld	a,(OFST+1,sp)
 749  014b 97            	ld	xl,a
 750  014c 1c000b        	addw	x,#11
 751  014f a608          	ld	a,#8
 752  0151 cd0000        	call	c_sdivx
 754  0154 9f            	ld	a,xl
 755  0155 6b05          	ld	(OFST-7,sp),a
 757                     ; 185 			yushu_end=(uint8_t)((Row+12-1)%8);		
 759  0157 5f            	clrw	x
 760  0158 7b0d          	ld	a,(OFST+1,sp)
 761  015a 97            	ld	xl,a
 762  015b 1c000b        	addw	x,#11
 763  015e a608          	ld	a,#8
 764  0160 cd0000        	call	c_smodx
 766  0163 9f            	ld	a,xl
 767  0164 6b02          	ld	(OFST-10,sp),a
 769                     ; 187 			if((shang_end-shang_begin)>1) onemorerow=1;
 771  0166 5f            	clrw	x
 772  0167 7b05          	ld	a,(OFST-7,sp)
 773  0169 1006          	sub	a,(OFST-6,sp)
 774  016b 2401          	jrnc	L26
 775  016d 5a            	decw	x
 776  016e               L26:
 777  016e 02            	rlwa	x,a
 778  016f a30002        	cpw	x,#2
 779  0172 2f06          	jrslt	L303
 782  0174 a601          	ld	a,#1
 783  0176 6b03          	ld	(OFST-9,sp),a
 786  0178 2002          	jra	L503
 787  017a               L303:
 788                     ; 188 			else	onemorerow=0;
 790  017a 0f03          	clr	(OFST-9,sp)
 792  017c               L503:
 793                     ; 190 			set_adress(Column,shang_begin);
 795  017c 7b06          	ld	a,(OFST-6,sp)
 796  017e 97            	ld	xl,a
 797  017f 7b0e          	ld	a,(OFST+2,sp)
 798  0181 95            	ld	xh,a
 799  0182 cd00e8        	call	L541_set_adress
 801                     ; 191 			for(i=0;i<12;i++){
 803  0185 0f0c          	clr	(OFST+0,sp)
 805  0187               L703:
 806                     ; 192 				lcd_buf[shang_begin][i+Column]&=mask_low[yushu_begin];	//清零
 808  0187 7b06          	ld	a,(OFST-6,sp)
 809  0189 cd0333        	call	LC001
 810  018c 1b0e          	add	a,(OFST+2,sp)
 811  018e 2401          	jrnc	L66
 812  0190 5c            	incw	x
 813  0191               L66:
 814  0191 1b0c          	add	a,(OFST+0,sp)
 815  0193 2401          	jrnc	L07
 816  0195 5c            	incw	x
 817  0196               L07:
 818  0196 02            	rlwa	x,a
 819  0197 7b04          	ld	a,(OFST-8,sp)
 820  0199 905f          	clrw	y
 821  019b 9097          	ld	yl,a
 822  019d d60000        	ld	a,(L3_lcd_buf,x)
 823  01a0 90d40000      	and	a,(_mask_low,y)
 824  01a4 d70000        	ld	(L3_lcd_buf,x),a
 825                     ; 193 				m8=(uint8_t)(*(p+i)<<yushu_begin);
 827  01a7 7b08          	ld	a,(OFST-4,sp)
 828  01a9 97            	ld	xl,a
 829  01aa 7b09          	ld	a,(OFST-3,sp)
 830  01ac 1b0c          	add	a,(OFST+0,sp)
 831  01ae 2401          	jrnc	L27
 832  01b0 5c            	incw	x
 833  01b1               L27:
 834  01b1 02            	rlwa	x,a
 835  01b2 f6            	ld	a,(x)
 836  01b3 88            	push	a
 837  01b4 7b05          	ld	a,(OFST-7,sp)
 838  01b6 5f            	clrw	x
 839  01b7 97            	ld	xl,a
 840  01b8 5d            	tnzw	x
 841  01b9 84            	pop	a
 842  01ba 2704          	jreq	L47
 843  01bc               L67:
 844  01bc 48            	sll	a
 845  01bd 5a            	decw	x
 846  01be 26fc          	jrne	L67
 847  01c0               L47:
 848  01c0 6b07          	ld	(OFST-5,sp),a
 850                     ; 194 				lcd_buf[shang_begin][i+Column]|=m8;			
 852  01c2 7b06          	ld	a,(OFST-6,sp)
 853  01c4 cd0333        	call	LC001
 854  01c7 1b0e          	add	a,(OFST+2,sp)
 855  01c9 2401          	jrnc	L001
 856  01cb 5c            	incw	x
 857  01cc               L001:
 858  01cc 1b0c          	add	a,(OFST+0,sp)
 859  01ce 2401          	jrnc	L201
 860  01d0 5c            	incw	x
 861  01d1               L201:
 862  01d1 02            	rlwa	x,a
 863  01d2 d60000        	ld	a,(L3_lcd_buf,x)
 864  01d5 1a07          	or	a,(OFST-5,sp)
 865  01d7 d70000        	ld	(L3_lcd_buf,x),a
 866                     ; 196 				write_byte(lcd_buf[shang_begin][i+Column],0);
 868  01da 7b06          	ld	a,(OFST-6,sp)
 869  01dc cd0333        	call	LC001
 870  01df 1b0e          	add	a,(OFST+2,sp)
 871  01e1 2401          	jrnc	L601
 872  01e3 5c            	incw	x
 873  01e4               L601:
 874  01e4 1b0c          	add	a,(OFST+0,sp)
 875  01e6 2401          	jrnc	L011
 876  01e8 5c            	incw	x
 877  01e9               L011:
 878  01e9 cd0339        	call	LC002
 880                     ; 191 			for(i=0;i<12;i++){
 882  01ec 0c0c          	inc	(OFST+0,sp)
 886  01ee 7b0c          	ld	a,(OFST+0,sp)
 887  01f0 a10c          	cp	a,#12
 888  01f2 2593          	jrult	L703
 889                     ; 198 			if(onemorerow)	//多占一行
 891  01f4 7b03          	ld	a,(OFST-9,sp)
 892  01f6 2603cc027e    	jreq	L513
 893                     ; 200 				m8=(uint8_t)(shang_begin+1);
 895  01fb 7b06          	ld	a,(OFST-6,sp)
 896  01fd 4c            	inc	a
 897  01fe 6b07          	ld	(OFST-5,sp),a
 899                     ; 201 				set_adress(Column,m8);
 901  0200 97            	ld	xl,a
 902  0201 7b0e          	ld	a,(OFST+2,sp)
 903  0203 95            	ld	xh,a
 904  0204 cd00e8        	call	L541_set_adress
 906                     ; 202 				for(i=0;i<12;i++){
 908  0207 0f0c          	clr	(OFST+0,sp)
 910  0209               L713:
 911                     ; 203 					lcd_buf[m8][i+Column]=0x00;	//清零
 913  0209 7b07          	ld	a,(OFST-5,sp)
 914  020b cd0333        	call	LC001
 915  020e 1b0e          	add	a,(OFST+2,sp)
 916  0210 2401          	jrnc	L411
 917  0212 5c            	incw	x
 918  0213               L411:
 919  0213 1b0c          	add	a,(OFST+0,sp)
 920  0215 2401          	jrnc	L611
 921  0217 5c            	incw	x
 922  0218               L611:
 923  0218 02            	rlwa	x,a
 924  0219 724f0000      	clr	(L3_lcd_buf,x)
 925                     ; 205 					m16=*(p+i)+((uint16_t)(*(p+12+i))<<8);
 927  021d 7b08          	ld	a,(OFST-4,sp)
 928  021f 97            	ld	xl,a
 929  0220 7b09          	ld	a,(OFST-3,sp)
 930  0222 1b0c          	add	a,(OFST+0,sp)
 931  0224 2401          	jrnc	L021
 932  0226 5c            	incw	x
 933  0227               L021:
 934  0227 02            	rlwa	x,a
 935  0228 f6            	ld	a,(x)
 936  0229 6b01          	ld	(OFST-11,sp),a
 938  022b 7b08          	ld	a,(OFST-4,sp)
 939  022d 97            	ld	xl,a
 940  022e 7b09          	ld	a,(OFST-3,sp)
 941  0230 1b0c          	add	a,(OFST+0,sp)
 942  0232 2401          	jrnc	L221
 943  0234 5c            	incw	x
 944  0235               L221:
 945  0235 cd0342        	call	LC003
 946  0238 4f            	clr	a
 947  0239 1b01          	add	a,(OFST-11,sp)
 948  023b 2401          	jrnc	L421
 949  023d 5c            	incw	x
 950  023e               L421:
 951  023e 02            	rlwa	x,a
 952  023f 1f0a          	ldw	(OFST-2,sp),x
 954                     ; 206 					m16<<=yushu_begin;
 956  0241 7b04          	ld	a,(OFST-8,sp)
 957  0243 2707          	jreq	L621
 958  0245               L031:
 959  0245 080b          	sll	(OFST-1,sp)
 960  0247 090a          	rlc	(OFST-2,sp)
 961  0249 4a            	dec	a
 962  024a 26f9          	jrne	L031
 963  024c               L621:
 965                     ; 207 					lcd_buf[m8][i+Column]|=(uint8_t)(m16>>8);
 967  024c 7b07          	ld	a,(OFST-5,sp)
 968  024e cd0333        	call	LC001
 969  0251 1b0e          	add	a,(OFST+2,sp)
 970  0253 2401          	jrnc	L231
 971  0255 5c            	incw	x
 972  0256               L231:
 973  0256 1b0c          	add	a,(OFST+0,sp)
 974  0258 2401          	jrnc	L431
 975  025a 5c            	incw	x
 976  025b               L431:
 977  025b 02            	rlwa	x,a
 978  025c d60000        	ld	a,(L3_lcd_buf,x)
 979  025f 1a0a          	or	a,(OFST-2,sp)
 980  0261 d70000        	ld	(L3_lcd_buf,x),a
 981                     ; 209 					write_byte(lcd_buf[m8][i+Column],0);					
 983  0264 7b07          	ld	a,(OFST-5,sp)
 984  0266 cd0333        	call	LC001
 985  0269 1b0e          	add	a,(OFST+2,sp)
 986  026b 2401          	jrnc	L041
 987  026d 5c            	incw	x
 988  026e               L041:
 989  026e 1b0c          	add	a,(OFST+0,sp)
 990  0270 2401          	jrnc	L241
 991  0272 5c            	incw	x
 992  0273               L241:
 993  0273 cd0339        	call	LC002
 995                     ; 202 				for(i=0;i<12;i++){
 997  0276 0c0c          	inc	(OFST+0,sp)
1001  0278 7b0c          	ld	a,(OFST+0,sp)
1002  027a a10c          	cp	a,#12
1003  027c 258b          	jrult	L713
1004  027e               L513:
1005                     ; 212 			set_adress(Column,shang_end);
1007  027e 7b05          	ld	a,(OFST-7,sp)
1008  0280 97            	ld	xl,a
1009  0281 7b0e          	ld	a,(OFST+2,sp)
1010  0283 95            	ld	xh,a
1011  0284 cd00e8        	call	L541_set_adress
1013                     ; 213 			for(i=0;i<12;i++){
1015  0287 0f0c          	clr	(OFST+0,sp)
1017  0289               L523:
1018                     ; 214 				lcd_buf[shang_end][i+Column]&=mask_high[yushu_end];	//清零
1020  0289 7b05          	ld	a,(OFST-7,sp)
1021  028b cd0333        	call	LC001
1022  028e 1b0e          	add	a,(OFST+2,sp)
1023  0290 2401          	jrnc	L641
1024  0292 5c            	incw	x
1025  0293               L641:
1026  0293 1b0c          	add	a,(OFST+0,sp)
1027  0295 2401          	jrnc	L051
1028  0297 5c            	incw	x
1029  0298               L051:
1030  0298 02            	rlwa	x,a
1031  0299 7b02          	ld	a,(OFST-10,sp)
1032  029b 905f          	clrw	y
1033  029d 9097          	ld	yl,a
1034  029f d60000        	ld	a,(L3_lcd_buf,x)
1035  02a2 90d40008      	and	a,(_mask_high,y)
1036  02a6 d70000        	ld	(L3_lcd_buf,x),a
1037                     ; 223 				if(onemorerow)
1039  02a9 7b03          	ld	a,(OFST-9,sp)
1040  02ab 270f          	jreq	L333
1041                     ; 225 					m16=(uint16_t)(*(p+12+i));					
1043  02ad 7b08          	ld	a,(OFST-4,sp)
1044  02af 97            	ld	xl,a
1045  02b0 7b09          	ld	a,(OFST-3,sp)
1046  02b2 1b0c          	add	a,(OFST+0,sp)
1047  02b4 2401          	jrnc	L251
1048  02b6 5c            	incw	x
1049  02b7               L251:
1050  02b7 cd0342        	call	LC003
1052  02ba 2021          	jra	L533
1053  02bc               L333:
1054                     ; 228 					m16=*(p+i)+((uint16_t)(*(p+12+i))<<8);					
1056  02bc 7b08          	ld	a,(OFST-4,sp)
1057  02be 97            	ld	xl,a
1058  02bf 7b09          	ld	a,(OFST-3,sp)
1059  02c1 1b0c          	add	a,(OFST+0,sp)
1060  02c3 2401          	jrnc	L451
1061  02c5 5c            	incw	x
1062  02c6               L451:
1063  02c6 02            	rlwa	x,a
1064  02c7 f6            	ld	a,(x)
1065  02c8 6b01          	ld	(OFST-11,sp),a
1067  02ca 7b08          	ld	a,(OFST-4,sp)
1068  02cc 97            	ld	xl,a
1069  02cd 7b09          	ld	a,(OFST-3,sp)
1070  02cf 1b0c          	add	a,(OFST+0,sp)
1071  02d1 2401          	jrnc	L651
1072  02d3 5c            	incw	x
1073  02d4               L651:
1074  02d4 ad6c          	call	LC003
1075  02d6 4f            	clr	a
1076  02d7 1b01          	add	a,(OFST-11,sp)
1077  02d9 2401          	jrnc	L061
1078  02db 5c            	incw	x
1079  02dc               L061:
1080  02dc 02            	rlwa	x,a
1081  02dd               L533:
1082  02dd 1f0a          	ldw	(OFST-2,sp),x
1084                     ; 230 				m16<<=yushu_begin;
1086  02df 7b04          	ld	a,(OFST-8,sp)
1087  02e1 2707          	jreq	L261
1088  02e3               L461:
1089  02e3 080b          	sll	(OFST-1,sp)
1090  02e5 090a          	rlc	(OFST-2,sp)
1091  02e7 4a            	dec	a
1092  02e8 26f9          	jrne	L461
1093  02ea               L261:
1095                     ; 231 				lcd_buf[shang_end][i+Column]|=(uint8_t)(m16>>8);
1097  02ea 7b05          	ld	a,(OFST-7,sp)
1098  02ec ad45          	call	LC001
1099  02ee 1b0e          	add	a,(OFST+2,sp)
1100  02f0 2401          	jrnc	L661
1101  02f2 5c            	incw	x
1102  02f3               L661:
1103  02f3 1b0c          	add	a,(OFST+0,sp)
1104  02f5 2401          	jrnc	L071
1105  02f7 5c            	incw	x
1106  02f8               L071:
1107  02f8 02            	rlwa	x,a
1108  02f9 d60000        	ld	a,(L3_lcd_buf,x)
1109  02fc 1a0a          	or	a,(OFST-2,sp)
1110  02fe d70000        	ld	(L3_lcd_buf,x),a
1111                     ; 233 				write_byte(lcd_buf[shang_end][i+Column],0);
1113  0301 7b05          	ld	a,(OFST-7,sp)
1114  0303 ad2e          	call	LC001
1115  0305 1b0e          	add	a,(OFST+2,sp)
1116  0307 2401          	jrnc	L471
1117  0309 5c            	incw	x
1118  030a               L471:
1119  030a 1b0c          	add	a,(OFST+0,sp)
1120  030c 2401          	jrnc	L671
1121  030e 5c            	incw	x
1122  030f               L671:
1123  030f ad28          	call	LC002
1125                     ; 213 			for(i=0;i<12;i++){
1127  0311 0c0c          	inc	(OFST+0,sp)
1131  0313 7b0c          	ld	a,(OFST+0,sp)
1132  0315 a10c          	cp	a,#12
1133  0317 2403cc0289    	jrult	L523
1134                     ; 235 			return 1;	//success
1136  031c a601          	ld	a,#1
1138  031e 2010          	jra	L002
1139  0320               L103:
1140                     ; 238 			i++;			
1142  0320 0c0c          	inc	(OFST+0,sp)
1144  0322               L572:
1145                     ; 173 	while(*FontIndex[i]!=0)
1147  0322 7b0c          	ld	a,(OFST+0,sp)
1148  0324 5f            	clrw	x
1149  0325 97            	ld	xl,a
1150  0326 58            	sllw	x
1151  0327 ee00          	ldw	x,(_FontIndex,x)
1152  0329 7d            	tnz	(x)
1153  032a 2703cc010e    	jrne	L172
1154                     ; 242 	return 0;	//failed
1156  032f 4f            	clr	a
1158  0330               L002:
1160  0330 5b0e          	addw	sp,#14
1161  0332 81            	ret	
1162  0333               LC001:
1163  0333 97            	ld	xl,a
1164  0334 a654          	ld	a,#84
1165  0336 42            	mul	x,a
1166  0337 01            	rrwa	x,a
1167  0338 81            	ret	
1168  0339               LC002:
1169  0339 02            	rlwa	x,a
1170  033a d60000        	ld	a,(L3_lcd_buf,x)
1171  033d 5f            	clrw	x
1172  033e 95            	ld	xh,a
1173  033f cc0038        	jp	L32_write_byte
1174  0342               LC003:
1175  0342 02            	rlwa	x,a
1176  0343 e60c          	ld	a,(12,x)
1177  0345 5f            	clrw	x
1178  0346 97            	ld	xl,a
1179  0347 81            	ret	
1321                     ; 248 static uint8_t print_oneChar(uint8_t Row,uint8_t Column,uint8_t *pChar)
1321                     ; 249 {	
1322                     	switch	.text
1323  0348               L143_print_oneChar:
1325  0348 89            	pushw	x
1326  0349 520c          	subw	sp,#12
1327       0000000c      OFST:	set	12
1330                     ; 254 	i=0;
1332  034b 0f0c          	clr	(OFST+0,sp)
1335  034d cc0553        	jra	L144
1336  0350               L534:
1337                     ; 257 		if(*pChar==CharIndex[i])																										//找到字库数据
1339  0350 5f            	clrw	x
1340  0351 1611          	ldw	y,(OFST+5,sp)
1341  0353 97            	ld	xl,a
1342  0354 90f6          	ld	a,(y)
1343  0356 d10000        	cp	a,(_CharIndex,x)
1344  0359 2703cc0551    	jrne	L544
1345                     ; 260 			p=&CharLib[i][0];	
1347  035e 7b0c          	ld	a,(OFST+0,sp)
1348  0360 97            	ld	xl,a
1349  0361 a60c          	ld	a,#12
1350  0363 42            	mul	x,a
1351  0364 1c0000        	addw	x,#_CharLib
1352  0367 1f08          	ldw	(OFST-4,sp),x
1354                     ; 263 			shang_begin=(uint8_t)(Row/8);
1356  0369 5f            	clrw	x
1357  036a 7b0d          	ld	a,(OFST+1,sp)
1358  036c 97            	ld	xl,a
1359  036d 57            	sraw	x
1360  036e 57            	sraw	x
1361  036f 57            	sraw	x
1362  0370 9f            	ld	a,xl
1363  0371 6b06          	ld	(OFST-6,sp),a
1365                     ; 264 			yushu_begin=(uint8_t)(Row%8);
1367  0373 7b0d          	ld	a,(OFST+1,sp)
1368  0375 a407          	and	a,#7
1369  0377 6b04          	ld	(OFST-8,sp),a
1371                     ; 265 			shang_end=(uint8_t)((Row+12-1)/8);
1373  0379 5f            	clrw	x
1374  037a 7b0d          	ld	a,(OFST+1,sp)
1375  037c 97            	ld	xl,a
1376  037d 1c000b        	addw	x,#11
1377  0380 a608          	ld	a,#8
1378  0382 cd0000        	call	c_sdivx
1380  0385 9f            	ld	a,xl
1381  0386 6b05          	ld	(OFST-7,sp),a
1383                     ; 266 			yushu_end=(uint8_t)((Row+12-1)%8);		
1385  0388 5f            	clrw	x
1386  0389 7b0d          	ld	a,(OFST+1,sp)
1387  038b 97            	ld	xl,a
1388  038c 1c000b        	addw	x,#11
1389  038f a608          	ld	a,#8
1390  0391 cd0000        	call	c_smodx
1392  0394 9f            	ld	a,xl
1393  0395 6b02          	ld	(OFST-10,sp),a
1395                     ; 268 			if((shang_end-shang_begin)>1) onemorerow=1;
1397  0397 5f            	clrw	x
1398  0398 7b05          	ld	a,(OFST-7,sp)
1399  039a 1006          	sub	a,(OFST-6,sp)
1400  039c 2401          	jrnc	L402
1401  039e 5a            	decw	x
1402  039f               L402:
1403  039f 02            	rlwa	x,a
1404  03a0 a30002        	cpw	x,#2
1405  03a3 2f06          	jrslt	L744
1408  03a5 a601          	ld	a,#1
1409  03a7 6b03          	ld	(OFST-9,sp),a
1412  03a9 2002          	jra	L154
1413  03ab               L744:
1414                     ; 269 			else	onemorerow=0;
1416  03ab 0f03          	clr	(OFST-9,sp)
1418  03ad               L154:
1419                     ; 271 			set_adress(Column,shang_begin);
1421  03ad 7b06          	ld	a,(OFST-6,sp)
1422  03af 97            	ld	xl,a
1423  03b0 7b0e          	ld	a,(OFST+2,sp)
1424  03b2 95            	ld	xh,a
1425  03b3 cd00e8        	call	L541_set_adress
1427                     ; 272 			for(i=0;i<6;i++){
1429  03b6 0f0c          	clr	(OFST+0,sp)
1431  03b8               L354:
1432                     ; 273 				lcd_buf[shang_begin][i+Column]&=mask_low[yushu_begin];	//清零
1434  03b8 7b06          	ld	a,(OFST-6,sp)
1435  03ba cd0564        	call	LC004
1436  03bd 1b0e          	add	a,(OFST+2,sp)
1437  03bf 2401          	jrnc	L012
1438  03c1 5c            	incw	x
1439  03c2               L012:
1440  03c2 1b0c          	add	a,(OFST+0,sp)
1441  03c4 2401          	jrnc	L212
1442  03c6 5c            	incw	x
1443  03c7               L212:
1444  03c7 02            	rlwa	x,a
1445  03c8 7b04          	ld	a,(OFST-8,sp)
1446  03ca 905f          	clrw	y
1447  03cc 9097          	ld	yl,a
1448  03ce d60000        	ld	a,(L3_lcd_buf,x)
1449  03d1 90d40000      	and	a,(_mask_low,y)
1450  03d5 d70000        	ld	(L3_lcd_buf,x),a
1451                     ; 274 				m8=(uint8_t)(*(p+i)<<yushu_begin);
1453  03d8 7b08          	ld	a,(OFST-4,sp)
1454  03da 97            	ld	xl,a
1455  03db 7b09          	ld	a,(OFST-3,sp)
1456  03dd 1b0c          	add	a,(OFST+0,sp)
1457  03df 2401          	jrnc	L412
1458  03e1 5c            	incw	x
1459  03e2               L412:
1460  03e2 02            	rlwa	x,a
1461  03e3 f6            	ld	a,(x)
1462  03e4 88            	push	a
1463  03e5 7b05          	ld	a,(OFST-7,sp)
1464  03e7 5f            	clrw	x
1465  03e8 97            	ld	xl,a
1466  03e9 5d            	tnzw	x
1467  03ea 84            	pop	a
1468  03eb 2704          	jreq	L612
1469  03ed               L022:
1470  03ed 48            	sll	a
1471  03ee 5a            	decw	x
1472  03ef 26fc          	jrne	L022
1473  03f1               L612:
1474  03f1 6b07          	ld	(OFST-5,sp),a
1476                     ; 275 				lcd_buf[shang_begin][i+Column]|=m8;			
1478  03f3 7b06          	ld	a,(OFST-6,sp)
1479  03f5 cd0564        	call	LC004
1480  03f8 1b0e          	add	a,(OFST+2,sp)
1481  03fa 2401          	jrnc	L222
1482  03fc 5c            	incw	x
1483  03fd               L222:
1484  03fd 1b0c          	add	a,(OFST+0,sp)
1485  03ff 2401          	jrnc	L422
1486  0401 5c            	incw	x
1487  0402               L422:
1488  0402 02            	rlwa	x,a
1489  0403 d60000        	ld	a,(L3_lcd_buf,x)
1490  0406 1a07          	or	a,(OFST-5,sp)
1491  0408 d70000        	ld	(L3_lcd_buf,x),a
1492                     ; 277 				write_byte(lcd_buf[shang_begin][i+Column],0);
1494  040b 7b06          	ld	a,(OFST-6,sp)
1495  040d cd0564        	call	LC004
1496  0410 1b0e          	add	a,(OFST+2,sp)
1497  0412 2401          	jrnc	L032
1498  0414 5c            	incw	x
1499  0415               L032:
1500  0415 1b0c          	add	a,(OFST+0,sp)
1501  0417 2401          	jrnc	L232
1502  0419 5c            	incw	x
1503  041a               L232:
1504  041a cd056a        	call	LC005
1506                     ; 272 			for(i=0;i<6;i++){
1508  041d 0c0c          	inc	(OFST+0,sp)
1512  041f 7b0c          	ld	a,(OFST+0,sp)
1513  0421 a106          	cp	a,#6
1514  0423 2593          	jrult	L354
1515                     ; 279 			if(onemorerow)	//多占一行
1517  0425 7b03          	ld	a,(OFST-9,sp)
1518  0427 2603cc04af    	jreq	L164
1519                     ; 281 				m8=(uint8_t)(shang_begin+1);
1521  042c 7b06          	ld	a,(OFST-6,sp)
1522  042e 4c            	inc	a
1523  042f 6b07          	ld	(OFST-5,sp),a
1525                     ; 282 				set_adress(Column,m8);
1527  0431 97            	ld	xl,a
1528  0432 7b0e          	ld	a,(OFST+2,sp)
1529  0434 95            	ld	xh,a
1530  0435 cd00e8        	call	L541_set_adress
1532                     ; 283 				for(i=0;i<6;i++){
1534  0438 0f0c          	clr	(OFST+0,sp)
1536  043a               L364:
1537                     ; 284 					lcd_buf[m8][i+Column]=0x00;	//清零
1539  043a 7b07          	ld	a,(OFST-5,sp)
1540  043c cd0564        	call	LC004
1541  043f 1b0e          	add	a,(OFST+2,sp)
1542  0441 2401          	jrnc	L632
1543  0443 5c            	incw	x
1544  0444               L632:
1545  0444 1b0c          	add	a,(OFST+0,sp)
1546  0446 2401          	jrnc	L042
1547  0448 5c            	incw	x
1548  0449               L042:
1549  0449 02            	rlwa	x,a
1550  044a 724f0000      	clr	(L3_lcd_buf,x)
1551                     ; 286 					m16=*(p+i)+((uint16_t)(*(p+6+i))<<8);
1553  044e 7b08          	ld	a,(OFST-4,sp)
1554  0450 97            	ld	xl,a
1555  0451 7b09          	ld	a,(OFST-3,sp)
1556  0453 1b0c          	add	a,(OFST+0,sp)
1557  0455 2401          	jrnc	L242
1558  0457 5c            	incw	x
1559  0458               L242:
1560  0458 02            	rlwa	x,a
1561  0459 f6            	ld	a,(x)
1562  045a 6b01          	ld	(OFST-11,sp),a
1564  045c 7b08          	ld	a,(OFST-4,sp)
1565  045e 97            	ld	xl,a
1566  045f 7b09          	ld	a,(OFST-3,sp)
1567  0461 1b0c          	add	a,(OFST+0,sp)
1568  0463 2401          	jrnc	L442
1569  0465 5c            	incw	x
1570  0466               L442:
1571  0466 cd0573        	call	LC006
1572  0469 4f            	clr	a
1573  046a 1b01          	add	a,(OFST-11,sp)
1574  046c 2401          	jrnc	L642
1575  046e 5c            	incw	x
1576  046f               L642:
1577  046f 02            	rlwa	x,a
1578  0470 1f0a          	ldw	(OFST-2,sp),x
1580                     ; 287 					m16<<=yushu_begin;
1582  0472 7b04          	ld	a,(OFST-8,sp)
1583  0474 2707          	jreq	L052
1584  0476               L252:
1585  0476 080b          	sll	(OFST-1,sp)
1586  0478 090a          	rlc	(OFST-2,sp)
1587  047a 4a            	dec	a
1588  047b 26f9          	jrne	L252
1589  047d               L052:
1591                     ; 288 					lcd_buf[m8][i+Column]|=(uint8_t)(m16>>8);
1593  047d 7b07          	ld	a,(OFST-5,sp)
1594  047f cd0564        	call	LC004
1595  0482 1b0e          	add	a,(OFST+2,sp)
1596  0484 2401          	jrnc	L452
1597  0486 5c            	incw	x
1598  0487               L452:
1599  0487 1b0c          	add	a,(OFST+0,sp)
1600  0489 2401          	jrnc	L652
1601  048b 5c            	incw	x
1602  048c               L652:
1603  048c 02            	rlwa	x,a
1604  048d d60000        	ld	a,(L3_lcd_buf,x)
1605  0490 1a0a          	or	a,(OFST-2,sp)
1606  0492 d70000        	ld	(L3_lcd_buf,x),a
1607                     ; 290 					write_byte(lcd_buf[m8][i+Column],0);					
1609  0495 7b07          	ld	a,(OFST-5,sp)
1610  0497 cd0564        	call	LC004
1611  049a 1b0e          	add	a,(OFST+2,sp)
1612  049c 2401          	jrnc	L262
1613  049e 5c            	incw	x
1614  049f               L262:
1615  049f 1b0c          	add	a,(OFST+0,sp)
1616  04a1 2401          	jrnc	L462
1617  04a3 5c            	incw	x
1618  04a4               L462:
1619  04a4 cd056a        	call	LC005
1621                     ; 283 				for(i=0;i<6;i++){
1623  04a7 0c0c          	inc	(OFST+0,sp)
1627  04a9 7b0c          	ld	a,(OFST+0,sp)
1628  04ab a106          	cp	a,#6
1629  04ad 258b          	jrult	L364
1630  04af               L164:
1631                     ; 293 			set_adress(Column,shang_end);
1633  04af 7b05          	ld	a,(OFST-7,sp)
1634  04b1 97            	ld	xl,a
1635  04b2 7b0e          	ld	a,(OFST+2,sp)
1636  04b4 95            	ld	xh,a
1637  04b5 cd00e8        	call	L541_set_adress
1639                     ; 294 			for(i=0;i<6;i++){
1641  04b8 0f0c          	clr	(OFST+0,sp)
1643  04ba               L174:
1644                     ; 295 				lcd_buf[shang_end][i+Column]&=mask_high[yushu_end];	//清零
1646  04ba 7b05          	ld	a,(OFST-7,sp)
1647  04bc cd0564        	call	LC004
1648  04bf 1b0e          	add	a,(OFST+2,sp)
1649  04c1 2401          	jrnc	L072
1650  04c3 5c            	incw	x
1651  04c4               L072:
1652  04c4 1b0c          	add	a,(OFST+0,sp)
1653  04c6 2401          	jrnc	L272
1654  04c8 5c            	incw	x
1655  04c9               L272:
1656  04c9 02            	rlwa	x,a
1657  04ca 7b02          	ld	a,(OFST-10,sp)
1658  04cc 905f          	clrw	y
1659  04ce 9097          	ld	yl,a
1660  04d0 d60000        	ld	a,(L3_lcd_buf,x)
1661  04d3 90d40008      	and	a,(_mask_high,y)
1662  04d7 d70000        	ld	(L3_lcd_buf,x),a
1663                     ; 304 				if(onemorerow)
1665  04da 7b03          	ld	a,(OFST-9,sp)
1666  04dc 270f          	jreq	L774
1667                     ; 306 					m16=(uint16_t)(*(p+6+i));					
1669  04de 7b08          	ld	a,(OFST-4,sp)
1670  04e0 97            	ld	xl,a
1671  04e1 7b09          	ld	a,(OFST-3,sp)
1672  04e3 1b0c          	add	a,(OFST+0,sp)
1673  04e5 2401          	jrnc	L472
1674  04e7 5c            	incw	x
1675  04e8               L472:
1676  04e8 cd0573        	call	LC006
1678  04eb 2021          	jra	L105
1679  04ed               L774:
1680                     ; 309 					m16=*(p+i)+((uint16_t)(*(p+6+i))<<8);					
1682  04ed 7b08          	ld	a,(OFST-4,sp)
1683  04ef 97            	ld	xl,a
1684  04f0 7b09          	ld	a,(OFST-3,sp)
1685  04f2 1b0c          	add	a,(OFST+0,sp)
1686  04f4 2401          	jrnc	L672
1687  04f6 5c            	incw	x
1688  04f7               L672:
1689  04f7 02            	rlwa	x,a
1690  04f8 f6            	ld	a,(x)
1691  04f9 6b01          	ld	(OFST-11,sp),a
1693  04fb 7b08          	ld	a,(OFST-4,sp)
1694  04fd 97            	ld	xl,a
1695  04fe 7b09          	ld	a,(OFST-3,sp)
1696  0500 1b0c          	add	a,(OFST+0,sp)
1697  0502 2401          	jrnc	L003
1698  0504 5c            	incw	x
1699  0505               L003:
1700  0505 ad6c          	call	LC006
1701  0507 4f            	clr	a
1702  0508 1b01          	add	a,(OFST-11,sp)
1703  050a 2401          	jrnc	L203
1704  050c 5c            	incw	x
1705  050d               L203:
1706  050d 02            	rlwa	x,a
1707  050e               L105:
1708  050e 1f0a          	ldw	(OFST-2,sp),x
1710                     ; 311 				m16<<=yushu_begin;
1712  0510 7b04          	ld	a,(OFST-8,sp)
1713  0512 2707          	jreq	L403
1714  0514               L603:
1715  0514 080b          	sll	(OFST-1,sp)
1716  0516 090a          	rlc	(OFST-2,sp)
1717  0518 4a            	dec	a
1718  0519 26f9          	jrne	L603
1719  051b               L403:
1721                     ; 312 				lcd_buf[shang_end][i+Column]|=(uint8_t)(m16>>8);
1723  051b 7b05          	ld	a,(OFST-7,sp)
1724  051d ad45          	call	LC004
1725  051f 1b0e          	add	a,(OFST+2,sp)
1726  0521 2401          	jrnc	L013
1727  0523 5c            	incw	x
1728  0524               L013:
1729  0524 1b0c          	add	a,(OFST+0,sp)
1730  0526 2401          	jrnc	L213
1731  0528 5c            	incw	x
1732  0529               L213:
1733  0529 02            	rlwa	x,a
1734  052a d60000        	ld	a,(L3_lcd_buf,x)
1735  052d 1a0a          	or	a,(OFST-2,sp)
1736  052f d70000        	ld	(L3_lcd_buf,x),a
1737                     ; 314 				write_byte(lcd_buf[shang_end][i+Column],0);
1739  0532 7b05          	ld	a,(OFST-7,sp)
1740  0534 ad2e          	call	LC004
1741  0536 1b0e          	add	a,(OFST+2,sp)
1742  0538 2401          	jrnc	L613
1743  053a 5c            	incw	x
1744  053b               L613:
1745  053b 1b0c          	add	a,(OFST+0,sp)
1746  053d 2401          	jrnc	L023
1747  053f 5c            	incw	x
1748  0540               L023:
1749  0540 ad28          	call	LC005
1751                     ; 294 			for(i=0;i<6;i++){
1753  0542 0c0c          	inc	(OFST+0,sp)
1757  0544 7b0c          	ld	a,(OFST+0,sp)
1758  0546 a106          	cp	a,#6
1759  0548 2403cc04ba    	jrult	L174
1760                     ; 316 			return 1;	//success
1762  054d a601          	ld	a,#1
1764  054f 2010          	jra	L223
1765  0551               L544:
1766                     ; 319 			i++;			
1768  0551 0c0c          	inc	(OFST+0,sp)
1770  0553               L144:
1771                     ; 255 	while(CharIndex[i]!=0)
1773  0553 7b0c          	ld	a,(OFST+0,sp)
1774  0555 5f            	clrw	x
1775  0556 97            	ld	xl,a
1776  0557 724d0000      	tnz	(_CharIndex,x)
1777  055b 2703cc0350    	jrne	L534
1778                     ; 322 	return 0;	//failed
1780  0560 4f            	clr	a
1782  0561               L223:
1784  0561 5b0e          	addw	sp,#14
1785  0563 81            	ret	
1786  0564               LC004:
1787  0564 97            	ld	xl,a
1788  0565 a654          	ld	a,#84
1789  0567 42            	mul	x,a
1790  0568 01            	rrwa	x,a
1791  0569 81            	ret	
1792  056a               LC005:
1793  056a 02            	rlwa	x,a
1794  056b d60000        	ld	a,(L3_lcd_buf,x)
1795  056e 5f            	clrw	x
1796  056f 95            	ld	xh,a
1797  0570 cc0038        	jp	L32_write_byte
1798  0573               LC006:
1799  0573 02            	rlwa	x,a
1800  0574 e606          	ld	a,(6,x)
1801  0576 5f            	clrw	x
1802  0577 97            	ld	xl,a
1803  0578 81            	ret	
1888                     ; 331 uint8_t LCD_Print(uint8_t Row,uint8_t Column,uint8_t *pString)
1888                     ; 332 {
1889                     	switch	.text
1890  0579               _LCD_Print:
1892  0579 89            	pushw	x
1893  057a 5204          	subw	sp,#4
1894       00000004      OFST:	set	4
1897                     ; 336 	assert_param(Row<48);
1899                     ; 337 	assert_param(Column<84);
1901                     ; 339 	r=Row;c=Column;
1903  057c 9e            	ld	a,xh
1904  057d 6b03          	ld	(OFST-1,sp),a
1908  057f 9f            	ld	a,xl
1909  0580 6b04          	ld	(OFST+0,sp),a
1911                     ; 340 	p=pString;
1913  0582 1e09          	ldw	x,(OFST+5,sp)
1915  0584 cc0614        	jra	L355
1916  0587               L745:
1917                     ; 343 		if(*p>0x80&&*p<0xff)		//汉字
1919  0587 a181          	cp	a,#129
1920  0589 2545          	jrult	L755
1922  058b a1ff          	cp	a,#255
1923  058d 2441          	jruge	L755
1924                     ; 345 			if(c>(84-12))	//换行
1926  058f 7b04          	ld	a,(OFST+0,sp)
1927  0591 a149          	cp	a,#73
1928  0593 2512          	jrult	L165
1929                     ; 347 				if(r<(48-12))			r+=12; 	//换下一行
1931  0595 7b03          	ld	a,(OFST-1,sp)
1932  0597 a124          	cp	a,#36
1933  0599 2406          	jruge	L365
1936  059b ab0c          	add	a,#12
1937  059d 6b03          	ld	(OFST-1,sp),a
1940  059f 2002          	jra	L565
1941  05a1               L365:
1942                     ; 348 				else							r=0;		//换到首行
1944  05a1 0f03          	clr	(OFST-1,sp)
1946  05a3               L565:
1947                     ; 350 				c=0;											//换到首列
1949  05a3 0f04          	clr	(OFST+0,sp)
1951  05a5 1e01          	ldw	x,(OFST-3,sp)
1952  05a7               L165:
1953                     ; 352 			if(print_oneChineseWord(r,c,p)==0)
1955  05a7 89            	pushw	x
1956  05a8 7b06          	ld	a,(OFST+2,sp)
1957  05aa 97            	ld	xl,a
1958  05ab 7b05          	ld	a,(OFST+1,sp)
1959  05ad 95            	ld	xh,a
1960  05ae cd0106        	call	L571_print_oneChineseWord
1962  05b1 4d            	tnz	a
1963  05b2 85            	popw	x
1964  05b3 260e          	jrne	L765
1965                     ; 353 				print_oneChineseWord(r,c,Chinese_ndef);
1967  05b5 ae0000        	ldw	x,#_Chinese_ndef
1968  05b8 89            	pushw	x
1969  05b9 7b06          	ld	a,(OFST+2,sp)
1970  05bb 97            	ld	xl,a
1971  05bc 7b05          	ld	a,(OFST+1,sp)
1972  05be 95            	ld	xh,a
1973  05bf cd0106        	call	L571_print_oneChineseWord
1975  05c2 85            	popw	x
1976  05c3               L765:
1977                     ; 355 			c+=12;
1979  05c3 7b04          	ld	a,(OFST+0,sp)
1980  05c5 ab0c          	add	a,#12
1981  05c7 6b04          	ld	(OFST+0,sp),a
1983                     ; 356 			p+=2;	//每个汉字占用2个字节空间
1985  05c9 1e01          	ldw	x,(OFST-3,sp)
1986  05cb 1c0002        	addw	x,#2
1988  05ce 2044          	jra	L355
1989  05d0               L755:
1990                     ; 357 		}else if(*p<0x81)	//字母
1992  05d0 a181          	cp	a,#129
1993  05d2 243d          	jruge	L375
1994                     ; 359 			if(c>(84-6))	//换行
1996  05d4 7b04          	ld	a,(OFST+0,sp)
1997  05d6 a14f          	cp	a,#79
1998  05d8 2510          	jrult	L575
1999                     ; 361 				if(r<(48-12))			r+=12; 	//换下一行
2001  05da 7b03          	ld	a,(OFST-1,sp)
2002  05dc a124          	cp	a,#36
2003  05de 2406          	jruge	L775
2006  05e0 ab0c          	add	a,#12
2007  05e2 6b03          	ld	(OFST-1,sp),a
2010  05e4 2002          	jra	L106
2011  05e6               L775:
2012                     ; 362 				else							r=0;		//换到首行
2014  05e6 0f03          	clr	(OFST-1,sp)
2016  05e8               L106:
2017                     ; 364 				c=0;											//换到首列
2019  05e8 0f04          	clr	(OFST+0,sp)
2021  05ea               L575:
2022                     ; 366 			if(print_oneChar(r,c,p)==0)
2024  05ea 89            	pushw	x
2025  05eb 7b06          	ld	a,(OFST+2,sp)
2026  05ed 97            	ld	xl,a
2027  05ee 7b05          	ld	a,(OFST+1,sp)
2028  05f0 95            	ld	xh,a
2029  05f1 cd0348        	call	L143_print_oneChar
2031  05f4 4d            	tnz	a
2032  05f5 85            	popw	x
2033  05f6 260e          	jrne	L306
2034                     ; 367 				print_oneChar(r,c,pChar_ndef);
2036  05f8 ce0000        	ldw	x,_pChar_ndef
2037  05fb 89            	pushw	x
2038  05fc 7b06          	ld	a,(OFST+2,sp)
2039  05fe 97            	ld	xl,a
2040  05ff 7b05          	ld	a,(OFST+1,sp)
2041  0601 95            	ld	xh,a
2042  0602 cd0348        	call	L143_print_oneChar
2044  0605 85            	popw	x
2045  0606               L306:
2046                     ; 369 			c+=6;
2048  0606 7b04          	ld	a,(OFST+0,sp)
2049  0608 ab06          	add	a,#6
2050  060a 6b04          	ld	(OFST+0,sp),a
2052                     ; 370 			p++;
2054  060c 1e01          	ldw	x,(OFST-3,sp)
2055  060e 5c            	incw	x
2057  060f 2003          	jra	L355
2058  0611               L375:
2059                     ; 371 		}else return 0;
2061  0611 4f            	clr	a
2063  0612 2009          	jra	L633
2064  0614               L355:
2065  0614 1f01          	ldw	(OFST-3,sp),x
2067                     ; 341 	while(*p!='\0')
2069  0616 f6            	ld	a,(x)
2070  0617 2703cc0587    	jrne	L745
2071                     ; 373 	return 1;
2073  061c 4c            	inc	a
2075  061d               L633:
2077  061d 5b06          	addw	sp,#6
2078  061f 81            	ret	
2081                     	switch	.const
2082  0010               L706_char_string:
2083  0010 00            	dc.b	0
2084  0011 00            	dc.b	0
2154                     ; 376 void LCD_Print_HexNum(uint8_t Row,uint8_t Column,uint8_t num)
2154                     ; 377 {
2155                     	switch	.text
2156  0620               _LCD_Print_HexNum:
2158  0620 89            	pushw	x
2159  0621 5203          	subw	sp,#3
2160       00000003      OFST:	set	3
2163                     ; 378 uint8_t char_string[2]={0,'\0'};
2165  0623 c60010        	ld	a,L706_char_string
2166  0626 6b01          	ld	(OFST-2,sp),a
2167  0628 c60011        	ld	a,L706_char_string+1
2168  062b 6b02          	ld	(OFST-1,sp),a
2169                     ; 380 	m8=(uint8_t)(num>>4);
2171  062d 7b08          	ld	a,(OFST+5,sp)
2172  062f 4e            	swap	a
2173  0630 a40f          	and	a,#15
2174  0632 6b03          	ld	(OFST+0,sp),a
2176                     ; 381 	if(m8>9){
2178  0634 a10a          	cp	a,#10
2179  0636 2504          	jrult	L746
2180                     ; 382 		char_string[0]=(uint8_t)('A'+m8-10);		
2182  0638 ab37          	add	a,#55
2184  063a 2002          	jra	L156
2185  063c               L746:
2186                     ; 384 		char_string[0]=(uint8_t)('0'+m8);		
2188  063c ab30          	add	a,#48
2189  063e               L156:
2190  063e 6b01          	ld	(OFST-2,sp),a
2192                     ; 386 	print_oneChar(Row,Column,&char_string[0]);
2194  0640 96            	ldw	x,sp
2195  0641 5c            	incw	x
2196  0642 89            	pushw	x
2197  0643 7b07          	ld	a,(OFST+4,sp)
2198  0645 97            	ld	xl,a
2199  0646 7b06          	ld	a,(OFST+3,sp)
2200  0648 95            	ld	xh,a
2201  0649 cd0348        	call	L143_print_oneChar
2203  064c 85            	popw	x
2204                     ; 387 	m8=(uint8_t)(num&0x0f);
2206  064d 7b08          	ld	a,(OFST+5,sp)
2207  064f a40f          	and	a,#15
2208  0651 6b03          	ld	(OFST+0,sp),a
2210                     ; 388 	if(m8>9){
2212  0653 a10a          	cp	a,#10
2213  0655 2504          	jrult	L356
2214                     ; 389 		char_string[0]=(uint8_t)('A'+m8-10);
2216  0657 ab37          	add	a,#55
2218  0659 2002          	jra	L556
2219  065b               L356:
2220                     ; 391 		char_string[0]=(uint8_t)('0'+m8);
2222  065b ab30          	add	a,#48
2223  065d               L556:
2224  065d 6b01          	ld	(OFST-2,sp),a
2226                     ; 393 	print_oneChar(Row,(uint8_t)(Column+6),&char_string[0]);	
2228  065f 96            	ldw	x,sp
2229  0660 5c            	incw	x
2230  0661 89            	pushw	x
2231  0662 7b07          	ld	a,(OFST+4,sp)
2232  0664 ab06          	add	a,#6
2233  0666 97            	ld	xl,a
2234  0667 7b06          	ld	a,(OFST+3,sp)
2235  0669 95            	ld	xh,a
2236  066a cd0348        	call	L143_print_oneChar
2238  066d 85            	popw	x
2239                     ; 394 }
2242  066e 5b05          	addw	sp,#5
2243  0670 81            	ret	
2307                     ; 398 void LCD_Print_0to9DecNum(uint8_t Row,uint8_t Column,uint8_t num)
2307                     ; 399 {
2308                     	switch	.text
2309  0671               _LCD_Print_0to9DecNum:
2311  0671 89            	pushw	x
2312  0672 89            	pushw	x
2313       00000002      OFST:	set	2
2316                     ; 401 	num&=0x0f;	//实际应为num%=10,此处为加快效率采用了不严格限定
2318  0673 7b07          	ld	a,(OFST+5,sp)
2319  0675 a40f          	and	a,#15
2320  0677 6b07          	ld	(OFST+5,sp),a
2321                     ; 402 	char_string[0]=(uint8_t)('0'+num);
2323  0679 ab30          	add	a,#48
2324  067b 6b01          	ld	(OFST-1,sp),a
2326                     ; 403 	char_string[1]='\0';
2328  067d 0f02          	clr	(OFST+0,sp)
2330                     ; 404 	print_oneChar(Row,Column,&char_string[0]);
2332  067f 96            	ldw	x,sp
2333  0680 5c            	incw	x
2334  0681 89            	pushw	x
2335  0682 7b06          	ld	a,(OFST+4,sp)
2336  0684 97            	ld	xl,a
2337  0685 7b05          	ld	a,(OFST+3,sp)
2338  0687 95            	ld	xh,a
2339  0688 cd0348        	call	L143_print_oneChar
2341  068b 85            	popw	x
2342                     ; 405 }
2345  068c 5b04          	addw	sp,#4
2346  068e 81            	ret	
2392                     	xdef	_LCD_Print_0to9DecNum
2393                     	xdef	_LCD_Print_HexNum
2394                     	xdef	_LCD_Print
2395                     	xdef	_Nokia5110_Init
2396                     	xdef	_LCD_Clear
2397                     	xdef	_Nokia5110_PortInit
2398                     	xdef	_mask_high
2399                     	xdef	_mask_low
2400                     	switch	.bss
2401  0000               L3_lcd_buf:
2402  0000 000000000000  	ds.b	504
2403                     	xref	_FontLib
2404                     	xref.b	_FontIndex
2405                     	xref	_CharLib
2406                     	xref	_CharIndex
2407                     	xref	_Chinese_ndef
2408                     	xref	_pChar_ndef
2409                     	xref	_delay_ms
2410                     	xref	_GPIO_Init
2411                     	xref.b	c_x
2431                     	xref	c_smodx
2432                     	xref	c_sdivx
2433                     	xref	c_imul
2434                     	end
