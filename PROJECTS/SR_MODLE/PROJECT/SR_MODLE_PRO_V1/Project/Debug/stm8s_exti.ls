   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
  44                     ; 53 void EXTI_DeInit(void)
  44                     ; 54 {
  46                     	switch	.text
  47  0000               _EXTI_DeInit:
  51                     ; 55   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  53  0000 725f50a0      	clr	20640
  54                     ; 56   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  56  0004 725f50a1      	clr	20641
  57                     ; 57 }
  60  0008 81            	ret
 185                     ; 70 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
 185                     ; 71 {
 186                     	switch	.text
 187  0009               _EXTI_SetExtIntSensitivity:
 189  0009 89            	pushw	x
 190       00000000      OFST:	set	0
 193                     ; 73   assert_param(IS_EXTI_PORT_OK(Port));
 195                     ; 74   assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
 197                     ; 77   switch (Port)
 199  000a 9e            	ld	a,xh
 201                     ; 99   default:
 201                     ; 100     break;
 202  000b 4d            	tnz	a
 203  000c 270e          	jreq	L12
 204  000e 4a            	dec	a
 205  000f 271d          	jreq	L32
 206  0011 4a            	dec	a
 207  0012 272e          	jreq	L52
 208  0014 4a            	dec	a
 209  0015 2742          	jreq	L72
 210  0017 4a            	dec	a
 211  0018 2756          	jreq	L13
 212  001a 2064          	jra	L311
 213  001c               L12:
 214                     ; 79   case EXTI_PORT_GPIOA:
 214                     ; 80     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
 216  001c c650a0        	ld	a,20640
 217  001f a4fc          	and	a,#252
 218  0021 c750a0        	ld	20640,a
 219                     ; 81     EXTI->CR1 |= (uint8_t)(SensitivityValue);
 221  0024 c650a0        	ld	a,20640
 222  0027 1a02          	or	a,(OFST+2,sp)
 223  0029 c750a0        	ld	20640,a
 224                     ; 82     break;
 226  002c 2052          	jra	L311
 227  002e               L32:
 228                     ; 83   case EXTI_PORT_GPIOB:
 228                     ; 84     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
 230  002e c650a0        	ld	a,20640
 231  0031 a4f3          	and	a,#243
 232  0033 c750a0        	ld	20640,a
 233                     ; 85     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
 235  0036 7b02          	ld	a,(OFST+2,sp)
 236  0038 48            	sll	a
 237  0039 48            	sll	a
 238  003a ca50a0        	or	a,20640
 239  003d c750a0        	ld	20640,a
 240                     ; 86     break;
 242  0040 203e          	jra	L311
 243  0042               L52:
 244                     ; 87   case EXTI_PORT_GPIOC:
 244                     ; 88     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
 246  0042 c650a0        	ld	a,20640
 247  0045 a4cf          	and	a,#207
 248  0047 c750a0        	ld	20640,a
 249                     ; 89     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
 251  004a 7b02          	ld	a,(OFST+2,sp)
 252  004c 97            	ld	xl,a
 253  004d a610          	ld	a,#16
 254  004f 42            	mul	x,a
 255  0050 9f            	ld	a,xl
 256  0051 ca50a0        	or	a,20640
 257  0054 c750a0        	ld	20640,a
 258                     ; 90     break;
 260  0057 2027          	jra	L311
 261  0059               L72:
 262                     ; 91   case EXTI_PORT_GPIOD:
 262                     ; 92     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
 264  0059 c650a0        	ld	a,20640
 265  005c a43f          	and	a,#63
 266  005e c750a0        	ld	20640,a
 267                     ; 93     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
 269  0061 7b02          	ld	a,(OFST+2,sp)
 270  0063 97            	ld	xl,a
 271  0064 a640          	ld	a,#64
 272  0066 42            	mul	x,a
 273  0067 9f            	ld	a,xl
 274  0068 ca50a0        	or	a,20640
 275  006b c750a0        	ld	20640,a
 276                     ; 94     break;
 278  006e 2010          	jra	L311
 279  0070               L13:
 280                     ; 95   case EXTI_PORT_GPIOE:
 280                     ; 96     EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
 282  0070 c650a1        	ld	a,20641
 283  0073 a4fc          	and	a,#252
 284  0075 c750a1        	ld	20641,a
 285                     ; 97     EXTI->CR2 |= (uint8_t)(SensitivityValue);
 287  0078 c650a1        	ld	a,20641
 288  007b 1a02          	or	a,(OFST+2,sp)
 289  007d c750a1        	ld	20641,a
 290                     ; 98     break;
 292  0080               L33:
 293                     ; 99   default:
 293                     ; 100     break;
 295  0080               L311:
 296                     ; 102 }
 299  0080 85            	popw	x
 300  0081 81            	ret
 358                     ; 111 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
 358                     ; 112 {
 359                     	switch	.text
 360  0082               _EXTI_SetTLISensitivity:
 364                     ; 114   assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
 366                     ; 117   EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
 368  0082 721550a1      	bres	20641,#2
 369                     ; 118   EXTI->CR2 |= (uint8_t)(SensitivityValue);
 371  0086 ca50a1        	or	a,20641
 372  0089 c750a1        	ld	20641,a
 373                     ; 119 }
 376  008c 81            	ret
 422                     ; 126 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
 422                     ; 127 {
 423                     	switch	.text
 424  008d               _EXTI_GetExtIntSensitivity:
 426  008d 88            	push	a
 427       00000001      OFST:	set	1
 430                     ; 128   uint8_t value = 0;
 432  008e 0f01          	clr	(OFST+0,sp)
 434                     ; 131   assert_param(IS_EXTI_PORT_OK(Port));
 436                     ; 133   switch (Port)
 439                     ; 150   default:
 439                     ; 151     break;
 440  0090 4d            	tnz	a
 441  0091 270e          	jreq	L341
 442  0093 4a            	dec	a
 443  0094 2714          	jreq	L541
 444  0096 4a            	dec	a
 445  0097 271c          	jreq	L741
 446  0099 4a            	dec	a
 447  009a 2725          	jreq	L151
 448  009c 4a            	dec	a
 449  009d 2730          	jreq	L351
 450  009f 2035          	jra	L302
 451  00a1               L341:
 452                     ; 135   case EXTI_PORT_GPIOA:
 452                     ; 136     value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
 454  00a1 c650a0        	ld	a,20640
 455  00a4 a403          	and	a,#3
 456  00a6 6b01          	ld	(OFST+0,sp),a
 458                     ; 137     break;
 460  00a8 202c          	jra	L302
 461  00aa               L541:
 462                     ; 138   case EXTI_PORT_GPIOB:
 462                     ; 139     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
 464  00aa c650a0        	ld	a,20640
 465  00ad a40c          	and	a,#12
 466  00af 44            	srl	a
 467  00b0 44            	srl	a
 468  00b1 6b01          	ld	(OFST+0,sp),a
 470                     ; 140     break;
 472  00b3 2021          	jra	L302
 473  00b5               L741:
 474                     ; 141   case EXTI_PORT_GPIOC:
 474                     ; 142     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
 476  00b5 c650a0        	ld	a,20640
 477  00b8 a430          	and	a,#48
 478  00ba 4e            	swap	a
 479  00bb a40f          	and	a,#15
 480  00bd 6b01          	ld	(OFST+0,sp),a
 482                     ; 143     break;
 484  00bf 2015          	jra	L302
 485  00c1               L151:
 486                     ; 144   case EXTI_PORT_GPIOD:
 486                     ; 145     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
 488  00c1 c650a0        	ld	a,20640
 489  00c4 a4c0          	and	a,#192
 490  00c6 4e            	swap	a
 491  00c7 44            	srl	a
 492  00c8 44            	srl	a
 493  00c9 a403          	and	a,#3
 494  00cb 6b01          	ld	(OFST+0,sp),a
 496                     ; 146     break;
 498  00cd 2007          	jra	L302
 499  00cf               L351:
 500                     ; 147   case EXTI_PORT_GPIOE:
 500                     ; 148     value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
 502  00cf c650a1        	ld	a,20641
 503  00d2 a403          	and	a,#3
 504  00d4 6b01          	ld	(OFST+0,sp),a
 506                     ; 149     break;
 508  00d6               L551:
 509                     ; 150   default:
 509                     ; 151     break;
 511  00d6               L302:
 512                     ; 154   return((EXTI_Sensitivity_TypeDef)value);
 514  00d6 7b01          	ld	a,(OFST+0,sp)
 517  00d8 5b01          	addw	sp,#1
 518  00da 81            	ret
 554                     ; 162 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
 554                     ; 163 {
 555                     	switch	.text
 556  00db               _EXTI_GetTLISensitivity:
 558  00db 88            	push	a
 559       00000001      OFST:	set	1
 562                     ; 164   uint8_t value = 0;
 564                     ; 167   value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
 566  00dc c650a1        	ld	a,20641
 567  00df a404          	and	a,#4
 568  00e1 6b01          	ld	(OFST+0,sp),a
 570                     ; 169   return((EXTI_TLISensitivity_TypeDef)value);
 572  00e3 7b01          	ld	a,(OFST+0,sp)
 575  00e5 5b01          	addw	sp,#1
 576  00e7 81            	ret
 589                     	xdef	_EXTI_GetTLISensitivity
 590                     	xdef	_EXTI_GetExtIntSensitivity
 591                     	xdef	_EXTI_SetTLISensitivity
 592                     	xdef	_EXTI_SetExtIntSensitivity
 593                     	xdef	_EXTI_DeInit
 612                     	end
