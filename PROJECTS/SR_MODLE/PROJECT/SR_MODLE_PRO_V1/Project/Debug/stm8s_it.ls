   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
  49                     ; 64 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  49                     ; 65 {
  50                     .text:	section	.text,new
  51  0000               f_TRAP_IRQHandler:
  55                     ; 69 }
  58  0000 80            	iret	
  80                     ; 75 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
  80                     ; 76 {
  81                     .text:	section	.text,new
  82  0000               f_TLI_IRQHandler:
  86                     ; 80 }
  89  0000 80            	iret	
 111                     ; 87 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 111                     ; 88 {
 112                     .text:	section	.text,new
 113  0000               f_AWU_IRQHandler:
 117                     ; 92 }
 120  0000 80            	iret	
 142                     ; 99 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 142                     ; 100 {
 143                     .text:	section	.text,new
 144  0000               f_CLK_IRQHandler:
 148                     ; 104 }
 151  0000 80            	iret	
 174                     ; 111 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 174                     ; 112 {
 175                     .text:	section	.text,new
 176  0000               f_EXTI_PORTA_IRQHandler:
 180                     ; 116 }
 183  0000 80            	iret	
 206                     ; 123 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 206                     ; 124 {
 207                     .text:	section	.text,new
 208  0000               f_EXTI_PORTB_IRQHandler:
 212                     ; 128 }
 215  0000 80            	iret	
 238                     ; 135 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 238                     ; 136 {
 239                     .text:	section	.text,new
 240  0000               f_EXTI_PORTC_IRQHandler:
 244                     ; 140 }
 247  0000 80            	iret	
 270                     ; 147 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 270                     ; 148 {
 271                     .text:	section	.text,new
 272  0000               f_EXTI_PORTD_IRQHandler:
 276                     ; 152 }
 279  0000 80            	iret	
 302                     ; 159 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 302                     ; 160 {
 303                     .text:	section	.text,new
 304  0000               f_EXTI_PORTE_IRQHandler:
 308                     ; 164 }
 311  0000 80            	iret	
 333                     ; 210 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 333                     ; 211 {
 334                     .text:	section	.text,new
 335  0000               f_SPI_IRQHandler:
 339                     ; 215 }
 342  0000 80            	iret	
 365                     ; 222 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 365                     ; 223 {
 366                     .text:	section	.text,new
 367  0000               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 371                     ; 227 }
 374  0000 80            	iret	
 397                     ; 234 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 397                     ; 235 {
 398                     .text:	section	.text,new
 399  0000               f_TIM1_CAP_COM_IRQHandler:
 403                     ; 239 }
 406  0000 80            	iret	
 433                     ; 271  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 433                     ; 272 {
 434                     .text:	section	.text,new
 435  0000               f_TIM2_UPD_OVF_BRK_IRQHandler:
 437  0000 8a            	push	cc
 438  0001 84            	pop	a
 439  0002 a4bf          	and	a,#191
 440  0004 88            	push	a
 441  0005 86            	pop	cc
 442  0006 3b0002        	push	c_x+2
 443  0009 be00          	ldw	x,c_x
 444  000b 89            	pushw	x
 445  000c 3b0002        	push	c_y+2
 446  000f be00          	ldw	x,c_y
 447  0011 89            	pushw	x
 450                     ; 277 	TIM2_SetCounter(0X00);
 452  0012 5f            	clrw	x
 453  0013 cd0000        	call	_TIM2_SetCounter
 455                     ; 278 	TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
 457  0016 a601          	ld	a,#1
 458  0018 cd0000        	call	_TIM2_ClearITPendingBit
 460                     ; 279 	Speed_Pulse_Status=SPEED_NO_PULSE;
 462  001b 3f00          	clr	_Speed_Pulse_Status
 463                     ; 280 	Speed_Origin=0XFFFF;
 465  001d aeffff        	ldw	x,#65535
 466  0020 bf00          	ldw	_Speed_Origin,x
 467                     ; 282 }
 470  0022 85            	popw	x
 471  0023 bf00          	ldw	c_y,x
 472  0025 320002        	pop	c_y+2
 473  0028 85            	popw	x
 474  0029 bf00          	ldw	c_x,x
 475  002b 320002        	pop	c_x+2
 476  002e 80            	iret	
 506                     ; 289  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 506                     ; 290 {
 507                     .text:	section	.text,new
 508  0000               f_TIM2_CAP_COM_IRQHandler:
 510  0000 8a            	push	cc
 511  0001 84            	pop	a
 512  0002 a4bf          	and	a,#191
 513  0004 88            	push	a
 514  0005 86            	pop	cc
 515  0006 3b0002        	push	c_x+2
 516  0009 be00          	ldw	x,c_x
 517  000b 89            	pushw	x
 518  000c 3b0002        	push	c_y+2
 519  000f be00          	ldw	x,c_y
 520  0011 89            	pushw	x
 523                     ; 295 	TIM2_SetCounter(0X00);
 525  0012 5f            	clrw	x
 526  0013 cd0000        	call	_TIM2_SetCounter
 528                     ; 296 	TIM2_ClearITPendingBit(TIM2_IT_CC3);
 530  0016 a608          	ld	a,#8
 531  0018 cd0000        	call	_TIM2_ClearITPendingBit
 533                     ; 298 	if(MT.status==MT_RUNNING_FORWARD){
 535  001b b600          	ld	a,_MT
 536  001d a101          	cp	a,#1
 537  001f 2605          	jrne	L171
 538                     ; 299 		Speed_Pulse_cnt++;
 540  0021 be00          	ldw	x,_Speed_Pulse_cnt
 541  0023 5c            	incw	x
 543  0024 2007          	jpf	LC001
 544  0026               L171:
 545                     ; 300 	}else if(MT.status==MT_RUNNING_BACKWARD){
 547  0026 a111          	cp	a,#17
 548  0028 2605          	jrne	L371
 549                     ; 301 		Speed_Pulse_cnt--;
 551  002a be00          	ldw	x,_Speed_Pulse_cnt
 552  002c 5a            	decw	x
 553  002d               LC001:
 554  002d bf00          	ldw	_Speed_Pulse_cnt,x
 555  002f               L371:
 556                     ; 304 	if(Speed_Pulse_Status==SPEED_OK){
 558  002f b600          	ld	a,_Speed_Pulse_Status
 559  0031 a102          	cp	a,#2
 560                     ; 305 		Speed_Origin=TIM2_GetCapture3();
 563  0033 2714          	jreq	LC003
 564                     ; 306 	}else if(Speed_Pulse_Status==SPEED_NO_PULSE){
 566  0035 b600          	ld	a,_Speed_Pulse_Status
 567  0037 2609          	jrne	L302
 568                     ; 307 		Speed_Pulse_Status=SPEED_FIRST_PULSE;
 570  0039 35010000      	mov	_Speed_Pulse_Status,#1
 571                     ; 308 		Speed_Origin=0XFFFF;
 573  003d aeffff        	ldw	x,#65535
 575  0040 200a          	jpf	LC002
 576  0042               L302:
 577                     ; 309 	}else if(Speed_Pulse_Status==SPEED_FIRST_PULSE){
 579  0042 4a            	dec	a
 580  0043 2609          	jrne	L102
 581                     ; 310 		Speed_Pulse_Status=SPEED_OK;
 583  0045 35020000      	mov	_Speed_Pulse_Status,#2
 584                     ; 311 		Speed_Origin=TIM2_GetCapture3();		
 586  0049               LC003:
 588  0049 cd0000        	call	_TIM2_GetCapture3
 590  004c               LC002:
 591  004c bf00          	ldw	_Speed_Origin,x
 592  004e               L102:
 593                     ; 314 }
 596  004e 85            	popw	x
 597  004f bf00          	ldw	c_y,x
 598  0051 320002        	pop	c_y+2
 599  0054 85            	popw	x
 600  0055 bf00          	ldw	c_x,x
 601  0057 320002        	pop	c_x+2
 602  005a 80            	iret	
 625                     ; 351  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 625                     ; 352 {
 626                     .text:	section	.text,new
 627  0000               f_UART1_TX_IRQHandler:
 631                     ; 356 }
 634  0000 80            	iret	
 657                     ; 363  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 657                     ; 364 {
 658                     .text:	section	.text,new
 659  0000               f_UART1_RX_IRQHandler:
 663                     ; 368 }
 666  0000 80            	iret	
 688                     ; 376 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 688                     ; 377 {
 689                     .text:	section	.text,new
 690  0000               f_I2C_IRQHandler:
 694                     ; 381 }
 697  0000 80            	iret	
 719                     ; 456  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 719                     ; 457 {
 720                     .text:	section	.text,new
 721  0000               f_ADC1_IRQHandler:
 725                     ; 462     return;
 728  0000 80            	iret	
 754                     ; 485  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 754                     ; 486 {
 755                     .text:	section	.text,new
 756  0000               f_TIM4_UPD_OVF_IRQHandler:
 758  0000 8a            	push	cc
 759  0001 84            	pop	a
 760  0002 a4bf          	and	a,#191
 761  0004 88            	push	a
 762  0005 86            	pop	cc
 763  0006 3b0002        	push	c_x+2
 764  0009 be00          	ldw	x,c_x
 765  000b 89            	pushw	x
 766  000c 3b0002        	push	c_y+2
 767  000f be00          	ldw	x,c_y
 768  0011 89            	pushw	x
 771                     ; 488 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 773  0012 a601          	ld	a,#1
 774  0014 cd0000        	call	_TIM4_ClearITPendingBit
 776                     ; 490 	Timebase_cnt++;
 778  0017 3c00          	inc	_Timebase_cnt
 779                     ; 492 	Tasks_1ms_TimeCritical();
 781  0019 cd0000        	call	_Tasks_1ms_TimeCritical
 783                     ; 494 }
 786  001c 85            	popw	x
 787  001d bf00          	ldw	c_y,x
 788  001f 320002        	pop	c_y+2
 789  0022 85            	popw	x
 790  0023 bf00          	ldw	c_x,x
 791  0025 320002        	pop	c_x+2
 792  0028 80            	iret	
 815                     ; 502 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 815                     ; 503 {
 816                     .text:	section	.text,new
 817  0000               f_EEPROM_EEC_IRQHandler:
 821                     ; 507 }
 824  0000 80            	iret	
 836                     	xref.b	_Speed_Pulse_cnt
 837                     	xref.b	_Speed_Origin
 838                     	xref.b	_Speed_Pulse_Status
 839                     	xref.b	_MT
 840                     	xref	_Tasks_1ms_TimeCritical
 841                     	xref.b	_Timebase_cnt
 842                     	xdef	f_EEPROM_EEC_IRQHandler
 843                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 844                     	xdef	f_ADC1_IRQHandler
 845                     	xdef	f_I2C_IRQHandler
 846                     	xdef	f_UART1_RX_IRQHandler
 847                     	xdef	f_UART1_TX_IRQHandler
 848                     	xdef	f_TIM2_CAP_COM_IRQHandler
 849                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 850                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 851                     	xdef	f_TIM1_CAP_COM_IRQHandler
 852                     	xdef	f_SPI_IRQHandler
 853                     	xdef	f_EXTI_PORTE_IRQHandler
 854                     	xdef	f_EXTI_PORTD_IRQHandler
 855                     	xdef	f_EXTI_PORTC_IRQHandler
 856                     	xdef	f_EXTI_PORTB_IRQHandler
 857                     	xdef	f_EXTI_PORTA_IRQHandler
 858                     	xdef	f_CLK_IRQHandler
 859                     	xdef	f_AWU_IRQHandler
 860                     	xdef	f_TLI_IRQHandler
 861                     	xdef	f_TRAP_IRQHandler
 862                     	xref	_TIM4_ClearITPendingBit
 863                     	xref	_TIM2_ClearITPendingBit
 864                     	xref	_TIM2_GetCapture3
 865                     	xref	_TIM2_SetCounter
 866                     	xref.b	c_x
 867                     	xref.b	c_y
 886                     	end
