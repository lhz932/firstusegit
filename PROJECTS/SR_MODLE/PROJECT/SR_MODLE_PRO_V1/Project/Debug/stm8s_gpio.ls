   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
 114                     ; 53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 114                     ; 54 {
 116                     .text:	section	.text,new
 117  0000               _GPIO_DeInit:
 121                     ; 55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 123  0000 7f            	clr	(x)
 124                     ; 56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 126  0001 6f02          	clr	(2,x)
 127                     ; 57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 129  0003 6f03          	clr	(3,x)
 130                     ; 58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 132  0005 6f04          	clr	(4,x)
 133                     ; 59 }
 136  0007 81            	ret	
 376                     ; 71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 376                     ; 72 {
 377                     .text:	section	.text,new
 378  0000               _GPIO_Init:
 380  0000 89            	pushw	x
 381       00000000      OFST:	set	0
 384                     ; 77   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 386                     ; 78   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 388                     ; 81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 390  0001 7b05          	ld	a,(OFST+5,sp)
 391  0003 43            	cpl	a
 392  0004 e404          	and	a,(4,x)
 393  0006 e704          	ld	(4,x),a
 394                     ; 87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 396  0008 7b06          	ld	a,(OFST+6,sp)
 397  000a 2a16          	jrpl	L771
 398                     ; 89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 400  000c a510          	bcp	a,#16
 401  000e 2705          	jreq	L102
 402                     ; 91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
 404  0010 f6            	ld	a,(x)
 405  0011 1a05          	or	a,(OFST+5,sp)
 407  0013 2004          	jra	L302
 408  0015               L102:
 409                     ; 95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 411  0015 7b05          	ld	a,(OFST+5,sp)
 412  0017 43            	cpl	a
 413  0018 f4            	and	a,(x)
 414  0019               L302:
 415  0019 f7            	ld	(x),a
 416                     ; 98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
 418  001a 1e01          	ldw	x,(OFST+1,sp)
 419  001c e602          	ld	a,(2,x)
 420  001e 1a05          	or	a,(OFST+5,sp)
 422  0020 2005          	jra	L502
 423  0022               L771:
 424                     ; 103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 426  0022 7b05          	ld	a,(OFST+5,sp)
 427  0024 43            	cpl	a
 428  0025 e402          	and	a,(2,x)
 429  0027               L502:
 430  0027 e702          	ld	(2,x),a
 431                     ; 110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 433  0029 7b06          	ld	a,(OFST+6,sp)
 434  002b a540          	bcp	a,#64
 435  002d 2706          	jreq	L702
 436                     ; 112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 438  002f e603          	ld	a,(3,x)
 439  0031 1a05          	or	a,(OFST+5,sp)
 441  0033 2005          	jra	L112
 442  0035               L702:
 443                     ; 116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 445  0035 7b05          	ld	a,(OFST+5,sp)
 446  0037 43            	cpl	a
 447  0038 e403          	and	a,(3,x)
 448  003a               L112:
 449  003a e703          	ld	(3,x),a
 450                     ; 123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 452  003c 7b06          	ld	a,(OFST+6,sp)
 453  003e a520          	bcp	a,#32
 454  0040 2706          	jreq	L312
 455                     ; 125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 457  0042 e604          	ld	a,(4,x)
 458  0044 1a05          	or	a,(OFST+5,sp)
 460  0046 2005          	jra	L512
 461  0048               L312:
 462                     ; 129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 464  0048 7b05          	ld	a,(OFST+5,sp)
 465  004a 43            	cpl	a
 466  004b e404          	and	a,(4,x)
 467  004d               L512:
 468  004d e704          	ld	(4,x),a
 469                     ; 131 }
 472  004f 85            	popw	x
 473  0050 81            	ret	
 519                     ; 141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 519                     ; 142 {
 520                     .text:	section	.text,new
 521  0000               _GPIO_Write:
 523  0000 89            	pushw	x
 524       00000000      OFST:	set	0
 527                     ; 143   GPIOx->ODR = PortVal;
 529  0001 7b05          	ld	a,(OFST+5,sp)
 530  0003 f7            	ld	(x),a
 531                     ; 144 }
 534  0004 85            	popw	x
 535  0005 81            	ret	
 582                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 582                     ; 155 {
 583                     .text:	section	.text,new
 584  0000               _GPIO_WriteHigh:
 586  0000 89            	pushw	x
 587       00000000      OFST:	set	0
 590                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 592  0001 f6            	ld	a,(x)
 593  0002 1a05          	or	a,(OFST+5,sp)
 594  0004 f7            	ld	(x),a
 595                     ; 157 }
 598  0005 85            	popw	x
 599  0006 81            	ret	
 646                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 646                     ; 168 {
 647                     .text:	section	.text,new
 648  0000               _GPIO_WriteLow:
 650  0000 89            	pushw	x
 651       00000000      OFST:	set	0
 654                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 656  0001 7b05          	ld	a,(OFST+5,sp)
 657  0003 43            	cpl	a
 658  0004 f4            	and	a,(x)
 659  0005 f7            	ld	(x),a
 660                     ; 170 }
 663  0006 85            	popw	x
 664  0007 81            	ret	
 711                     ; 180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 711                     ; 181 {
 712                     .text:	section	.text,new
 713  0000               _GPIO_WriteReverse:
 715  0000 89            	pushw	x
 716       00000000      OFST:	set	0
 719                     ; 182   GPIOx->ODR ^= (uint8_t)PortPins;
 721  0001 f6            	ld	a,(x)
 722  0002 1805          	xor	a,(OFST+5,sp)
 723  0004 f7            	ld	(x),a
 724                     ; 183 }
 727  0005 85            	popw	x
 728  0006 81            	ret	
 766                     ; 191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 766                     ; 192 {
 767                     .text:	section	.text,new
 768  0000               _GPIO_ReadOutputData:
 772                     ; 193   return ((uint8_t)GPIOx->ODR);
 774  0000 f6            	ld	a,(x)
 777  0001 81            	ret	
 814                     ; 202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 814                     ; 203 {
 815                     .text:	section	.text,new
 816  0000               _GPIO_ReadInputData:
 820                     ; 204   return ((uint8_t)GPIOx->IDR);
 822  0000 e601          	ld	a,(1,x)
 825  0002 81            	ret	
 893                     ; 213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 893                     ; 214 {
 894                     .text:	section	.text,new
 895  0000               _GPIO_ReadInputPin:
 897  0000 89            	pushw	x
 898       00000000      OFST:	set	0
 901                     ; 215   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 903  0001 e601          	ld	a,(1,x)
 904  0003 1405          	and	a,(OFST+5,sp)
 907  0005 85            	popw	x
 908  0006 81            	ret	
 986                     ; 225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
 986                     ; 226 {
 987                     .text:	section	.text,new
 988  0000               _GPIO_ExternalPullUpConfig:
 990  0000 89            	pushw	x
 991       00000000      OFST:	set	0
 994                     ; 228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 996                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 998                     ; 231   if (NewState != DISABLE) /* External Pull-Up Set*/
1000  0001 7b06          	ld	a,(OFST+6,sp)
1001  0003 2706          	jreq	L374
1002                     ; 233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1004  0005 e603          	ld	a,(3,x)
1005  0007 1a05          	or	a,(OFST+5,sp)
1007  0009 2005          	jra	L574
1008  000b               L374:
1009                     ; 236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1011  000b 7b05          	ld	a,(OFST+5,sp)
1012  000d 43            	cpl	a
1013  000e e403          	and	a,(3,x)
1014  0010               L574:
1015  0010 e703          	ld	(3,x),a
1016                     ; 238 }
1019  0012 85            	popw	x
1020  0013 81            	ret	
1033                     	xdef	_GPIO_ExternalPullUpConfig
1034                     	xdef	_GPIO_ReadInputPin
1035                     	xdef	_GPIO_ReadOutputData
1036                     	xdef	_GPIO_ReadInputData
1037                     	xdef	_GPIO_WriteReverse
1038                     	xdef	_GPIO_WriteLow
1039                     	xdef	_GPIO_WriteHigh
1040                     	xdef	_GPIO_Write
1041                     	xdef	_GPIO_Init
1042                     	xdef	_GPIO_DeInit
1061                     	end
