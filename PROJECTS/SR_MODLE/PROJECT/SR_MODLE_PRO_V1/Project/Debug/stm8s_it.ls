   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
  49                     ; 65 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  49                     ; 66 {
  50                     .text:	section	.text,new
  51  0000               f_TRAP_IRQHandler:
  55                     ; 70 }
  58  0000 80            	iret	
  80                     ; 76 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
  80                     ; 77 {
  81                     .text:	section	.text,new
  82  0000               f_TLI_IRQHandler:
  86                     ; 81 }
  89  0000 80            	iret	
 111                     ; 88 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 111                     ; 89 {
 112                     .text:	section	.text,new
 113  0000               f_AWU_IRQHandler:
 117                     ; 93 }
 120  0000 80            	iret	
 142                     ; 100 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 142                     ; 101 {
 143                     .text:	section	.text,new
 144  0000               f_CLK_IRQHandler:
 148                     ; 105 }
 151  0000 80            	iret	
 174                     ; 112 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 174                     ; 113 {
 175                     .text:	section	.text,new
 176  0000               f_EXTI_PORTA_IRQHandler:
 180                     ; 117 }
 183  0000 80            	iret	
 206                     ; 124 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 206                     ; 125 {
 207                     .text:	section	.text,new
 208  0000               f_EXTI_PORTB_IRQHandler:
 212                     ; 129 }
 215  0000 80            	iret	
 217                     	switch	.ubsct
 218  0000               L17_cnt:
 219  0000 00            	ds.b	1
 264                     ; 136 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 264                     ; 137 {
 265                     .text:	section	.text,new
 266  0000               f_EXTI_PORTC_IRQHandler:
 268       00000001      OFST:	set	1
 269  0000 88            	push	a
 272                     ; 143 	time=IR_time_cnt;
 274  0001 b600          	ld	a,_IR_time_cnt
 275  0003 6b01          	ld	(OFST+0,sp),a
 277                     ; 144 	IR_time_cnt=0;
 279  0005 3f00          	clr	_IR_time_cnt
 280                     ; 151 	if((time>(135-10))&&(time<(135+10)))
 282  0007 a17e          	cp	a,#126
 283  0009 250b          	jrult	L511
 285  000b a191          	cp	a,#145
 286  000d 2407          	jruge	L511
 287                     ; 153 		cnt=0;
 289  000f 3f00          	clr	L17_cnt
 290                     ; 154 		IR_Code=0;
 292  0011 5f            	clrw	x
 293  0012 bf02          	ldw	_IR_Code+2,x
 294  0014 bf00          	ldw	_IR_Code,x
 295  0016               L511:
 296                     ; 156 	if(cnt<32)
 298  0016 b600          	ld	a,L17_cnt
 299  0018 a120          	cp	a,#32
 300  001a 242e          	jruge	L711
 301                     ; 158 		if((time>(11-5))&&(time<(11+5)))	//0
 303  001c 7b01          	ld	a,(OFST+0,sp)
 304  001e a107          	cp	a,#7
 305  0020 250c          	jrult	L121
 307  0022 a110          	cp	a,#16
 308  0024 2408          	jruge	L121
 309                     ; 160 			if(cnt<31)	IR_Code<<=1;
 311  0026 b600          	ld	a,L17_cnt
 312  0028 a11f          	cp	a,#31
 313  002a 241c          	jruge	L131
 315                     ; 161 			cnt++;
 317  002c 2012          	jpf	LC002
 318  002e               L121:
 319                     ; 162 		}else if((time>(22-5))&&(time<(22+5)))
 321  002e a112          	cp	a,#18
 322  0030 2518          	jrult	L711
 324  0032 a11b          	cp	a,#27
 325  0034 2414          	jruge	L711
 326                     ; 164 			IR_Code|=1;
 328  0036 72100003      	bset	_IR_Code+3,#0
 329                     ; 165 			if(cnt<31)	IR_Code<<=1;
 331  003a b600          	ld	a,L17_cnt
 332  003c a11f          	cp	a,#31
 333  003e 2408          	jruge	L131
 336  0040               LC002:
 338  0040 3803          	sll	_IR_Code+3
 339  0042 3902          	rlc	_IR_Code+2
 340  0044 3901          	rlc	_IR_Code+1
 341  0046 3900          	rlc	_IR_Code
 342  0048               L131:
 343                     ; 166 			cnt++;
 346  0048 3c00          	inc	L17_cnt
 347  004a               L711:
 348                     ; 169 	if(cnt==32)
 350  004a b600          	ld	a,L17_cnt
 351  004c a120          	cp	a,#32
 352  004e 2606          	jrne	L331
 353                     ; 171 		New_IR_Code_Flag=1;	//set the flag
 355  0050 35010000      	mov	_New_IR_Code_Flag,#1
 356                     ; 172 		cnt=0;
 358  0054 3f00          	clr	L17_cnt
 359  0056               L331:
 360                     ; 174 }
 363  0056 84            	pop	a
 364  0057 80            	iret	
 387                     ; 181 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 387                     ; 182 {
 388                     .text:	section	.text,new
 389  0000               f_EXTI_PORTD_IRQHandler:
 393                     ; 186 }
 396  0000 80            	iret	
 419                     ; 193 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 419                     ; 194 {
 420                     .text:	section	.text,new
 421  0000               f_EXTI_PORTE_IRQHandler:
 425                     ; 198 }
 428  0000 80            	iret	
 450                     ; 244 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 450                     ; 245 {
 451                     .text:	section	.text,new
 452  0000               f_SPI_IRQHandler:
 456                     ; 249 }
 459  0000 80            	iret	
 484                     ; 256 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 484                     ; 257 {
 485                     .text:	section	.text,new
 486  0000               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 488  0000 8a            	push	cc
 489  0001 84            	pop	a
 490  0002 a4bf          	and	a,#191
 491  0004 88            	push	a
 492  0005 86            	pop	cc
 493  0006 3b0002        	push	c_x+2
 494  0009 be00          	ldw	x,c_x
 495  000b 89            	pushw	x
 496  000c 3b0002        	push	c_y+2
 497  000f be00          	ldw	x,c_y
 498  0011 89            	pushw	x
 501                     ; 261 	TIM1_ClearFlag(TIM1_FLAG_UPDATE);
 503  0012 ae0001        	ldw	x,#1
 504  0015 cd0000        	call	_TIM1_ClearFlag
 506                     ; 262 	IR_time_cnt++;
 508  0018 3c00          	inc	_IR_time_cnt
 509                     ; 265 }
 512  001a 85            	popw	x
 513  001b bf00          	ldw	c_y,x
 514  001d 320002        	pop	c_y+2
 515  0020 85            	popw	x
 516  0021 bf00          	ldw	c_x,x
 517  0023 320002        	pop	c_x+2
 518  0026 80            	iret	
 541                     ; 272 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 541                     ; 273 {
 542                     .text:	section	.text,new
 543  0000               f_TIM1_CAP_COM_IRQHandler:
 547                     ; 277 }
 550  0000 80            	iret	
 577                     ; 309  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 577                     ; 310 {
 578                     .text:	section	.text,new
 579  0000               f_TIM2_UPD_OVF_BRK_IRQHandler:
 581  0000 8a            	push	cc
 582  0001 84            	pop	a
 583  0002 a4bf          	and	a,#191
 584  0004 88            	push	a
 585  0005 86            	pop	cc
 586  0006 3b0002        	push	c_x+2
 587  0009 be00          	ldw	x,c_x
 588  000b 89            	pushw	x
 589  000c 3b0002        	push	c_y+2
 590  000f be00          	ldw	x,c_y
 591  0011 89            	pushw	x
 594                     ; 315 	TIM2_SetCounter(0X00);
 596  0012 5f            	clrw	x
 597  0013 cd0000        	call	_TIM2_SetCounter
 599                     ; 316 	TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
 601  0016 a601          	ld	a,#1
 602  0018 cd0000        	call	_TIM2_ClearITPendingBit
 604                     ; 317 	Speed_Pulse_Status=SPEED_NO_PULSE;
 606  001b 3f00          	clr	_Speed_Pulse_Status
 607                     ; 318 	Speed_Origin=0XFFFF;
 609  001d aeffff        	ldw	x,#65535
 610  0020 bf00          	ldw	_Speed_Origin,x
 611                     ; 320 }
 614  0022 85            	popw	x
 615  0023 bf00          	ldw	c_y,x
 616  0025 320002        	pop	c_y+2
 617  0028 85            	popw	x
 618  0029 bf00          	ldw	c_x,x
 619  002b 320002        	pop	c_x+2
 620  002e 80            	iret	
 650                     ; 327  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 650                     ; 328 {
 651                     .text:	section	.text,new
 652  0000               f_TIM2_CAP_COM_IRQHandler:
 654  0000 8a            	push	cc
 655  0001 84            	pop	a
 656  0002 a4bf          	and	a,#191
 657  0004 88            	push	a
 658  0005 86            	pop	cc
 659  0006 3b0002        	push	c_x+2
 660  0009 be00          	ldw	x,c_x
 661  000b 89            	pushw	x
 662  000c 3b0002        	push	c_y+2
 663  000f be00          	ldw	x,c_y
 664  0011 89            	pushw	x
 667                     ; 333 	TIM2_SetCounter(0X00);
 669  0012 5f            	clrw	x
 670  0013 cd0000        	call	_TIM2_SetCounter
 672                     ; 334 	TIM2_ClearITPendingBit(TIM2_IT_CC3);
 674  0016 a608          	ld	a,#8
 675  0018 cd0000        	call	_TIM2_ClearITPendingBit
 677                     ; 336 	if(MT.status==MT_RUNNING_FORWARD){
 679  001b b600          	ld	a,_MT
 680  001d a102          	cp	a,#2
 681  001f 2605          	jrne	L522
 682                     ; 337 		Speed_Pulse_cnt++;
 684  0021 be00          	ldw	x,_Speed_Pulse_cnt
 685  0023 5c            	incw	x
 687  0024 2007          	jpf	LC003
 688  0026               L522:
 689                     ; 338 	}else if(MT.status==MT_RUNNING_BACKWARD){
 691  0026 a104          	cp	a,#4
 692  0028 2605          	jrne	L722
 693                     ; 339 		Speed_Pulse_cnt--;
 695  002a be00          	ldw	x,_Speed_Pulse_cnt
 696  002c 5a            	decw	x
 697  002d               LC003:
 698  002d bf00          	ldw	_Speed_Pulse_cnt,x
 699  002f               L722:
 700                     ; 342 	if(Speed_Pulse_Status==SPEED_OK){
 702  002f b600          	ld	a,_Speed_Pulse_Status
 703  0031 a102          	cp	a,#2
 704                     ; 343 		Speed_Origin=TIM2_GetCapture3();
 707  0033 2714          	jreq	LC005
 708                     ; 344 	}else if(Speed_Pulse_Status==SPEED_NO_PULSE){
 710  0035 b600          	ld	a,_Speed_Pulse_Status
 711  0037 2609          	jrne	L732
 712                     ; 345 		Speed_Pulse_Status=SPEED_FIRST_PULSE;
 714  0039 35010000      	mov	_Speed_Pulse_Status,#1
 715                     ; 346 		Speed_Origin=0XFFFF;
 717  003d aeffff        	ldw	x,#65535
 719  0040 200a          	jpf	LC004
 720  0042               L732:
 721                     ; 347 	}else if(Speed_Pulse_Status==SPEED_FIRST_PULSE){
 723  0042 4a            	dec	a
 724  0043 2609          	jrne	L532
 725                     ; 348 		Speed_Pulse_Status=SPEED_OK;
 727  0045 35020000      	mov	_Speed_Pulse_Status,#2
 728                     ; 349 		Speed_Origin=TIM2_GetCapture3();		
 730  0049               LC005:
 732  0049 cd0000        	call	_TIM2_GetCapture3
 734  004c               LC004:
 735  004c bf00          	ldw	_Speed_Origin,x
 736  004e               L532:
 737                     ; 352 }
 740  004e 85            	popw	x
 741  004f bf00          	ldw	c_y,x
 742  0051 320002        	pop	c_y+2
 743  0054 85            	popw	x
 744  0055 bf00          	ldw	c_x,x
 745  0057 320002        	pop	c_x+2
 746  005a 80            	iret	
 769                     ; 389  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 769                     ; 390 {
 770                     .text:	section	.text,new
 771  0000               f_UART1_TX_IRQHandler:
 775                     ; 394 }
 778  0000 80            	iret	
 801                     ; 401  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 801                     ; 402 {
 802                     .text:	section	.text,new
 803  0000               f_UART1_RX_IRQHandler:
 807                     ; 406 }
 810  0000 80            	iret	
 832                     ; 414 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 832                     ; 415 {
 833                     .text:	section	.text,new
 834  0000               f_I2C_IRQHandler:
 838                     ; 419 }
 841  0000 80            	iret	
 863                     ; 494  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 863                     ; 495 {
 864                     .text:	section	.text,new
 865  0000               f_ADC1_IRQHandler:
 869                     ; 500     return;
 872  0000 80            	iret	
 898                     ; 523  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 898                     ; 524 {	
 899                     .text:	section	.text,new
 900  0000               f_TIM4_UPD_OVF_IRQHandler:
 902  0000 8a            	push	cc
 903  0001 84            	pop	a
 904  0002 a4bf          	and	a,#191
 905  0004 88            	push	a
 906  0005 86            	pop	cc
 907  0006 3b0002        	push	c_x+2
 908  0009 be00          	ldw	x,c_x
 909  000b 89            	pushw	x
 910  000c 3b0002        	push	c_y+2
 911  000f be00          	ldw	x,c_y
 912  0011 89            	pushw	x
 915                     ; 525 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);	
 917  0012 a601          	ld	a,#1
 918  0014 cd0000        	call	_TIM4_ClearITPendingBit
 920                     ; 526 	Timebase_cnt++;	
 922  0017 3c00          	inc	_Timebase_cnt
 923                     ; 527 	Tasks_1ms_TimeCritical();
 925  0019 cd0000        	call	_Tasks_1ms_TimeCritical
 927                     ; 529 }
 930  001c 85            	popw	x
 931  001d bf00          	ldw	c_y,x
 932  001f 320002        	pop	c_y+2
 933  0022 85            	popw	x
 934  0023 bf00          	ldw	c_x,x
 935  0025 320002        	pop	c_x+2
 936  0028 80            	iret	
 959                     ; 537 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 959                     ; 538 {
 960                     .text:	section	.text,new
 961  0000               f_EEPROM_EEC_IRQHandler:
 965                     ; 542 }
 968  0000 80            	iret	
 980                     	xref.b	_New_IR_Code_Flag
 981                     	xref.b	_IR_Code
 982                     	xref.b	_IR_time_cnt
 983                     	xref.b	_Speed_Pulse_cnt
 984                     	xref.b	_Speed_Origin
 985                     	xref.b	_Speed_Pulse_Status
 986                     	xref.b	_MT
 987                     	xref	_Tasks_1ms_TimeCritical
 988                     	xref.b	_Timebase_cnt
 989                     	xdef	f_EEPROM_EEC_IRQHandler
 990                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 991                     	xdef	f_ADC1_IRQHandler
 992                     	xdef	f_I2C_IRQHandler
 993                     	xdef	f_UART1_RX_IRQHandler
 994                     	xdef	f_UART1_TX_IRQHandler
 995                     	xdef	f_TIM2_CAP_COM_IRQHandler
 996                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 997                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 998                     	xdef	f_TIM1_CAP_COM_IRQHandler
 999                     	xdef	f_SPI_IRQHandler
1000                     	xdef	f_EXTI_PORTE_IRQHandler
1001                     	xdef	f_EXTI_PORTD_IRQHandler
1002                     	xdef	f_EXTI_PORTC_IRQHandler
1003                     	xdef	f_EXTI_PORTB_IRQHandler
1004                     	xdef	f_EXTI_PORTA_IRQHandler
1005                     	xdef	f_CLK_IRQHandler
1006                     	xdef	f_AWU_IRQHandler
1007                     	xdef	f_TLI_IRQHandler
1008                     	xdef	f_TRAP_IRQHandler
1009                     	xref	_TIM4_ClearITPendingBit
1010                     	xref	_TIM2_ClearITPendingBit
1011                     	xref	_TIM2_GetCapture3
1012                     	xref	_TIM2_SetCounter
1013                     	xref	_TIM1_ClearFlag
1014                     	xref.b	c_x
1015                     	xref.b	c_y
1034                     	end
