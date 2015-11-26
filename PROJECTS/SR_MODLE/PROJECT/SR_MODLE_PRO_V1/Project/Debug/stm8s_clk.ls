   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
  16                     .const:	section	.text
  17  0000               _HSIDivFactor:
  18  0000 01            	dc.b	1
  19  0001 02            	dc.b	2
  20  0002 04            	dc.b	4
  21  0003 08            	dc.b	8
  22  0004               _CLKPrescTable:
  23  0004 01            	dc.b	1
  24  0005 02            	dc.b	2
  25  0006 04            	dc.b	4
  26  0007 08            	dc.b	8
  27  0008 0a            	dc.b	10
  28  0009 10            	dc.b	16
  29  000a 14            	dc.b	20
  30  000b 28            	dc.b	40
  59                     ; 72 void CLK_DeInit(void)
  59                     ; 73 {
  61                     	switch	.text
  62  0000               _CLK_DeInit:
  66                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  68  0000 350150c0      	mov	20672,#1
  69                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  71  0004 725f50c1      	clr	20673
  72                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  74  0008 35e150c4      	mov	20676,#225
  75                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  77  000c 725f50c5      	clr	20677
  78                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  80  0010 351850c6      	mov	20678,#24
  81                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  83  0014 35ff50c7      	mov	20679,#255
  84                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  86  0018 35ff50ca      	mov	20682,#255
  87                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  89  001c 725f50c8      	clr	20680
  90                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  92  0020 725f50c9      	clr	20681
  94  0024               L52:
  95                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  97  0024 c650c9        	ld	a,20681
  98  0027 a501          	bcp	a,#1
  99  0029 26f9          	jrne	L52
 100                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 102  002b 725f50c9      	clr	20681
 103                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 105  002f 725f50cc      	clr	20684
 106                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 108  0033 725f50cd      	clr	20685
 109                     ; 88 }
 112  0037 81            	ret
 168                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 168                     ; 100 {
 169                     	switch	.text
 170  0038               _CLK_FastHaltWakeUpCmd:
 174                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 176                     ; 104   if (NewState != DISABLE)
 178  0038 4d            	tnz	a
 179  0039 2706          	jreq	L75
 180                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 182  003b 721450c0      	bset	20672,#2
 184  003f 2004          	jra	L16
 185  0041               L75:
 186                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 188  0041 721550c0      	bres	20672,#2
 189  0045               L16:
 190                     ; 114 }
 193  0045 81            	ret
 228                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 228                     ; 122 {
 229                     	switch	.text
 230  0046               _CLK_HSECmd:
 234                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 236                     ; 126   if (NewState != DISABLE)
 238  0046 4d            	tnz	a
 239  0047 2706          	jreq	L101
 240                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 242  0049 721050c1      	bset	20673,#0
 244  004d 2004          	jra	L301
 245  004f               L101:
 246                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 248  004f 721150c1      	bres	20673,#0
 249  0053               L301:
 250                     ; 136 }
 253  0053 81            	ret
 288                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 288                     ; 144 {
 289                     	switch	.text
 290  0054               _CLK_HSICmd:
 294                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 296                     ; 148   if (NewState != DISABLE)
 298  0054 4d            	tnz	a
 299  0055 2706          	jreq	L321
 300                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 302  0057 721050c0      	bset	20672,#0
 304  005b 2004          	jra	L521
 305  005d               L321:
 306                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 308  005d 721150c0      	bres	20672,#0
 309  0061               L521:
 310                     ; 158 }
 313  0061 81            	ret
 348                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 348                     ; 167 {
 349                     	switch	.text
 350  0062               _CLK_LSICmd:
 354                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 356                     ; 171   if (NewState != DISABLE)
 358  0062 4d            	tnz	a
 359  0063 2706          	jreq	L541
 360                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 362  0065 721650c0      	bset	20672,#3
 364  0069 2004          	jra	L741
 365  006b               L541:
 366                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 368  006b 721750c0      	bres	20672,#3
 369  006f               L741:
 370                     ; 181 }
 373  006f 81            	ret
 408                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 408                     ; 190 {
 409                     	switch	.text
 410  0070               _CLK_CCOCmd:
 414                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 416                     ; 194   if (NewState != DISABLE)
 418  0070 4d            	tnz	a
 419  0071 2706          	jreq	L761
 420                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 422  0073 721050c9      	bset	20681,#0
 424  0077 2004          	jra	L171
 425  0079               L761:
 426                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 428  0079 721150c9      	bres	20681,#0
 429  007d               L171:
 430                     ; 204 }
 433  007d 81            	ret
 468                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 468                     ; 214 {
 469                     	switch	.text
 470  007e               _CLK_ClockSwitchCmd:
 474                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 476                     ; 218   if (NewState != DISABLE )
 478  007e 4d            	tnz	a
 479  007f 2706          	jreq	L112
 480                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 482  0081 721250c5      	bset	20677,#1
 484  0085 2004          	jra	L312
 485  0087               L112:
 486                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 488  0087 721350c5      	bres	20677,#1
 489  008b               L312:
 490                     ; 228 }
 493  008b 81            	ret
 529                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 529                     ; 239 {
 530                     	switch	.text
 531  008c               _CLK_SlowActiveHaltWakeUpCmd:
 535                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 537                     ; 243   if (NewState != DISABLE)
 539  008c 4d            	tnz	a
 540  008d 2706          	jreq	L332
 541                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 543  008f 721a50c0      	bset	20672,#5
 545  0093 2004          	jra	L532
 546  0095               L332:
 547                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 549  0095 721b50c0      	bres	20672,#5
 550  0099               L532:
 551                     ; 253 }
 554  0099 81            	ret
 713                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 713                     ; 264 {
 714                     	switch	.text
 715  009a               _CLK_PeripheralClockConfig:
 717  009a 89            	pushw	x
 718       00000000      OFST:	set	0
 721                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 723                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 725                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 727  009b 9e            	ld	a,xh
 728  009c a510          	bcp	a,#16
 729  009e 2633          	jrne	L123
 730                     ; 271     if (NewState != DISABLE)
 732  00a0 0d02          	tnz	(OFST+2,sp)
 733  00a2 2717          	jreq	L323
 734                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 736  00a4 7b01          	ld	a,(OFST+1,sp)
 737  00a6 a40f          	and	a,#15
 738  00a8 5f            	clrw	x
 739  00a9 97            	ld	xl,a
 740  00aa a601          	ld	a,#1
 741  00ac 5d            	tnzw	x
 742  00ad 2704          	jreq	L62
 743  00af               L03:
 744  00af 48            	sll	a
 745  00b0 5a            	decw	x
 746  00b1 26fc          	jrne	L03
 747  00b3               L62:
 748  00b3 ca50c7        	or	a,20679
 749  00b6 c750c7        	ld	20679,a
 751  00b9 2049          	jra	L723
 752  00bb               L323:
 753                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 755  00bb 7b01          	ld	a,(OFST+1,sp)
 756  00bd a40f          	and	a,#15
 757  00bf 5f            	clrw	x
 758  00c0 97            	ld	xl,a
 759  00c1 a601          	ld	a,#1
 760  00c3 5d            	tnzw	x
 761  00c4 2704          	jreq	L23
 762  00c6               L43:
 763  00c6 48            	sll	a
 764  00c7 5a            	decw	x
 765  00c8 26fc          	jrne	L43
 766  00ca               L23:
 767  00ca 43            	cpl	a
 768  00cb c450c7        	and	a,20679
 769  00ce c750c7        	ld	20679,a
 770  00d1 2031          	jra	L723
 771  00d3               L123:
 772                     ; 284     if (NewState != DISABLE)
 774  00d3 0d02          	tnz	(OFST+2,sp)
 775  00d5 2717          	jreq	L133
 776                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 778  00d7 7b01          	ld	a,(OFST+1,sp)
 779  00d9 a40f          	and	a,#15
 780  00db 5f            	clrw	x
 781  00dc 97            	ld	xl,a
 782  00dd a601          	ld	a,#1
 783  00df 5d            	tnzw	x
 784  00e0 2704          	jreq	L63
 785  00e2               L04:
 786  00e2 48            	sll	a
 787  00e3 5a            	decw	x
 788  00e4 26fc          	jrne	L04
 789  00e6               L63:
 790  00e6 ca50ca        	or	a,20682
 791  00e9 c750ca        	ld	20682,a
 793  00ec 2016          	jra	L723
 794  00ee               L133:
 795                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 797  00ee 7b01          	ld	a,(OFST+1,sp)
 798  00f0 a40f          	and	a,#15
 799  00f2 5f            	clrw	x
 800  00f3 97            	ld	xl,a
 801  00f4 a601          	ld	a,#1
 802  00f6 5d            	tnzw	x
 803  00f7 2704          	jreq	L24
 804  00f9               L44:
 805  00f9 48            	sll	a
 806  00fa 5a            	decw	x
 807  00fb 26fc          	jrne	L44
 808  00fd               L24:
 809  00fd 43            	cpl	a
 810  00fe c450ca        	and	a,20682
 811  0101 c750ca        	ld	20682,a
 812  0104               L723:
 813                     ; 295 }
 816  0104 85            	popw	x
 817  0105 81            	ret
1005                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1005                     ; 310 {
1006                     	switch	.text
1007  0106               _CLK_ClockSwitchConfig:
1009  0106 89            	pushw	x
1010  0107 5204          	subw	sp,#4
1011       00000004      OFST:	set	4
1014                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1016  0109 aeffff        	ldw	x,#65535
1017  010c 1f03          	ldw	(OFST-1,sp),x
1019                     ; 313   ErrorStatus Swif = ERROR;
1021                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1023                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1025                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1027                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1029                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1031  010e c650c3        	ld	a,20675
1032  0111 6b01          	ld	(OFST-3,sp),a
1034                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1036  0113 7b05          	ld	a,(OFST+1,sp)
1037  0115 a101          	cp	a,#1
1038  0117 264b          	jrne	L544
1039                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1041  0119 721250c5      	bset	20677,#1
1042                     ; 331     if (ITState != DISABLE)
1044  011d 0d09          	tnz	(OFST+5,sp)
1045  011f 2706          	jreq	L744
1046                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1048  0121 721450c5      	bset	20677,#2
1050  0125 2004          	jra	L154
1051  0127               L744:
1052                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1054  0127 721550c5      	bres	20677,#2
1055  012b               L154:
1056                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1058  012b 7b06          	ld	a,(OFST+2,sp)
1059  012d c750c4        	ld	20676,a
1061  0130 2007          	jra	L754
1062  0132               L354:
1063                     ; 346       DownCounter--;
1065  0132 1e03          	ldw	x,(OFST-1,sp)
1066  0134 1d0001        	subw	x,#1
1067  0137 1f03          	ldw	(OFST-1,sp),x
1069  0139               L754:
1070                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1072  0139 c650c5        	ld	a,20677
1073  013c a501          	bcp	a,#1
1074  013e 2704          	jreq	L364
1076  0140 1e03          	ldw	x,(OFST-1,sp)
1077  0142 26ee          	jrne	L354
1078  0144               L364:
1079                     ; 349     if(DownCounter != 0)
1081  0144 1e03          	ldw	x,(OFST-1,sp)
1082  0146 2706          	jreq	L564
1083                     ; 351       Swif = SUCCESS;
1085  0148 a601          	ld	a,#1
1086  014a 6b02          	ld	(OFST-2,sp),a
1089  014c 2002          	jra	L174
1090  014e               L564:
1091                     ; 355       Swif = ERROR;
1093  014e 0f02          	clr	(OFST-2,sp)
1095  0150               L174:
1096                     ; 390   if(Swif != ERROR)
1098  0150 0d02          	tnz	(OFST-2,sp)
1099  0152 2767          	jreq	L515
1100                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1102  0154 0d0a          	tnz	(OFST+6,sp)
1103  0156 2645          	jrne	L715
1105  0158 7b01          	ld	a,(OFST-3,sp)
1106  015a a1e1          	cp	a,#225
1107  015c 263f          	jrne	L715
1108                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1110  015e 721150c0      	bres	20672,#0
1112  0162 2057          	jra	L515
1113  0164               L544:
1114                     ; 361     if (ITState != DISABLE)
1116  0164 0d09          	tnz	(OFST+5,sp)
1117  0166 2706          	jreq	L374
1118                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1120  0168 721450c5      	bset	20677,#2
1122  016c 2004          	jra	L574
1123  016e               L374:
1124                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1126  016e 721550c5      	bres	20677,#2
1127  0172               L574:
1128                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1130  0172 7b06          	ld	a,(OFST+2,sp)
1131  0174 c750c4        	ld	20676,a
1133  0177 2007          	jra	L305
1134  0179               L774:
1135                     ; 376       DownCounter--;
1137  0179 1e03          	ldw	x,(OFST-1,sp)
1138  017b 1d0001        	subw	x,#1
1139  017e 1f03          	ldw	(OFST-1,sp),x
1141  0180               L305:
1142                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1144  0180 c650c5        	ld	a,20677
1145  0183 a508          	bcp	a,#8
1146  0185 2704          	jreq	L705
1148  0187 1e03          	ldw	x,(OFST-1,sp)
1149  0189 26ee          	jrne	L774
1150  018b               L705:
1151                     ; 379     if(DownCounter != 0)
1153  018b 1e03          	ldw	x,(OFST-1,sp)
1154  018d 270a          	jreq	L115
1155                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1157  018f 721250c5      	bset	20677,#1
1158                     ; 383       Swif = SUCCESS;
1160  0193 a601          	ld	a,#1
1161  0195 6b02          	ld	(OFST-2,sp),a
1164  0197 20b7          	jra	L174
1165  0199               L115:
1166                     ; 387       Swif = ERROR;
1168  0199 0f02          	clr	(OFST-2,sp)
1170  019b 20b3          	jra	L174
1171  019d               L715:
1172                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1174  019d 0d0a          	tnz	(OFST+6,sp)
1175  019f 260c          	jrne	L325
1177  01a1 7b01          	ld	a,(OFST-3,sp)
1178  01a3 a1d2          	cp	a,#210
1179  01a5 2606          	jrne	L325
1180                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1182  01a7 721750c0      	bres	20672,#3
1184  01ab 200e          	jra	L515
1185  01ad               L325:
1186                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1188  01ad 0d0a          	tnz	(OFST+6,sp)
1189  01af 260a          	jrne	L515
1191  01b1 7b01          	ld	a,(OFST-3,sp)
1192  01b3 a1b4          	cp	a,#180
1193  01b5 2604          	jrne	L515
1194                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1196  01b7 721150c1      	bres	20673,#0
1197  01bb               L515:
1198                     ; 406   return(Swif);
1200  01bb 7b02          	ld	a,(OFST-2,sp)
1203  01bd 5b06          	addw	sp,#6
1204  01bf 81            	ret
1342                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1342                     ; 416 {
1343                     	switch	.text
1344  01c0               _CLK_HSIPrescalerConfig:
1346  01c0 88            	push	a
1347       00000000      OFST:	set	0
1350                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1352                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1354  01c1 c650c6        	ld	a,20678
1355  01c4 a4e7          	and	a,#231
1356  01c6 c750c6        	ld	20678,a
1357                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1359  01c9 c650c6        	ld	a,20678
1360  01cc 1a01          	or	a,(OFST+1,sp)
1361  01ce c750c6        	ld	20678,a
1362                     ; 425 }
1365  01d1 84            	pop	a
1366  01d2 81            	ret
1501                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1501                     ; 437 {
1502                     	switch	.text
1503  01d3               _CLK_CCOConfig:
1505  01d3 88            	push	a
1506       00000000      OFST:	set	0
1509                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1511                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1513  01d4 c650c9        	ld	a,20681
1514  01d7 a4e1          	and	a,#225
1515  01d9 c750c9        	ld	20681,a
1516                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1518  01dc c650c9        	ld	a,20681
1519  01df 1a01          	or	a,(OFST+1,sp)
1520  01e1 c750c9        	ld	20681,a
1521                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1523  01e4 721050c9      	bset	20681,#0
1524                     ; 449 }
1527  01e8 84            	pop	a
1528  01e9 81            	ret
1593                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1593                     ; 460 {
1594                     	switch	.text
1595  01ea               _CLK_ITConfig:
1597  01ea 89            	pushw	x
1598       00000000      OFST:	set	0
1601                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1603                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1605                     ; 465   if (NewState != DISABLE)
1607  01eb 9f            	ld	a,xl
1608  01ec 4d            	tnz	a
1609  01ed 2719          	jreq	L527
1610                     ; 467     switch (CLK_IT)
1612  01ef 9e            	ld	a,xh
1614                     ; 475     default:
1614                     ; 476       break;
1615  01f0 a00c          	sub	a,#12
1616  01f2 270a          	jreq	L166
1617  01f4 a010          	sub	a,#16
1618  01f6 2624          	jrne	L337
1619                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1619                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
1621  01f8 721450c5      	bset	20677,#2
1622                     ; 471       break;
1624  01fc 201e          	jra	L337
1625  01fe               L166:
1626                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1626                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
1628  01fe 721450c8      	bset	20680,#2
1629                     ; 474       break;
1631  0202 2018          	jra	L337
1632  0204               L366:
1633                     ; 475     default:
1633                     ; 476       break;
1635  0204 2016          	jra	L337
1636  0206               L137:
1638  0206 2014          	jra	L337
1639  0208               L527:
1640                     ; 481     switch (CLK_IT)
1642  0208 7b01          	ld	a,(OFST+1,sp)
1644                     ; 489     default:
1644                     ; 490       break;
1645  020a a00c          	sub	a,#12
1646  020c 270a          	jreq	L766
1647  020e a010          	sub	a,#16
1648  0210 260a          	jrne	L337
1649                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1649                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1651  0212 721550c5      	bres	20677,#2
1652                     ; 485       break;
1654  0216 2004          	jra	L337
1655  0218               L766:
1656                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1656                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1658  0218 721550c8      	bres	20680,#2
1659                     ; 488       break;
1660  021c               L337:
1661                     ; 493 }
1664  021c 85            	popw	x
1665  021d 81            	ret
1666  021e               L176:
1667                     ; 489     default:
1667                     ; 490       break;
1669  021e 20fc          	jra	L337
1670  0220               L737:
1671  0220 20fa          	jra	L337
1706                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1706                     ; 501 {
1707                     	switch	.text
1708  0222               _CLK_SYSCLKConfig:
1710  0222 88            	push	a
1711       00000000      OFST:	set	0
1714                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1716                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1718  0223 a580          	bcp	a,#128
1719  0225 2614          	jrne	L757
1720                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1722  0227 c650c6        	ld	a,20678
1723  022a a4e7          	and	a,#231
1724  022c c750c6        	ld	20678,a
1725                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1727  022f 7b01          	ld	a,(OFST+1,sp)
1728  0231 a418          	and	a,#24
1729  0233 ca50c6        	or	a,20678
1730  0236 c750c6        	ld	20678,a
1732  0239 2012          	jra	L167
1733  023b               L757:
1734                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1736  023b c650c6        	ld	a,20678
1737  023e a4f8          	and	a,#248
1738  0240 c750c6        	ld	20678,a
1739                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1741  0243 7b01          	ld	a,(OFST+1,sp)
1742  0245 a407          	and	a,#7
1743  0247 ca50c6        	or	a,20678
1744  024a c750c6        	ld	20678,a
1745  024d               L167:
1746                     ; 515 }
1749  024d 84            	pop	a
1750  024e 81            	ret
1806                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1806                     ; 524 {
1807                     	switch	.text
1808  024f               _CLK_SWIMConfig:
1812                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1814                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1816  024f 4d            	tnz	a
1817  0250 2706          	jreq	L1101
1818                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1820  0252 721050cd      	bset	20685,#0
1822  0256 2004          	jra	L3101
1823  0258               L1101:
1824                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1826  0258 721150cd      	bres	20685,#0
1827  025c               L3101:
1828                     ; 538 }
1831  025c 81            	ret
1855                     ; 547 void CLK_ClockSecuritySystemEnable(void)
1855                     ; 548 {
1856                     	switch	.text
1857  025d               _CLK_ClockSecuritySystemEnable:
1861                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
1863  025d 721050c8      	bset	20680,#0
1864                     ; 551 }
1867  0261 81            	ret
1892                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1892                     ; 560 {
1893                     	switch	.text
1894  0262               _CLK_GetSYSCLKSource:
1898                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
1900  0262 c650c3        	ld	a,20675
1903  0265 81            	ret
1966                     ; 569 uint32_t CLK_GetClockFreq(void)
1966                     ; 570 {
1967                     	switch	.text
1968  0266               _CLK_GetClockFreq:
1970  0266 5209          	subw	sp,#9
1971       00000009      OFST:	set	9
1974                     ; 571   uint32_t clockfrequency = 0;
1976                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
1978                     ; 573   uint8_t tmp = 0, presc = 0;
1982                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
1984  0268 c650c3        	ld	a,20675
1985  026b 6b09          	ld	(OFST+0,sp),a
1987                     ; 578   if (clocksource == CLK_SOURCE_HSI)
1989  026d 7b09          	ld	a,(OFST+0,sp)
1990  026f a1e1          	cp	a,#225
1991  0271 2641          	jrne	L7601
1992                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
1994  0273 c650c6        	ld	a,20678
1995  0276 a418          	and	a,#24
1996  0278 6b09          	ld	(OFST+0,sp),a
1998                     ; 581     tmp = (uint8_t)(tmp >> 3);
2000  027a 0409          	srl	(OFST+0,sp)
2001  027c 0409          	srl	(OFST+0,sp)
2002  027e 0409          	srl	(OFST+0,sp)
2004                     ; 582     presc = HSIDivFactor[tmp];
2006  0280 7b09          	ld	a,(OFST+0,sp)
2007  0282 5f            	clrw	x
2008  0283 97            	ld	xl,a
2009  0284 d60000        	ld	a,(_HSIDivFactor,x)
2010  0287 6b09          	ld	(OFST+0,sp),a
2012                     ; 583     clockfrequency = HSI_VALUE / presc;
2014  0289 7b09          	ld	a,(OFST+0,sp)
2015  028b b703          	ld	c_lreg+3,a
2016  028d 3f02          	clr	c_lreg+2
2017  028f 3f01          	clr	c_lreg+1
2018  0291 3f00          	clr	c_lreg
2019  0293 96            	ldw	x,sp
2020  0294 1c0001        	addw	x,#OFST-8
2021  0297 cd0000        	call	c_rtol
2024  029a ae2400        	ldw	x,#9216
2025  029d bf02          	ldw	c_lreg+2,x
2026  029f ae00f4        	ldw	x,#244
2027  02a2 bf00          	ldw	c_lreg,x
2028  02a4 96            	ldw	x,sp
2029  02a5 1c0001        	addw	x,#OFST-8
2030  02a8 cd0000        	call	c_ludv
2032  02ab 96            	ldw	x,sp
2033  02ac 1c0005        	addw	x,#OFST-4
2034  02af cd0000        	call	c_rtol
2038  02b2 201c          	jra	L1701
2039  02b4               L7601:
2040                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2042  02b4 7b09          	ld	a,(OFST+0,sp)
2043  02b6 a1d2          	cp	a,#210
2044  02b8 260c          	jrne	L3701
2045                     ; 587     clockfrequency = LSI_VALUE;
2047  02ba aef400        	ldw	x,#62464
2048  02bd 1f07          	ldw	(OFST-2,sp),x
2049  02bf ae0001        	ldw	x,#1
2050  02c2 1f05          	ldw	(OFST-4,sp),x
2053  02c4 200a          	jra	L1701
2054  02c6               L3701:
2055                     ; 591     clockfrequency = HSE_VALUE;
2057  02c6 ae2400        	ldw	x,#9216
2058  02c9 1f07          	ldw	(OFST-2,sp),x
2059  02cb ae00f4        	ldw	x,#244
2060  02ce 1f05          	ldw	(OFST-4,sp),x
2062  02d0               L1701:
2063                     ; 594   return((uint32_t)clockfrequency);
2065  02d0 96            	ldw	x,sp
2066  02d1 1c0005        	addw	x,#OFST-4
2067  02d4 cd0000        	call	c_ltor
2071  02d7 5b09          	addw	sp,#9
2072  02d9 81            	ret
2171                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2171                     ; 605 {
2172                     	switch	.text
2173  02da               _CLK_AdjustHSICalibrationValue:
2175  02da 88            	push	a
2176       00000000      OFST:	set	0
2179                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2181                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2183  02db c650cc        	ld	a,20684
2184  02de a4f8          	and	a,#248
2185  02e0 1a01          	or	a,(OFST+1,sp)
2186  02e2 c750cc        	ld	20684,a
2187                     ; 611 }
2190  02e5 84            	pop	a
2191  02e6 81            	ret
2215                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2215                     ; 623 {
2216                     	switch	.text
2217  02e7               _CLK_SYSCLKEmergencyClear:
2221                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2223  02e7 721150c5      	bres	20677,#0
2224                     ; 625 }
2227  02eb 81            	ret
2380                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2380                     ; 635 {
2381                     	switch	.text
2382  02ec               _CLK_GetFlagStatus:
2384  02ec 89            	pushw	x
2385  02ed 5203          	subw	sp,#3
2386       00000003      OFST:	set	3
2389                     ; 636   uint16_t statusreg = 0;
2391                     ; 637   uint8_t tmpreg = 0;
2393                     ; 638   FlagStatus bitstatus = RESET;
2395                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2397                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2399  02ef 01            	rrwa	x,a
2400  02f0 9f            	ld	a,xl
2401  02f1 a4ff          	and	a,#255
2402  02f3 97            	ld	xl,a
2403  02f4 4f            	clr	a
2404  02f5 02            	rlwa	x,a
2405  02f6 1f01          	ldw	(OFST-2,sp),x
2406  02f8 01            	rrwa	x,a
2408                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2410  02f9 1e01          	ldw	x,(OFST-2,sp)
2411  02fb a30100        	cpw	x,#256
2412  02fe 2607          	jrne	L1421
2413                     ; 649     tmpreg = CLK->ICKR;
2415  0300 c650c0        	ld	a,20672
2416  0303 6b03          	ld	(OFST+0,sp),a
2419  0305 202f          	jra	L3421
2420  0307               L1421:
2421                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2423  0307 1e01          	ldw	x,(OFST-2,sp)
2424  0309 a30200        	cpw	x,#512
2425  030c 2607          	jrne	L5421
2426                     ; 653     tmpreg = CLK->ECKR;
2428  030e c650c1        	ld	a,20673
2429  0311 6b03          	ld	(OFST+0,sp),a
2432  0313 2021          	jra	L3421
2433  0315               L5421:
2434                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2436  0315 1e01          	ldw	x,(OFST-2,sp)
2437  0317 a30300        	cpw	x,#768
2438  031a 2607          	jrne	L1521
2439                     ; 657     tmpreg = CLK->SWCR;
2441  031c c650c5        	ld	a,20677
2442  031f 6b03          	ld	(OFST+0,sp),a
2445  0321 2013          	jra	L3421
2446  0323               L1521:
2447                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2449  0323 1e01          	ldw	x,(OFST-2,sp)
2450  0325 a30400        	cpw	x,#1024
2451  0328 2607          	jrne	L5521
2452                     ; 661     tmpreg = CLK->CSSR;
2454  032a c650c8        	ld	a,20680
2455  032d 6b03          	ld	(OFST+0,sp),a
2458  032f 2005          	jra	L3421
2459  0331               L5521:
2460                     ; 665     tmpreg = CLK->CCOR;
2462  0331 c650c9        	ld	a,20681
2463  0334 6b03          	ld	(OFST+0,sp),a
2465  0336               L3421:
2466                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2468  0336 7b05          	ld	a,(OFST+2,sp)
2469  0338 1503          	bcp	a,(OFST+0,sp)
2470  033a 2706          	jreq	L1621
2471                     ; 670     bitstatus = SET;
2473  033c a601          	ld	a,#1
2474  033e 6b03          	ld	(OFST+0,sp),a
2477  0340 2002          	jra	L3621
2478  0342               L1621:
2479                     ; 674     bitstatus = RESET;
2481  0342 0f03          	clr	(OFST+0,sp)
2483  0344               L3621:
2484                     ; 678   return((FlagStatus)bitstatus);
2486  0344 7b03          	ld	a,(OFST+0,sp)
2489  0346 5b05          	addw	sp,#5
2490  0348 81            	ret
2536                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2536                     ; 688 {
2537                     	switch	.text
2538  0349               _CLK_GetITStatus:
2540  0349 88            	push	a
2541  034a 88            	push	a
2542       00000001      OFST:	set	1
2545                     ; 689   ITStatus bitstatus = RESET;
2547                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
2549                     ; 694   if (CLK_IT == CLK_IT_SWIF)
2551  034b a11c          	cp	a,#28
2552  034d 2611          	jrne	L7031
2553                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2555  034f c450c5        	and	a,20677
2556  0352 a10c          	cp	a,#12
2557  0354 2606          	jrne	L1131
2558                     ; 699       bitstatus = SET;
2560  0356 a601          	ld	a,#1
2561  0358 6b01          	ld	(OFST+0,sp),a
2564  035a 2015          	jra	L5131
2565  035c               L1131:
2566                     ; 703       bitstatus = RESET;
2568  035c 0f01          	clr	(OFST+0,sp)
2570  035e 2011          	jra	L5131
2571  0360               L7031:
2572                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2574  0360 c650c8        	ld	a,20680
2575  0363 1402          	and	a,(OFST+1,sp)
2576  0365 a10c          	cp	a,#12
2577  0367 2606          	jrne	L7131
2578                     ; 711       bitstatus = SET;
2580  0369 a601          	ld	a,#1
2581  036b 6b01          	ld	(OFST+0,sp),a
2584  036d 2002          	jra	L5131
2585  036f               L7131:
2586                     ; 715       bitstatus = RESET;
2588  036f 0f01          	clr	(OFST+0,sp)
2590  0371               L5131:
2591                     ; 720   return bitstatus;
2593  0371 7b01          	ld	a,(OFST+0,sp)
2596  0373 85            	popw	x
2597  0374 81            	ret
2633                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2633                     ; 730 {
2634                     	switch	.text
2635  0375               _CLK_ClearITPendingBit:
2639                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
2641                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2643  0375 a10c          	cp	a,#12
2644  0377 2606          	jrne	L1431
2645                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2647  0379 721750c8      	bres	20680,#3
2649  037d 2004          	jra	L3431
2650  037f               L1431:
2651                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2653  037f 721750c5      	bres	20677,#3
2654  0383               L3431:
2655                     ; 745 }
2658  0383 81            	ret
2693                     	xdef	_CLKPrescTable
2694                     	xdef	_HSIDivFactor
2695                     	xdef	_CLK_ClearITPendingBit
2696                     	xdef	_CLK_GetITStatus
2697                     	xdef	_CLK_GetFlagStatus
2698                     	xdef	_CLK_GetSYSCLKSource
2699                     	xdef	_CLK_GetClockFreq
2700                     	xdef	_CLK_AdjustHSICalibrationValue
2701                     	xdef	_CLK_SYSCLKEmergencyClear
2702                     	xdef	_CLK_ClockSecuritySystemEnable
2703                     	xdef	_CLK_SWIMConfig
2704                     	xdef	_CLK_SYSCLKConfig
2705                     	xdef	_CLK_ITConfig
2706                     	xdef	_CLK_CCOConfig
2707                     	xdef	_CLK_HSIPrescalerConfig
2708                     	xdef	_CLK_ClockSwitchConfig
2709                     	xdef	_CLK_PeripheralClockConfig
2710                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2711                     	xdef	_CLK_FastHaltWakeUpCmd
2712                     	xdef	_CLK_ClockSwitchCmd
2713                     	xdef	_CLK_CCOCmd
2714                     	xdef	_CLK_LSICmd
2715                     	xdef	_CLK_HSICmd
2716                     	xdef	_CLK_HSECmd
2717                     	xdef	_CLK_DeInit
2718                     	xref.b	c_lreg
2719                     	xref.b	c_x
2738                     	xref	c_ltor
2739                     	xref	c_ludv
2740                     	xref	c_rtol
2741                     	end
