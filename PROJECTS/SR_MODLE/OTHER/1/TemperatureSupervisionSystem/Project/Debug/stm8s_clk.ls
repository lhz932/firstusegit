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
 169                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 169                     ; 100 {
 170                     	switch	.text
 171  0038               _CLK_FastHaltWakeUpCmd:
 173  0038 88            	push	a
 174       00000000      OFST:	set	0
 177                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 179  0039 4d            	tnz	a
 180  003a 2704          	jreq	L21
 181  003c a101          	cp	a,#1
 182  003e 2603          	jrne	L01
 183  0040               L21:
 184  0040 4f            	clr	a
 185  0041 2010          	jra	L41
 186  0043               L01:
 187  0043 ae0066        	ldw	x,#102
 188  0046 89            	pushw	x
 189  0047 ae0000        	ldw	x,#0
 190  004a 89            	pushw	x
 191  004b ae000c        	ldw	x,#L75
 192  004e cd0000        	call	_assert_failed
 194  0051 5b04          	addw	sp,#4
 195  0053               L41:
 196                     ; 104   if (NewState != DISABLE)
 198  0053 0d01          	tnz	(OFST+1,sp)
 199  0055 2706          	jreq	L16
 200                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 202  0057 721450c0      	bset	20672,#2
 204  005b 2004          	jra	L36
 205  005d               L16:
 206                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 208  005d 721550c0      	bres	20672,#2
 209  0061               L36:
 210                     ; 114 }
 213  0061 84            	pop	a
 214  0062 81            	ret
 250                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 250                     ; 122 {
 251                     	switch	.text
 252  0063               _CLK_HSECmd:
 254  0063 88            	push	a
 255       00000000      OFST:	set	0
 258                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 260  0064 4d            	tnz	a
 261  0065 2704          	jreq	L22
 262  0067 a101          	cp	a,#1
 263  0069 2603          	jrne	L02
 264  006b               L22:
 265  006b 4f            	clr	a
 266  006c 2010          	jra	L42
 267  006e               L02:
 268  006e ae007c        	ldw	x,#124
 269  0071 89            	pushw	x
 270  0072 ae0000        	ldw	x,#0
 271  0075 89            	pushw	x
 272  0076 ae000c        	ldw	x,#L75
 273  0079 cd0000        	call	_assert_failed
 275  007c 5b04          	addw	sp,#4
 276  007e               L42:
 277                     ; 126   if (NewState != DISABLE)
 279  007e 0d01          	tnz	(OFST+1,sp)
 280  0080 2706          	jreq	L301
 281                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 283  0082 721050c1      	bset	20673,#0
 285  0086 2004          	jra	L501
 286  0088               L301:
 287                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 289  0088 721150c1      	bres	20673,#0
 290  008c               L501:
 291                     ; 136 }
 294  008c 84            	pop	a
 295  008d 81            	ret
 331                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 331                     ; 144 {
 332                     	switch	.text
 333  008e               _CLK_HSICmd:
 335  008e 88            	push	a
 336       00000000      OFST:	set	0
 339                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 341  008f 4d            	tnz	a
 342  0090 2704          	jreq	L23
 343  0092 a101          	cp	a,#1
 344  0094 2603          	jrne	L03
 345  0096               L23:
 346  0096 4f            	clr	a
 347  0097 2010          	jra	L43
 348  0099               L03:
 349  0099 ae0092        	ldw	x,#146
 350  009c 89            	pushw	x
 351  009d ae0000        	ldw	x,#0
 352  00a0 89            	pushw	x
 353  00a1 ae000c        	ldw	x,#L75
 354  00a4 cd0000        	call	_assert_failed
 356  00a7 5b04          	addw	sp,#4
 357  00a9               L43:
 358                     ; 148   if (NewState != DISABLE)
 360  00a9 0d01          	tnz	(OFST+1,sp)
 361  00ab 2706          	jreq	L521
 362                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 364  00ad 721050c0      	bset	20672,#0
 366  00b1 2004          	jra	L721
 367  00b3               L521:
 368                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 370  00b3 721150c0      	bres	20672,#0
 371  00b7               L721:
 372                     ; 158 }
 375  00b7 84            	pop	a
 376  00b8 81            	ret
 412                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 412                     ; 167 {
 413                     	switch	.text
 414  00b9               _CLK_LSICmd:
 416  00b9 88            	push	a
 417       00000000      OFST:	set	0
 420                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 422  00ba 4d            	tnz	a
 423  00bb 2704          	jreq	L24
 424  00bd a101          	cp	a,#1
 425  00bf 2603          	jrne	L04
 426  00c1               L24:
 427  00c1 4f            	clr	a
 428  00c2 2010          	jra	L44
 429  00c4               L04:
 430  00c4 ae00a9        	ldw	x,#169
 431  00c7 89            	pushw	x
 432  00c8 ae0000        	ldw	x,#0
 433  00cb 89            	pushw	x
 434  00cc ae000c        	ldw	x,#L75
 435  00cf cd0000        	call	_assert_failed
 437  00d2 5b04          	addw	sp,#4
 438  00d4               L44:
 439                     ; 171   if (NewState != DISABLE)
 441  00d4 0d01          	tnz	(OFST+1,sp)
 442  00d6 2706          	jreq	L741
 443                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 445  00d8 721650c0      	bset	20672,#3
 447  00dc 2004          	jra	L151
 448  00de               L741:
 449                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 451  00de 721750c0      	bres	20672,#3
 452  00e2               L151:
 453                     ; 181 }
 456  00e2 84            	pop	a
 457  00e3 81            	ret
 493                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 493                     ; 190 {
 494                     	switch	.text
 495  00e4               _CLK_CCOCmd:
 497  00e4 88            	push	a
 498       00000000      OFST:	set	0
 501                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 503  00e5 4d            	tnz	a
 504  00e6 2704          	jreq	L25
 505  00e8 a101          	cp	a,#1
 506  00ea 2603          	jrne	L05
 507  00ec               L25:
 508  00ec 4f            	clr	a
 509  00ed 2010          	jra	L45
 510  00ef               L05:
 511  00ef ae00c0        	ldw	x,#192
 512  00f2 89            	pushw	x
 513  00f3 ae0000        	ldw	x,#0
 514  00f6 89            	pushw	x
 515  00f7 ae000c        	ldw	x,#L75
 516  00fa cd0000        	call	_assert_failed
 518  00fd 5b04          	addw	sp,#4
 519  00ff               L45:
 520                     ; 194   if (NewState != DISABLE)
 522  00ff 0d01          	tnz	(OFST+1,sp)
 523  0101 2706          	jreq	L171
 524                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 526  0103 721050c9      	bset	20681,#0
 528  0107 2004          	jra	L371
 529  0109               L171:
 530                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 532  0109 721150c9      	bres	20681,#0
 533  010d               L371:
 534                     ; 204 }
 537  010d 84            	pop	a
 538  010e 81            	ret
 574                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 574                     ; 214 {
 575                     	switch	.text
 576  010f               _CLK_ClockSwitchCmd:
 578  010f 88            	push	a
 579       00000000      OFST:	set	0
 582                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 584  0110 4d            	tnz	a
 585  0111 2704          	jreq	L26
 586  0113 a101          	cp	a,#1
 587  0115 2603          	jrne	L06
 588  0117               L26:
 589  0117 4f            	clr	a
 590  0118 2010          	jra	L46
 591  011a               L06:
 592  011a ae00d8        	ldw	x,#216
 593  011d 89            	pushw	x
 594  011e ae0000        	ldw	x,#0
 595  0121 89            	pushw	x
 596  0122 ae000c        	ldw	x,#L75
 597  0125 cd0000        	call	_assert_failed
 599  0128 5b04          	addw	sp,#4
 600  012a               L46:
 601                     ; 218   if (NewState != DISABLE )
 603  012a 0d01          	tnz	(OFST+1,sp)
 604  012c 2706          	jreq	L312
 605                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 607  012e 721250c5      	bset	20677,#1
 609  0132 2004          	jra	L512
 610  0134               L312:
 611                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 613  0134 721350c5      	bres	20677,#1
 614  0138               L512:
 615                     ; 228 }
 618  0138 84            	pop	a
 619  0139 81            	ret
 656                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 656                     ; 239 {
 657                     	switch	.text
 658  013a               _CLK_SlowActiveHaltWakeUpCmd:
 660  013a 88            	push	a
 661       00000000      OFST:	set	0
 664                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 666  013b 4d            	tnz	a
 667  013c 2704          	jreq	L27
 668  013e a101          	cp	a,#1
 669  0140 2603          	jrne	L07
 670  0142               L27:
 671  0142 4f            	clr	a
 672  0143 2010          	jra	L47
 673  0145               L07:
 674  0145 ae00f1        	ldw	x,#241
 675  0148 89            	pushw	x
 676  0149 ae0000        	ldw	x,#0
 677  014c 89            	pushw	x
 678  014d ae000c        	ldw	x,#L75
 679  0150 cd0000        	call	_assert_failed
 681  0153 5b04          	addw	sp,#4
 682  0155               L47:
 683                     ; 243   if (NewState != DISABLE)
 685  0155 0d01          	tnz	(OFST+1,sp)
 686  0157 2706          	jreq	L532
 687                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 689  0159 721a50c0      	bset	20672,#5
 691  015d 2004          	jra	L732
 692  015f               L532:
 693                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 695  015f 721b50c0      	bres	20672,#5
 696  0163               L732:
 697                     ; 253 }
 700  0163 84            	pop	a
 701  0164 81            	ret
 861                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 861                     ; 264 {
 862                     	switch	.text
 863  0165               _CLK_PeripheralClockConfig:
 865  0165 89            	pushw	x
 866       00000000      OFST:	set	0
 869                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 871  0166 9f            	ld	a,xl
 872  0167 4d            	tnz	a
 873  0168 2705          	jreq	L201
 874  016a 9f            	ld	a,xl
 875  016b a101          	cp	a,#1
 876  016d 2603          	jrne	L001
 877  016f               L201:
 878  016f 4f            	clr	a
 879  0170 2010          	jra	L401
 880  0172               L001:
 881  0172 ae010a        	ldw	x,#266
 882  0175 89            	pushw	x
 883  0176 ae0000        	ldw	x,#0
 884  0179 89            	pushw	x
 885  017a ae000c        	ldw	x,#L75
 886  017d cd0000        	call	_assert_failed
 888  0180 5b04          	addw	sp,#4
 889  0182               L401:
 890                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 892  0182 0d01          	tnz	(OFST+1,sp)
 893  0184 274e          	jreq	L011
 894  0186 7b01          	ld	a,(OFST+1,sp)
 895  0188 a101          	cp	a,#1
 896  018a 2748          	jreq	L011
 897  018c 7b01          	ld	a,(OFST+1,sp)
 898  018e a103          	cp	a,#3
 899  0190 2742          	jreq	L011
 900  0192 7b01          	ld	a,(OFST+1,sp)
 901  0194 a103          	cp	a,#3
 902  0196 273c          	jreq	L011
 903  0198 7b01          	ld	a,(OFST+1,sp)
 904  019a a103          	cp	a,#3
 905  019c 2736          	jreq	L011
 906  019e 7b01          	ld	a,(OFST+1,sp)
 907  01a0 a104          	cp	a,#4
 908  01a2 2730          	jreq	L011
 909  01a4 7b01          	ld	a,(OFST+1,sp)
 910  01a6 a105          	cp	a,#5
 911  01a8 272a          	jreq	L011
 912  01aa 7b01          	ld	a,(OFST+1,sp)
 913  01ac a105          	cp	a,#5
 914  01ae 2724          	jreq	L011
 915  01b0 7b01          	ld	a,(OFST+1,sp)
 916  01b2 a104          	cp	a,#4
 917  01b4 271e          	jreq	L011
 918  01b6 7b01          	ld	a,(OFST+1,sp)
 919  01b8 a106          	cp	a,#6
 920  01ba 2718          	jreq	L011
 921  01bc 7b01          	ld	a,(OFST+1,sp)
 922  01be a107          	cp	a,#7
 923  01c0 2712          	jreq	L011
 924  01c2 7b01          	ld	a,(OFST+1,sp)
 925  01c4 a117          	cp	a,#23
 926  01c6 270c          	jreq	L011
 927  01c8 7b01          	ld	a,(OFST+1,sp)
 928  01ca a113          	cp	a,#19
 929  01cc 2706          	jreq	L011
 930  01ce 7b01          	ld	a,(OFST+1,sp)
 931  01d0 a112          	cp	a,#18
 932  01d2 2603          	jrne	L601
 933  01d4               L011:
 934  01d4 4f            	clr	a
 935  01d5 2010          	jra	L211
 936  01d7               L601:
 937  01d7 ae010b        	ldw	x,#267
 938  01da 89            	pushw	x
 939  01db ae0000        	ldw	x,#0
 940  01de 89            	pushw	x
 941  01df ae000c        	ldw	x,#L75
 942  01e2 cd0000        	call	_assert_failed
 944  01e5 5b04          	addw	sp,#4
 945  01e7               L211:
 946                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 948  01e7 7b01          	ld	a,(OFST+1,sp)
 949  01e9 a510          	bcp	a,#16
 950  01eb 2633          	jrne	L323
 951                     ; 271     if (NewState != DISABLE)
 953  01ed 0d02          	tnz	(OFST+2,sp)
 954  01ef 2717          	jreq	L523
 955                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 957  01f1 7b01          	ld	a,(OFST+1,sp)
 958  01f3 a40f          	and	a,#15
 959  01f5 5f            	clrw	x
 960  01f6 97            	ld	xl,a
 961  01f7 a601          	ld	a,#1
 962  01f9 5d            	tnzw	x
 963  01fa 2704          	jreq	L411
 964  01fc               L611:
 965  01fc 48            	sll	a
 966  01fd 5a            	decw	x
 967  01fe 26fc          	jrne	L611
 968  0200               L411:
 969  0200 ca50c7        	or	a,20679
 970  0203 c750c7        	ld	20679,a
 972  0206 2049          	jra	L133
 973  0208               L523:
 974                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 976  0208 7b01          	ld	a,(OFST+1,sp)
 977  020a a40f          	and	a,#15
 978  020c 5f            	clrw	x
 979  020d 97            	ld	xl,a
 980  020e a601          	ld	a,#1
 981  0210 5d            	tnzw	x
 982  0211 2704          	jreq	L021
 983  0213               L221:
 984  0213 48            	sll	a
 985  0214 5a            	decw	x
 986  0215 26fc          	jrne	L221
 987  0217               L021:
 988  0217 43            	cpl	a
 989  0218 c450c7        	and	a,20679
 990  021b c750c7        	ld	20679,a
 991  021e 2031          	jra	L133
 992  0220               L323:
 993                     ; 284     if (NewState != DISABLE)
 995  0220 0d02          	tnz	(OFST+2,sp)
 996  0222 2717          	jreq	L333
 997                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 999  0224 7b01          	ld	a,(OFST+1,sp)
1000  0226 a40f          	and	a,#15
1001  0228 5f            	clrw	x
1002  0229 97            	ld	xl,a
1003  022a a601          	ld	a,#1
1004  022c 5d            	tnzw	x
1005  022d 2704          	jreq	L421
1006  022f               L621:
1007  022f 48            	sll	a
1008  0230 5a            	decw	x
1009  0231 26fc          	jrne	L621
1010  0233               L421:
1011  0233 ca50ca        	or	a,20682
1012  0236 c750ca        	ld	20682,a
1014  0239 2016          	jra	L133
1015  023b               L333:
1016                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1018  023b 7b01          	ld	a,(OFST+1,sp)
1019  023d a40f          	and	a,#15
1020  023f 5f            	clrw	x
1021  0240 97            	ld	xl,a
1022  0241 a601          	ld	a,#1
1023  0243 5d            	tnzw	x
1024  0244 2704          	jreq	L031
1025  0246               L231:
1026  0246 48            	sll	a
1027  0247 5a            	decw	x
1028  0248 26fc          	jrne	L231
1029  024a               L031:
1030  024a 43            	cpl	a
1031  024b c450ca        	and	a,20682
1032  024e c750ca        	ld	20682,a
1033  0251               L133:
1034                     ; 295 }
1037  0251 85            	popw	x
1038  0252 81            	ret
1227                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1227                     ; 310 {
1228                     	switch	.text
1229  0253               _CLK_ClockSwitchConfig:
1231  0253 89            	pushw	x
1232  0254 5204          	subw	sp,#4
1233       00000004      OFST:	set	4
1236                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1238  0256 aeffff        	ldw	x,#65535
1239  0259 1f03          	ldw	(OFST-1,sp),x
1241                     ; 313   ErrorStatus Swif = ERROR;
1243                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1245  025b 7b06          	ld	a,(OFST+2,sp)
1246  025d a1e1          	cp	a,#225
1247  025f 270c          	jreq	L041
1248  0261 7b06          	ld	a,(OFST+2,sp)
1249  0263 a1d2          	cp	a,#210
1250  0265 2706          	jreq	L041
1251  0267 7b06          	ld	a,(OFST+2,sp)
1252  0269 a1b4          	cp	a,#180
1253  026b 2603          	jrne	L631
1254  026d               L041:
1255  026d 4f            	clr	a
1256  026e 2010          	jra	L241
1257  0270               L631:
1258  0270 ae013c        	ldw	x,#316
1259  0273 89            	pushw	x
1260  0274 ae0000        	ldw	x,#0
1261  0277 89            	pushw	x
1262  0278 ae000c        	ldw	x,#L75
1263  027b cd0000        	call	_assert_failed
1265  027e 5b04          	addw	sp,#4
1266  0280               L241:
1267                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1269  0280 0d05          	tnz	(OFST+1,sp)
1270  0282 2706          	jreq	L641
1271  0284 7b05          	ld	a,(OFST+1,sp)
1272  0286 a101          	cp	a,#1
1273  0288 2603          	jrne	L441
1274  028a               L641:
1275  028a 4f            	clr	a
1276  028b 2010          	jra	L051
1277  028d               L441:
1278  028d ae013d        	ldw	x,#317
1279  0290 89            	pushw	x
1280  0291 ae0000        	ldw	x,#0
1281  0294 89            	pushw	x
1282  0295 ae000c        	ldw	x,#L75
1283  0298 cd0000        	call	_assert_failed
1285  029b 5b04          	addw	sp,#4
1286  029d               L051:
1287                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1289  029d 0d09          	tnz	(OFST+5,sp)
1290  029f 2706          	jreq	L451
1291  02a1 7b09          	ld	a,(OFST+5,sp)
1292  02a3 a101          	cp	a,#1
1293  02a5 2603          	jrne	L251
1294  02a7               L451:
1295  02a7 4f            	clr	a
1296  02a8 2010          	jra	L651
1297  02aa               L251:
1298  02aa ae013e        	ldw	x,#318
1299  02ad 89            	pushw	x
1300  02ae ae0000        	ldw	x,#0
1301  02b1 89            	pushw	x
1302  02b2 ae000c        	ldw	x,#L75
1303  02b5 cd0000        	call	_assert_failed
1305  02b8 5b04          	addw	sp,#4
1306  02ba               L651:
1307                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1309  02ba 0d0a          	tnz	(OFST+6,sp)
1310  02bc 2706          	jreq	L261
1311  02be 7b0a          	ld	a,(OFST+6,sp)
1312  02c0 a101          	cp	a,#1
1313  02c2 2603          	jrne	L061
1314  02c4               L261:
1315  02c4 4f            	clr	a
1316  02c5 2010          	jra	L461
1317  02c7               L061:
1318  02c7 ae013f        	ldw	x,#319
1319  02ca 89            	pushw	x
1320  02cb ae0000        	ldw	x,#0
1321  02ce 89            	pushw	x
1322  02cf ae000c        	ldw	x,#L75
1323  02d2 cd0000        	call	_assert_failed
1325  02d5 5b04          	addw	sp,#4
1326  02d7               L461:
1327                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1329  02d7 c650c3        	ld	a,20675
1330  02da 6b01          	ld	(OFST-3,sp),a
1332                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1334  02dc 7b05          	ld	a,(OFST+1,sp)
1335  02de a101          	cp	a,#1
1336  02e0 264b          	jrne	L744
1337                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1339  02e2 721250c5      	bset	20677,#1
1340                     ; 331     if (ITState != DISABLE)
1342  02e6 0d09          	tnz	(OFST+5,sp)
1343  02e8 2706          	jreq	L154
1344                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1346  02ea 721450c5      	bset	20677,#2
1348  02ee 2004          	jra	L354
1349  02f0               L154:
1350                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1352  02f0 721550c5      	bres	20677,#2
1353  02f4               L354:
1354                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1356  02f4 7b06          	ld	a,(OFST+2,sp)
1357  02f6 c750c4        	ld	20676,a
1359  02f9 2007          	jra	L164
1360  02fb               L554:
1361                     ; 346       DownCounter--;
1363  02fb 1e03          	ldw	x,(OFST-1,sp)
1364  02fd 1d0001        	subw	x,#1
1365  0300 1f03          	ldw	(OFST-1,sp),x
1367  0302               L164:
1368                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1370  0302 c650c5        	ld	a,20677
1371  0305 a501          	bcp	a,#1
1372  0307 2704          	jreq	L564
1374  0309 1e03          	ldw	x,(OFST-1,sp)
1375  030b 26ee          	jrne	L554
1376  030d               L564:
1377                     ; 349     if(DownCounter != 0)
1379  030d 1e03          	ldw	x,(OFST-1,sp)
1380  030f 2706          	jreq	L764
1381                     ; 351       Swif = SUCCESS;
1383  0311 a601          	ld	a,#1
1384  0313 6b02          	ld	(OFST-2,sp),a
1387  0315 2002          	jra	L374
1388  0317               L764:
1389                     ; 355       Swif = ERROR;
1391  0317 0f02          	clr	(OFST-2,sp)
1393  0319               L374:
1394                     ; 390   if(Swif != ERROR)
1396  0319 0d02          	tnz	(OFST-2,sp)
1397  031b 2767          	jreq	L715
1398                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1400  031d 0d0a          	tnz	(OFST+6,sp)
1401  031f 2645          	jrne	L125
1403  0321 7b01          	ld	a,(OFST-3,sp)
1404  0323 a1e1          	cp	a,#225
1405  0325 263f          	jrne	L125
1406                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1408  0327 721150c0      	bres	20672,#0
1410  032b 2057          	jra	L715
1411  032d               L744:
1412                     ; 361     if (ITState != DISABLE)
1414  032d 0d09          	tnz	(OFST+5,sp)
1415  032f 2706          	jreq	L574
1416                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1418  0331 721450c5      	bset	20677,#2
1420  0335 2004          	jra	L774
1421  0337               L574:
1422                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1424  0337 721550c5      	bres	20677,#2
1425  033b               L774:
1426                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1428  033b 7b06          	ld	a,(OFST+2,sp)
1429  033d c750c4        	ld	20676,a
1431  0340 2007          	jra	L505
1432  0342               L105:
1433                     ; 376       DownCounter--;
1435  0342 1e03          	ldw	x,(OFST-1,sp)
1436  0344 1d0001        	subw	x,#1
1437  0347 1f03          	ldw	(OFST-1,sp),x
1439  0349               L505:
1440                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1442  0349 c650c5        	ld	a,20677
1443  034c a508          	bcp	a,#8
1444  034e 2704          	jreq	L115
1446  0350 1e03          	ldw	x,(OFST-1,sp)
1447  0352 26ee          	jrne	L105
1448  0354               L115:
1449                     ; 379     if(DownCounter != 0)
1451  0354 1e03          	ldw	x,(OFST-1,sp)
1452  0356 270a          	jreq	L315
1453                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1455  0358 721250c5      	bset	20677,#1
1456                     ; 383       Swif = SUCCESS;
1458  035c a601          	ld	a,#1
1459  035e 6b02          	ld	(OFST-2,sp),a
1462  0360 20b7          	jra	L374
1463  0362               L315:
1464                     ; 387       Swif = ERROR;
1466  0362 0f02          	clr	(OFST-2,sp)
1468  0364 20b3          	jra	L374
1469  0366               L125:
1470                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1472  0366 0d0a          	tnz	(OFST+6,sp)
1473  0368 260c          	jrne	L525
1475  036a 7b01          	ld	a,(OFST-3,sp)
1476  036c a1d2          	cp	a,#210
1477  036e 2606          	jrne	L525
1478                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1480  0370 721750c0      	bres	20672,#3
1482  0374 200e          	jra	L715
1483  0376               L525:
1484                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1486  0376 0d0a          	tnz	(OFST+6,sp)
1487  0378 260a          	jrne	L715
1489  037a 7b01          	ld	a,(OFST-3,sp)
1490  037c a1b4          	cp	a,#180
1491  037e 2604          	jrne	L715
1492                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1494  0380 721150c1      	bres	20673,#0
1495  0384               L715:
1496                     ; 406   return(Swif);
1498  0384 7b02          	ld	a,(OFST-2,sp)
1501  0386 5b06          	addw	sp,#6
1502  0388 81            	ret
1641                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1641                     ; 416 {
1642                     	switch	.text
1643  0389               _CLK_HSIPrescalerConfig:
1645  0389 88            	push	a
1646       00000000      OFST:	set	0
1649                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1651  038a 4d            	tnz	a
1652  038b 270c          	jreq	L271
1653  038d a108          	cp	a,#8
1654  038f 2708          	jreq	L271
1655  0391 a110          	cp	a,#16
1656  0393 2704          	jreq	L271
1657  0395 a118          	cp	a,#24
1658  0397 2603          	jrne	L071
1659  0399               L271:
1660  0399 4f            	clr	a
1661  039a 2010          	jra	L471
1662  039c               L071:
1663  039c ae01a2        	ldw	x,#418
1664  039f 89            	pushw	x
1665  03a0 ae0000        	ldw	x,#0
1666  03a3 89            	pushw	x
1667  03a4 ae000c        	ldw	x,#L75
1668  03a7 cd0000        	call	_assert_failed
1670  03aa 5b04          	addw	sp,#4
1671  03ac               L471:
1672                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1674  03ac c650c6        	ld	a,20678
1675  03af a4e7          	and	a,#231
1676  03b1 c750c6        	ld	20678,a
1677                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1679  03b4 c650c6        	ld	a,20678
1680  03b7 1a01          	or	a,(OFST+1,sp)
1681  03b9 c750c6        	ld	20678,a
1682                     ; 425 }
1685  03bc 84            	pop	a
1686  03bd 81            	ret
1822                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1822                     ; 437 {
1823                     	switch	.text
1824  03be               _CLK_CCOConfig:
1826  03be 88            	push	a
1827       00000000      OFST:	set	0
1830                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1832  03bf 4d            	tnz	a
1833  03c0 2730          	jreq	L202
1834  03c2 a104          	cp	a,#4
1835  03c4 272c          	jreq	L202
1836  03c6 a102          	cp	a,#2
1837  03c8 2728          	jreq	L202
1838  03ca a108          	cp	a,#8
1839  03cc 2724          	jreq	L202
1840  03ce a10a          	cp	a,#10
1841  03d0 2720          	jreq	L202
1842  03d2 a10c          	cp	a,#12
1843  03d4 271c          	jreq	L202
1844  03d6 a10e          	cp	a,#14
1845  03d8 2718          	jreq	L202
1846  03da a110          	cp	a,#16
1847  03dc 2714          	jreq	L202
1848  03de a112          	cp	a,#18
1849  03e0 2710          	jreq	L202
1850  03e2 a114          	cp	a,#20
1851  03e4 270c          	jreq	L202
1852  03e6 a116          	cp	a,#22
1853  03e8 2708          	jreq	L202
1854  03ea a118          	cp	a,#24
1855  03ec 2704          	jreq	L202
1856  03ee a11a          	cp	a,#26
1857  03f0 2603          	jrne	L002
1858  03f2               L202:
1859  03f2 4f            	clr	a
1860  03f3 2010          	jra	L402
1861  03f5               L002:
1862  03f5 ae01b7        	ldw	x,#439
1863  03f8 89            	pushw	x
1864  03f9 ae0000        	ldw	x,#0
1865  03fc 89            	pushw	x
1866  03fd ae000c        	ldw	x,#L75
1867  0400 cd0000        	call	_assert_failed
1869  0403 5b04          	addw	sp,#4
1870  0405               L402:
1871                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1873  0405 c650c9        	ld	a,20681
1874  0408 a4e1          	and	a,#225
1875  040a c750c9        	ld	20681,a
1876                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1878  040d c650c9        	ld	a,20681
1879  0410 1a01          	or	a,(OFST+1,sp)
1880  0412 c750c9        	ld	20681,a
1881                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1883  0415 721050c9      	bset	20681,#0
1884                     ; 449 }
1887  0419 84            	pop	a
1888  041a 81            	ret
1954                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1954                     ; 460 {
1955                     	switch	.text
1956  041b               _CLK_ITConfig:
1958  041b 89            	pushw	x
1959       00000000      OFST:	set	0
1962                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1964  041c 9f            	ld	a,xl
1965  041d 4d            	tnz	a
1966  041e 2705          	jreq	L212
1967  0420 9f            	ld	a,xl
1968  0421 a101          	cp	a,#1
1969  0423 2603          	jrne	L012
1970  0425               L212:
1971  0425 4f            	clr	a
1972  0426 2010          	jra	L412
1973  0428               L012:
1974  0428 ae01ce        	ldw	x,#462
1975  042b 89            	pushw	x
1976  042c ae0000        	ldw	x,#0
1977  042f 89            	pushw	x
1978  0430 ae000c        	ldw	x,#L75
1979  0433 cd0000        	call	_assert_failed
1981  0436 5b04          	addw	sp,#4
1982  0438               L412:
1983                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1985  0438 7b01          	ld	a,(OFST+1,sp)
1986  043a a10c          	cp	a,#12
1987  043c 2706          	jreq	L022
1988  043e 7b01          	ld	a,(OFST+1,sp)
1989  0440 a11c          	cp	a,#28
1990  0442 2603          	jrne	L612
1991  0444               L022:
1992  0444 4f            	clr	a
1993  0445 2010          	jra	L222
1994  0447               L612:
1995  0447 ae01cf        	ldw	x,#463
1996  044a 89            	pushw	x
1997  044b ae0000        	ldw	x,#0
1998  044e 89            	pushw	x
1999  044f ae000c        	ldw	x,#L75
2000  0452 cd0000        	call	_assert_failed
2002  0455 5b04          	addw	sp,#4
2003  0457               L222:
2004                     ; 465   if (NewState != DISABLE)
2006  0457 0d02          	tnz	(OFST+2,sp)
2007  0459 271a          	jreq	L727
2008                     ; 467     switch (CLK_IT)
2010  045b 7b01          	ld	a,(OFST+1,sp)
2012                     ; 475     default:
2012                     ; 476       break;
2013  045d a00c          	sub	a,#12
2014  045f 270a          	jreq	L366
2015  0461 a010          	sub	a,#16
2016  0463 2624          	jrne	L537
2017                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
2017                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
2019  0465 721450c5      	bset	20677,#2
2020                     ; 471       break;
2022  0469 201e          	jra	L537
2023  046b               L366:
2024                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
2024                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
2026  046b 721450c8      	bset	20680,#2
2027                     ; 474       break;
2029  046f 2018          	jra	L537
2030  0471               L566:
2031                     ; 475     default:
2031                     ; 476       break;
2033  0471 2016          	jra	L537
2034  0473               L337:
2036  0473 2014          	jra	L537
2037  0475               L727:
2038                     ; 481     switch (CLK_IT)
2040  0475 7b01          	ld	a,(OFST+1,sp)
2042                     ; 489     default:
2042                     ; 490       break;
2043  0477 a00c          	sub	a,#12
2044  0479 270a          	jreq	L176
2045  047b a010          	sub	a,#16
2046  047d 260a          	jrne	L537
2047                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
2047                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
2049  047f 721550c5      	bres	20677,#2
2050                     ; 485       break;
2052  0483 2004          	jra	L537
2053  0485               L176:
2054                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
2054                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
2056  0485 721550c8      	bres	20680,#2
2057                     ; 488       break;
2058  0489               L537:
2059                     ; 493 }
2062  0489 85            	popw	x
2063  048a 81            	ret
2064  048b               L376:
2065                     ; 489     default:
2065                     ; 490       break;
2067  048b 20fc          	jra	L537
2068  048d               L147:
2069  048d 20fa          	jra	L537
2105                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
2105                     ; 501 {
2106                     	switch	.text
2107  048f               _CLK_SYSCLKConfig:
2109  048f 88            	push	a
2110       00000000      OFST:	set	0
2113                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
2115  0490 4d            	tnz	a
2116  0491 272c          	jreq	L032
2117  0493 a108          	cp	a,#8
2118  0495 2728          	jreq	L032
2119  0497 a110          	cp	a,#16
2120  0499 2724          	jreq	L032
2121  049b a118          	cp	a,#24
2122  049d 2720          	jreq	L032
2123  049f a180          	cp	a,#128
2124  04a1 271c          	jreq	L032
2125  04a3 a181          	cp	a,#129
2126  04a5 2718          	jreq	L032
2127  04a7 a182          	cp	a,#130
2128  04a9 2714          	jreq	L032
2129  04ab a183          	cp	a,#131
2130  04ad 2710          	jreq	L032
2131  04af a184          	cp	a,#132
2132  04b1 270c          	jreq	L032
2133  04b3 a185          	cp	a,#133
2134  04b5 2708          	jreq	L032
2135  04b7 a186          	cp	a,#134
2136  04b9 2704          	jreq	L032
2137  04bb a187          	cp	a,#135
2138  04bd 2603          	jrne	L622
2139  04bf               L032:
2140  04bf 4f            	clr	a
2141  04c0 2010          	jra	L232
2142  04c2               L622:
2143  04c2 ae01f7        	ldw	x,#503
2144  04c5 89            	pushw	x
2145  04c6 ae0000        	ldw	x,#0
2146  04c9 89            	pushw	x
2147  04ca ae000c        	ldw	x,#L75
2148  04cd cd0000        	call	_assert_failed
2150  04d0 5b04          	addw	sp,#4
2151  04d2               L232:
2152                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
2154  04d2 7b01          	ld	a,(OFST+1,sp)
2155  04d4 a580          	bcp	a,#128
2156  04d6 2614          	jrne	L167
2157                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
2159  04d8 c650c6        	ld	a,20678
2160  04db a4e7          	and	a,#231
2161  04dd c750c6        	ld	20678,a
2162                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
2164  04e0 7b01          	ld	a,(OFST+1,sp)
2165  04e2 a418          	and	a,#24
2166  04e4 ca50c6        	or	a,20678
2167  04e7 c750c6        	ld	20678,a
2169  04ea 2012          	jra	L367
2170  04ec               L167:
2171                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
2173  04ec c650c6        	ld	a,20678
2174  04ef a4f8          	and	a,#248
2175  04f1 c750c6        	ld	20678,a
2176                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
2178  04f4 7b01          	ld	a,(OFST+1,sp)
2179  04f6 a407          	and	a,#7
2180  04f8 ca50c6        	or	a,20678
2181  04fb c750c6        	ld	20678,a
2182  04fe               L367:
2183                     ; 515 }
2186  04fe 84            	pop	a
2187  04ff 81            	ret
2244                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
2244                     ; 524 {
2245                     	switch	.text
2246  0500               _CLK_SWIMConfig:
2248  0500 88            	push	a
2249       00000000      OFST:	set	0
2252                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
2254  0501 4d            	tnz	a
2255  0502 2704          	jreq	L042
2256  0504 a101          	cp	a,#1
2257  0506 2603          	jrne	L632
2258  0508               L042:
2259  0508 4f            	clr	a
2260  0509 2010          	jra	L242
2261  050b               L632:
2262  050b ae020e        	ldw	x,#526
2263  050e 89            	pushw	x
2264  050f ae0000        	ldw	x,#0
2265  0512 89            	pushw	x
2266  0513 ae000c        	ldw	x,#L75
2267  0516 cd0000        	call	_assert_failed
2269  0519 5b04          	addw	sp,#4
2270  051b               L242:
2271                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
2273  051b 0d01          	tnz	(OFST+1,sp)
2274  051d 2706          	jreq	L3101
2275                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
2277  051f 721050cd      	bset	20685,#0
2279  0523 2004          	jra	L5101
2280  0525               L3101:
2281                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
2283  0525 721150cd      	bres	20685,#0
2284  0529               L5101:
2285                     ; 538 }
2288  0529 84            	pop	a
2289  052a 81            	ret
2313                     ; 547 void CLK_ClockSecuritySystemEnable(void)
2313                     ; 548 {
2314                     	switch	.text
2315  052b               _CLK_ClockSecuritySystemEnable:
2319                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
2321  052b 721050c8      	bset	20680,#0
2322                     ; 551 }
2325  052f 81            	ret
2350                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
2350                     ; 560 {
2351                     	switch	.text
2352  0530               _CLK_GetSYSCLKSource:
2356                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
2358  0530 c650c3        	ld	a,20675
2361  0533 81            	ret
2424                     ; 569 uint32_t CLK_GetClockFreq(void)
2424                     ; 570 {
2425                     	switch	.text
2426  0534               _CLK_GetClockFreq:
2428  0534 5209          	subw	sp,#9
2429       00000009      OFST:	set	9
2432                     ; 571   uint32_t clockfrequency = 0;
2434                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
2436                     ; 573   uint8_t tmp = 0, presc = 0;
2440                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
2442  0536 c650c3        	ld	a,20675
2443  0539 6b09          	ld	(OFST+0,sp),a
2445                     ; 578   if (clocksource == CLK_SOURCE_HSI)
2447  053b 7b09          	ld	a,(OFST+0,sp)
2448  053d a1e1          	cp	a,#225
2449  053f 2641          	jrne	L1701
2450                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
2452  0541 c650c6        	ld	a,20678
2453  0544 a418          	and	a,#24
2454  0546 6b09          	ld	(OFST+0,sp),a
2456                     ; 581     tmp = (uint8_t)(tmp >> 3);
2458  0548 0409          	srl	(OFST+0,sp)
2459  054a 0409          	srl	(OFST+0,sp)
2460  054c 0409          	srl	(OFST+0,sp)
2462                     ; 582     presc = HSIDivFactor[tmp];
2464  054e 7b09          	ld	a,(OFST+0,sp)
2465  0550 5f            	clrw	x
2466  0551 97            	ld	xl,a
2467  0552 d60000        	ld	a,(_HSIDivFactor,x)
2468  0555 6b09          	ld	(OFST+0,sp),a
2470                     ; 583     clockfrequency = HSI_VALUE / presc;
2472  0557 7b09          	ld	a,(OFST+0,sp)
2473  0559 b703          	ld	c_lreg+3,a
2474  055b 3f02          	clr	c_lreg+2
2475  055d 3f01          	clr	c_lreg+1
2476  055f 3f00          	clr	c_lreg
2477  0561 96            	ldw	x,sp
2478  0562 1c0001        	addw	x,#OFST-8
2479  0565 cd0000        	call	c_rtol
2482  0568 ae2400        	ldw	x,#9216
2483  056b bf02          	ldw	c_lreg+2,x
2484  056d ae00f4        	ldw	x,#244
2485  0570 bf00          	ldw	c_lreg,x
2486  0572 96            	ldw	x,sp
2487  0573 1c0001        	addw	x,#OFST-8
2488  0576 cd0000        	call	c_ludv
2490  0579 96            	ldw	x,sp
2491  057a 1c0005        	addw	x,#OFST-4
2492  057d cd0000        	call	c_rtol
2496  0580 201c          	jra	L3701
2497  0582               L1701:
2498                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2500  0582 7b09          	ld	a,(OFST+0,sp)
2501  0584 a1d2          	cp	a,#210
2502  0586 260c          	jrne	L5701
2503                     ; 587     clockfrequency = LSI_VALUE;
2505  0588 aef400        	ldw	x,#62464
2506  058b 1f07          	ldw	(OFST-2,sp),x
2507  058d ae0001        	ldw	x,#1
2508  0590 1f05          	ldw	(OFST-4,sp),x
2511  0592 200a          	jra	L3701
2512  0594               L5701:
2513                     ; 591     clockfrequency = HSE_VALUE;
2515  0594 ae2400        	ldw	x,#9216
2516  0597 1f07          	ldw	(OFST-2,sp),x
2517  0599 ae00f4        	ldw	x,#244
2518  059c 1f05          	ldw	(OFST-4,sp),x
2520  059e               L3701:
2521                     ; 594   return((uint32_t)clockfrequency);
2523  059e 96            	ldw	x,sp
2524  059f 1c0005        	addw	x,#OFST-4
2525  05a2 cd0000        	call	c_ltor
2529  05a5 5b09          	addw	sp,#9
2530  05a7 81            	ret
2630                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2630                     ; 605 {
2631                     	switch	.text
2632  05a8               _CLK_AdjustHSICalibrationValue:
2634  05a8 88            	push	a
2635       00000000      OFST:	set	0
2638                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2640  05a9 4d            	tnz	a
2641  05aa 271c          	jreq	L652
2642  05ac a101          	cp	a,#1
2643  05ae 2718          	jreq	L652
2644  05b0 a102          	cp	a,#2
2645  05b2 2714          	jreq	L652
2646  05b4 a103          	cp	a,#3
2647  05b6 2710          	jreq	L652
2648  05b8 a104          	cp	a,#4
2649  05ba 270c          	jreq	L652
2650  05bc a105          	cp	a,#5
2651  05be 2708          	jreq	L652
2652  05c0 a106          	cp	a,#6
2653  05c2 2704          	jreq	L652
2654  05c4 a107          	cp	a,#7
2655  05c6 2603          	jrne	L452
2656  05c8               L652:
2657  05c8 4f            	clr	a
2658  05c9 2010          	jra	L062
2659  05cb               L452:
2660  05cb ae025f        	ldw	x,#607
2661  05ce 89            	pushw	x
2662  05cf ae0000        	ldw	x,#0
2663  05d2 89            	pushw	x
2664  05d3 ae000c        	ldw	x,#L75
2665  05d6 cd0000        	call	_assert_failed
2667  05d9 5b04          	addw	sp,#4
2668  05db               L062:
2669                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2671  05db c650cc        	ld	a,20684
2672  05de a4f8          	and	a,#248
2673  05e0 1a01          	or	a,(OFST+1,sp)
2674  05e2 c750cc        	ld	20684,a
2675                     ; 611 }
2678  05e5 84            	pop	a
2679  05e6 81            	ret
2703                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2703                     ; 623 {
2704                     	switch	.text
2705  05e7               _CLK_SYSCLKEmergencyClear:
2709                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2711  05e7 721150c5      	bres	20677,#0
2712                     ; 625 }
2715  05eb 81            	ret
2869                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2869                     ; 635 {
2870                     	switch	.text
2871  05ec               _CLK_GetFlagStatus:
2873  05ec 89            	pushw	x
2874  05ed 5203          	subw	sp,#3
2875       00000003      OFST:	set	3
2878                     ; 636   uint16_t statusreg = 0;
2880                     ; 637   uint8_t tmpreg = 0;
2882                     ; 638   FlagStatus bitstatus = RESET;
2884                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2886  05ef a30110        	cpw	x,#272
2887  05f2 2728          	jreq	L072
2888  05f4 a30102        	cpw	x,#258
2889  05f7 2723          	jreq	L072
2890  05f9 a30202        	cpw	x,#514
2891  05fc 271e          	jreq	L072
2892  05fe a30308        	cpw	x,#776
2893  0601 2719          	jreq	L072
2894  0603 a30301        	cpw	x,#769
2895  0606 2714          	jreq	L072
2896  0608 a30408        	cpw	x,#1032
2897  060b 270f          	jreq	L072
2898  060d a30402        	cpw	x,#1026
2899  0610 270a          	jreq	L072
2900  0612 a30504        	cpw	x,#1284
2901  0615 2705          	jreq	L072
2902  0617 a30502        	cpw	x,#1282
2903  061a 2603          	jrne	L662
2904  061c               L072:
2905  061c 4f            	clr	a
2906  061d 2010          	jra	L272
2907  061f               L662:
2908  061f ae0281        	ldw	x,#641
2909  0622 89            	pushw	x
2910  0623 ae0000        	ldw	x,#0
2911  0626 89            	pushw	x
2912  0627 ae000c        	ldw	x,#L75
2913  062a cd0000        	call	_assert_failed
2915  062d 5b04          	addw	sp,#4
2916  062f               L272:
2917                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2919  062f 7b04          	ld	a,(OFST+1,sp)
2920  0631 97            	ld	xl,a
2921  0632 7b05          	ld	a,(OFST+2,sp)
2922  0634 9f            	ld	a,xl
2923  0635 a4ff          	and	a,#255
2924  0637 97            	ld	xl,a
2925  0638 4f            	clr	a
2926  0639 02            	rlwa	x,a
2927  063a 1f01          	ldw	(OFST-2,sp),x
2928  063c 01            	rrwa	x,a
2930                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2932  063d 1e01          	ldw	x,(OFST-2,sp)
2933  063f a30100        	cpw	x,#256
2934  0642 2607          	jrne	L3421
2935                     ; 649     tmpreg = CLK->ICKR;
2937  0644 c650c0        	ld	a,20672
2938  0647 6b03          	ld	(OFST+0,sp),a
2941  0649 202f          	jra	L5421
2942  064b               L3421:
2943                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2945  064b 1e01          	ldw	x,(OFST-2,sp)
2946  064d a30200        	cpw	x,#512
2947  0650 2607          	jrne	L7421
2948                     ; 653     tmpreg = CLK->ECKR;
2950  0652 c650c1        	ld	a,20673
2951  0655 6b03          	ld	(OFST+0,sp),a
2954  0657 2021          	jra	L5421
2955  0659               L7421:
2956                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2958  0659 1e01          	ldw	x,(OFST-2,sp)
2959  065b a30300        	cpw	x,#768
2960  065e 2607          	jrne	L3521
2961                     ; 657     tmpreg = CLK->SWCR;
2963  0660 c650c5        	ld	a,20677
2964  0663 6b03          	ld	(OFST+0,sp),a
2967  0665 2013          	jra	L5421
2968  0667               L3521:
2969                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2971  0667 1e01          	ldw	x,(OFST-2,sp)
2972  0669 a30400        	cpw	x,#1024
2973  066c 2607          	jrne	L7521
2974                     ; 661     tmpreg = CLK->CSSR;
2976  066e c650c8        	ld	a,20680
2977  0671 6b03          	ld	(OFST+0,sp),a
2980  0673 2005          	jra	L5421
2981  0675               L7521:
2982                     ; 665     tmpreg = CLK->CCOR;
2984  0675 c650c9        	ld	a,20681
2985  0678 6b03          	ld	(OFST+0,sp),a
2987  067a               L5421:
2988                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2990  067a 7b05          	ld	a,(OFST+2,sp)
2991  067c 1503          	bcp	a,(OFST+0,sp)
2992  067e 2706          	jreq	L3621
2993                     ; 670     bitstatus = SET;
2995  0680 a601          	ld	a,#1
2996  0682 6b03          	ld	(OFST+0,sp),a
2999  0684 2002          	jra	L5621
3000  0686               L3621:
3001                     ; 674     bitstatus = RESET;
3003  0686 0f03          	clr	(OFST+0,sp)
3005  0688               L5621:
3006                     ; 678   return((FlagStatus)bitstatus);
3008  0688 7b03          	ld	a,(OFST+0,sp)
3011  068a 5b05          	addw	sp,#5
3012  068c 81            	ret
3059                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
3059                     ; 688 {
3060                     	switch	.text
3061  068d               _CLK_GetITStatus:
3063  068d 88            	push	a
3064  068e 88            	push	a
3065       00000001      OFST:	set	1
3068                     ; 689   ITStatus bitstatus = RESET;
3070                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
3072  068f a10c          	cp	a,#12
3073  0691 2704          	jreq	L003
3074  0693 a11c          	cp	a,#28
3075  0695 2603          	jrne	L672
3076  0697               L003:
3077  0697 4f            	clr	a
3078  0698 2010          	jra	L203
3079  069a               L672:
3080  069a ae02b4        	ldw	x,#692
3081  069d 89            	pushw	x
3082  069e ae0000        	ldw	x,#0
3083  06a1 89            	pushw	x
3084  06a2 ae000c        	ldw	x,#L75
3085  06a5 cd0000        	call	_assert_failed
3087  06a8 5b04          	addw	sp,#4
3088  06aa               L203:
3089                     ; 694   if (CLK_IT == CLK_IT_SWIF)
3091  06aa 7b02          	ld	a,(OFST+1,sp)
3092  06ac a11c          	cp	a,#28
3093  06ae 2613          	jrne	L1131
3094                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
3096  06b0 c650c5        	ld	a,20677
3097  06b3 1402          	and	a,(OFST+1,sp)
3098  06b5 a10c          	cp	a,#12
3099  06b7 2606          	jrne	L3131
3100                     ; 699       bitstatus = SET;
3102  06b9 a601          	ld	a,#1
3103  06bb 6b01          	ld	(OFST+0,sp),a
3106  06bd 2015          	jra	L7131
3107  06bf               L3131:
3108                     ; 703       bitstatus = RESET;
3110  06bf 0f01          	clr	(OFST+0,sp)
3112  06c1 2011          	jra	L7131
3113  06c3               L1131:
3114                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
3116  06c3 c650c8        	ld	a,20680
3117  06c6 1402          	and	a,(OFST+1,sp)
3118  06c8 a10c          	cp	a,#12
3119  06ca 2606          	jrne	L1231
3120                     ; 711       bitstatus = SET;
3122  06cc a601          	ld	a,#1
3123  06ce 6b01          	ld	(OFST+0,sp),a
3126  06d0 2002          	jra	L7131
3127  06d2               L1231:
3128                     ; 715       bitstatus = RESET;
3130  06d2 0f01          	clr	(OFST+0,sp)
3132  06d4               L7131:
3133                     ; 720   return bitstatus;
3135  06d4 7b01          	ld	a,(OFST+0,sp)
3138  06d6 85            	popw	x
3139  06d7 81            	ret
3176                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
3176                     ; 730 {
3177                     	switch	.text
3178  06d8               _CLK_ClearITPendingBit:
3180  06d8 88            	push	a
3181       00000000      OFST:	set	0
3184                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
3186  06d9 a10c          	cp	a,#12
3187  06db 2704          	jreq	L013
3188  06dd a11c          	cp	a,#28
3189  06df 2603          	jrne	L603
3190  06e1               L013:
3191  06e1 4f            	clr	a
3192  06e2 2010          	jra	L213
3193  06e4               L603:
3194  06e4 ae02dc        	ldw	x,#732
3195  06e7 89            	pushw	x
3196  06e8 ae0000        	ldw	x,#0
3197  06eb 89            	pushw	x
3198  06ec ae000c        	ldw	x,#L75
3199  06ef cd0000        	call	_assert_failed
3201  06f2 5b04          	addw	sp,#4
3202  06f4               L213:
3203                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
3205  06f4 7b01          	ld	a,(OFST+1,sp)
3206  06f6 a10c          	cp	a,#12
3207  06f8 2606          	jrne	L3431
3208                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
3210  06fa 721750c8      	bres	20680,#3
3212  06fe 2004          	jra	L5431
3213  0700               L3431:
3214                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
3216  0700 721750c5      	bres	20677,#3
3217  0704               L5431:
3218                     ; 745 }
3221  0704 84            	pop	a
3222  0705 81            	ret
3257                     	xdef	_CLKPrescTable
3258                     	xdef	_HSIDivFactor
3259                     	xdef	_CLK_ClearITPendingBit
3260                     	xdef	_CLK_GetITStatus
3261                     	xdef	_CLK_GetFlagStatus
3262                     	xdef	_CLK_GetSYSCLKSource
3263                     	xdef	_CLK_GetClockFreq
3264                     	xdef	_CLK_AdjustHSICalibrationValue
3265                     	xdef	_CLK_SYSCLKEmergencyClear
3266                     	xdef	_CLK_ClockSecuritySystemEnable
3267                     	xdef	_CLK_SWIMConfig
3268                     	xdef	_CLK_SYSCLKConfig
3269                     	xdef	_CLK_ITConfig
3270                     	xdef	_CLK_CCOConfig
3271                     	xdef	_CLK_HSIPrescalerConfig
3272                     	xdef	_CLK_ClockSwitchConfig
3273                     	xdef	_CLK_PeripheralClockConfig
3274                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
3275                     	xdef	_CLK_FastHaltWakeUpCmd
3276                     	xdef	_CLK_ClockSwitchCmd
3277                     	xdef	_CLK_CCOCmd
3278                     	xdef	_CLK_LSICmd
3279                     	xdef	_CLK_HSICmd
3280                     	xdef	_CLK_HSECmd
3281                     	xdef	_CLK_DeInit
3282                     	xref	_assert_failed
3283                     	switch	.const
3284  000c               L75:
3285  000c 2e2e5c73746d  	dc.b	"..\stm8s_stdperiph"
3286  001e 5f6472697665  	dc.b	"_driver\src\stm8s_"
3287  0030 636c6b2e6300  	dc.b	"clk.c",0
3288                     	xref.b	c_lreg
3289                     	xref.b	c_x
3309                     	xref	c_ltor
3310                     	xref	c_ludv
3311                     	xref	c_rtol
3312                     	end
