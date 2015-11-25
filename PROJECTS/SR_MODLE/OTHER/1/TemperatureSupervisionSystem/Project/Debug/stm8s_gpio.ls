   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
 110                     ; 53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 110                     ; 54 {
 112                     	switch	.text
 113  0000               _GPIO_DeInit:
 117                     ; 55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 119  0000 7f            	clr	(x)
 120                     ; 56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 122  0001 6f02          	clr	(2,x)
 123                     ; 57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 125  0003 6f03          	clr	(3,x)
 126                     ; 58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 128  0005 6f04          	clr	(4,x)
 129                     ; 59 }
 132  0007 81            	ret
 373                     ; 71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 373                     ; 72 {
 374                     	switch	.text
 375  0008               _GPIO_Init:
 377  0008 89            	pushw	x
 378       00000000      OFST:	set	0
 381                     ; 77   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 383  0009 0d06          	tnz	(OFST+6,sp)
 384  000b 2742          	jreq	L21
 385  000d 7b06          	ld	a,(OFST+6,sp)
 386  000f a140          	cp	a,#64
 387  0011 273c          	jreq	L21
 388  0013 7b06          	ld	a,(OFST+6,sp)
 389  0015 a120          	cp	a,#32
 390  0017 2736          	jreq	L21
 391  0019 7b06          	ld	a,(OFST+6,sp)
 392  001b a160          	cp	a,#96
 393  001d 2730          	jreq	L21
 394  001f 7b06          	ld	a,(OFST+6,sp)
 395  0021 a1a0          	cp	a,#160
 396  0023 272a          	jreq	L21
 397  0025 7b06          	ld	a,(OFST+6,sp)
 398  0027 a1e0          	cp	a,#224
 399  0029 2724          	jreq	L21
 400  002b 7b06          	ld	a,(OFST+6,sp)
 401  002d a180          	cp	a,#128
 402  002f 271e          	jreq	L21
 403  0031 7b06          	ld	a,(OFST+6,sp)
 404  0033 a1c0          	cp	a,#192
 405  0035 2718          	jreq	L21
 406  0037 7b06          	ld	a,(OFST+6,sp)
 407  0039 a1b0          	cp	a,#176
 408  003b 2712          	jreq	L21
 409  003d 7b06          	ld	a,(OFST+6,sp)
 410  003f a1f0          	cp	a,#240
 411  0041 270c          	jreq	L21
 412  0043 7b06          	ld	a,(OFST+6,sp)
 413  0045 a190          	cp	a,#144
 414  0047 2706          	jreq	L21
 415  0049 7b06          	ld	a,(OFST+6,sp)
 416  004b a1d0          	cp	a,#208
 417  004d 2603          	jrne	L01
 418  004f               L21:
 419  004f 4f            	clr	a
 420  0050 2010          	jra	L41
 421  0052               L01:
 422  0052 ae004d        	ldw	x,#77
 423  0055 89            	pushw	x
 424  0056 ae0000        	ldw	x,#0
 425  0059 89            	pushw	x
 426  005a ae0000        	ldw	x,#L771
 427  005d cd0000        	call	_assert_failed
 429  0060 5b04          	addw	sp,#4
 430  0062               L41:
 431                     ; 78   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 433  0062 0d05          	tnz	(OFST+5,sp)
 434  0064 2703          	jreq	L61
 435  0066 4f            	clr	a
 436  0067 2010          	jra	L02
 437  0069               L61:
 438  0069 ae004e        	ldw	x,#78
 439  006c 89            	pushw	x
 440  006d ae0000        	ldw	x,#0
 441  0070 89            	pushw	x
 442  0071 ae0000        	ldw	x,#L771
 443  0074 cd0000        	call	_assert_failed
 445  0077 5b04          	addw	sp,#4
 446  0079               L02:
 447                     ; 81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 449  0079 1e01          	ldw	x,(OFST+1,sp)
 450  007b 7b05          	ld	a,(OFST+5,sp)
 451  007d 43            	cpl	a
 452  007e e404          	and	a,(4,x)
 453  0080 e704          	ld	(4,x),a
 454                     ; 87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 456  0082 7b06          	ld	a,(OFST+6,sp)
 457  0084 a580          	bcp	a,#128
 458  0086 271f          	jreq	L102
 459                     ; 89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 461  0088 7b06          	ld	a,(OFST+6,sp)
 462  008a a510          	bcp	a,#16
 463  008c 2708          	jreq	L302
 464                     ; 91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
 466  008e 1e01          	ldw	x,(OFST+1,sp)
 467  0090 f6            	ld	a,(x)
 468  0091 1a05          	or	a,(OFST+5,sp)
 469  0093 f7            	ld	(x),a
 471  0094 2007          	jra	L502
 472  0096               L302:
 473                     ; 95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 475  0096 1e01          	ldw	x,(OFST+1,sp)
 476  0098 7b05          	ld	a,(OFST+5,sp)
 477  009a 43            	cpl	a
 478  009b f4            	and	a,(x)
 479  009c f7            	ld	(x),a
 480  009d               L502:
 481                     ; 98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
 483  009d 1e01          	ldw	x,(OFST+1,sp)
 484  009f e602          	ld	a,(2,x)
 485  00a1 1a05          	or	a,(OFST+5,sp)
 486  00a3 e702          	ld	(2,x),a
 488  00a5 2009          	jra	L702
 489  00a7               L102:
 490                     ; 103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 492  00a7 1e01          	ldw	x,(OFST+1,sp)
 493  00a9 7b05          	ld	a,(OFST+5,sp)
 494  00ab 43            	cpl	a
 495  00ac e402          	and	a,(2,x)
 496  00ae e702          	ld	(2,x),a
 497  00b0               L702:
 498                     ; 110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 500  00b0 7b06          	ld	a,(OFST+6,sp)
 501  00b2 a540          	bcp	a,#64
 502  00b4 270a          	jreq	L112
 503                     ; 112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 505  00b6 1e01          	ldw	x,(OFST+1,sp)
 506  00b8 e603          	ld	a,(3,x)
 507  00ba 1a05          	or	a,(OFST+5,sp)
 508  00bc e703          	ld	(3,x),a
 510  00be 2009          	jra	L312
 511  00c0               L112:
 512                     ; 116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 514  00c0 1e01          	ldw	x,(OFST+1,sp)
 515  00c2 7b05          	ld	a,(OFST+5,sp)
 516  00c4 43            	cpl	a
 517  00c5 e403          	and	a,(3,x)
 518  00c7 e703          	ld	(3,x),a
 519  00c9               L312:
 520                     ; 123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 522  00c9 7b06          	ld	a,(OFST+6,sp)
 523  00cb a520          	bcp	a,#32
 524  00cd 270a          	jreq	L512
 525                     ; 125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 527  00cf 1e01          	ldw	x,(OFST+1,sp)
 528  00d1 e604          	ld	a,(4,x)
 529  00d3 1a05          	or	a,(OFST+5,sp)
 530  00d5 e704          	ld	(4,x),a
 532  00d7 2009          	jra	L712
 533  00d9               L512:
 534                     ; 129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 536  00d9 1e01          	ldw	x,(OFST+1,sp)
 537  00db 7b05          	ld	a,(OFST+5,sp)
 538  00dd 43            	cpl	a
 539  00de e404          	and	a,(4,x)
 540  00e0 e704          	ld	(4,x),a
 541  00e2               L712:
 542                     ; 131 }
 545  00e2 85            	popw	x
 546  00e3 81            	ret
 592                     ; 141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 592                     ; 142 {
 593                     	switch	.text
 594  00e4               _GPIO_Write:
 596  00e4 89            	pushw	x
 597       00000000      OFST:	set	0
 600                     ; 143   GPIOx->ODR = PortVal;
 602  00e5 7b05          	ld	a,(OFST+5,sp)
 603  00e7 1e01          	ldw	x,(OFST+1,sp)
 604  00e9 f7            	ld	(x),a
 605                     ; 144 }
 608  00ea 85            	popw	x
 609  00eb 81            	ret
 656                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 656                     ; 155 {
 657                     	switch	.text
 658  00ec               _GPIO_WriteHigh:
 660  00ec 89            	pushw	x
 661       00000000      OFST:	set	0
 664                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 666  00ed f6            	ld	a,(x)
 667  00ee 1a05          	or	a,(OFST+5,sp)
 668  00f0 f7            	ld	(x),a
 669                     ; 157 }
 672  00f1 85            	popw	x
 673  00f2 81            	ret
 720                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 720                     ; 168 {
 721                     	switch	.text
 722  00f3               _GPIO_WriteLow:
 724  00f3 89            	pushw	x
 725       00000000      OFST:	set	0
 728                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 730  00f4 7b05          	ld	a,(OFST+5,sp)
 731  00f6 43            	cpl	a
 732  00f7 f4            	and	a,(x)
 733  00f8 f7            	ld	(x),a
 734                     ; 170 }
 737  00f9 85            	popw	x
 738  00fa 81            	ret
 785                     ; 180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 785                     ; 181 {
 786                     	switch	.text
 787  00fb               _GPIO_WriteReverse:
 789  00fb 89            	pushw	x
 790       00000000      OFST:	set	0
 793                     ; 182   GPIOx->ODR ^= (uint8_t)PortPins;
 795  00fc f6            	ld	a,(x)
 796  00fd 1805          	xor	a,	(OFST+5,sp)
 797  00ff f7            	ld	(x),a
 798                     ; 183 }
 801  0100 85            	popw	x
 802  0101 81            	ret
 840                     ; 191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 840                     ; 192 {
 841                     	switch	.text
 842  0102               _GPIO_ReadOutputData:
 846                     ; 193   return ((uint8_t)GPIOx->ODR);
 848  0102 f6            	ld	a,(x)
 851  0103 81            	ret
 888                     ; 202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 888                     ; 203 {
 889                     	switch	.text
 890  0104               _GPIO_ReadInputData:
 894                     ; 204   return ((uint8_t)GPIOx->IDR);
 896  0104 e601          	ld	a,(1,x)
 899  0106 81            	ret
 967                     ; 213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 967                     ; 214 {
 968                     	switch	.text
 969  0107               _GPIO_ReadInputPin:
 971  0107 89            	pushw	x
 972       00000000      OFST:	set	0
 975                     ; 215   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 977  0108 e601          	ld	a,(1,x)
 978  010a 1405          	and	a,(OFST+5,sp)
 981  010c 85            	popw	x
 982  010d 81            	ret
1061                     ; 225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
1061                     ; 226 {
1062                     	switch	.text
1063  010e               _GPIO_ExternalPullUpConfig:
1065  010e 89            	pushw	x
1066       00000000      OFST:	set	0
1069                     ; 228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
1071  010f 0d05          	tnz	(OFST+5,sp)
1072  0111 2703          	jreq	L24
1073  0113 4f            	clr	a
1074  0114 2010          	jra	L44
1075  0116               L24:
1076  0116 ae00e4        	ldw	x,#228
1077  0119 89            	pushw	x
1078  011a ae0000        	ldw	x,#0
1079  011d 89            	pushw	x
1080  011e ae0000        	ldw	x,#L771
1081  0121 cd0000        	call	_assert_failed
1083  0124 5b04          	addw	sp,#4
1084  0126               L44:
1085                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1087  0126 0d06          	tnz	(OFST+6,sp)
1088  0128 2706          	jreq	L05
1089  012a 7b06          	ld	a,(OFST+6,sp)
1090  012c a101          	cp	a,#1
1091  012e 2603          	jrne	L64
1092  0130               L05:
1093  0130 4f            	clr	a
1094  0131 2010          	jra	L25
1095  0133               L64:
1096  0133 ae00e5        	ldw	x,#229
1097  0136 89            	pushw	x
1098  0137 ae0000        	ldw	x,#0
1099  013a 89            	pushw	x
1100  013b ae0000        	ldw	x,#L771
1101  013e cd0000        	call	_assert_failed
1103  0141 5b04          	addw	sp,#4
1104  0143               L25:
1105                     ; 231   if (NewState != DISABLE) /* External Pull-Up Set*/
1107  0143 0d06          	tnz	(OFST+6,sp)
1108  0145 270a          	jreq	L574
1109                     ; 233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1111  0147 1e01          	ldw	x,(OFST+1,sp)
1112  0149 e603          	ld	a,(3,x)
1113  014b 1a05          	or	a,(OFST+5,sp)
1114  014d e703          	ld	(3,x),a
1116  014f 2009          	jra	L774
1117  0151               L574:
1118                     ; 236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1120  0151 1e01          	ldw	x,(OFST+1,sp)
1121  0153 7b05          	ld	a,(OFST+5,sp)
1122  0155 43            	cpl	a
1123  0156 e403          	and	a,(3,x)
1124  0158 e703          	ld	(3,x),a
1125  015a               L774:
1126                     ; 238 }
1129  015a 85            	popw	x
1130  015b 81            	ret
1143                     	xdef	_GPIO_ExternalPullUpConfig
1144                     	xdef	_GPIO_ReadInputPin
1145                     	xdef	_GPIO_ReadOutputData
1146                     	xdef	_GPIO_ReadInputData
1147                     	xdef	_GPIO_WriteReverse
1148                     	xdef	_GPIO_WriteLow
1149                     	xdef	_GPIO_WriteHigh
1150                     	xdef	_GPIO_Write
1151                     	xdef	_GPIO_Init
1152                     	xdef	_GPIO_DeInit
1153                     	xref	_assert_failed
1154                     .const:	section	.text
1155  0000               L771:
1156  0000 2e2e5c73746d  	dc.b	"..\stm8s_stdperiph"
1157  0012 5f6472697665  	dc.b	"_driver\src\stm8s_"
1158  0024 6770696f2e63  	dc.b	"gpio.c",0
1178                     	end
