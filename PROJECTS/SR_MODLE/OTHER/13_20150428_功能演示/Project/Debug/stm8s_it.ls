   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
  48                     ; 64 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  48                     ; 65 {
  49                     	switch	.text
  50  0000               f_TRAP_IRQHandler:
  54                     ; 69 }
  57  0000 80            	iret	
  79                     ; 75 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
  79                     ; 76 {
  80                     	switch	.text
  81  0001               f_TLI_IRQHandler:
  85                     ; 80 }
  88  0001 80            	iret	
 110                     ; 87 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 110                     ; 88 {
 111                     	switch	.text
 112  0002               f_AWU_IRQHandler:
 116                     ; 92 }
 119  0002 80            	iret	
 141                     ; 99 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 141                     ; 100 {
 142                     	switch	.text
 143  0003               f_CLK_IRQHandler:
 147                     ; 104 }
 150  0003 80            	iret	
 173                     ; 111 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 173                     ; 112 {
 174                     	switch	.text
 175  0004               f_EXTI_PORTA_IRQHandler:
 179                     ; 116 }
 182  0004 80            	iret	
 205                     ; 123 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 205                     ; 124 {
 206                     	switch	.text
 207  0005               f_EXTI_PORTB_IRQHandler:
 211                     ; 128 }
 214  0005 80            	iret	
 237                     ; 135 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 237                     ; 136 {
 238                     	switch	.text
 239  0006               f_EXTI_PORTC_IRQHandler:
 243                     ; 140 }
 246  0006 80            	iret	
 269                     ; 147 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 269                     ; 148 {
 270                     	switch	.text
 271  0007               f_EXTI_PORTD_IRQHandler:
 275                     ; 152 }
 278  0007 80            	iret	
 301                     ; 159 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 301                     ; 160 {
 302                     	switch	.text
 303  0008               f_EXTI_PORTE_IRQHandler:
 307                     ; 164 }
 310  0008 80            	iret	
 332                     ; 210 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 332                     ; 211 {
 333                     	switch	.text
 334  0009               f_SPI_IRQHandler:
 338                     ; 215 }
 341  0009 80            	iret	
 364                     ; 222 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 364                     ; 223 {
 365                     	switch	.text
 366  000a               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 370                     ; 227 }
 373  000a 80            	iret	
 396                     ; 234 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 396                     ; 235 {
 397                     	switch	.text
 398  000b               f_TIM1_CAP_COM_IRQHandler:
 402                     ; 239 }
 405  000b 80            	iret	
 428                     ; 271  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 428                     ; 272 {
 429                     	switch	.text
 430  000c               f_TIM2_UPD_OVF_BRK_IRQHandler:
 434                     ; 276 }
 437  000c 80            	iret	
 460                     ; 283  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 460                     ; 284 {
 461                     	switch	.text
 462  000d               f_TIM2_CAP_COM_IRQHandler:
 466                     ; 288 }
 469  000d 80            	iret	
 492                     ; 325  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 492                     ; 326 {
 493                     	switch	.text
 494  000e               f_UART1_TX_IRQHandler:
 498                     ; 330 }
 501  000e 80            	iret	
 524                     ; 337  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 524                     ; 338 {
 525                     	switch	.text
 526  000f               f_UART1_RX_IRQHandler:
 530                     ; 342 }
 533  000f 80            	iret	
 555                     ; 350 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 555                     ; 351 {
 556                     	switch	.text
 557  0010               f_I2C_IRQHandler:
 561                     ; 355 }
 564  0010 80            	iret	
 586                     ; 430  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 586                     ; 431 {
 587                     	switch	.text
 588  0011               f_ADC1_IRQHandler:
 592                     ; 436     return;
 595  0011 80            	iret	
 597                     	bsct
 598  0000               L132_cnt:
 599  0000 0000          	dc.w	0
 600                     	switch	.ubsct
 601  0000               L332_flag:
 602  0000 00            	ds.b	1
 648                     ; 459  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 648                     ; 460 {
 649                     	switch	.text
 650  0012               f_TIM4_UPD_OVF_IRQHandler:
 652  0012 8a            	push	cc
 653  0013 84            	pop	a
 654  0014 a4bf          	and	a,#191
 655  0016 88            	push	a
 656  0017 86            	pop	cc
 657  0018 3b0002        	push	c_x+2
 658  001b be00          	ldw	x,c_x
 659  001d 89            	pushw	x
 660  001e 3b0002        	push	c_y+2
 661  0021 be00          	ldw	x,c_y
 662  0023 89            	pushw	x
 665                     ; 464 	 TIM4->SR1 = (uint8_t)(~0x01);
 667  0024 35fe5344      	mov	21316,#254
 668                     ; 466 	cnt++;
 670  0028 be00          	ldw	x,L132_cnt
 671  002a 5c            	incw	x
 672  002b bf00          	ldw	L132_cnt,x
 673                     ; 467 	if(cnt>999)
 675  002d a303e8        	cpw	x,#1000
 676  0030 2515          	jrult	L752
 677                     ; 469 		cnt=0;
 679  0032 5f            	clrw	x
 680  0033 bf00          	ldw	L132_cnt,x
 681                     ; 470 	if(flag==0){flag=1;	LED_On();}
 683  0035 b600          	ld	a,L332_flag
 684  0037 2609          	jrne	L162
 687  0039 35010000      	mov	L332_flag,#1
 690  003d cd0000        	call	_LED_On
 693  0040 2005          	jra	L752
 694  0042               L162:
 695                     ; 471 	else {flag=0;	LED_Off();}
 697  0042 3f00          	clr	L332_flag
 700  0044 cd0000        	call	_LED_Off
 702  0047               L752:
 703                     ; 474 	Task_1ms_NotCritical_cnt++;
 705  0047 3c00          	inc	_Task_1ms_NotCritical_cnt
 706                     ; 475 	Task_10ms_NotCritical_cnt++;
 708  0049 3c00          	inc	_Task_10ms_NotCritical_cnt
 709                     ; 476 }
 712  004b 85            	popw	x
 713  004c bf00          	ldw	c_y,x
 714  004e 320002        	pop	c_y+2
 715  0051 85            	popw	x
 716  0052 bf00          	ldw	c_x,x
 717  0054 320002        	pop	c_x+2
 718  0057 80            	iret	
 741                     ; 484 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 741                     ; 485 {
 742                     	switch	.text
 743  0058               f_EEPROM_EEC_IRQHandler:
 747                     ; 489 }
 750  0058 80            	iret	
 762                     	xref.b	_Task_10ms_NotCritical_cnt
 763                     	xref.b	_Task_1ms_NotCritical_cnt
 764                     	xref	_LED_Off
 765                     	xref	_LED_On
 766                     	xdef	f_EEPROM_EEC_IRQHandler
 767                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 768                     	xdef	f_ADC1_IRQHandler
 769                     	xdef	f_I2C_IRQHandler
 770                     	xdef	f_UART1_RX_IRQHandler
 771                     	xdef	f_UART1_TX_IRQHandler
 772                     	xdef	f_TIM2_CAP_COM_IRQHandler
 773                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 774                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 775                     	xdef	f_TIM1_CAP_COM_IRQHandler
 776                     	xdef	f_SPI_IRQHandler
 777                     	xdef	f_EXTI_PORTE_IRQHandler
 778                     	xdef	f_EXTI_PORTD_IRQHandler
 779                     	xdef	f_EXTI_PORTC_IRQHandler
 780                     	xdef	f_EXTI_PORTB_IRQHandler
 781                     	xdef	f_EXTI_PORTA_IRQHandler
 782                     	xdef	f_CLK_IRQHandler
 783                     	xdef	f_AWU_IRQHandler
 784                     	xdef	f_TLI_IRQHandler
 785                     	xdef	f_TRAP_IRQHandler
 786                     	xref.b	c_x
 787                     	xref.b	c_y
 806                     	end
