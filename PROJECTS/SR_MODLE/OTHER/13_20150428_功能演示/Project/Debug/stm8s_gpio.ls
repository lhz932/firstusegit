   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
 317                     ; 71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 317                     ; 72 {
 319                     	switch	.text
 320  0000               _GPIO_Init:
 322  0000 89            	pushw	x
 323       00000000      OFST:	set	0
 326                     ; 77   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 328                     ; 78   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 330                     ; 81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 332  0001 7b05          	ld	a,(OFST+5,sp)
 333  0003 43            	cpl	a
 334  0004 e404          	and	a,(4,x)
 335  0006 e704          	ld	(4,x),a
 336                     ; 87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 338  0008 7b06          	ld	a,(OFST+6,sp)
 339  000a 2a16          	jrpl	L751
 340                     ; 89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 342  000c a510          	bcp	a,#16
 343  000e 2705          	jreq	L161
 344                     ; 91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
 346  0010 f6            	ld	a,(x)
 347  0011 1a05          	or	a,(OFST+5,sp)
 349  0013 2004          	jra	L361
 350  0015               L161:
 351                     ; 95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 353  0015 7b05          	ld	a,(OFST+5,sp)
 354  0017 43            	cpl	a
 355  0018 f4            	and	a,(x)
 356  0019               L361:
 357  0019 f7            	ld	(x),a
 358                     ; 98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
 360  001a 1e01          	ldw	x,(OFST+1,sp)
 361  001c e602          	ld	a,(2,x)
 362  001e 1a05          	or	a,(OFST+5,sp)
 364  0020 2005          	jra	L561
 365  0022               L751:
 366                     ; 103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 368  0022 7b05          	ld	a,(OFST+5,sp)
 369  0024 43            	cpl	a
 370  0025 e402          	and	a,(2,x)
 371  0027               L561:
 372  0027 e702          	ld	(2,x),a
 373                     ; 110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 375  0029 7b06          	ld	a,(OFST+6,sp)
 376  002b a540          	bcp	a,#64
 377  002d 2706          	jreq	L761
 378                     ; 112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 380  002f e603          	ld	a,(3,x)
 381  0031 1a05          	or	a,(OFST+5,sp)
 383  0033 2005          	jra	L171
 384  0035               L761:
 385                     ; 116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 387  0035 7b05          	ld	a,(OFST+5,sp)
 388  0037 43            	cpl	a
 389  0038 e403          	and	a,(3,x)
 390  003a               L171:
 391  003a e703          	ld	(3,x),a
 392                     ; 123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 394  003c 7b06          	ld	a,(OFST+6,sp)
 395  003e a520          	bcp	a,#32
 396  0040 2706          	jreq	L371
 397                     ; 125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 399  0042 e604          	ld	a,(4,x)
 400  0044 1a05          	or	a,(OFST+5,sp)
 402  0046 2005          	jra	L571
 403  0048               L371:
 404                     ; 129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 406  0048 7b05          	ld	a,(OFST+5,sp)
 407  004a 43            	cpl	a
 408  004b e404          	and	a,(4,x)
 409  004d               L571:
 410  004d e704          	ld	(4,x),a
 411                     ; 131 }
 414  004f 85            	popw	x
 415  0050 81            	ret	
 462                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 462                     ; 155 {
 463                     	switch	.text
 464  0051               _GPIO_WriteHigh:
 466  0051 89            	pushw	x
 467       00000000      OFST:	set	0
 470                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 472  0052 f6            	ld	a,(x)
 473  0053 1a05          	or	a,(OFST+5,sp)
 474  0055 f7            	ld	(x),a
 475                     ; 157 }
 478  0056 85            	popw	x
 479  0057 81            	ret	
 526                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 526                     ; 168 {
 527                     	switch	.text
 528  0058               _GPIO_WriteLow:
 530  0058 89            	pushw	x
 531       00000000      OFST:	set	0
 534                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 536  0059 7b05          	ld	a,(OFST+5,sp)
 537  005b 43            	cpl	a
 538  005c f4            	and	a,(x)
 539  005d f7            	ld	(x),a
 540                     ; 170 }
 543  005e 85            	popw	x
 544  005f 81            	ret	
 581                     ; 204 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 581                     ; 205 {
 582                     	switch	.text
 583  0060               _GPIO_ReadInputData:
 587                     ; 206   return ((uint8_t)GPIOx->IDR);
 589  0060 e601          	ld	a,(1,x)
 592  0062 81            	ret	
 660                     ; 215 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 660                     ; 216 {
 661                     	switch	.text
 662  0063               _GPIO_ReadInputPin:
 664  0063 89            	pushw	x
 665       00000000      OFST:	set	0
 668                     ; 217   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 670  0064 e601          	ld	a,(1,x)
 671  0066 1405          	and	a,(OFST+5,sp)
 674  0068 85            	popw	x
 675  0069 81            	ret	
 688                     	xdef	_GPIO_ReadInputPin
 689                     	xdef	_GPIO_ReadInputData
 690                     	xdef	_GPIO_WriteLow
 691                     	xdef	_GPIO_WriteHigh
 692                     	xdef	_GPIO_Init
 711                     	end
