   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  48                     ; 52 void ADC1_DeInit(void)
  48                     ; 53 {
  50                     	switch	.text
  51  0000               _ADC1_DeInit:
  55                     ; 54   ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  57  0000 725f5400      	clr	21504
  58                     ; 55   ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  60  0004 725f5401      	clr	21505
  61                     ; 56   ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  63  0008 725f5402      	clr	21506
  64                     ; 57   ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  66  000c 725f5403      	clr	21507
  67                     ; 58   ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  69  0010 725f5406      	clr	21510
  70                     ; 59   ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  72  0014 725f5407      	clr	21511
  73                     ; 60   ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  75  0018 35ff5408      	mov	21512,#255
  76                     ; 61   ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  78  001c 35035409      	mov	21513,#3
  79                     ; 62   ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  81  0020 725f540a      	clr	21514
  82                     ; 63   ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  84  0024 725f540b      	clr	21515
  85                     ; 64   ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  87  0028 725f540e      	clr	21518
  88                     ; 65   ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  90  002c 725f540f      	clr	21519
  91                     ; 66 }
  94  0030 81            	ret	
 545                     ; 88 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 545                     ; 89 {
 546                     	switch	.text
 547  0031               _ADC1_Init:
 549  0031 89            	pushw	x
 550       00000000      OFST:	set	0
 553                     ; 91   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 555                     ; 92   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 557                     ; 93   assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 559                     ; 94   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 561                     ; 95   assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 563                     ; 96   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 565                     ; 97   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 567                     ; 98   assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 569                     ; 103   ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 571  0032 7b08          	ld	a,(OFST+8,sp)
 572  0034 88            	push	a
 573  0035 7b02          	ld	a,(OFST+2,sp)
 574  0037 95            	ld	xh,a
 575  0038 cd011b        	call	_ADC1_ConversionConfig
 577  003b 84            	pop	a
 578                     ; 105   ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 580  003c 7b05          	ld	a,(OFST+5,sp)
 581  003e ad54          	call	_ADC1_PrescalerConfig
 583                     ; 110   ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 585  0040 7b07          	ld	a,(OFST+7,sp)
 586  0042 97            	ld	xl,a
 587  0043 7b06          	ld	a,(OFST+6,sp)
 588  0045 95            	ld	xh,a
 589  0046 cd0148        	call	_ADC1_ExternalTriggerConfig
 591                     ; 115   ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 593  0049 7b0a          	ld	a,(OFST+10,sp)
 594  004b 97            	ld	xl,a
 595  004c 7b09          	ld	a,(OFST+9,sp)
 596  004e 95            	ld	xh,a
 597  004f ad56          	call	_ADC1_SchmittTriggerConfig
 599                     ; 118   ADC1->CR1 |= ADC1_CR1_ADON;
 601  0051 72105401      	bset	21505,#0
 602                     ; 119 }
 605  0055 85            	popw	x
 606  0056 81            	ret	
 641                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 641                     ; 127 {
 642                     	switch	.text
 643  0057               _ADC1_Cmd:
 647                     ; 129   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 649                     ; 131   if (NewState != DISABLE)
 651  0057 4d            	tnz	a
 652  0058 2705          	jreq	L362
 653                     ; 133     ADC1->CR1 |= ADC1_CR1_ADON;
 655  005a 72105401      	bset	21505,#0
 658  005e 81            	ret	
 659  005f               L362:
 660                     ; 137     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 662  005f 72115401      	bres	21505,#0
 663                     ; 139 }
 666  0063 81            	ret	
 701                     ; 146 void ADC1_ScanModeCmd(FunctionalState NewState)
 701                     ; 147 {
 702                     	switch	.text
 703  0064               _ADC1_ScanModeCmd:
 707                     ; 149   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 709                     ; 151   if (NewState != DISABLE)
 711  0064 4d            	tnz	a
 712  0065 2705          	jreq	L503
 713                     ; 153     ADC1->CR2 |= ADC1_CR2_SCAN;
 715  0067 72125402      	bset	21506,#1
 718  006b 81            	ret	
 719  006c               L503:
 720                     ; 157     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
 722  006c 72135402      	bres	21506,#1
 723                     ; 159 }
 726  0070 81            	ret	
 761                     ; 166 void ADC1_DataBufferCmd(FunctionalState NewState)
 761                     ; 167 {
 762                     	switch	.text
 763  0071               _ADC1_DataBufferCmd:
 767                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 769                     ; 171   if (NewState != DISABLE)
 771  0071 4d            	tnz	a
 772  0072 2705          	jreq	L723
 773                     ; 173     ADC1->CR3 |= ADC1_CR3_DBUF;
 775  0074 721e5403      	bset	21507,#7
 778  0078 81            	ret	
 779  0079               L723:
 780                     ; 177     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
 782  0079 721f5403      	bres	21507,#7
 783                     ; 179 }
 786  007d 81            	ret	
 942                     ; 190 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
 942                     ; 191 {
 943                     	switch	.text
 944  007e               _ADC1_ITConfig:
 946  007e 89            	pushw	x
 947       00000000      OFST:	set	0
 950                     ; 193   assert_param(IS_ADC1_IT_OK(ADC1_IT));
 952                     ; 194   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 954                     ; 196   if (NewState != DISABLE)
 956  007f 7b05          	ld	a,(OFST+5,sp)
 957  0081 2706          	jreq	L714
 958                     ; 199     ADC1->CSR |= (uint8_t)ADC1_IT;
 960  0083 9f            	ld	a,xl
 961  0084 ca5400        	or	a,21504
 963  0087 2006          	jra	L124
 964  0089               L714:
 965                     ; 204     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
 967  0089 7b02          	ld	a,(OFST+2,sp)
 968  008b 43            	cpl	a
 969  008c c45400        	and	a,21504
 970  008f               L124:
 971  008f c75400        	ld	21504,a
 972                     ; 206 }
 975  0092 85            	popw	x
 976  0093 81            	ret	
1012                     ; 214 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
1012                     ; 215 {
1013                     	switch	.text
1014  0094               _ADC1_PrescalerConfig:
1016  0094 88            	push	a
1017       00000000      OFST:	set	0
1020                     ; 217   assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1022                     ; 220   ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
1024  0095 c65401        	ld	a,21505
1025  0098 a48f          	and	a,#143
1026  009a c75401        	ld	21505,a
1027                     ; 222   ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
1029  009d c65401        	ld	a,21505
1030  00a0 1a01          	or	a,(OFST+1,sp)
1031  00a2 c75401        	ld	21505,a
1032                     ; 223 }
1035  00a5 84            	pop	a
1036  00a6 81            	ret	
1083                     ; 233 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1083                     ; 234 {
1084                     	switch	.text
1085  00a7               _ADC1_SchmittTriggerConfig:
1087  00a7 89            	pushw	x
1088       00000000      OFST:	set	0
1091                     ; 236   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1093                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1095                     ; 239   if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1097  00a8 9e            	ld	a,xh
1098  00a9 4c            	inc	a
1099  00aa 261d          	jrne	L364
1100                     ; 241     if (NewState != DISABLE)
1102  00ac 9f            	ld	a,xl
1103  00ad 4d            	tnz	a
1104  00ae 270a          	jreq	L564
1105                     ; 243       ADC1->TDRL &= (uint8_t)0x0;
1107  00b0 725f5407      	clr	21511
1108                     ; 244       ADC1->TDRH &= (uint8_t)0x0;
1110  00b4 725f5406      	clr	21510
1112  00b8 2059          	jra	L174
1113  00ba               L564:
1114                     ; 248       ADC1->TDRL |= (uint8_t)0xFF;
1116  00ba c65407        	ld	a,21511
1117  00bd aaff          	or	a,#255
1118  00bf c75407        	ld	21511,a
1119                     ; 249       ADC1->TDRH |= (uint8_t)0xFF;
1121  00c2 c65406        	ld	a,21510
1122  00c5 aaff          	or	a,#255
1123  00c7 2047          	jp	LC001
1124  00c9               L364:
1125                     ; 252   else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1127  00c9 7b01          	ld	a,(OFST+1,sp)
1128  00cb a108          	cp	a,#8
1129  00cd 0d02          	tnz	(OFST+2,sp)
1130  00cf 2420          	jruge	L374
1131                     ; 254     if (NewState != DISABLE)
1133  00d1 2711          	jreq	L574
1134                     ; 256       ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1136  00d3 ad40          	call	LC003
1137  00d5 2704          	jreq	L43
1138  00d7               L63:
1139  00d7 48            	sll	a
1140  00d8 5a            	decw	x
1141  00d9 26fc          	jrne	L63
1142  00db               L43:
1143  00db 43            	cpl	a
1144  00dc c45407        	and	a,21511
1145  00df               LC002:
1146  00df c75407        	ld	21511,a
1148  00e2 202f          	jra	L174
1149  00e4               L574:
1150                     ; 260       ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1152  00e4 ad2f          	call	LC003
1153  00e6 2704          	jreq	L04
1154  00e8               L24:
1155  00e8 48            	sll	a
1156  00e9 5a            	decw	x
1157  00ea 26fc          	jrne	L24
1158  00ec               L04:
1159  00ec ca5407        	or	a,21511
1160  00ef 20ee          	jp	LC002
1161  00f1               L374:
1162                     ; 265     if (NewState != DISABLE)
1164  00f1 2710          	jreq	L305
1165                     ; 267       ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1167  00f3 a008          	sub	a,#8
1168  00f5 ad1e          	call	LC003
1169  00f7 2704          	jreq	L44
1170  00f9               L64:
1171  00f9 48            	sll	a
1172  00fa 5a            	decw	x
1173  00fb 26fc          	jrne	L64
1174  00fd               L44:
1175  00fd 43            	cpl	a
1176  00fe c45406        	and	a,21510
1178  0101 200d          	jp	LC001
1179  0103               L305:
1180                     ; 271       ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1182  0103 a008          	sub	a,#8
1183  0105 ad0e          	call	LC003
1184  0107 2704          	jreq	L05
1185  0109               L25:
1186  0109 48            	sll	a
1187  010a 5a            	decw	x
1188  010b 26fc          	jrne	L25
1189  010d               L05:
1190  010d ca5406        	or	a,21510
1191  0110               LC001:
1192  0110 c75406        	ld	21510,a
1193  0113               L174:
1194                     ; 274 }
1197  0113 85            	popw	x
1198  0114 81            	ret	
1199  0115               LC003:
1200  0115 5f            	clrw	x
1201  0116 97            	ld	xl,a
1202  0117 a601          	ld	a,#1
1203  0119 5d            	tnzw	x
1204  011a 81            	ret	
1261                     ; 286 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1261                     ; 287 {
1262                     	switch	.text
1263  011b               _ADC1_ConversionConfig:
1265  011b 89            	pushw	x
1266       00000000      OFST:	set	0
1269                     ; 289   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1271                     ; 290   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1273                     ; 291   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1275                     ; 294   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1277  011c 72175402      	bres	21506,#3
1278                     ; 296   ADC1->CR2 |= (uint8_t)(ADC1_Align);
1280  0120 c65402        	ld	a,21506
1281  0123 1a05          	or	a,(OFST+5,sp)
1282  0125 c75402        	ld	21506,a
1283                     ; 298   if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1285  0128 9e            	ld	a,xh
1286  0129 4a            	dec	a
1287  012a 2606          	jrne	L535
1288                     ; 301     ADC1->CR1 |= ADC1_CR1_CONT;
1290  012c 72125401      	bset	21505,#1
1292  0130 2004          	jra	L735
1293  0132               L535:
1294                     ; 306     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1296  0132 72135401      	bres	21505,#1
1297  0136               L735:
1298                     ; 310   ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1300  0136 c65400        	ld	a,21504
1301  0139 a4f0          	and	a,#240
1302  013b c75400        	ld	21504,a
1303                     ; 312   ADC1->CSR |= (uint8_t)(ADC1_Channel);
1305  013e c65400        	ld	a,21504
1306  0141 1a02          	or	a,(OFST+2,sp)
1307  0143 c75400        	ld	21504,a
1308                     ; 313 }
1311  0146 85            	popw	x
1312  0147 81            	ret	
1358                     ; 325 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1358                     ; 326 {
1359                     	switch	.text
1360  0148               _ADC1_ExternalTriggerConfig:
1362  0148 89            	pushw	x
1363       00000000      OFST:	set	0
1366                     ; 328   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1368                     ; 329   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1370                     ; 332   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1372  0149 c65402        	ld	a,21506
1373  014c a4cf          	and	a,#207
1374  014e c75402        	ld	21506,a
1375                     ; 334   if (NewState != DISABLE)
1377  0151 9f            	ld	a,xl
1378  0152 4d            	tnz	a
1379  0153 2706          	jreq	L365
1380                     ; 337     ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1382  0155 721c5402      	bset	21506,#6
1384  0159 2004          	jra	L565
1385  015b               L365:
1386                     ; 342     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1388  015b 721d5402      	bres	21506,#6
1389  015f               L565:
1390                     ; 346   ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1392  015f c65402        	ld	a,21506
1393  0162 1a01          	or	a,(OFST+1,sp)
1394  0164 c75402        	ld	21506,a
1395                     ; 347 }
1398  0167 85            	popw	x
1399  0168 81            	ret	
1423                     ; 358 void ADC1_StartConversion(void)
1423                     ; 359 {
1424                     	switch	.text
1425  0169               _ADC1_StartConversion:
1429                     ; 360   ADC1->CR1 |= ADC1_CR1_ADON;
1431  0169 72105401      	bset	21505,#0
1432                     ; 361 }
1435  016d 81            	ret	
1479                     ; 370 uint16_t ADC1_GetConversionValue(void)
1479                     ; 371 {
1480                     	switch	.text
1481  016e               _ADC1_GetConversionValue:
1483  016e 5205          	subw	sp,#5
1484       00000005      OFST:	set	5
1487                     ; 372   uint16_t temph = 0;
1489                     ; 373   uint8_t templ = 0;
1491                     ; 375   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1493  0170 720754020e    	btjf	21506,#3,L126
1494                     ; 378     templ = ADC1->DRL;
1496  0175 c65405        	ld	a,21509
1497  0178 6b03          	ld	(OFST-2,sp),a
1498                     ; 380     temph = ADC1->DRH;
1500  017a c65404        	ld	a,21508
1501  017d 97            	ld	xl,a
1502                     ; 382     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1504  017e 7b03          	ld	a,(OFST-2,sp)
1505  0180 02            	rlwa	x,a
1507  0181 201a          	jra	L326
1508  0183               L126:
1509                     ; 387     temph = ADC1->DRH;
1511  0183 c65404        	ld	a,21508
1512  0186 97            	ld	xl,a
1513                     ; 389     templ = ADC1->DRL;
1515  0187 c65405        	ld	a,21509
1516  018a 6b03          	ld	(OFST-2,sp),a
1517                     ; 391     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1519  018c 4f            	clr	a
1520  018d 02            	rlwa	x,a
1521  018e 1f01          	ldw	(OFST-4,sp),x
1522  0190 7b03          	ld	a,(OFST-2,sp)
1523  0192 97            	ld	xl,a
1524  0193 a640          	ld	a,#64
1525  0195 42            	mul	x,a
1526  0196 01            	rrwa	x,a
1527  0197 1a02          	or	a,(OFST-3,sp)
1528  0199 01            	rrwa	x,a
1529  019a 1a01          	or	a,(OFST-4,sp)
1530  019c 01            	rrwa	x,a
1531  019d               L326:
1532                     ; 394   return ((uint16_t)temph);
1536  019d 5b05          	addw	sp,#5
1537  019f 81            	ret	
1583                     ; 405 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
1583                     ; 406 {
1584                     	switch	.text
1585  01a0               _ADC1_AWDChannelConfig:
1587  01a0 89            	pushw	x
1588       00000000      OFST:	set	0
1591                     ; 408   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1593                     ; 409   assert_param(IS_ADC1_CHANNEL_OK(Channel));
1595                     ; 411   if (Channel < (uint8_t)8)
1597  01a1 9e            	ld	a,xh
1598  01a2 a108          	cp	a,#8
1599  01a4 2425          	jruge	L746
1600                     ; 413     if (NewState != DISABLE)
1602  01a6 9f            	ld	a,xl
1603  01a7 4d            	tnz	a
1604  01a8 270e          	jreq	L156
1605                     ; 415       ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
1607  01aa 9e            	ld	a,xh
1608  01ab ad48          	call	LC006
1609  01ad 2704          	jreq	L66
1610  01af               L07:
1611  01af 48            	sll	a
1612  01b0 5a            	decw	x
1613  01b1 26fc          	jrne	L07
1614  01b3               L66:
1615  01b3 ca540f        	or	a,21519
1617  01b6 200e          	jp	LC005
1618  01b8               L156:
1619                     ; 419       ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
1621  01b8 7b01          	ld	a,(OFST+1,sp)
1622  01ba ad39          	call	LC006
1623  01bc 2704          	jreq	L27
1624  01be               L47:
1625  01be 48            	sll	a
1626  01bf 5a            	decw	x
1627  01c0 26fc          	jrne	L47
1628  01c2               L27:
1629  01c2 43            	cpl	a
1630  01c3 c4540f        	and	a,21519
1631  01c6               LC005:
1632  01c6 c7540f        	ld	21519,a
1633  01c9 2028          	jra	L556
1634  01cb               L746:
1635                     ; 424     if (NewState != DISABLE)
1637  01cb 7b02          	ld	a,(OFST+2,sp)
1638  01cd 2711          	jreq	L756
1639                     ; 426       ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
1641  01cf 7b01          	ld	a,(OFST+1,sp)
1642  01d1 a008          	sub	a,#8
1643  01d3 ad20          	call	LC006
1644  01d5 2704          	jreq	L67
1645  01d7               L001:
1646  01d7 48            	sll	a
1647  01d8 5a            	decw	x
1648  01d9 26fc          	jrne	L001
1649  01db               L67:
1650  01db ca540e        	or	a,21518
1652  01de 2010          	jp	LC004
1653  01e0               L756:
1654                     ; 430       ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
1656  01e0 7b01          	ld	a,(OFST+1,sp)
1657  01e2 a008          	sub	a,#8
1658  01e4 ad0f          	call	LC006
1659  01e6 2704          	jreq	L201
1660  01e8               L401:
1661  01e8 48            	sll	a
1662  01e9 5a            	decw	x
1663  01ea 26fc          	jrne	L401
1664  01ec               L201:
1665  01ec 43            	cpl	a
1666  01ed c4540e        	and	a,21518
1667  01f0               LC004:
1668  01f0 c7540e        	ld	21518,a
1669  01f3               L556:
1670                     ; 433 }
1673  01f3 85            	popw	x
1674  01f4 81            	ret	
1675  01f5               LC006:
1676  01f5 5f            	clrw	x
1677  01f6 97            	ld	xl,a
1678  01f7 a601          	ld	a,#1
1679  01f9 5d            	tnzw	x
1680  01fa 81            	ret	
1715                     ; 441 void ADC1_SetHighThreshold(uint16_t Threshold)
1715                     ; 442 {
1716                     	switch	.text
1717  01fb               _ADC1_SetHighThreshold:
1719  01fb 89            	pushw	x
1720       00000000      OFST:	set	0
1723                     ; 443   ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
1725  01fc 54            	srlw	x
1726  01fd 54            	srlw	x
1727  01fe 9f            	ld	a,xl
1728  01ff c75408        	ld	21512,a
1729                     ; 444   ADC1->HTRL = (uint8_t)Threshold;
1731  0202 7b02          	ld	a,(OFST+2,sp)
1732  0204 c75409        	ld	21513,a
1733                     ; 445 }
1736  0207 85            	popw	x
1737  0208 81            	ret	
1772                     ; 453 void ADC1_SetLowThreshold(uint16_t Threshold)
1772                     ; 454 {
1773                     	switch	.text
1774  0209               _ADC1_SetLowThreshold:
1778                     ; 455   ADC1->LTRL = (uint8_t)Threshold;
1780  0209 9f            	ld	a,xl
1781  020a c7540b        	ld	21515,a
1782                     ; 456   ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
1784  020d 54            	srlw	x
1785  020e 54            	srlw	x
1786  020f 9f            	ld	a,xl
1787  0210 c7540a        	ld	21514,a
1788                     ; 457 }
1791  0213 81            	ret	
1844                     ; 466 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
1844                     ; 467 {
1845                     	switch	.text
1846  0214               _ADC1_GetBufferValue:
1848  0214 88            	push	a
1849  0215 5205          	subw	sp,#5
1850       00000005      OFST:	set	5
1853                     ; 468   uint16_t temph = 0;
1855                     ; 469   uint8_t templ = 0;
1857                     ; 472   assert_param(IS_ADC1_BUFFER_OK(Buffer));
1859                     ; 474   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1861  0217 7b06          	ld	a,(OFST+1,sp)
1862  0219 48            	sll	a
1863  021a 5f            	clrw	x
1864  021b 97            	ld	xl,a
1865  021c 7207540213    	btjf	21506,#3,L547
1866                     ; 477     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1868  0221 d653e1        	ld	a,(21473,x)
1869  0224 6b03          	ld	(OFST-2,sp),a
1870                     ; 479     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1872  0226 7b06          	ld	a,(OFST+1,sp)
1873  0228 48            	sll	a
1874  0229 5f            	clrw	x
1875  022a 97            	ld	xl,a
1876  022b d653e0        	ld	a,(21472,x)
1877  022e 97            	ld	xl,a
1878                     ; 481     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1880  022f 7b03          	ld	a,(OFST-2,sp)
1881  0231 02            	rlwa	x,a
1883  0232 2024          	jra	L747
1884  0234               L547:
1885                     ; 486     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1887  0234 d653e0        	ld	a,(21472,x)
1888  0237 5f            	clrw	x
1889  0238 97            	ld	xl,a
1890  0239 1f04          	ldw	(OFST-1,sp),x
1891                     ; 488     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1893  023b 7b06          	ld	a,(OFST+1,sp)
1894  023d 48            	sll	a
1895  023e 5f            	clrw	x
1896  023f 97            	ld	xl,a
1897  0240 d653e1        	ld	a,(21473,x)
1898  0243 6b03          	ld	(OFST-2,sp),a
1899                     ; 490     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
1901  0245 4f            	clr	a
1902  0246 1e04          	ldw	x,(OFST-1,sp)
1903  0248 02            	rlwa	x,a
1904  0249 1f01          	ldw	(OFST-4,sp),x
1905  024b 7b03          	ld	a,(OFST-2,sp)
1906  024d 97            	ld	xl,a
1907  024e a640          	ld	a,#64
1908  0250 42            	mul	x,a
1909  0251 01            	rrwa	x,a
1910  0252 1a02          	or	a,(OFST-3,sp)
1911  0254 01            	rrwa	x,a
1912  0255 1a01          	or	a,(OFST-4,sp)
1913  0257 01            	rrwa	x,a
1914  0258               L747:
1915                     ; 493   return ((uint16_t)temph);
1919  0258 5b06          	addw	sp,#6
1920  025a 81            	ret	
1986                     ; 502 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
1986                     ; 503 {
1987                     	switch	.text
1988  025b               _ADC1_GetAWDChannelStatus:
1990  025b 88            	push	a
1991  025c 88            	push	a
1992       00000001      OFST:	set	1
1995                     ; 504   uint8_t status = 0;
1997                     ; 507   assert_param(IS_ADC1_CHANNEL_OK(Channel));
1999                     ; 509   if (Channel < (uint8_t)8)
2001  025d a108          	cp	a,#8
2002  025f 2410          	jruge	L3001
2003                     ; 511     status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
2005  0261 5f            	clrw	x
2006  0262 97            	ld	xl,a
2007  0263 a601          	ld	a,#1
2008  0265 5d            	tnzw	x
2009  0266 2704          	jreq	L611
2010  0268               L021:
2011  0268 48            	sll	a
2012  0269 5a            	decw	x
2013  026a 26fc          	jrne	L021
2014  026c               L611:
2015  026c c4540d        	and	a,21517
2017  026f 2012          	jra	L5001
2018  0271               L3001:
2019                     ; 515     status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2021  0271 7b02          	ld	a,(OFST+1,sp)
2022  0273 a008          	sub	a,#8
2023  0275 5f            	clrw	x
2024  0276 97            	ld	xl,a
2025  0277 a601          	ld	a,#1
2026  0279 5d            	tnzw	x
2027  027a 2704          	jreq	L221
2028  027c               L421:
2029  027c 48            	sll	a
2030  027d 5a            	decw	x
2031  027e 26fc          	jrne	L421
2032  0280               L221:
2033  0280 c4540c        	and	a,21516
2034  0283               L5001:
2035                     ; 518   return ((FlagStatus)status);
2039  0283 85            	popw	x
2040  0284 81            	ret	
2198                     ; 527 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2198                     ; 528 {
2199                     	switch	.text
2200  0285               _ADC1_GetFlagStatus:
2202  0285 88            	push	a
2203  0286 88            	push	a
2204       00000001      OFST:	set	1
2207                     ; 529   uint8_t flagstatus = 0;
2209                     ; 530   uint8_t temp = 0;
2211                     ; 533   assert_param(IS_ADC1_FLAG_OK(Flag));
2213                     ; 535   if ((Flag & 0x0F) == 0x01)
2215  0287 a40f          	and	a,#15
2216  0289 4a            	dec	a
2217  028a 2607          	jrne	L5701
2218                     ; 538     flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2220  028c c65403        	ld	a,21507
2221  028f a440          	and	a,#64
2223  0291 2039          	jra	L7701
2224  0293               L5701:
2225                     ; 540   else if ((Flag & 0xF0) == 0x10)
2227  0293 7b02          	ld	a,(OFST+1,sp)
2228  0295 a4f0          	and	a,#240
2229  0297 a110          	cp	a,#16
2230  0299 262c          	jrne	L1011
2231                     ; 543     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2233  029b 7b02          	ld	a,(OFST+1,sp)
2234  029d a40f          	and	a,#15
2235  029f 6b01          	ld	(OFST+0,sp),a
2236                     ; 544     if (temp < 8)
2238  02a1 a108          	cp	a,#8
2239  02a3 2410          	jruge	L3011
2240                     ; 546       flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2242  02a5 5f            	clrw	x
2243  02a6 97            	ld	xl,a
2244  02a7 a601          	ld	a,#1
2245  02a9 5d            	tnzw	x
2246  02aa 2704          	jreq	L031
2247  02ac               L231:
2248  02ac 48            	sll	a
2249  02ad 5a            	decw	x
2250  02ae 26fc          	jrne	L231
2251  02b0               L031:
2252  02b0 c4540d        	and	a,21517
2254  02b3 2017          	jra	L7701
2255  02b5               L3011:
2256                     ; 550       flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2258  02b5 a008          	sub	a,#8
2259  02b7 5f            	clrw	x
2260  02b8 97            	ld	xl,a
2261  02b9 a601          	ld	a,#1
2262  02bb 5d            	tnzw	x
2263  02bc 2704          	jreq	L431
2264  02be               L631:
2265  02be 48            	sll	a
2266  02bf 5a            	decw	x
2267  02c0 26fc          	jrne	L631
2268  02c2               L431:
2269  02c2 c4540c        	and	a,21516
2270  02c5 2005          	jra	L7701
2271  02c7               L1011:
2272                     ; 555     flagstatus = (uint8_t)(ADC1->CSR & Flag);
2274  02c7 c65400        	ld	a,21504
2275  02ca 1402          	and	a,(OFST+1,sp)
2276  02cc               L7701:
2277                     ; 557   return ((FlagStatus)flagstatus);
2281  02cc 85            	popw	x
2282  02cd 81            	ret	
2326                     ; 567 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
2326                     ; 568 {
2327                     	switch	.text
2328  02ce               _ADC1_ClearFlag:
2330  02ce 88            	push	a
2331  02cf 88            	push	a
2332       00000001      OFST:	set	1
2335                     ; 569   uint8_t temp = 0;
2337                     ; 572   assert_param(IS_ADC1_FLAG_OK(Flag));
2339                     ; 574   if ((Flag & 0x0F) == 0x01)
2341  02d0 a40f          	and	a,#15
2342  02d2 4a            	dec	a
2343  02d3 2606          	jrne	L3311
2344                     ; 577     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
2346  02d5 721d5403      	bres	21507,#6
2348  02d9 2045          	jra	L5311
2349  02db               L3311:
2350                     ; 579   else if ((Flag & 0xF0) == 0x10)
2352  02db 7b02          	ld	a,(OFST+1,sp)
2353  02dd a4f0          	and	a,#240
2354  02df a110          	cp	a,#16
2355  02e1 2634          	jrne	L7311
2356                     ; 582     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2358  02e3 7b02          	ld	a,(OFST+1,sp)
2359  02e5 a40f          	and	a,#15
2360  02e7 6b01          	ld	(OFST+0,sp),a
2361                     ; 583     if (temp < 8)
2363  02e9 a108          	cp	a,#8
2364  02eb 2414          	jruge	L1411
2365                     ; 585       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2367  02ed 5f            	clrw	x
2368  02ee 97            	ld	xl,a
2369  02ef a601          	ld	a,#1
2370  02f1 5d            	tnzw	x
2371  02f2 2704          	jreq	L241
2372  02f4               L441:
2373  02f4 48            	sll	a
2374  02f5 5a            	decw	x
2375  02f6 26fc          	jrne	L441
2376  02f8               L241:
2377  02f8 43            	cpl	a
2378  02f9 c4540d        	and	a,21517
2379  02fc c7540d        	ld	21517,a
2381  02ff 201f          	jra	L5311
2382  0301               L1411:
2383                     ; 589       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2385  0301 a008          	sub	a,#8
2386  0303 5f            	clrw	x
2387  0304 97            	ld	xl,a
2388  0305 a601          	ld	a,#1
2389  0307 5d            	tnzw	x
2390  0308 2704          	jreq	L641
2391  030a               L051:
2392  030a 48            	sll	a
2393  030b 5a            	decw	x
2394  030c 26fc          	jrne	L051
2395  030e               L641:
2396  030e 43            	cpl	a
2397  030f c4540c        	and	a,21516
2398  0312 c7540c        	ld	21516,a
2399  0315 2009          	jra	L5311
2400  0317               L7311:
2401                     ; 594     ADC1->CSR &= (uint8_t) (~Flag);
2403  0317 7b02          	ld	a,(OFST+1,sp)
2404  0319 43            	cpl	a
2405  031a c45400        	and	a,21504
2406  031d c75400        	ld	21504,a
2407  0320               L5311:
2408                     ; 596 }
2411  0320 85            	popw	x
2412  0321 81            	ret	
2467                     ; 616 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
2467                     ; 617 {
2468                     	switch	.text
2469  0322               _ADC1_GetITStatus:
2471  0322 89            	pushw	x
2472  0323 88            	push	a
2473       00000001      OFST:	set	1
2476                     ; 618   ITStatus itstatus = RESET;
2478                     ; 619   uint8_t temp = 0;
2480                     ; 622   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2482                     ; 624   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2484  0324 01            	rrwa	x,a
2485  0325 a4f0          	and	a,#240
2486  0327 5f            	clrw	x
2487  0328 02            	rlwa	x,a
2488  0329 a30010        	cpw	x,#16
2489  032c 262c          	jrne	L5711
2490                     ; 627     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2492  032e 7b03          	ld	a,(OFST+2,sp)
2493  0330 a40f          	and	a,#15
2494  0332 6b01          	ld	(OFST+0,sp),a
2495                     ; 628     if (temp < 8)
2497  0334 a108          	cp	a,#8
2498  0336 2410          	jruge	L7711
2499                     ; 630       itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2501  0338 5f            	clrw	x
2502  0339 97            	ld	xl,a
2503  033a a601          	ld	a,#1
2504  033c 5d            	tnzw	x
2505  033d 2704          	jreq	L451
2506  033f               L651:
2507  033f 48            	sll	a
2508  0340 5a            	decw	x
2509  0341 26fc          	jrne	L651
2510  0343               L451:
2511  0343 c4540d        	and	a,21517
2513  0346 2017          	jra	L3021
2514  0348               L7711:
2515                     ; 634       itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2517  0348 a008          	sub	a,#8
2518  034a 5f            	clrw	x
2519  034b 97            	ld	xl,a
2520  034c a601          	ld	a,#1
2521  034e 5d            	tnzw	x
2522  034f 2704          	jreq	L061
2523  0351               L261:
2524  0351 48            	sll	a
2525  0352 5a            	decw	x
2526  0353 26fc          	jrne	L261
2527  0355               L061:
2528  0355 c4540c        	and	a,21516
2529  0358 2005          	jra	L3021
2530  035a               L5711:
2531                     ; 639     itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
2533  035a c65400        	ld	a,21504
2534  035d 1403          	and	a,(OFST+2,sp)
2535  035f               L3021:
2536                     ; 641   return ((ITStatus)itstatus);
2540  035f 5b03          	addw	sp,#3
2541  0361 81            	ret	
2586                     ; 662 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
2586                     ; 663 {
2587                     	switch	.text
2588  0362               _ADC1_ClearITPendingBit:
2590  0362 89            	pushw	x
2591  0363 88            	push	a
2592       00000001      OFST:	set	1
2595                     ; 664   uint8_t temp = 0;
2597                     ; 667   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2599                     ; 669   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2601  0364 01            	rrwa	x,a
2602  0365 a4f0          	and	a,#240
2603  0367 5f            	clrw	x
2604  0368 02            	rlwa	x,a
2605  0369 a30010        	cpw	x,#16
2606  036c 2634          	jrne	L7221
2607                     ; 672     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2609  036e 7b03          	ld	a,(OFST+2,sp)
2610  0370 a40f          	and	a,#15
2611  0372 6b01          	ld	(OFST+0,sp),a
2612                     ; 673     if (temp < 8)
2614  0374 a108          	cp	a,#8
2615  0376 2414          	jruge	L1321
2616                     ; 675       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2618  0378 5f            	clrw	x
2619  0379 97            	ld	xl,a
2620  037a a601          	ld	a,#1
2621  037c 5d            	tnzw	x
2622  037d 2704          	jreq	L661
2623  037f               L071:
2624  037f 48            	sll	a
2625  0380 5a            	decw	x
2626  0381 26fc          	jrne	L071
2627  0383               L661:
2628  0383 43            	cpl	a
2629  0384 c4540d        	and	a,21517
2630  0387 c7540d        	ld	21517,a
2632  038a 201f          	jra	L5321
2633  038c               L1321:
2634                     ; 679       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2636  038c a008          	sub	a,#8
2637  038e 5f            	clrw	x
2638  038f 97            	ld	xl,a
2639  0390 a601          	ld	a,#1
2640  0392 5d            	tnzw	x
2641  0393 2704          	jreq	L271
2642  0395               L471:
2643  0395 48            	sll	a
2644  0396 5a            	decw	x
2645  0397 26fc          	jrne	L471
2646  0399               L271:
2647  0399 43            	cpl	a
2648  039a c4540c        	and	a,21516
2649  039d c7540c        	ld	21516,a
2650  03a0 2009          	jra	L5321
2651  03a2               L7221:
2652                     ; 684     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
2654  03a2 7b03          	ld	a,(OFST+2,sp)
2655  03a4 43            	cpl	a
2656  03a5 c45400        	and	a,21504
2657  03a8 c75400        	ld	21504,a
2658  03ab               L5321:
2659                     ; 686 }
2662  03ab 5b03          	addw	sp,#3
2663  03ad 81            	ret	
2676                     	xdef	_ADC1_ClearITPendingBit
2677                     	xdef	_ADC1_GetITStatus
2678                     	xdef	_ADC1_ClearFlag
2679                     	xdef	_ADC1_GetFlagStatus
2680                     	xdef	_ADC1_GetAWDChannelStatus
2681                     	xdef	_ADC1_GetBufferValue
2682                     	xdef	_ADC1_SetLowThreshold
2683                     	xdef	_ADC1_SetHighThreshold
2684                     	xdef	_ADC1_GetConversionValue
2685                     	xdef	_ADC1_StartConversion
2686                     	xdef	_ADC1_AWDChannelConfig
2687                     	xdef	_ADC1_ExternalTriggerConfig
2688                     	xdef	_ADC1_ConversionConfig
2689                     	xdef	_ADC1_SchmittTriggerConfig
2690                     	xdef	_ADC1_PrescalerConfig
2691                     	xdef	_ADC1_ITConfig
2692                     	xdef	_ADC1_DataBufferCmd
2693                     	xdef	_ADC1_ScanModeCmd
2694                     	xdef	_ADC1_Cmd
2695                     	xdef	_ADC1_Init
2696                     	xdef	_ADC1_DeInit
2715                     	end
