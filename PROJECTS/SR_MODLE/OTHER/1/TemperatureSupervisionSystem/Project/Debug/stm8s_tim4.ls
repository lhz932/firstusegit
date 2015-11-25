   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
  44                     ; 49 void TIM4_DeInit(void)
  44                     ; 50 {
  46                     	switch	.text
  47  0000               _TIM4_DeInit:
  51                     ; 51   TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  53  0000 725f5340      	clr	21312
  54                     ; 52   TIM4->IER = TIM4_IER_RESET_VALUE;
  56  0004 725f5343      	clr	21315
  57                     ; 53   TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  59  0008 725f5346      	clr	21318
  60                     ; 54   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  62  000c 725f5347      	clr	21319
  63                     ; 55   TIM4->ARR = TIM4_ARR_RESET_VALUE;
  65  0010 35ff5348      	mov	21320,#255
  66                     ; 56   TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  68  0014 725f5344      	clr	21316
  69                     ; 57 }
  72  0018 81            	ret
 179                     ; 65 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 179                     ; 66 {
 180                     	switch	.text
 181  0019               _TIM4_TimeBaseInit:
 183  0019 89            	pushw	x
 184       00000000      OFST:	set	0
 187                     ; 68   assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 189  001a 9e            	ld	a,xh
 190  001b 4d            	tnz	a
 191  001c 2723          	jreq	L21
 192  001e 9e            	ld	a,xh
 193  001f a101          	cp	a,#1
 194  0021 271e          	jreq	L21
 195  0023 9e            	ld	a,xh
 196  0024 a102          	cp	a,#2
 197  0026 2719          	jreq	L21
 198  0028 9e            	ld	a,xh
 199  0029 a103          	cp	a,#3
 200  002b 2714          	jreq	L21
 201  002d 9e            	ld	a,xh
 202  002e a104          	cp	a,#4
 203  0030 270f          	jreq	L21
 204  0032 9e            	ld	a,xh
 205  0033 a105          	cp	a,#5
 206  0035 270a          	jreq	L21
 207  0037 9e            	ld	a,xh
 208  0038 a106          	cp	a,#6
 209  003a 2705          	jreq	L21
 210  003c 9e            	ld	a,xh
 211  003d a107          	cp	a,#7
 212  003f 2603          	jrne	L01
 213  0041               L21:
 214  0041 4f            	clr	a
 215  0042 2010          	jra	L41
 216  0044               L01:
 217  0044 ae0044        	ldw	x,#68
 218  0047 89            	pushw	x
 219  0048 ae0000        	ldw	x,#0
 220  004b 89            	pushw	x
 221  004c ae0000        	ldw	x,#L76
 222  004f cd0000        	call	_assert_failed
 224  0052 5b04          	addw	sp,#4
 225  0054               L41:
 226                     ; 70   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 228  0054 7b01          	ld	a,(OFST+1,sp)
 229  0056 c75347        	ld	21319,a
 230                     ; 72   TIM4->ARR = (uint8_t)(TIM4_Period);
 232  0059 7b02          	ld	a,(OFST+2,sp)
 233  005b c75348        	ld	21320,a
 234                     ; 73 }
 237  005e 85            	popw	x
 238  005f 81            	ret
 294                     ; 81 void TIM4_Cmd(FunctionalState NewState)
 294                     ; 82 {
 295                     	switch	.text
 296  0060               _TIM4_Cmd:
 298  0060 88            	push	a
 299       00000000      OFST:	set	0
 302                     ; 84   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 304  0061 4d            	tnz	a
 305  0062 2704          	jreq	L22
 306  0064 a101          	cp	a,#1
 307  0066 2603          	jrne	L02
 308  0068               L22:
 309  0068 4f            	clr	a
 310  0069 2010          	jra	L42
 311  006b               L02:
 312  006b ae0054        	ldw	x,#84
 313  006e 89            	pushw	x
 314  006f ae0000        	ldw	x,#0
 315  0072 89            	pushw	x
 316  0073 ae0000        	ldw	x,#L76
 317  0076 cd0000        	call	_assert_failed
 319  0079 5b04          	addw	sp,#4
 320  007b               L42:
 321                     ; 87   if (NewState != DISABLE)
 323  007b 0d01          	tnz	(OFST+1,sp)
 324  007d 2706          	jreq	L711
 325                     ; 89     TIM4->CR1 |= TIM4_CR1_CEN;
 327  007f 72105340      	bset	21312,#0
 329  0083 2004          	jra	L121
 330  0085               L711:
 331                     ; 93     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 333  0085 72115340      	bres	21312,#0
 334  0089               L121:
 335                     ; 95 }
 338  0089 84            	pop	a
 339  008a 81            	ret
 398                     ; 107 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 398                     ; 108 {
 399                     	switch	.text
 400  008b               _TIM4_ITConfig:
 402  008b 89            	pushw	x
 403       00000000      OFST:	set	0
 406                     ; 110   assert_param(IS_TIM4_IT_OK(TIM4_IT));
 408  008c 9e            	ld	a,xh
 409  008d a101          	cp	a,#1
 410  008f 2603          	jrne	L03
 411  0091 4f            	clr	a
 412  0092 2010          	jra	L23
 413  0094               L03:
 414  0094 ae006e        	ldw	x,#110
 415  0097 89            	pushw	x
 416  0098 ae0000        	ldw	x,#0
 417  009b 89            	pushw	x
 418  009c ae0000        	ldw	x,#L76
 419  009f cd0000        	call	_assert_failed
 421  00a2 5b04          	addw	sp,#4
 422  00a4               L23:
 423                     ; 111   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 425  00a4 0d02          	tnz	(OFST+2,sp)
 426  00a6 2706          	jreq	L63
 427  00a8 7b02          	ld	a,(OFST+2,sp)
 428  00aa a101          	cp	a,#1
 429  00ac 2603          	jrne	L43
 430  00ae               L63:
 431  00ae 4f            	clr	a
 432  00af 2010          	jra	L04
 433  00b1               L43:
 434  00b1 ae006f        	ldw	x,#111
 435  00b4 89            	pushw	x
 436  00b5 ae0000        	ldw	x,#0
 437  00b8 89            	pushw	x
 438  00b9 ae0000        	ldw	x,#L76
 439  00bc cd0000        	call	_assert_failed
 441  00bf 5b04          	addw	sp,#4
 442  00c1               L04:
 443                     ; 113   if (NewState != DISABLE)
 445  00c1 0d02          	tnz	(OFST+2,sp)
 446  00c3 270a          	jreq	L351
 447                     ; 116     TIM4->IER |= (uint8_t)TIM4_IT;
 449  00c5 c65343        	ld	a,21315
 450  00c8 1a01          	or	a,(OFST+1,sp)
 451  00ca c75343        	ld	21315,a
 453  00cd 2009          	jra	L551
 454  00cf               L351:
 455                     ; 121     TIM4->IER &= (uint8_t)(~TIM4_IT);
 457  00cf 7b01          	ld	a,(OFST+1,sp)
 458  00d1 43            	cpl	a
 459  00d2 c45343        	and	a,21315
 460  00d5 c75343        	ld	21315,a
 461  00d8               L551:
 462                     ; 123 }
 465  00d8 85            	popw	x
 466  00d9 81            	ret
 503                     ; 131 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 503                     ; 132 {
 504                     	switch	.text
 505  00da               _TIM4_UpdateDisableConfig:
 507  00da 88            	push	a
 508       00000000      OFST:	set	0
 511                     ; 134   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 513  00db 4d            	tnz	a
 514  00dc 2704          	jreq	L64
 515  00de a101          	cp	a,#1
 516  00e0 2603          	jrne	L44
 517  00e2               L64:
 518  00e2 4f            	clr	a
 519  00e3 2010          	jra	L05
 520  00e5               L44:
 521  00e5 ae0086        	ldw	x,#134
 522  00e8 89            	pushw	x
 523  00e9 ae0000        	ldw	x,#0
 524  00ec 89            	pushw	x
 525  00ed ae0000        	ldw	x,#L76
 526  00f0 cd0000        	call	_assert_failed
 528  00f3 5b04          	addw	sp,#4
 529  00f5               L05:
 530                     ; 137   if (NewState != DISABLE)
 532  00f5 0d01          	tnz	(OFST+1,sp)
 533  00f7 2706          	jreq	L571
 534                     ; 139     TIM4->CR1 |= TIM4_CR1_UDIS;
 536  00f9 72125340      	bset	21312,#1
 538  00fd 2004          	jra	L771
 539  00ff               L571:
 540                     ; 143     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 542  00ff 72135340      	bres	21312,#1
 543  0103               L771:
 544                     ; 145 }
 547  0103 84            	pop	a
 548  0104 81            	ret
 607                     ; 155 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 607                     ; 156 {
 608                     	switch	.text
 609  0105               _TIM4_UpdateRequestConfig:
 611  0105 88            	push	a
 612       00000000      OFST:	set	0
 615                     ; 158   assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 617  0106 4d            	tnz	a
 618  0107 2704          	jreq	L65
 619  0109 a101          	cp	a,#1
 620  010b 2603          	jrne	L45
 621  010d               L65:
 622  010d 4f            	clr	a
 623  010e 2010          	jra	L06
 624  0110               L45:
 625  0110 ae009e        	ldw	x,#158
 626  0113 89            	pushw	x
 627  0114 ae0000        	ldw	x,#0
 628  0117 89            	pushw	x
 629  0118 ae0000        	ldw	x,#L76
 630  011b cd0000        	call	_assert_failed
 632  011e 5b04          	addw	sp,#4
 633  0120               L06:
 634                     ; 161   if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 636  0120 0d01          	tnz	(OFST+1,sp)
 637  0122 2706          	jreq	L722
 638                     ; 163     TIM4->CR1 |= TIM4_CR1_URS;
 640  0124 72145340      	bset	21312,#2
 642  0128 2004          	jra	L132
 643  012a               L722:
 644                     ; 167     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 646  012a 72155340      	bres	21312,#2
 647  012e               L132:
 648                     ; 169 }
 651  012e 84            	pop	a
 652  012f 81            	ret
 710                     ; 179 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 710                     ; 180 {
 711                     	switch	.text
 712  0130               _TIM4_SelectOnePulseMode:
 714  0130 88            	push	a
 715       00000000      OFST:	set	0
 718                     ; 182   assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 720  0131 a101          	cp	a,#1
 721  0133 2703          	jreq	L66
 722  0135 4d            	tnz	a
 723  0136 2603          	jrne	L46
 724  0138               L66:
 725  0138 4f            	clr	a
 726  0139 2010          	jra	L07
 727  013b               L46:
 728  013b ae00b6        	ldw	x,#182
 729  013e 89            	pushw	x
 730  013f ae0000        	ldw	x,#0
 731  0142 89            	pushw	x
 732  0143 ae0000        	ldw	x,#L76
 733  0146 cd0000        	call	_assert_failed
 735  0149 5b04          	addw	sp,#4
 736  014b               L07:
 737                     ; 185   if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 739  014b 0d01          	tnz	(OFST+1,sp)
 740  014d 2706          	jreq	L162
 741                     ; 187     TIM4->CR1 |= TIM4_CR1_OPM;
 743  014f 72165340      	bset	21312,#3
 745  0153 2004          	jra	L362
 746  0155               L162:
 747                     ; 191     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 749  0155 72175340      	bres	21312,#3
 750  0159               L362:
 751                     ; 193 }
 754  0159 84            	pop	a
 755  015a 81            	ret
 824                     ; 215 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 824                     ; 216 {
 825                     	switch	.text
 826  015b               _TIM4_PrescalerConfig:
 828  015b 89            	pushw	x
 829       00000000      OFST:	set	0
 832                     ; 218   assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 834  015c 9f            	ld	a,xl
 835  015d 4d            	tnz	a
 836  015e 2705          	jreq	L67
 837  0160 9f            	ld	a,xl
 838  0161 a101          	cp	a,#1
 839  0163 2603          	jrne	L47
 840  0165               L67:
 841  0165 4f            	clr	a
 842  0166 2010          	jra	L001
 843  0168               L47:
 844  0168 ae00da        	ldw	x,#218
 845  016b 89            	pushw	x
 846  016c ae0000        	ldw	x,#0
 847  016f 89            	pushw	x
 848  0170 ae0000        	ldw	x,#L76
 849  0173 cd0000        	call	_assert_failed
 851  0176 5b04          	addw	sp,#4
 852  0178               L001:
 853                     ; 219   assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 855  0178 0d01          	tnz	(OFST+1,sp)
 856  017a 272a          	jreq	L401
 857  017c 7b01          	ld	a,(OFST+1,sp)
 858  017e a101          	cp	a,#1
 859  0180 2724          	jreq	L401
 860  0182 7b01          	ld	a,(OFST+1,sp)
 861  0184 a102          	cp	a,#2
 862  0186 271e          	jreq	L401
 863  0188 7b01          	ld	a,(OFST+1,sp)
 864  018a a103          	cp	a,#3
 865  018c 2718          	jreq	L401
 866  018e 7b01          	ld	a,(OFST+1,sp)
 867  0190 a104          	cp	a,#4
 868  0192 2712          	jreq	L401
 869  0194 7b01          	ld	a,(OFST+1,sp)
 870  0196 a105          	cp	a,#5
 871  0198 270c          	jreq	L401
 872  019a 7b01          	ld	a,(OFST+1,sp)
 873  019c a106          	cp	a,#6
 874  019e 2706          	jreq	L401
 875  01a0 7b01          	ld	a,(OFST+1,sp)
 876  01a2 a107          	cp	a,#7
 877  01a4 2603          	jrne	L201
 878  01a6               L401:
 879  01a6 4f            	clr	a
 880  01a7 2010          	jra	L601
 881  01a9               L201:
 882  01a9 ae00db        	ldw	x,#219
 883  01ac 89            	pushw	x
 884  01ad ae0000        	ldw	x,#0
 885  01b0 89            	pushw	x
 886  01b1 ae0000        	ldw	x,#L76
 887  01b4 cd0000        	call	_assert_failed
 889  01b7 5b04          	addw	sp,#4
 890  01b9               L601:
 891                     ; 222   TIM4->PSCR = (uint8_t)Prescaler;
 893  01b9 7b01          	ld	a,(OFST+1,sp)
 894  01bb c75347        	ld	21319,a
 895                     ; 225   TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 897  01be 7b02          	ld	a,(OFST+2,sp)
 898  01c0 c75345        	ld	21317,a
 899                     ; 226 }
 902  01c3 85            	popw	x
 903  01c4 81            	ret
 940                     ; 234 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 940                     ; 235 {
 941                     	switch	.text
 942  01c5               _TIM4_ARRPreloadConfig:
 944  01c5 88            	push	a
 945       00000000      OFST:	set	0
 948                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 950  01c6 4d            	tnz	a
 951  01c7 2704          	jreq	L411
 952  01c9 a101          	cp	a,#1
 953  01cb 2603          	jrne	L211
 954  01cd               L411:
 955  01cd 4f            	clr	a
 956  01ce 2010          	jra	L611
 957  01d0               L211:
 958  01d0 ae00ed        	ldw	x,#237
 959  01d3 89            	pushw	x
 960  01d4 ae0000        	ldw	x,#0
 961  01d7 89            	pushw	x
 962  01d8 ae0000        	ldw	x,#L76
 963  01db cd0000        	call	_assert_failed
 965  01de 5b04          	addw	sp,#4
 966  01e0               L611:
 967                     ; 240   if (NewState != DISABLE)
 969  01e0 0d01          	tnz	(OFST+1,sp)
 970  01e2 2706          	jreq	L533
 971                     ; 242     TIM4->CR1 |= TIM4_CR1_ARPE;
 973  01e4 721e5340      	bset	21312,#7
 975  01e8 2004          	jra	L733
 976  01ea               L533:
 977                     ; 246     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 979  01ea 721f5340      	bres	21312,#7
 980  01ee               L733:
 981                     ; 248 }
 984  01ee 84            	pop	a
 985  01ef 81            	ret
1035                     ; 257 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1035                     ; 258 {
1036                     	switch	.text
1037  01f0               _TIM4_GenerateEvent:
1039  01f0 88            	push	a
1040       00000000      OFST:	set	0
1043                     ; 260   assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
1045  01f1 a101          	cp	a,#1
1046  01f3 2603          	jrne	L221
1047  01f5 4f            	clr	a
1048  01f6 2010          	jra	L421
1049  01f8               L221:
1050  01f8 ae0104        	ldw	x,#260
1051  01fb 89            	pushw	x
1052  01fc ae0000        	ldw	x,#0
1053  01ff 89            	pushw	x
1054  0200 ae0000        	ldw	x,#L76
1055  0203 cd0000        	call	_assert_failed
1057  0206 5b04          	addw	sp,#4
1058  0208               L421:
1059                     ; 263   TIM4->EGR = (uint8_t)(TIM4_EventSource);
1061  0208 7b01          	ld	a,(OFST+1,sp)
1062  020a c75345        	ld	21317,a
1063                     ; 264 }
1066  020d 84            	pop	a
1067  020e 81            	ret
1101                     ; 272 void TIM4_SetCounter(uint8_t Counter)
1101                     ; 273 {
1102                     	switch	.text
1103  020f               _TIM4_SetCounter:
1107                     ; 275   TIM4->CNTR = (uint8_t)(Counter);
1109  020f c75346        	ld	21318,a
1110                     ; 276 }
1113  0212 81            	ret
1147                     ; 284 void TIM4_SetAutoreload(uint8_t Autoreload)
1147                     ; 285 {
1148                     	switch	.text
1149  0213               _TIM4_SetAutoreload:
1153                     ; 287   TIM4->ARR = (uint8_t)(Autoreload);
1155  0213 c75348        	ld	21320,a
1156                     ; 288 }
1159  0216 81            	ret
1182                     ; 295 uint8_t TIM4_GetCounter(void)
1182                     ; 296 {
1183                     	switch	.text
1184  0217               _TIM4_GetCounter:
1188                     ; 298   return (uint8_t)(TIM4->CNTR);
1190  0217 c65346        	ld	a,21318
1193  021a 81            	ret
1217                     ; 306 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
1217                     ; 307 {
1218                     	switch	.text
1219  021b               _TIM4_GetPrescaler:
1223                     ; 309   return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
1225  021b c65347        	ld	a,21319
1228  021e 81            	ret
1308                     ; 319 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1308                     ; 320 {
1309                     	switch	.text
1310  021f               _TIM4_GetFlagStatus:
1312  021f 88            	push	a
1313  0220 88            	push	a
1314       00000001      OFST:	set	1
1317                     ; 321   FlagStatus bitstatus = RESET;
1319                     ; 324   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1321  0221 a101          	cp	a,#1
1322  0223 2603          	jrne	L041
1323  0225 4f            	clr	a
1324  0226 2010          	jra	L241
1325  0228               L041:
1326  0228 ae0144        	ldw	x,#324
1327  022b 89            	pushw	x
1328  022c ae0000        	ldw	x,#0
1329  022f 89            	pushw	x
1330  0230 ae0000        	ldw	x,#L76
1331  0233 cd0000        	call	_assert_failed
1333  0236 5b04          	addw	sp,#4
1334  0238               L241:
1335                     ; 326   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1337  0238 c65344        	ld	a,21316
1338  023b 1502          	bcp	a,(OFST+1,sp)
1339  023d 2706          	jreq	L105
1340                     ; 328     bitstatus = SET;
1342  023f a601          	ld	a,#1
1343  0241 6b01          	ld	(OFST+0,sp),a
1346  0243 2002          	jra	L305
1347  0245               L105:
1348                     ; 332     bitstatus = RESET;
1350  0245 0f01          	clr	(OFST+0,sp)
1352  0247               L305:
1353                     ; 334   return ((FlagStatus)bitstatus);
1355  0247 7b01          	ld	a,(OFST+0,sp)
1358  0249 85            	popw	x
1359  024a 81            	ret
1395                     ; 344 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1395                     ; 345 {
1396                     	switch	.text
1397  024b               _TIM4_ClearFlag:
1399  024b 88            	push	a
1400       00000000      OFST:	set	0
1403                     ; 347   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1405  024c a101          	cp	a,#1
1406  024e 2603          	jrne	L641
1407  0250 4f            	clr	a
1408  0251 2010          	jra	L051
1409  0253               L641:
1410  0253 ae015b        	ldw	x,#347
1411  0256 89            	pushw	x
1412  0257 ae0000        	ldw	x,#0
1413  025a 89            	pushw	x
1414  025b ae0000        	ldw	x,#L76
1415  025e cd0000        	call	_assert_failed
1417  0261 5b04          	addw	sp,#4
1418  0263               L051:
1419                     ; 350   TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1421  0263 7b01          	ld	a,(OFST+1,sp)
1422  0265 43            	cpl	a
1423  0266 c75344        	ld	21316,a
1424                     ; 351 }
1427  0269 84            	pop	a
1428  026a 81            	ret
1493                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1493                     ; 361 {
1494                     	switch	.text
1495  026b               _TIM4_GetITStatus:
1497  026b 88            	push	a
1498  026c 89            	pushw	x
1499       00000002      OFST:	set	2
1502                     ; 362   ITStatus bitstatus = RESET;
1504                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1508                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1510  026d a101          	cp	a,#1
1511  026f 2603          	jrne	L451
1512  0271 4f            	clr	a
1513  0272 2010          	jra	L651
1514  0274               L451:
1515  0274 ae016f        	ldw	x,#367
1516  0277 89            	pushw	x
1517  0278 ae0000        	ldw	x,#0
1518  027b 89            	pushw	x
1519  027c ae0000        	ldw	x,#L76
1520  027f cd0000        	call	_assert_failed
1522  0282 5b04          	addw	sp,#4
1523  0284               L651:
1524                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1526  0284 c65344        	ld	a,21316
1527  0287 1403          	and	a,(OFST+1,sp)
1528  0289 6b01          	ld	(OFST-1,sp),a
1530                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1532  028b c65343        	ld	a,21315
1533  028e 1403          	and	a,(OFST+1,sp)
1534  0290 6b02          	ld	(OFST+0,sp),a
1536                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1538  0292 0d01          	tnz	(OFST-1,sp)
1539  0294 270a          	jreq	L555
1541  0296 0d02          	tnz	(OFST+0,sp)
1542  0298 2706          	jreq	L555
1543                     ; 375     bitstatus = (ITStatus)SET;
1545  029a a601          	ld	a,#1
1546  029c 6b02          	ld	(OFST+0,sp),a
1549  029e 2002          	jra	L755
1550  02a0               L555:
1551                     ; 379     bitstatus = (ITStatus)RESET;
1553  02a0 0f02          	clr	(OFST+0,sp)
1555  02a2               L755:
1556                     ; 381   return ((ITStatus)bitstatus);
1558  02a2 7b02          	ld	a,(OFST+0,sp)
1561  02a4 5b03          	addw	sp,#3
1562  02a6 81            	ret
1599                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1599                     ; 392 {
1600                     	switch	.text
1601  02a7               _TIM4_ClearITPendingBit:
1603  02a7 88            	push	a
1604       00000000      OFST:	set	0
1607                     ; 394   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1609  02a8 a101          	cp	a,#1
1610  02aa 2603          	jrne	L261
1611  02ac 4f            	clr	a
1612  02ad 2010          	jra	L461
1613  02af               L261:
1614  02af ae018a        	ldw	x,#394
1615  02b2 89            	pushw	x
1616  02b3 ae0000        	ldw	x,#0
1617  02b6 89            	pushw	x
1618  02b7 ae0000        	ldw	x,#L76
1619  02ba cd0000        	call	_assert_failed
1621  02bd 5b04          	addw	sp,#4
1622  02bf               L461:
1623                     ; 397   TIM4->SR1 = (uint8_t)(~TIM4_IT);
1625  02bf 7b01          	ld	a,(OFST+1,sp)
1626  02c1 43            	cpl	a
1627  02c2 c75344        	ld	21316,a
1628                     ; 398 }
1631  02c5 84            	pop	a
1632  02c6 81            	ret
1645                     	xdef	_TIM4_ClearITPendingBit
1646                     	xdef	_TIM4_GetITStatus
1647                     	xdef	_TIM4_ClearFlag
1648                     	xdef	_TIM4_GetFlagStatus
1649                     	xdef	_TIM4_GetPrescaler
1650                     	xdef	_TIM4_GetCounter
1651                     	xdef	_TIM4_SetAutoreload
1652                     	xdef	_TIM4_SetCounter
1653                     	xdef	_TIM4_GenerateEvent
1654                     	xdef	_TIM4_ARRPreloadConfig
1655                     	xdef	_TIM4_PrescalerConfig
1656                     	xdef	_TIM4_SelectOnePulseMode
1657                     	xdef	_TIM4_UpdateRequestConfig
1658                     	xdef	_TIM4_UpdateDisableConfig
1659                     	xdef	_TIM4_ITConfig
1660                     	xdef	_TIM4_Cmd
1661                     	xdef	_TIM4_TimeBaseInit
1662                     	xdef	_TIM4_DeInit
1663                     	xref	_assert_failed
1664                     .const:	section	.text
1665  0000               L76:
1666  0000 2e2e5c73746d  	dc.b	"..\stm8s_stdperiph"
1667  0012 5f6472697665  	dc.b	"_driver\src\stm8s_"
1668  0024 74696d342e63  	dc.b	"tim4.c",0
1688                     	end
