   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
  44                     ; 65 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  44                     ; 66 {
  45                     	switch	.text
  46  0000               f_TRAP_IRQHandler:
  50                     ; 70 }
  53  0000 80            	iret
  75                     ; 76 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
  75                     ; 77 {
  76                     	switch	.text
  77  0001               f_TLI_IRQHandler:
  81                     ; 81 }
  84  0001 80            	iret
 106                     ; 88 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 106                     ; 89 {
 107                     	switch	.text
 108  0002               f_AWU_IRQHandler:
 112                     ; 93 }
 115  0002 80            	iret
 137                     ; 100 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 137                     ; 101 {
 138                     	switch	.text
 139  0003               f_CLK_IRQHandler:
 143                     ; 105 }
 146  0003 80            	iret
 169                     ; 112 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 169                     ; 113 {
 170                     	switch	.text
 171  0004               f_EXTI_PORTA_IRQHandler:
 175                     ; 117 }
 178  0004 80            	iret
 201                     ; 124 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 201                     ; 125 {
 202                     	switch	.text
 203  0005               f_EXTI_PORTB_IRQHandler:
 207                     ; 129 }
 210  0005 80            	iret
 235                     ; 136 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 235                     ; 137 {
 236                     	switch	.text
 237  0006               f_EXTI_PORTC_IRQHandler:
 241                     ; 142 	disableInterrupts();
 244  0006 9b            sim
 246                     ; 144 	enableInterrupts();
 250  0007 9a            rim
 252                     ; 146 }
 256  0008 80            	iret
 279                     ; 153 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 279                     ; 154 {
 280                     	switch	.text
 281  0009               f_EXTI_PORTD_IRQHandler:
 285                     ; 158 }
 288  0009 80            	iret
 311                     ; 165 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 311                     ; 166 {
 312                     	switch	.text
 313  000a               f_EXTI_PORTE_IRQHandler:
 317                     ; 170 }
 320  000a 80            	iret
 342                     ; 216 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 342                     ; 217 {
 343                     	switch	.text
 344  000b               f_SPI_IRQHandler:
 348                     ; 221 }
 351  000b 80            	iret
 375                     ; 228 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 375                     ; 229 {
 376                     	switch	.text
 377  000c               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 381                     ; 233 	IR_time_cnt++;
 383  000c 3c00          	inc	_IR_time_cnt
 384                     ; 236 }
 387  000e 80            	iret
 410                     ; 243 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 410                     ; 244 {
 411                     	switch	.text
 412  000f               f_TIM1_CAP_COM_IRQHandler:
 416                     ; 248 }
 419  000f 80            	iret
 446                     ; 280  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 446                     ; 281 {
 447                     	switch	.text
 448  0010               f_TIM2_UPD_OVF_BRK_IRQHandler:
 450  0010 8a            	push	cc
 451  0011 84            	pop	a
 452  0012 a4bf          	and	a,#191
 453  0014 88            	push	a
 454  0015 86            	pop	cc
 455  0016 3b0002        	push	c_x+2
 456  0019 be00          	ldw	x,c_x
 457  001b 89            	pushw	x
 458  001c 3b0002        	push	c_y+2
 459  001f be00          	ldw	x,c_y
 460  0021 89            	pushw	x
 463                     ; 286 	TIM2_SetCounter(0X00);
 465  0022 5f            	clrw	x
 466  0023 cd0000        	call	_TIM2_SetCounter
 468                     ; 287 	TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
 470  0026 a601          	ld	a,#1
 471  0028 cd0000        	call	_TIM2_ClearITPendingBit
 473                     ; 288 	Speed_Pulse_Status=SPEED_NO_PULSE;
 475  002b 3f00          	clr	_Speed_Pulse_Status
 476                     ; 289 	Speed_Origin=0XFFFF;
 478  002d aeffff        	ldw	x,#65535
 479  0030 bf00          	ldw	_Speed_Origin,x
 480                     ; 291 }
 483  0032 85            	popw	x
 484  0033 bf00          	ldw	c_y,x
 485  0035 320002        	pop	c_y+2
 486  0038 85            	popw	x
 487  0039 bf00          	ldw	c_x,x
 488  003b 320002        	pop	c_x+2
 489  003e 80            	iret
 519                     ; 298  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 519                     ; 299 {
 520                     	switch	.text
 521  003f               f_TIM2_CAP_COM_IRQHandler:
 523  003f 8a            	push	cc
 524  0040 84            	pop	a
 525  0041 a4bf          	and	a,#191
 526  0043 88            	push	a
 527  0044 86            	pop	cc
 528  0045 3b0002        	push	c_x+2
 529  0048 be00          	ldw	x,c_x
 530  004a 89            	pushw	x
 531  004b 3b0002        	push	c_y+2
 532  004e be00          	ldw	x,c_y
 533  0050 89            	pushw	x
 536                     ; 304 	TIM2_SetCounter(0X00);
 538  0051 5f            	clrw	x
 539  0052 cd0000        	call	_TIM2_SetCounter
 541                     ; 305 	TIM2_ClearITPendingBit(TIM2_IT_CC3);
 543  0055 a608          	ld	a,#8
 544  0057 cd0000        	call	_TIM2_ClearITPendingBit
 546                     ; 307 	if(MT.status==MT_RUNNING_FORWARD){
 548  005a b600          	ld	a,_MT
 549  005c a101          	cp	a,#1
 550  005e 2609          	jrne	L171
 551                     ; 308 		Speed_Pulse_cnt++;
 553  0060 be00          	ldw	x,_Speed_Pulse_cnt
 554  0062 1c0001        	addw	x,#1
 555  0065 bf00          	ldw	_Speed_Pulse_cnt,x
 557  0067 200d          	jra	L371
 558  0069               L171:
 559                     ; 309 	}else if(MT.status==MT_RUNNING_BACKWARD){
 561  0069 b600          	ld	a,_MT
 562  006b a111          	cp	a,#17
 563  006d 2607          	jrne	L371
 564                     ; 310 		Speed_Pulse_cnt--;
 566  006f be00          	ldw	x,_Speed_Pulse_cnt
 567  0071 1d0001        	subw	x,#1
 568  0074 bf00          	ldw	_Speed_Pulse_cnt,x
 569  0076               L371:
 570                     ; 313 	if(Speed_Pulse_Status==SPEED_OK){
 572  0076 b600          	ld	a,_Speed_Pulse_Status
 573  0078 a102          	cp	a,#2
 574  007a 2607          	jrne	L771
 575                     ; 314 		Speed_Origin=TIM2_GetCapture3();
 577  007c cd0000        	call	_TIM2_GetCapture3
 579  007f bf00          	ldw	_Speed_Origin,x
 581  0081 201e          	jra	L102
 582  0083               L771:
 583                     ; 315 	}else if(Speed_Pulse_Status==SPEED_NO_PULSE){
 585  0083 3d00          	tnz	_Speed_Pulse_Status
 586  0085 260b          	jrne	L302
 587                     ; 316 		Speed_Pulse_Status=SPEED_FIRST_PULSE;
 589  0087 35010000      	mov	_Speed_Pulse_Status,#1
 590                     ; 317 		Speed_Origin=0XFFFF;
 592  008b aeffff        	ldw	x,#65535
 593  008e bf00          	ldw	_Speed_Origin,x
 595  0090 200f          	jra	L102
 596  0092               L302:
 597                     ; 318 	}else if(Speed_Pulse_Status==SPEED_FIRST_PULSE){
 599  0092 b600          	ld	a,_Speed_Pulse_Status
 600  0094 a101          	cp	a,#1
 601  0096 2609          	jrne	L102
 602                     ; 319 		Speed_Pulse_Status=SPEED_OK;
 604  0098 35020000      	mov	_Speed_Pulse_Status,#2
 605                     ; 320 		Speed_Origin=TIM2_GetCapture3();		
 607  009c cd0000        	call	_TIM2_GetCapture3
 609  009f bf00          	ldw	_Speed_Origin,x
 610  00a1               L102:
 611                     ; 323 }
 614  00a1 85            	popw	x
 615  00a2 bf00          	ldw	c_y,x
 616  00a4 320002        	pop	c_y+2
 617  00a7 85            	popw	x
 618  00a8 bf00          	ldw	c_x,x
 619  00aa 320002        	pop	c_x+2
 620  00ad 80            	iret
 643                     ; 360  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 643                     ; 361 {
 644                     	switch	.text
 645  00ae               f_UART1_TX_IRQHandler:
 649                     ; 365 }
 652  00ae 80            	iret
 675                     ; 372  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 675                     ; 373 {
 676                     	switch	.text
 677  00af               f_UART1_RX_IRQHandler:
 681                     ; 377 }
 684  00af 80            	iret
 706                     ; 385 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 706                     ; 386 {
 707                     	switch	.text
 708  00b0               f_I2C_IRQHandler:
 712                     ; 390 }
 715  00b0 80            	iret
 737                     ; 465  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 737                     ; 466 {
 738                     	switch	.text
 739  00b1               f_ADC1_IRQHandler:
 743                     ; 471     return;
 746  00b1 80            	iret
 772                     ; 494  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 772                     ; 495 {	
 773                     	switch	.text
 774  00b2               f_TIM4_UPD_OVF_IRQHandler:
 776  00b2 8a            	push	cc
 777  00b3 84            	pop	a
 778  00b4 a4bf          	and	a,#191
 779  00b6 88            	push	a
 780  00b7 86            	pop	cc
 781  00b8 3b0002        	push	c_x+2
 782  00bb be00          	ldw	x,c_x
 783  00bd 89            	pushw	x
 784  00be 3b0002        	push	c_y+2
 785  00c1 be00          	ldw	x,c_y
 786  00c3 89            	pushw	x
 789                     ; 496 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);	
 791  00c4 a601          	ld	a,#1
 792  00c6 cd0000        	call	_TIM4_ClearITPendingBit
 794                     ; 497 	Timebase_cnt++;	
 796  00c9 3c00          	inc	_Timebase_cnt
 797                     ; 498 	Tasks_1ms_TimeCritical();
 799  00cb cd0000        	call	_Tasks_1ms_TimeCritical
 801                     ; 500 }
 804  00ce 85            	popw	x
 805  00cf bf00          	ldw	c_y,x
 806  00d1 320002        	pop	c_y+2
 807  00d4 85            	popw	x
 808  00d5 bf00          	ldw	c_x,x
 809  00d7 320002        	pop	c_x+2
 810  00da 80            	iret
 833                     ; 508 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 833                     ; 509 {
 834                     	switch	.text
 835  00db               f_EEPROM_EEC_IRQHandler:
 839                     ; 513 }
 842  00db 80            	iret
 854                     	xref.b	_IR_time_cnt
 855                     	xref.b	_Speed_Pulse_cnt
 856                     	xref.b	_Speed_Origin
 857                     	xref.b	_Speed_Pulse_Status
 858                     	xref.b	_MT
 859                     	xref	_Tasks_1ms_TimeCritical
 860                     	xref.b	_Timebase_cnt
 861                     	xdef	f_EEPROM_EEC_IRQHandler
 862                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 863                     	xdef	f_ADC1_IRQHandler
 864                     	xdef	f_I2C_IRQHandler
 865                     	xdef	f_UART1_RX_IRQHandler
 866                     	xdef	f_UART1_TX_IRQHandler
 867                     	xdef	f_TIM2_CAP_COM_IRQHandler
 868                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 869                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 870                     	xdef	f_TIM1_CAP_COM_IRQHandler
 871                     	xdef	f_SPI_IRQHandler
 872                     	xdef	f_EXTI_PORTE_IRQHandler
 873                     	xdef	f_EXTI_PORTD_IRQHandler
 874                     	xdef	f_EXTI_PORTC_IRQHandler
 875                     	xdef	f_EXTI_PORTB_IRQHandler
 876                     	xdef	f_EXTI_PORTA_IRQHandler
 877                     	xdef	f_CLK_IRQHandler
 878                     	xdef	f_AWU_IRQHandler
 879                     	xdef	f_TLI_IRQHandler
 880                     	xdef	f_TRAP_IRQHandler
 881                     	xref	_TIM4_ClearITPendingBit
 882                     	xref	_TIM2_ClearITPendingBit
 883                     	xref	_TIM2_GetCapture3
 884                     	xref	_TIM2_SetCounter
 885                     	xref.b	c_x
 886                     	xref.b	c_y
 905                     	end
