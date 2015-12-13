   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
  45                     ; 63 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  45                     ; 64 {
  46                     .text:	section	.text,new
  47  0000               f_TRAP_IRQHandler:
  51                     ; 68 }
  54  0000 80            	iret
  76                     ; 74 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
  76                     ; 75 {
  77                     .text:	section	.text,new
  78  0000               f_TLI_IRQHandler:
  82                     ; 79 }
  85  0000 80            	iret
 107                     ; 86 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 107                     ; 87 {
 108                     .text:	section	.text,new
 109  0000               f_AWU_IRQHandler:
 113                     ; 91 }
 116  0000 80            	iret
 138                     ; 98 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 138                     ; 99 {
 139                     .text:	section	.text,new
 140  0000               f_CLK_IRQHandler:
 144                     ; 103 }
 147  0000 80            	iret
 170                     ; 110 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 170                     ; 111 {
 171                     .text:	section	.text,new
 172  0000               f_EXTI_PORTA_IRQHandler:
 176                     ; 115 }
 179  0000 80            	iret
 202                     ; 122 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 202                     ; 123 {
 203                     .text:	section	.text,new
 204  0000               f_EXTI_PORTB_IRQHandler:
 208                     ; 127 }
 211  0000 80            	iret
 234                     ; 134 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 234                     ; 135 {
 235                     .text:	section	.text,new
 236  0000               f_EXTI_PORTC_IRQHandler:
 240                     ; 139 }
 243  0000 80            	iret
 266                     ; 146 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 266                     ; 147 {
 267                     .text:	section	.text,new
 268  0000               f_EXTI_PORTD_IRQHandler:
 272                     ; 151 }
 275  0000 80            	iret
 298                     ; 158 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 298                     ; 159 {
 299                     .text:	section	.text,new
 300  0000               f_EXTI_PORTE_IRQHandler:
 304                     ; 163 }
 307  0000 80            	iret
 329                     ; 209 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 329                     ; 210 {
 330                     .text:	section	.text,new
 331  0000               f_SPI_IRQHandler:
 335                     ; 214 }
 338  0000 80            	iret
 361                     ; 221 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 361                     ; 222 {
 362                     .text:	section	.text,new
 363  0000               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 367                     ; 226 }
 370  0000 80            	iret
 393                     ; 233 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 393                     ; 234 {
 394                     .text:	section	.text,new
 395  0000               f_TIM1_CAP_COM_IRQHandler:
 399                     ; 238 }
 402  0000 80            	iret
 425                     ; 270  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 425                     ; 271 {
 426                     .text:	section	.text,new
 427  0000               f_TIM2_UPD_OVF_BRK_IRQHandler:
 431                     ; 275 }
 434  0000 80            	iret
 457                     ; 282  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 457                     ; 283 {
 458                     .text:	section	.text,new
 459  0000               f_TIM2_CAP_COM_IRQHandler:
 463                     ; 287 }
 466  0000 80            	iret
 489                     ; 324  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 489                     ; 325 {
 490                     .text:	section	.text,new
 491  0000               f_UART1_TX_IRQHandler:
 495                     ; 329 }
 498  0000 80            	iret
 521                     ; 336  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 521                     ; 337 {
 522                     .text:	section	.text,new
 523  0000               f_UART1_RX_IRQHandler:
 527                     ; 341 }
 530  0000 80            	iret
 552                     ; 349 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 552                     ; 350 {
 553                     .text:	section	.text,new
 554  0000               f_I2C_IRQHandler:
 558                     ; 354 }
 561  0000 80            	iret
 583                     ; 429  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 583                     ; 430 {
 584                     .text:	section	.text,new
 585  0000               f_ADC1_IRQHandler:
 589                     ; 435     return;
 592  0000 80            	iret
 618                     ; 458  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 618                     ; 459 {
 619                     .text:	section	.text,new
 620  0000               f_TIM4_UPD_OVF_IRQHandler:
 622  0000 8a            	push	cc
 623  0001 84            	pop	a
 624  0002 a4bf          	and	a,#191
 625  0004 88            	push	a
 626  0005 86            	pop	cc
 627  0006 3b0002        	push	c_x+2
 628  0009 be00          	ldw	x,c_x
 629  000b 89            	pushw	x
 630  000c 3b0002        	push	c_y+2
 631  000f be00          	ldw	x,c_y
 632  0011 89            	pushw	x
 635                     ; 461 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 637  0012 a601          	ld	a,#1
 638  0014 cd0000        	call	_TIM4_ClearITPendingBit
 640                     ; 463 	Timebase_cnt++;
 642  0017 3c00          	inc	_Timebase_cnt
 643                     ; 465 	Tasks_1ms_TimeCritical();
 645  0019 cd0000        	call	_Tasks_1ms_TimeCritical
 647                     ; 467 }
 650  001c 85            	popw	x
 651  001d bf00          	ldw	c_y,x
 652  001f 320002        	pop	c_y+2
 653  0022 85            	popw	x
 654  0023 bf00          	ldw	c_x,x
 655  0025 320002        	pop	c_x+2
 656  0028 80            	iret
 679                     ; 475 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 679                     ; 476 {
 680                     .text:	section	.text,new
 681  0000               f_EEPROM_EEC_IRQHandler:
 685                     ; 480 }
 688  0000 80            	iret
 700                     	xref	_Tasks_1ms_TimeCritical
 701                     	xref.b	_Timebase_cnt
 702                     	xdef	f_EEPROM_EEC_IRQHandler
 703                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 704                     	xdef	f_ADC1_IRQHandler
 705                     	xdef	f_I2C_IRQHandler
 706                     	xdef	f_UART1_RX_IRQHandler
 707                     	xdef	f_UART1_TX_IRQHandler
 708                     	xdef	f_TIM2_CAP_COM_IRQHandler
 709                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 710                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 711                     	xdef	f_TIM1_CAP_COM_IRQHandler
 712                     	xdef	f_SPI_IRQHandler
 713                     	xdef	f_EXTI_PORTE_IRQHandler
 714                     	xdef	f_EXTI_PORTD_IRQHandler
 715                     	xdef	f_EXTI_PORTC_IRQHandler
 716                     	xdef	f_EXTI_PORTB_IRQHandler
 717                     	xdef	f_EXTI_PORTA_IRQHandler
 718                     	xdef	f_CLK_IRQHandler
 719                     	xdef	f_AWU_IRQHandler
 720                     	xdef	f_TLI_IRQHandler
 721                     	xdef	f_TRAP_IRQHandler
 722                     	xref	_TIM4_ClearITPendingBit
 723                     	xref.b	c_x
 724                     	xref.b	c_y
 743                     	end
