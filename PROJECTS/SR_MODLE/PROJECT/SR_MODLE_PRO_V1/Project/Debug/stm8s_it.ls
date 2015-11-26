   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
  44                     ; 63 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  44                     ; 64 {
  45                     	switch	.text
  46  0000               f_TRAP_IRQHandler:
  50                     ; 68 }
  53  0000 80            	iret
  75                     ; 74 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
  75                     ; 75 {
  76                     	switch	.text
  77  0001               f_TLI_IRQHandler:
  81                     ; 79 }
  84  0001 80            	iret
 106                     ; 86 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 106                     ; 87 {
 107                     	switch	.text
 108  0002               f_AWU_IRQHandler:
 112                     ; 91 }
 115  0002 80            	iret
 137                     ; 98 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 137                     ; 99 {
 138                     	switch	.text
 139  0003               f_CLK_IRQHandler:
 143                     ; 103 }
 146  0003 80            	iret
 169                     ; 110 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 169                     ; 111 {
 170                     	switch	.text
 171  0004               f_EXTI_PORTA_IRQHandler:
 175                     ; 115 }
 178  0004 80            	iret
 201                     ; 122 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 201                     ; 123 {
 202                     	switch	.text
 203  0005               f_EXTI_PORTB_IRQHandler:
 207                     ; 127 }
 210  0005 80            	iret
 233                     ; 134 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 233                     ; 135 {
 234                     	switch	.text
 235  0006               f_EXTI_PORTC_IRQHandler:
 239                     ; 139 }
 242  0006 80            	iret
 265                     ; 146 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 265                     ; 147 {
 266                     	switch	.text
 267  0007               f_EXTI_PORTD_IRQHandler:
 271                     ; 151 }
 274  0007 80            	iret
 297                     ; 158 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 297                     ; 159 {
 298                     	switch	.text
 299  0008               f_EXTI_PORTE_IRQHandler:
 303                     ; 163 }
 306  0008 80            	iret
 328                     ; 209 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 328                     ; 210 {
 329                     	switch	.text
 330  0009               f_SPI_IRQHandler:
 334                     ; 214 }
 337  0009 80            	iret
 360                     ; 221 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 360                     ; 222 {
 361                     	switch	.text
 362  000a               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 366                     ; 226 }
 369  000a 80            	iret
 392                     ; 233 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 392                     ; 234 {
 393                     	switch	.text
 394  000b               f_TIM1_CAP_COM_IRQHandler:
 398                     ; 238 }
 401  000b 80            	iret
 424                     ; 270  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 424                     ; 271 {
 425                     	switch	.text
 426  000c               f_TIM2_UPD_OVF_BRK_IRQHandler:
 430                     ; 275 }
 433  000c 80            	iret
 456                     ; 282  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 456                     ; 283 {
 457                     	switch	.text
 458  000d               f_TIM2_CAP_COM_IRQHandler:
 462                     ; 287 }
 465  000d 80            	iret
 488                     ; 324  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 488                     ; 325 {
 489                     	switch	.text
 490  000e               f_UART1_TX_IRQHandler:
 494                     ; 329 }
 497  000e 80            	iret
 520                     ; 336  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 520                     ; 337 {
 521                     	switch	.text
 522  000f               f_UART1_RX_IRQHandler:
 526                     ; 341 }
 529  000f 80            	iret
 551                     ; 349 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 551                     ; 350 {
 552                     	switch	.text
 553  0010               f_I2C_IRQHandler:
 557                     ; 354 }
 560  0010 80            	iret
 582                     ; 429  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 582                     ; 430 {
 583                     	switch	.text
 584  0011               f_ADC1_IRQHandler:
 588                     ; 435     return;
 591  0011 80            	iret
 615                     ; 458  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 615                     ; 459 {
 616                     	switch	.text
 617  0012               f_TIM4_UPD_OVF_IRQHandler:
 619  0012 8a            	push	cc
 620  0013 84            	pop	a
 621  0014 a4bf          	and	a,#191
 622  0016 88            	push	a
 623  0017 86            	pop	cc
 624  0018 3b0002        	push	c_x+2
 625  001b be00          	ldw	x,c_x
 626  001d 89            	pushw	x
 627  001e 3b0002        	push	c_y+2
 628  0021 be00          	ldw	x,c_y
 629  0023 89            	pushw	x
 632                     ; 461 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 634  0024 a601          	ld	a,#1
 635  0026 cd0000        	call	_TIM4_ClearITPendingBit
 637                     ; 464 }
 640  0029 85            	popw	x
 641  002a bf00          	ldw	c_y,x
 642  002c 320002        	pop	c_y+2
 643  002f 85            	popw	x
 644  0030 bf00          	ldw	c_x,x
 645  0032 320002        	pop	c_x+2
 646  0035 80            	iret
 669                     ; 472 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 669                     ; 473 {
 670                     	switch	.text
 671  0036               f_EEPROM_EEC_IRQHandler:
 675                     ; 477 }
 678  0036 80            	iret
 690                     	xdef	f_EEPROM_EEC_IRQHandler
 691                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 692                     	xdef	f_ADC1_IRQHandler
 693                     	xdef	f_I2C_IRQHandler
 694                     	xdef	f_UART1_RX_IRQHandler
 695                     	xdef	f_UART1_TX_IRQHandler
 696                     	xdef	f_TIM2_CAP_COM_IRQHandler
 697                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 698                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 699                     	xdef	f_TIM1_CAP_COM_IRQHandler
 700                     	xdef	f_SPI_IRQHandler
 701                     	xdef	f_EXTI_PORTE_IRQHandler
 702                     	xdef	f_EXTI_PORTD_IRQHandler
 703                     	xdef	f_EXTI_PORTC_IRQHandler
 704                     	xdef	f_EXTI_PORTB_IRQHandler
 705                     	xdef	f_EXTI_PORTA_IRQHandler
 706                     	xdef	f_CLK_IRQHandler
 707                     	xdef	f_AWU_IRQHandler
 708                     	xdef	f_TLI_IRQHandler
 709                     	xdef	f_TRAP_IRQHandler
 710                     	xref	_TIM4_ClearITPendingBit
 711                     	xref.b	c_x
 712                     	xref.b	c_y
 731                     	end
