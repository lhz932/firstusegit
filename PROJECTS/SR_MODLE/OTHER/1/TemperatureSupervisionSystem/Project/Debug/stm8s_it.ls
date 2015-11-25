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
 593                     	bsct
 594  0000               L132_cnt:
 595  0000 0000          	dc.w	0
 596                     	switch	.ubsct
 597  0000               L332_flag:
 598  0000 00            	ds.b	1
 643                     ; 458  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 643                     ; 459 {
 644                     	switch	.text
 645  0012               f_TIM4_UPD_OVF_IRQHandler:
 647  0012 8a            	push	cc
 648  0013 84            	pop	a
 649  0014 a4bf          	and	a,#191
 650  0016 88            	push	a
 651  0017 86            	pop	cc
 652  0018 3b0002        	push	c_x+2
 653  001b be00          	ldw	x,c_x
 654  001d 89            	pushw	x
 655  001e 3b0002        	push	c_y+2
 656  0021 be00          	ldw	x,c_y
 657  0023 89            	pushw	x
 660                     ; 462 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 662  0024 a601          	ld	a,#1
 663  0026 cd0000        	call	_TIM4_ClearITPendingBit
 665                     ; 463 	cnt++;
 667  0029 be00          	ldw	x,L132_cnt
 668  002b 1c0001        	addw	x,#1
 669  002e bf00          	ldw	L132_cnt,x
 670                     ; 464 	if(cnt>999)
 672  0030 be00          	ldw	x,L132_cnt
 673  0032 a303e8        	cpw	x,#1000
 674  0035 2515          	jrult	L752
 675                     ; 466 		cnt=0;
 677  0037 5f            	clrw	x
 678  0038 bf00          	ldw	L132_cnt,x
 679                     ; 467 	if(flag==0){flag=1;	LED_On();}
 681  003a 3d00          	tnz	L332_flag
 682  003c 2609          	jrne	L162
 685  003e 35010000      	mov	L332_flag,#1
 688  0042 cd0000        	call	_LED_On
 691  0045 2005          	jra	L752
 692  0047               L162:
 693                     ; 468 	else {flag=0;	LED_Off();}
 695  0047 3f00          	clr	L332_flag
 698  0049 cd0000        	call	_LED_Off
 700  004c               L752:
 701                     ; 471 }
 704  004c 85            	popw	x
 705  004d bf00          	ldw	c_y,x
 706  004f 320002        	pop	c_y+2
 707  0052 85            	popw	x
 708  0053 bf00          	ldw	c_x,x
 709  0055 320002        	pop	c_x+2
 710  0058 80            	iret
 733                     ; 479 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 733                     ; 480 {
 734                     	switch	.text
 735  0059               f_EEPROM_EEC_IRQHandler:
 739                     ; 484 }
 742  0059 80            	iret
 754                     	xref	_LED_Off
 755                     	xref	_LED_On
 756                     	xdef	f_EEPROM_EEC_IRQHandler
 757                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 758                     	xdef	f_ADC1_IRQHandler
 759                     	xdef	f_I2C_IRQHandler
 760                     	xdef	f_UART1_RX_IRQHandler
 761                     	xdef	f_UART1_TX_IRQHandler
 762                     	xdef	f_TIM2_CAP_COM_IRQHandler
 763                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 764                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 765                     	xdef	f_TIM1_CAP_COM_IRQHandler
 766                     	xdef	f_SPI_IRQHandler
 767                     	xdef	f_EXTI_PORTE_IRQHandler
 768                     	xdef	f_EXTI_PORTD_IRQHandler
 769                     	xdef	f_EXTI_PORTC_IRQHandler
 770                     	xdef	f_EXTI_PORTB_IRQHandler
 771                     	xdef	f_EXTI_PORTA_IRQHandler
 772                     	xdef	f_CLK_IRQHandler
 773                     	xdef	f_AWU_IRQHandler
 774                     	xdef	f_TLI_IRQHandler
 775                     	xdef	f_TRAP_IRQHandler
 776                     	xref	_TIM4_ClearITPendingBit
 777                     	xref.b	c_x
 778                     	xref.b	c_y
 797                     	end
