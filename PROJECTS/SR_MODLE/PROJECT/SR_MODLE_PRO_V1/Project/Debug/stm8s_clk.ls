   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
  20                     .const:	section	.text
  21  0000               _HSIDivFactor:
  22  0000 01            	dc.b	1
  23  0001 02            	dc.b	2
  24  0002 04            	dc.b	4
  25  0003 08            	dc.b	8
  26  0004               _CLKPrescTable:
  27  0004 01            	dc.b	1
  28  0005 02            	dc.b	2
  29  0006 04            	dc.b	4
  30  0007 08            	dc.b	8
  31  0008 0a            	dc.b	10
  32  0009 10            	dc.b	16
  33  000a 14            	dc.b	20
  34  000b 28            	dc.b	40
  63                     ; 72 void CLK_DeInit(void)
  63                     ; 73 {
  65                     .text:	section	.text,new
  66  0000               _CLK_DeInit:
  70                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  72  0000 350150c0      	mov	20672,#1
  73                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  75  0004 725f50c1      	clr	20673
  76                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  78  0008 35e150c4      	mov	20676,#225
  79                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  81  000c 725f50c5      	clr	20677
  82                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  84  0010 351850c6      	mov	20678,#24
  85                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  87  0014 35ff50c7      	mov	20679,#255
  88                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  90  0018 35ff50ca      	mov	20682,#255
  91                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  93  001c 725f50c8      	clr	20680
  94                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  96  0020 725f50c9      	clr	20681
  98  0024               L52:
  99                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
 101  0024 720050c9fb    	btjt	20681,#0,L52
 102                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 104  0029 725f50c9      	clr	20681
 105                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 107  002d 725f50cc      	clr	20684
 108                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 110  0031 725f50cd      	clr	20685
 111                     ; 88 }
 114  0035 81            	ret	
 170                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 170                     ; 100 {
 171                     .text:	section	.text,new
 172  0000               _CLK_FastHaltWakeUpCmd:
 176                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 178                     ; 104   if (NewState != DISABLE)
 180  0000 4d            	tnz	a
 181  0001 2705          	jreq	L75
 182                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 184  0003 721450c0      	bset	20672,#2
 187  0007 81            	ret	
 188  0008               L75:
 189                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 191  0008 721550c0      	bres	20672,#2
 192                     ; 114 }
 195  000c 81            	ret	
 230                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 230                     ; 122 {
 231                     .text:	section	.text,new
 232  0000               _CLK_HSECmd:
 236                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 238                     ; 126   if (NewState != DISABLE)
 240  0000 4d            	tnz	a
 241  0001 2705          	jreq	L101
 242                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 244  0003 721050c1      	bset	20673,#0
 247  0007 81            	ret	
 248  0008               L101:
 249                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 251  0008 721150c1      	bres	20673,#0
 252                     ; 136 }
 255  000c 81            	ret	
 290                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 290                     ; 144 {
 291                     .text:	section	.text,new
 292  0000               _CLK_HSICmd:
 296                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 298                     ; 148   if (NewState != DISABLE)
 300  0000 4d            	tnz	a
 301  0001 2705          	jreq	L321
 302                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 304  0003 721050c0      	bset	20672,#0
 307  0007 81            	ret	
 308  0008               L321:
 309                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 311  0008 721150c0      	bres	20672,#0
 312                     ; 158 }
 315  000c 81            	ret	
 350                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 350                     ; 167 {
 351                     .text:	section	.text,new
 352  0000               _CLK_LSICmd:
 356                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 358                     ; 171   if (NewState != DISABLE)
 360  0000 4d            	tnz	a
 361  0001 2705          	jreq	L541
 362                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 364  0003 721650c0      	bset	20672,#3
 367  0007 81            	ret	
 368  0008               L541:
 369                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 371  0008 721750c0      	bres	20672,#3
 372                     ; 181 }
 375  000c 81            	ret	
 410                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 410                     ; 190 {
 411                     .text:	section	.text,new
 412  0000               _CLK_CCOCmd:
 416                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 418                     ; 194   if (NewState != DISABLE)
 420  0000 4d            	tnz	a
 421  0001 2705          	jreq	L761
 422                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 424  0003 721050c9      	bset	20681,#0
 427  0007 81            	ret	
 428  0008               L761:
 429                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 431  0008 721150c9      	bres	20681,#0
 432                     ; 204 }
 435  000c 81            	ret	
 470                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 470                     ; 214 {
 471                     .text:	section	.text,new
 472  0000               _CLK_ClockSwitchCmd:
 476                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 478                     ; 218   if (NewState != DISABLE )
 480  0000 4d            	tnz	a
 481  0001 2705          	jreq	L112
 482                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 484  0003 721250c5      	bset	20677,#1
 487  0007 81            	ret	
 488  0008               L112:
 489                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 491  0008 721350c5      	bres	20677,#1
 492                     ; 228 }
 495  000c 81            	ret	
 531                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 531                     ; 239 {
 532                     .text:	section	.text,new
 533  0000               _CLK_SlowActiveHaltWakeUpCmd:
 537                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 539                     ; 243   if (NewState != DISABLE)
 541  0000 4d            	tnz	a
 542  0001 2705          	jreq	L332
 543                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 545  0003 721a50c0      	bset	20672,#5
 548  0007 81            	ret	
 549  0008               L332:
 550                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 552  0008 721b50c0      	bres	20672,#5
 553                     ; 253 }
 556  000c 81            	ret	
 715                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 715                     ; 264 {
 716                     .text:	section	.text,new
 717  0000               _CLK_PeripheralClockConfig:
 719  0000 89            	pushw	x
 720       00000000      OFST:	set	0
 723                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 725                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 727                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 729  0001 9e            	ld	a,xh
 730  0002 a510          	bcp	a,#16
 731  0004 2630          	jrne	L123
 732                     ; 271     if (NewState != DISABLE)
 734  0006 7b02          	ld	a,(OFST+2,sp)
 735  0008 2714          	jreq	L323
 736                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 738  000a 7b01          	ld	a,(OFST+1,sp)
 739  000c a40f          	and	a,#15
 740  000e 5f            	clrw	x
 741  000f 97            	ld	xl,a
 742  0010 a601          	ld	a,#1
 743  0012 5d            	tnzw	x
 744  0013 2704          	jreq	L62
 745  0015               L03:
 746  0015 48            	sll	a
 747  0016 5a            	decw	x
 748  0017 26fc          	jrne	L03
 749  0019               L62:
 750  0019 ca50c7        	or	a,20679
 752  001c 2013          	jp	LC002
 753  001e               L323:
 754                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 756  001e 7b01          	ld	a,(OFST+1,sp)
 757  0020 a40f          	and	a,#15
 758  0022 5f            	clrw	x
 759  0023 97            	ld	xl,a
 760  0024 a601          	ld	a,#1
 761  0026 5d            	tnzw	x
 762  0027 2704          	jreq	L23
 763  0029               L43:
 764  0029 48            	sll	a
 765  002a 5a            	decw	x
 766  002b 26fc          	jrne	L43
 767  002d               L23:
 768  002d 43            	cpl	a
 769  002e c450c7        	and	a,20679
 770  0031               LC002:
 771  0031 c750c7        	ld	20679,a
 772  0034 202e          	jra	L723
 773  0036               L123:
 774                     ; 284     if (NewState != DISABLE)
 776  0036 7b02          	ld	a,(OFST+2,sp)
 777  0038 2714          	jreq	L133
 778                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 780  003a 7b01          	ld	a,(OFST+1,sp)
 781  003c a40f          	and	a,#15
 782  003e 5f            	clrw	x
 783  003f 97            	ld	xl,a
 784  0040 a601          	ld	a,#1
 785  0042 5d            	tnzw	x
 786  0043 2704          	jreq	L63
 787  0045               L04:
 788  0045 48            	sll	a
 789  0046 5a            	decw	x
 790  0047 26fc          	jrne	L04
 791  0049               L63:
 792  0049 ca50ca        	or	a,20682
 794  004c 2013          	jp	LC001
 795  004e               L133:
 796                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 798  004e 7b01          	ld	a,(OFST+1,sp)
 799  0050 a40f          	and	a,#15
 800  0052 5f            	clrw	x
 801  0053 97            	ld	xl,a
 802  0054 a601          	ld	a,#1
 803  0056 5d            	tnzw	x
 804  0057 2704          	jreq	L24
 805  0059               L44:
 806  0059 48            	sll	a
 807  005a 5a            	decw	x
 808  005b 26fc          	jrne	L44
 809  005d               L24:
 810  005d 43            	cpl	a
 811  005e c450ca        	and	a,20682
 812  0061               LC001:
 813  0061 c750ca        	ld	20682,a
 814  0064               L723:
 815                     ; 295 }
 818  0064 85            	popw	x
 819  0065 81            	ret	
1007                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1007                     ; 310 {
1008                     .text:	section	.text,new
1009  0000               _CLK_ClockSwitchConfig:
1011  0000 89            	pushw	x
1012  0001 5204          	subw	sp,#4
1013       00000004      OFST:	set	4
1016                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1018  0003 aeffff        	ldw	x,#65535
1019  0006 1f03          	ldw	(OFST-1,sp),x
1021                     ; 313   ErrorStatus Swif = ERROR;
1023                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1025                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1027                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1029                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1031                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1033  0008 c650c3        	ld	a,20675
1034  000b 6b01          	ld	(OFST-3,sp),a
1036                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1038  000d 7b05          	ld	a,(OFST+1,sp)
1039  000f 4a            	dec	a
1040  0010 263d          	jrne	L544
1041                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1043  0012 721250c5      	bset	20677,#1
1044                     ; 331     if (ITState != DISABLE)
1046  0016 7b09          	ld	a,(OFST+5,sp)
1047  0018 2706          	jreq	L744
1048                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1050  001a 721450c5      	bset	20677,#2
1052  001e 2004          	jra	L154
1053  0020               L744:
1054                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1056  0020 721550c5      	bres	20677,#2
1057  0024               L154:
1058                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1060  0024 7b06          	ld	a,(OFST+2,sp)
1061  0026 c750c4        	ld	20676,a
1063  0029 2003          	jra	L754
1064  002b               L354:
1065                     ; 346       DownCounter--;
1067  002b 5a            	decw	x
1068  002c 1f03          	ldw	(OFST-1,sp),x
1070  002e               L754:
1071                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1073  002e 720150c504    	btjf	20677,#0,L364
1075  0033 1e03          	ldw	x,(OFST-1,sp)
1076  0035 26f4          	jrne	L354
1077  0037               L364:
1078                     ; 349     if(DownCounter != 0)
1080  0037 1e03          	ldw	x,(OFST-1,sp)
1081                     ; 351       Swif = SUCCESS;
1083  0039 263d          	jrne	LC004
1084  003b               L564:
1085                     ; 355       Swif = ERROR;
1088  003b 0f02          	clr	(OFST-2,sp)
1090  003d               L174:
1091                     ; 390   if(Swif != ERROR)
1093  003d 275d          	jreq	L515
1094                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1096  003f 7b0a          	ld	a,(OFST+6,sp)
1097  0041 263b          	jrne	L715
1099  0043 7b01          	ld	a,(OFST-3,sp)
1100  0045 a1e1          	cp	a,#225
1101  0047 2635          	jrne	L715
1102                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1104  0049 721150c0      	bres	20672,#0
1106  004d 204d          	jra	L515
1107  004f               L544:
1108                     ; 361     if (ITState != DISABLE)
1110  004f 7b09          	ld	a,(OFST+5,sp)
1111  0051 2706          	jreq	L374
1112                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1114  0053 721450c5      	bset	20677,#2
1116  0057 2004          	jra	L574
1117  0059               L374:
1118                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1120  0059 721550c5      	bres	20677,#2
1121  005d               L574:
1122                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1124  005d 7b06          	ld	a,(OFST+2,sp)
1125  005f c750c4        	ld	20676,a
1127  0062 2003          	jra	L305
1128  0064               L774:
1129                     ; 376       DownCounter--;
1131  0064 5a            	decw	x
1132  0065 1f03          	ldw	(OFST-1,sp),x
1134  0067               L305:
1135                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1137  0067 720750c504    	btjf	20677,#3,L705
1139  006c 1e03          	ldw	x,(OFST-1,sp)
1140  006e 26f4          	jrne	L774
1141  0070               L705:
1142                     ; 379     if(DownCounter != 0)
1144  0070 1e03          	ldw	x,(OFST-1,sp)
1145  0072 27c7          	jreq	L564
1146                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1148  0074 721250c5      	bset	20677,#1
1149                     ; 383       Swif = SUCCESS;
1151  0078               LC004:
1153  0078 a601          	ld	a,#1
1154  007a 6b02          	ld	(OFST-2,sp),a
1157  007c 20bf          	jra	L174
1158                     ; 387       Swif = ERROR;
1159  007e               L715:
1160                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1162  007e 7b0a          	ld	a,(OFST+6,sp)
1163  0080 260c          	jrne	L325
1165  0082 7b01          	ld	a,(OFST-3,sp)
1166  0084 a1d2          	cp	a,#210
1167  0086 2606          	jrne	L325
1168                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1170  0088 721750c0      	bres	20672,#3
1172  008c 200e          	jra	L515
1173  008e               L325:
1174                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1176  008e 7b0a          	ld	a,(OFST+6,sp)
1177  0090 260a          	jrne	L515
1179  0092 7b01          	ld	a,(OFST-3,sp)
1180  0094 a1b4          	cp	a,#180
1181  0096 2604          	jrne	L515
1182                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1184  0098 721150c1      	bres	20673,#0
1185  009c               L515:
1186                     ; 406   return(Swif);
1188  009c 7b02          	ld	a,(OFST-2,sp)
1191  009e 5b06          	addw	sp,#6
1192  00a0 81            	ret	
1330                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1330                     ; 416 {
1331                     .text:	section	.text,new
1332  0000               _CLK_HSIPrescalerConfig:
1334  0000 88            	push	a
1335       00000000      OFST:	set	0
1338                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1340                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1342  0001 c650c6        	ld	a,20678
1343  0004 a4e7          	and	a,#231
1344  0006 c750c6        	ld	20678,a
1345                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1347  0009 c650c6        	ld	a,20678
1348  000c 1a01          	or	a,(OFST+1,sp)
1349  000e c750c6        	ld	20678,a
1350                     ; 425 }
1353  0011 84            	pop	a
1354  0012 81            	ret	
1489                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1489                     ; 437 {
1490                     .text:	section	.text,new
1491  0000               _CLK_CCOConfig:
1493  0000 88            	push	a
1494       00000000      OFST:	set	0
1497                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1499                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1501  0001 c650c9        	ld	a,20681
1502  0004 a4e1          	and	a,#225
1503  0006 c750c9        	ld	20681,a
1504                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1506  0009 c650c9        	ld	a,20681
1507  000c 1a01          	or	a,(OFST+1,sp)
1508  000e c750c9        	ld	20681,a
1509                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1511  0011 721050c9      	bset	20681,#0
1512                     ; 449 }
1515  0015 84            	pop	a
1516  0016 81            	ret	
1581                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1581                     ; 460 {
1582                     .text:	section	.text,new
1583  0000               _CLK_ITConfig:
1585  0000 89            	pushw	x
1586       00000000      OFST:	set	0
1589                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1591                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1593                     ; 465   if (NewState != DISABLE)
1595  0001 9f            	ld	a,xl
1596  0002 4d            	tnz	a
1597  0003 2715          	jreq	L527
1598                     ; 467     switch (CLK_IT)
1600  0005 9e            	ld	a,xh
1602                     ; 475     default:
1602                     ; 476       break;
1603  0006 a00c          	sub	a,#12
1604  0008 270a          	jreq	L166
1605  000a a010          	sub	a,#16
1606  000c 2620          	jrne	L337
1607                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1607                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
1609  000e 721450c5      	bset	20677,#2
1610                     ; 471       break;
1612  0012 201a          	jra	L337
1613  0014               L166:
1614                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1614                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
1616  0014 721450c8      	bset	20680,#2
1617                     ; 474       break;
1619  0018 2014          	jra	L337
1620                     ; 475     default:
1620                     ; 476       break;
1623  001a               L527:
1624                     ; 481     switch (CLK_IT)
1626  001a 7b01          	ld	a,(OFST+1,sp)
1628                     ; 489     default:
1628                     ; 490       break;
1629  001c a00c          	sub	a,#12
1630  001e 270a          	jreq	L766
1631  0020 a010          	sub	a,#16
1632  0022 260a          	jrne	L337
1633                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1633                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1635  0024 721550c5      	bres	20677,#2
1636                     ; 485       break;
1638  0028 2004          	jra	L337
1639  002a               L766:
1640                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1640                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1642  002a 721550c8      	bres	20680,#2
1643                     ; 488       break;
1644  002e               L337:
1645                     ; 493 }
1648  002e 85            	popw	x
1649  002f 81            	ret	
1650                     ; 489     default:
1650                     ; 490       break;
1686                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1686                     ; 501 {
1687                     .text:	section	.text,new
1688  0000               _CLK_SYSCLKConfig:
1690  0000 88            	push	a
1691       00000000      OFST:	set	0
1694                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1696                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1698  0001 a580          	bcp	a,#128
1699  0003 260e          	jrne	L757
1700                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1702  0005 c650c6        	ld	a,20678
1703  0008 a4e7          	and	a,#231
1704  000a c750c6        	ld	20678,a
1705                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1707  000d 7b01          	ld	a,(OFST+1,sp)
1708  000f a418          	and	a,#24
1710  0011 200c          	jra	L167
1711  0013               L757:
1712                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1714  0013 c650c6        	ld	a,20678
1715  0016 a4f8          	and	a,#248
1716  0018 c750c6        	ld	20678,a
1717                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1719  001b 7b01          	ld	a,(OFST+1,sp)
1720  001d a407          	and	a,#7
1721  001f               L167:
1722  001f ca50c6        	or	a,20678
1723  0022 c750c6        	ld	20678,a
1724                     ; 515 }
1727  0025 84            	pop	a
1728  0026 81            	ret	
1784                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1784                     ; 524 {
1785                     .text:	section	.text,new
1786  0000               _CLK_SWIMConfig:
1790                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1792                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1794  0000 4d            	tnz	a
1795  0001 2705          	jreq	L1101
1796                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1798  0003 721050cd      	bset	20685,#0
1801  0007 81            	ret	
1802  0008               L1101:
1803                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1805  0008 721150cd      	bres	20685,#0
1806                     ; 538 }
1809  000c 81            	ret	
1833                     ; 547 void CLK_ClockSecuritySystemEnable(void)
1833                     ; 548 {
1834                     .text:	section	.text,new
1835  0000               _CLK_ClockSecuritySystemEnable:
1839                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
1841  0000 721050c8      	bset	20680,#0
1842                     ; 551 }
1845  0004 81            	ret	
1870                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1870                     ; 560 {
1871                     .text:	section	.text,new
1872  0000               _CLK_GetSYSCLKSource:
1876                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
1878  0000 c650c3        	ld	a,20675
1881  0003 81            	ret	
1944                     ; 569 uint32_t CLK_GetClockFreq(void)
1944                     ; 570 {
1945                     .text:	section	.text,new
1946  0000               _CLK_GetClockFreq:
1948  0000 5209          	subw	sp,#9
1949       00000009      OFST:	set	9
1952                     ; 571   uint32_t clockfrequency = 0;
1954                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
1956                     ; 573   uint8_t tmp = 0, presc = 0;
1960                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
1962  0002 c650c3        	ld	a,20675
1963  0005 6b09          	ld	(OFST+0,sp),a
1965                     ; 578   if (clocksource == CLK_SOURCE_HSI)
1967  0007 a1e1          	cp	a,#225
1968  0009 2634          	jrne	L7601
1969                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
1971  000b c650c6        	ld	a,20678
1972  000e a418          	and	a,#24
1973  0010 44            	srl	a
1974  0011 44            	srl	a
1975  0012 44            	srl	a
1977                     ; 581     tmp = (uint8_t)(tmp >> 3);
1980                     ; 582     presc = HSIDivFactor[tmp];
1982  0013 5f            	clrw	x
1983  0014 97            	ld	xl,a
1984  0015 d60000        	ld	a,(_HSIDivFactor,x)
1985  0018 6b09          	ld	(OFST+0,sp),a
1987                     ; 583     clockfrequency = HSI_VALUE / presc;
1989  001a b703          	ld	c_lreg+3,a
1990  001c 3f02          	clr	c_lreg+2
1991  001e 3f01          	clr	c_lreg+1
1992  0020 3f00          	clr	c_lreg
1993  0022 96            	ldw	x,sp
1994  0023 5c            	incw	x
1995  0024 cd0000        	call	c_rtol
1998  0027 ae2400        	ldw	x,#9216
1999  002a bf02          	ldw	c_lreg+2,x
2000  002c ae00f4        	ldw	x,#244
2001  002f bf00          	ldw	c_lreg,x
2002  0031 96            	ldw	x,sp
2003  0032 5c            	incw	x
2004  0033 cd0000        	call	c_ludv
2006  0036 96            	ldw	x,sp
2007  0037 1c0005        	addw	x,#OFST-4
2008  003a cd0000        	call	c_rtol
2012  003d 2018          	jra	L1701
2013  003f               L7601:
2014                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2016  003f a1d2          	cp	a,#210
2017  0041 260a          	jrne	L3701
2018                     ; 587     clockfrequency = LSI_VALUE;
2020  0043 aef400        	ldw	x,#62464
2021  0046 1f07          	ldw	(OFST-2,sp),x
2022  0048 ae0001        	ldw	x,#1
2024  004b 2008          	jp	LC005
2025  004d               L3701:
2026                     ; 591     clockfrequency = HSE_VALUE;
2028  004d ae2400        	ldw	x,#9216
2029  0050 1f07          	ldw	(OFST-2,sp),x
2030  0052 ae00f4        	ldw	x,#244
2031  0055               LC005:
2032  0055 1f05          	ldw	(OFST-4,sp),x
2034  0057               L1701:
2035                     ; 594   return((uint32_t)clockfrequency);
2037  0057 96            	ldw	x,sp
2038  0058 1c0005        	addw	x,#OFST-4
2039  005b cd0000        	call	c_ltor
2043  005e 5b09          	addw	sp,#9
2044  0060 81            	ret	
2143                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2143                     ; 605 {
2144                     .text:	section	.text,new
2145  0000               _CLK_AdjustHSICalibrationValue:
2147  0000 88            	push	a
2148       00000000      OFST:	set	0
2151                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2153                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2155  0001 c650cc        	ld	a,20684
2156  0004 a4f8          	and	a,#248
2157  0006 1a01          	or	a,(OFST+1,sp)
2158  0008 c750cc        	ld	20684,a
2159                     ; 611 }
2162  000b 84            	pop	a
2163  000c 81            	ret	
2187                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2187                     ; 623 {
2188                     .text:	section	.text,new
2189  0000               _CLK_SYSCLKEmergencyClear:
2193                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2195  0000 721150c5      	bres	20677,#0
2196                     ; 625 }
2199  0004 81            	ret	
2352                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2352                     ; 635 {
2353                     .text:	section	.text,new
2354  0000               _CLK_GetFlagStatus:
2356  0000 89            	pushw	x
2357  0001 5203          	subw	sp,#3
2358       00000003      OFST:	set	3
2361                     ; 636   uint16_t statusreg = 0;
2363                     ; 637   uint8_t tmpreg = 0;
2365                     ; 638   FlagStatus bitstatus = RESET;
2367                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2369                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2371  0003 01            	rrwa	x,a
2372  0004 4f            	clr	a
2373  0005 02            	rlwa	x,a
2374  0006 1f01          	ldw	(OFST-2,sp),x
2376                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2378  0008 a30100        	cpw	x,#256
2379  000b 2605          	jrne	L1421
2380                     ; 649     tmpreg = CLK->ICKR;
2382  000d c650c0        	ld	a,20672
2384  0010 2021          	jra	L3421
2385  0012               L1421:
2386                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2388  0012 a30200        	cpw	x,#512
2389  0015 2605          	jrne	L5421
2390                     ; 653     tmpreg = CLK->ECKR;
2392  0017 c650c1        	ld	a,20673
2394  001a 2017          	jra	L3421
2395  001c               L5421:
2396                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2398  001c a30300        	cpw	x,#768
2399  001f 2605          	jrne	L1521
2400                     ; 657     tmpreg = CLK->SWCR;
2402  0021 c650c5        	ld	a,20677
2404  0024 200d          	jra	L3421
2405  0026               L1521:
2406                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2408  0026 a30400        	cpw	x,#1024
2409  0029 2605          	jrne	L5521
2410                     ; 661     tmpreg = CLK->CSSR;
2412  002b c650c8        	ld	a,20680
2414  002e 2003          	jra	L3421
2415  0030               L5521:
2416                     ; 665     tmpreg = CLK->CCOR;
2418  0030 c650c9        	ld	a,20681
2419  0033               L3421:
2420  0033 6b03          	ld	(OFST+0,sp),a
2422                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2424  0035 7b05          	ld	a,(OFST+2,sp)
2425  0037 1503          	bcp	a,(OFST+0,sp)
2426  0039 2704          	jreq	L1621
2427                     ; 670     bitstatus = SET;
2429  003b a601          	ld	a,#1
2432  003d 2001          	jra	L3621
2433  003f               L1621:
2434                     ; 674     bitstatus = RESET;
2436  003f 4f            	clr	a
2438  0040               L3621:
2439                     ; 678   return((FlagStatus)bitstatus);
2443  0040 5b05          	addw	sp,#5
2444  0042 81            	ret	
2490                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2490                     ; 688 {
2491                     .text:	section	.text,new
2492  0000               _CLK_GetITStatus:
2494  0000 88            	push	a
2495  0001 88            	push	a
2496       00000001      OFST:	set	1
2499                     ; 689   ITStatus bitstatus = RESET;
2501                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
2503                     ; 694   if (CLK_IT == CLK_IT_SWIF)
2505  0002 a11c          	cp	a,#28
2506  0004 2609          	jrne	L7031
2507                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2509  0006 c450c5        	and	a,20677
2510  0009 a10c          	cp	a,#12
2511  000b 260f          	jrne	L7131
2512                     ; 699       bitstatus = SET;
2514  000d 2009          	jp	LC007
2515                     ; 703       bitstatus = RESET;
2516  000f               L7031:
2517                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2519  000f c650c8        	ld	a,20680
2520  0012 1402          	and	a,(OFST+1,sp)
2521  0014 a10c          	cp	a,#12
2522  0016 2604          	jrne	L7131
2523                     ; 711       bitstatus = SET;
2525  0018               LC007:
2527  0018 a601          	ld	a,#1
2530  001a 2001          	jra	L5131
2531  001c               L7131:
2532                     ; 715       bitstatus = RESET;
2535  001c 4f            	clr	a
2537  001d               L5131:
2538                     ; 720   return bitstatus;
2542  001d 85            	popw	x
2543  001e 81            	ret	
2579                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2579                     ; 730 {
2580                     .text:	section	.text,new
2581  0000               _CLK_ClearITPendingBit:
2585                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
2587                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2589  0000 a10c          	cp	a,#12
2590  0002 2605          	jrne	L1431
2591                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2593  0004 721750c8      	bres	20680,#3
2596  0008 81            	ret	
2597  0009               L1431:
2598                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2600  0009 721750c5      	bres	20677,#3
2601                     ; 745 }
2604  000d 81            	ret	
2639                     	xdef	_CLKPrescTable
2640                     	xdef	_HSIDivFactor
2641                     	xdef	_CLK_ClearITPendingBit
2642                     	xdef	_CLK_GetITStatus
2643                     	xdef	_CLK_GetFlagStatus
2644                     	xdef	_CLK_GetSYSCLKSource
2645                     	xdef	_CLK_GetClockFreq
2646                     	xdef	_CLK_AdjustHSICalibrationValue
2647                     	xdef	_CLK_SYSCLKEmergencyClear
2648                     	xdef	_CLK_ClockSecuritySystemEnable
2649                     	xdef	_CLK_SWIMConfig
2650                     	xdef	_CLK_SYSCLKConfig
2651                     	xdef	_CLK_ITConfig
2652                     	xdef	_CLK_CCOConfig
2653                     	xdef	_CLK_HSIPrescalerConfig
2654                     	xdef	_CLK_ClockSwitchConfig
2655                     	xdef	_CLK_PeripheralClockConfig
2656                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2657                     	xdef	_CLK_FastHaltWakeUpCmd
2658                     	xdef	_CLK_ClockSwitchCmd
2659                     	xdef	_CLK_CCOCmd
2660                     	xdef	_CLK_LSICmd
2661                     	xdef	_CLK_HSICmd
2662                     	xdef	_CLK_HSECmd
2663                     	xdef	_CLK_DeInit
2664                     	xref.b	c_lreg
2665                     	xref.b	c_x
2684                     	xref	c_ltor
2685                     	xref	c_ludv
2686                     	xref	c_rtol
2687                     	end
