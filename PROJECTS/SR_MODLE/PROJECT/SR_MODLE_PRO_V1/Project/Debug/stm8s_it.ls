   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
  48                     ; 63 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  48                     ; 64 {
  49                     .text:	section	.text,new
  50  0000               f_TRAP_IRQHandler:
  54                     ; 68 }
  57  0000 80            	iret	
  79                     ; 74 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
  79                     ; 75 {
  80                     .text:	section	.text,new
  81  0000               f_TLI_IRQHandler:
  85                     ; 79 }
  88  0000 80            	iret	
 110                     ; 86 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 110                     ; 87 {
 111                     .text:	section	.text,new
 112  0000               f_AWU_IRQHandler:
 116                     ; 91 }
 119  0000 80            	iret	
 141                     ; 98 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 141                     ; 99 {
 142                     .text:	section	.text,new
 143  0000               f_CLK_IRQHandler:
 147                     ; 103 }
 150  0000 80            	iret	
 173                     ; 110 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 173                     ; 111 {
 174                     .text:	section	.text,new
 175  0000               f_EXTI_PORTA_IRQHandler:
 179                     ; 115 }
 182  0000 80            	iret	
 205                     ; 122 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 205                     ; 123 {
 206                     .text:	section	.text,new
 207  0000               f_EXTI_PORTB_IRQHandler:
 211                     ; 127 }
 214  0000 80            	iret	
 237                     ; 134 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 237                     ; 135 {
 238                     .text:	section	.text,new
 239  0000               f_EXTI_PORTC_IRQHandler:
 243                     ; 139 }
 246  0000 80            	iret	
 269                     ; 146 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 269                     ; 147 {
 270                     .text:	section	.text,new
 271  0000               f_EXTI_PORTD_IRQHandler:
 275                     ; 151 }
 278  0000 80            	iret	
 301                     ; 158 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 301                     ; 159 {
 302                     .text:	section	.text,new
 303  0000               f_EXTI_PORTE_IRQHandler:
 307                     ; 163 }
 310  0000 80            	iret	
 332                     ; 209 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 332                     ; 210 {
 333                     .text:	section	.text,new
 334  0000               f_SPI_IRQHandler:
 338                     ; 214 }
 341  0000 80            	iret	
 364                     ; 221 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 364                     ; 222 {
 365                     .text:	section	.text,new
 366  0000               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 370                     ; 226 }
 373  0000 80            	iret	
 396                     ; 233 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 396                     ; 234 {
 397                     .text:	section	.text,new
 398  0000               f_TIM1_CAP_COM_IRQHandler:
 402                     ; 238 }
 405  0000 80            	iret	
 428                     ; 270  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 428                     ; 271 {
 429                     .text:	section	.text,new
 430  0000               f_TIM2_UPD_OVF_BRK_IRQHandler:
 434                     ; 275 }
 437  0000 80            	iret	
 460                     ; 282  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 460                     ; 283 {
 461                     .text:	section	.text,new
 462  0000               f_TIM2_CAP_COM_IRQHandler:
 466                     ; 287 }
 469  0000 80            	iret	
 492                     ; 324  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 492                     ; 325 {
 493                     .text:	section	.text,new
 494  0000               f_UART1_TX_IRQHandler:
 498                     ; 329 }
 501  0000 80            	iret	
 524                     ; 336  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 524                     ; 337 {
 525                     .text:	section	.text,new
 526  0000               f_UART1_RX_IRQHandler:
 530                     ; 341 }
 533  0000 80            	iret	
 555                     ; 349 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 555                     ; 350 {
 556                     .text:	section	.text,new
 557  0000               f_I2C_IRQHandler:
 561                     ; 354 }
 564  0000 80            	iret	
 586                     ; 429  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 586                     ; 430 {
 587                     .text:	section	.text,new
 588  0000               f_ADC1_IRQHandler:
 592                     ; 435     return;
 595  0000 80            	iret	
 621                     ; 458  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 621                     ; 459 {
 622                     .text:	section	.text,new
 623  0000               f_TIM4_UPD_OVF_IRQHandler:
 625  0000 8a            	push	cc
 626  0001 84            	pop	a
 627  0002 a4bf          	and	a,#191
 628  0004 88            	push	a
 629  0005 86            	pop	cc
 630  0006 3b0002        	push	c_x+2
 631  0009 be00          	ldw	x,c_x
 632  000b 89            	pushw	x
 633  000c 3b0002        	push	c_y+2
 634  000f be00          	ldw	x,c_y
 635  0011 89            	pushw	x
 638                     ; 461 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 640  0012 a601          	ld	a,#1
 641  0014 cd0000        	call	_TIM4_ClearITPendingBit
 643                     ; 463 	Timebase_cnt++;
 645  0017 3c00          	inc	_Timebase_cnt
 646                     ; 465 	Tasks_1ms_TimeCritical();
 648  0019 cd0000        	call	_Tasks_1ms_TimeCritical
 650                     ; 467 }
 653  001c 85            	popw	x
 654  001d bf00          	ldw	c_y,x
 655  001f 320002        	pop	c_y+2
 656  0022 85            	popw	x
 657  0023 bf00          	ldw	c_x,x
 658  0025 320002        	pop	c_x+2
 659  0028 80            	iret	
 682                     ; 475 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 682                     ; 476 {
 683                     .text:	section	.text,new
 684  0000               f_EEPROM_EEC_IRQHandler:
 688                     ; 480 }
 691  0000 80            	iret	
 703                     	xref	_Tasks_1ms_TimeCritical
 704                     	xref.b	_Timebase_cnt
 705                     	xdef	f_EEPROM_EEC_IRQHandler
 706                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 707                     	xdef	f_ADC1_IRQHandler
 708                     	xdef	f_I2C_IRQHandler
 709                     	xdef	f_UART1_RX_IRQHandler
 710                     	xdef	f_UART1_TX_IRQHandler
 711                     	xdef	f_TIM2_CAP_COM_IRQHandler
 712                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 713                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 714                     	xdef	f_TIM1_CAP_COM_IRQHandler
 715                     	xdef	f_SPI_IRQHandler
 716                     	xdef	f_EXTI_PORTE_IRQHandler
 717                     	xdef	f_EXTI_PORTD_IRQHandler
 718                     	xdef	f_EXTI_PORTC_IRQHandler
 719                     	xdef	f_EXTI_PORTB_IRQHandler
 720                     	xdef	f_EXTI_PORTA_IRQHandler
 721                     	xdef	f_CLK_IRQHandler
 722                     	xdef	f_AWU_IRQHandler
 723                     	xdef	f_TLI_IRQHandler
 724                     	xdef	f_TRAP_IRQHandler
 725                     	xref	_TIM4_ClearITPendingBit
 726                     	xref.b	c_x
 727                     	xref.b	c_y
 746                     	end
