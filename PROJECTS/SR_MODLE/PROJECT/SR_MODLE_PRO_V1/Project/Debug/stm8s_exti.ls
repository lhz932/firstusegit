   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
  48                     ; 53 void EXTI_DeInit(void)
  48                     ; 54 {
  50                     .text:	section	.text,new
  51  0000               _EXTI_DeInit:
  55                     ; 55   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  57  0000 725f50a0      	clr	20640
  58                     ; 56   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  60  0004 725f50a1      	clr	20641
  61                     ; 57 }
  64  0008 81            	ret	
 189                     ; 70 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
 189                     ; 71 {
 190                     .text:	section	.text,new
 191  0000               _EXTI_SetExtIntSensitivity:
 193  0000 89            	pushw	x
 194       00000000      OFST:	set	0
 197                     ; 73   assert_param(IS_EXTI_PORT_OK(Port));
 199                     ; 74   assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
 201                     ; 77   switch (Port)
 203  0001 9e            	ld	a,xh
 205                     ; 99   default:
 205                     ; 100     break;
 206  0002 4d            	tnz	a
 207  0003 270e          	jreq	L12
 208  0005 4a            	dec	a
 209  0006 271a          	jreq	L32
 210  0008 4a            	dec	a
 211  0009 2725          	jreq	L52
 212  000b 4a            	dec	a
 213  000c 2731          	jreq	L72
 214  000e 4a            	dec	a
 215  000f 2745          	jreq	L13
 216  0011 2053          	jra	L311
 217  0013               L12:
 218                     ; 79   case EXTI_PORT_GPIOA:
 218                     ; 80     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
 220  0013 c650a0        	ld	a,20640
 221  0016 a4fc          	and	a,#252
 222  0018 c750a0        	ld	20640,a
 223                     ; 81     EXTI->CR1 |= (uint8_t)(SensitivityValue);
 225  001b c650a0        	ld	a,20640
 226  001e 1a02          	or	a,(OFST+2,sp)
 227                     ; 82     break;
 229  0020 202f          	jp	LC001
 230  0022               L32:
 231                     ; 83   case EXTI_PORT_GPIOB:
 231                     ; 84     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
 233  0022 c650a0        	ld	a,20640
 234  0025 a4f3          	and	a,#243
 235  0027 c750a0        	ld	20640,a
 236                     ; 85     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
 238  002a 7b02          	ld	a,(OFST+2,sp)
 239  002c 48            	sll	a
 240  002d 48            	sll	a
 241                     ; 86     break;
 243  002e 201e          	jp	LC002
 244  0030               L52:
 245                     ; 87   case EXTI_PORT_GPIOC:
 245                     ; 88     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
 247  0030 c650a0        	ld	a,20640
 248  0033 a4cf          	and	a,#207
 249  0035 c750a0        	ld	20640,a
 250                     ; 89     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
 252  0038 7b02          	ld	a,(OFST+2,sp)
 253  003a 97            	ld	xl,a
 254  003b a610          	ld	a,#16
 255                     ; 90     break;
 257  003d 200d          	jp	LC003
 258  003f               L72:
 259                     ; 91   case EXTI_PORT_GPIOD:
 259                     ; 92     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
 261  003f c650a0        	ld	a,20640
 262  0042 a43f          	and	a,#63
 263  0044 c750a0        	ld	20640,a
 264                     ; 93     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
 266  0047 7b02          	ld	a,(OFST+2,sp)
 267  0049 97            	ld	xl,a
 268  004a a640          	ld	a,#64
 269  004c               LC003:
 270  004c 42            	mul	x,a
 271  004d 9f            	ld	a,xl
 272  004e               LC002:
 273  004e ca50a0        	or	a,20640
 274  0051               LC001:
 275  0051 c750a0        	ld	20640,a
 276                     ; 94     break;
 278  0054 2010          	jra	L311
 279  0056               L13:
 280                     ; 95   case EXTI_PORT_GPIOE:
 280                     ; 96     EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
 282  0056 c650a1        	ld	a,20641
 283  0059 a4fc          	and	a,#252
 284  005b c750a1        	ld	20641,a
 285                     ; 97     EXTI->CR2 |= (uint8_t)(SensitivityValue);
 287  005e c650a1        	ld	a,20641
 288  0061 1a02          	or	a,(OFST+2,sp)
 289  0063 c750a1        	ld	20641,a
 290                     ; 98     break;
 292                     ; 99   default:
 292                     ; 100     break;
 294  0066               L311:
 295                     ; 102 }
 298  0066 85            	popw	x
 299  0067 81            	ret	
 357                     ; 111 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
 357                     ; 112 {
 358                     .text:	section	.text,new
 359  0000               _EXTI_SetTLISensitivity:
 363                     ; 114   assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
 365                     ; 117   EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
 367  0000 721550a1      	bres	20641,#2
 368                     ; 118   EXTI->CR2 |= (uint8_t)(SensitivityValue);
 370  0004 ca50a1        	or	a,20641
 371  0007 c750a1        	ld	20641,a
 372                     ; 119 }
 375  000a 81            	ret	
 421                     ; 126 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
 421                     ; 127 {
 422                     .text:	section	.text,new
 423  0000               _EXTI_GetExtIntSensitivity:
 425  0000 88            	push	a
 426       00000001      OFST:	set	1
 429                     ; 128   uint8_t value = 0;
 431  0001 0f01          	clr	(OFST+0,sp)
 433                     ; 131   assert_param(IS_EXTI_PORT_OK(Port));
 435                     ; 133   switch (Port)
 438                     ; 150   default:
 438                     ; 151     break;
 439  0003 4d            	tnz	a
 440  0004 2710          	jreq	L341
 441  0006 4a            	dec	a
 442  0007 2712          	jreq	L541
 443  0009 4a            	dec	a
 444  000a 2718          	jreq	L741
 445  000c 4a            	dec	a
 446  000d 271b          	jreq	L151
 447  000f 4a            	dec	a
 448  0010 2722          	jreq	L351
 449  0012 7b01          	ld	a,(OFST+0,sp)
 450  0014 2023          	jra	LC004
 451  0016               L341:
 452                     ; 135   case EXTI_PORT_GPIOA:
 452                     ; 136     value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
 454  0016 c650a0        	ld	a,20640
 455                     ; 137     break;
 457  0019 201c          	jp	LC005
 458  001b               L541:
 459                     ; 138   case EXTI_PORT_GPIOB:
 459                     ; 139     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
 461  001b c650a0        	ld	a,20640
 462  001e a40c          	and	a,#12
 463  0020 44            	srl	a
 464  0021 44            	srl	a
 465                     ; 140     break;
 467  0022 2015          	jp	LC004
 468  0024               L741:
 469                     ; 141   case EXTI_PORT_GPIOC:
 469                     ; 142     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
 471  0024 c650a0        	ld	a,20640
 472  0027 4e            	swap	a
 473                     ; 143     break;
 475  0028 200d          	jp	LC005
 476  002a               L151:
 477                     ; 144   case EXTI_PORT_GPIOD:
 477                     ; 145     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
 479  002a c650a0        	ld	a,20640
 480  002d 4e            	swap	a
 481  002e a40c          	and	a,#12
 482  0030 44            	srl	a
 483  0031 44            	srl	a
 484                     ; 146     break;
 486  0032 2003          	jp	LC005
 487  0034               L351:
 488                     ; 147   case EXTI_PORT_GPIOE:
 488                     ; 148     value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
 490  0034 c650a1        	ld	a,20641
 491  0037               LC005:
 492  0037 a403          	and	a,#3
 493  0039               LC004:
 495                     ; 149     break;
 497                     ; 150   default:
 497                     ; 151     break;
 499                     ; 154   return((EXTI_Sensitivity_TypeDef)value);
 503  0039 5b01          	addw	sp,#1
 504  003b 81            	ret	
 540                     ; 162 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
 540                     ; 163 {
 541                     .text:	section	.text,new
 542  0000               _EXTI_GetTLISensitivity:
 544  0000 88            	push	a
 545       00000001      OFST:	set	1
 548                     ; 164   uint8_t value = 0;
 550                     ; 167   value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
 552  0001 c650a1        	ld	a,20641
 553  0004 a404          	and	a,#4
 555                     ; 169   return((EXTI_TLISensitivity_TypeDef)value);
 559  0006 5b01          	addw	sp,#1
 560  0008 81            	ret	
 573                     	xdef	_EXTI_GetTLISensitivity
 574                     	xdef	_EXTI_GetExtIntSensitivity
 575                     	xdef	_EXTI_SetTLISensitivity
 576                     	xdef	_EXTI_SetExtIntSensitivity
 577                     	xdef	_EXTI_DeInit
 596                     	end
