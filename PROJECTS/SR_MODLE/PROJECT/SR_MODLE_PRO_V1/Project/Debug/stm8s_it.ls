   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
  48                     ; 65 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  48                     ; 66 {
  49                     .text:	section	.text,new
  50  0000               f_TRAP_IRQHandler:
  54                     ; 70 }
  57  0000 80            	iret	
  79                     ; 76 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
  79                     ; 77 {
  80                     .text:	section	.text,new
  81  0000               f_TLI_IRQHandler:
  85                     ; 81 }
  88  0000 80            	iret	
 110                     ; 88 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 110                     ; 89 {
 111                     .text:	section	.text,new
 112  0000               f_AWU_IRQHandler:
 116                     ; 93 }
 119  0000 80            	iret	
 141                     ; 100 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 141                     ; 101 {
 142                     .text:	section	.text,new
 143  0000               f_CLK_IRQHandler:
 147                     ; 105 }
 150  0000 80            	iret	
 173                     ; 112 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 173                     ; 113 {
 174                     .text:	section	.text,new
 175  0000               f_EXTI_PORTA_IRQHandler:
 179                     ; 117 }
 182  0000 80            	iret	
 205                     ; 124 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 205                     ; 125 {
 206                     .text:	section	.text,new
 207  0000               f_EXTI_PORTB_IRQHandler:
 211                     ; 129 }
 214  0000 80            	iret	
 216                     	switch	.ubsct
 217  0000               L17_cnt:
 218  0000 00            	ds.b	1
 263                     ; 136 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 263                     ; 137 {
 264                     .text:	section	.text,new
 265  0000               f_EXTI_PORTC_IRQHandler:
 267       00000001      OFST:	set	1
 268  0000 88            	push	a
 271                     ; 143 	time=IR_time_cnt;
 273  0001 b600          	ld	a,_IR_time_cnt
 274  0003 6b01          	ld	(OFST+0,sp),a
 276                     ; 144 	IR_time_cnt=0;
 278  0005 3f00          	clr	_IR_time_cnt
 279                     ; 151 	if((time>(135-10))&&(time<(135+10)))
 281  0007 a17e          	cp	a,#126
 282  0009 250b          	jrult	L511
 284  000b a191          	cp	a,#145
 285  000d 2407          	jruge	L511
 286                     ; 153 		cnt=0;
 288  000f 3f00          	clr	L17_cnt
 289                     ; 154 		IR_Code=0;
 291  0011 5f            	clrw	x
 292  0012 bf02          	ldw	_IR_Code+2,x
 293  0014 bf00          	ldw	_IR_Code,x
 294  0016               L511:
 295                     ; 156 	if(cnt<32)
 297  0016 b600          	ld	a,L17_cnt
 298  0018 a120          	cp	a,#32
 299  001a 242e          	jruge	L711
 300                     ; 158 		if((time>(11-5))&&(time<(11+5)))	//0
 302  001c 7b01          	ld	a,(OFST+0,sp)
 303  001e a107          	cp	a,#7
 304  0020 250c          	jrult	L121
 306  0022 a110          	cp	a,#16
 307  0024 2408          	jruge	L121
 308                     ; 160 			if(cnt<31)	IR_Code<<=1;
 310  0026 b600          	ld	a,L17_cnt
 311  0028 a11f          	cp	a,#31
 312  002a 241c          	jruge	L131
 314                     ; 161 			cnt++;
 316  002c 2012          	jpf	LC002
 317  002e               L121:
 318                     ; 162 		}else if((time>(22-5))&&(time<(22+5)))
 320  002e a112          	cp	a,#18
 321  0030 2518          	jrult	L711
 323  0032 a11b          	cp	a,#27
 324  0034 2414          	jruge	L711
 325                     ; 164 			IR_Code|=1;
 327  0036 72100003      	bset	_IR_Code+3,#0
 328                     ; 165 			if(cnt<31)	IR_Code<<=1;
 330  003a b600          	ld	a,L17_cnt
 331  003c a11f          	cp	a,#31
 332  003e 2408          	jruge	L131
 335  0040               LC002:
 337  0040 3803          	sll	_IR_Code+3
 338  0042 3902          	rlc	_IR_Code+2
 339  0044 3901          	rlc	_IR_Code+1
 340  0046 3900          	rlc	_IR_Code
 341  0048               L131:
 342                     ; 166 			cnt++;
 345  0048 3c00          	inc	L17_cnt
 346  004a               L711:
 347                     ; 169 	if(cnt==32)
 349  004a b600          	ld	a,L17_cnt
 350  004c a120          	cp	a,#32
 351  004e 2606          	jrne	L331
 352                     ; 171 		New_IR_Code_Flag=1;	//set the flag
 354  0050 35010000      	mov	_New_IR_Code_Flag,#1
 355                     ; 172 		cnt=0;
 357  0054 3f00          	clr	L17_cnt
 358  0056               L331:
 359                     ; 174 }
 362  0056 84            	pop	a
 363  0057 80            	iret	
 386                     ; 181 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 386                     ; 182 {
 387                     .text:	section	.text,new
 388  0000               f_EXTI_PORTD_IRQHandler:
 392                     ; 186 }
 395  0000 80            	iret	
 418                     ; 193 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 418                     ; 194 {
 419                     .text:	section	.text,new
 420  0000               f_EXTI_PORTE_IRQHandler:
 424                     ; 198 }
 427  0000 80            	iret	
 449                     ; 244 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 449                     ; 245 {
 450                     .text:	section	.text,new
 451  0000               f_SPI_IRQHandler:
 455                     ; 249 }
 458  0000 80            	iret	
 483                     ; 256 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 483                     ; 257 {
 484                     .text:	section	.text,new
 485  0000               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 487  0000 8a            	push	cc
 488  0001 84            	pop	a
 489  0002 a4bf          	and	a,#191
 490  0004 88            	push	a
 491  0005 86            	pop	cc
 492  0006 3b0002        	push	c_x+2
 493  0009 be00          	ldw	x,c_x
 494  000b 89            	pushw	x
 495  000c 3b0002        	push	c_y+2
 496  000f be00          	ldw	x,c_y
 497  0011 89            	pushw	x
 500                     ; 261 	TIM1_ClearFlag(TIM1_FLAG_UPDATE);
 502  0012 ae0001        	ldw	x,#1
 503  0015 cd0000        	call	_TIM1_ClearFlag
 505                     ; 262 	IR_time_cnt++;
 507  0018 3c00          	inc	_IR_time_cnt
 508                     ; 265 }
 511  001a 85            	popw	x
 512  001b bf00          	ldw	c_y,x
 513  001d 320002        	pop	c_y+2
 514  0020 85            	popw	x
 515  0021 bf00          	ldw	c_x,x
 516  0023 320002        	pop	c_x+2
 517  0026 80            	iret	
 540                     ; 272 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 540                     ; 273 {
 541                     .text:	section	.text,new
 542  0000               f_TIM1_CAP_COM_IRQHandler:
 546                     ; 277 }
 549  0000 80            	iret	
 576                     ; 309  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 576                     ; 310 {
 577                     .text:	section	.text,new
 578  0000               f_TIM2_UPD_OVF_BRK_IRQHandler:
 580  0000 8a            	push	cc
 581  0001 84            	pop	a
 582  0002 a4bf          	and	a,#191
 583  0004 88            	push	a
 584  0005 86            	pop	cc
 585  0006 3b0002        	push	c_x+2
 586  0009 be00          	ldw	x,c_x
 587  000b 89            	pushw	x
 588  000c 3b0002        	push	c_y+2
 589  000f be00          	ldw	x,c_y
 590  0011 89            	pushw	x
 593                     ; 315 	TIM2_SetCounter(0X00);
 595  0012 5f            	clrw	x
 596  0013 cd0000        	call	_TIM2_SetCounter
 598                     ; 316 	TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
 600  0016 a601          	ld	a,#1
 601  0018 cd0000        	call	_TIM2_ClearITPendingBit
 603                     ; 317 	Speed_Pulse_Status=SPEED_NO_PULSE;
 605  001b 3f00          	clr	_Speed_Pulse_Status
 606                     ; 318 	Speed_Origin=0XFFFF;
 608  001d aeffff        	ldw	x,#65535
 609  0020 bf00          	ldw	_Speed_Origin,x
 610                     ; 320 }
 613  0022 85            	popw	x
 614  0023 bf00          	ldw	c_y,x
 615  0025 320002        	pop	c_y+2
 616  0028 85            	popw	x
 617  0029 bf00          	ldw	c_x,x
 618  002b 320002        	pop	c_x+2
 619  002e 80            	iret	
 649                     ; 327  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 649                     ; 328 {
 650                     .text:	section	.text,new
 651  0000               f_TIM2_CAP_COM_IRQHandler:
 653  0000 8a            	push	cc
 654  0001 84            	pop	a
 655  0002 a4bf          	and	a,#191
 656  0004 88            	push	a
 657  0005 86            	pop	cc
 658  0006 3b0002        	push	c_x+2
 659  0009 be00          	ldw	x,c_x
 660  000b 89            	pushw	x
 661  000c 3b0002        	push	c_y+2
 662  000f be00          	ldw	x,c_y
 663  0011 89            	pushw	x
 666                     ; 333 	TIM2_SetCounter(0X00);
 668  0012 5f            	clrw	x
 669  0013 cd0000        	call	_TIM2_SetCounter
 671                     ; 334 	TIM2_ClearITPendingBit(TIM2_IT_CC3);
 673  0016 a608          	ld	a,#8
 674  0018 cd0000        	call	_TIM2_ClearITPendingBit
 676                     ; 336 	if(MT.status==MT_RUNNING_FORWARD){
 678  001b b600          	ld	a,_MT
 679  001d a102          	cp	a,#2
 680  001f 2605          	jrne	L522
 681                     ; 337 		Speed_Pulse_cnt++;
 683  0021 be00          	ldw	x,_Speed_Pulse_cnt
 684  0023 5c            	incw	x
 686  0024 2007          	jpf	LC003
 687  0026               L522:
 688                     ; 338 	}else if(MT.status==MT_RUNNING_BACKWARD){
 690  0026 a104          	cp	a,#4
 691  0028 2605          	jrne	L722
 692                     ; 339 		Speed_Pulse_cnt--;
 694  002a be00          	ldw	x,_Speed_Pulse_cnt
 695  002c 5a            	decw	x
 696  002d               LC003:
 697  002d bf00          	ldw	_Speed_Pulse_cnt,x
 698  002f               L722:
 699                     ; 342 	if(Speed_Pulse_Status==SPEED_OK){
 701  002f b600          	ld	a,_Speed_Pulse_Status
 702  0031 a102          	cp	a,#2
 703                     ; 343 		Speed_Origin=TIM2_GetCapture3();
 706  0033 2714          	jreq	LC005
 707                     ; 344 	}else if(Speed_Pulse_Status==SPEED_NO_PULSE){
 709  0035 b600          	ld	a,_Speed_Pulse_Status
 710  0037 2609          	jrne	L732
 711                     ; 345 		Speed_Pulse_Status=SPEED_FIRST_PULSE;
 713  0039 35010000      	mov	_Speed_Pulse_Status,#1
 714                     ; 346 		Speed_Origin=0XFFFF;
 716  003d aeffff        	ldw	x,#65535
 718  0040 200a          	jpf	LC004
 719  0042               L732:
 720                     ; 347 	}else if(Speed_Pulse_Status==SPEED_FIRST_PULSE){
 722  0042 4a            	dec	a
 723  0043 2609          	jrne	L532
 724                     ; 348 		Speed_Pulse_Status=SPEED_OK;
 726  0045 35020000      	mov	_Speed_Pulse_Status,#2
 727                     ; 349 		Speed_Origin=TIM2_GetCapture3();		
 729  0049               LC005:
 731  0049 cd0000        	call	_TIM2_GetCapture3
 733  004c               LC004:
 734  004c bf00          	ldw	_Speed_Origin,x
 735  004e               L532:
 736                     ; 352 }
 739  004e 85            	popw	x
 740  004f bf00          	ldw	c_y,x
 741  0051 320002        	pop	c_y+2
 742  0054 85            	popw	x
 743  0055 bf00          	ldw	c_x,x
 744  0057 320002        	pop	c_x+2
 745  005a 80            	iret	
 768                     ; 389  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 768                     ; 390 {
 769                     .text:	section	.text,new
 770  0000               f_UART1_TX_IRQHandler:
 774                     ; 394 }
 777  0000 80            	iret	
 800                     ; 401  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 800                     ; 402 {
 801                     .text:	section	.text,new
 802  0000               f_UART1_RX_IRQHandler:
 806                     ; 406 }
 809  0000 80            	iret	
 831                     ; 414 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 831                     ; 415 {
 832                     .text:	section	.text,new
 833  0000               f_I2C_IRQHandler:
 837                     ; 419 }
 840  0000 80            	iret	
 862                     ; 494  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 862                     ; 495 {
 863                     .text:	section	.text,new
 864  0000               f_ADC1_IRQHandler:
 868                     ; 500     return;
 871  0000 80            	iret	
 897                     ; 523  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 897                     ; 524 {	
 898                     .text:	section	.text,new
 899  0000               f_TIM4_UPD_OVF_IRQHandler:
 901  0000 8a            	push	cc
 902  0001 84            	pop	a
 903  0002 a4bf          	and	a,#191
 904  0004 88            	push	a
 905  0005 86            	pop	cc
 906  0006 3b0002        	push	c_x+2
 907  0009 be00          	ldw	x,c_x
 908  000b 89            	pushw	x
 909  000c 3b0002        	push	c_y+2
 910  000f be00          	ldw	x,c_y
 911  0011 89            	pushw	x
 914                     ; 525 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);	
 916  0012 a601          	ld	a,#1
 917  0014 cd0000        	call	_TIM4_ClearITPendingBit
 919                     ; 526 	Timebase_cnt++;	
 921  0017 3c00          	inc	_Timebase_cnt
 922                     ; 527 	Tasks_1ms_TimeCritical();
 924  0019 cd0000        	call	_Tasks_1ms_TimeCritical
 926                     ; 529 }
 929  001c 85            	popw	x
 930  001d bf00          	ldw	c_y,x
 931  001f 320002        	pop	c_y+2
 932  0022 85            	popw	x
 933  0023 bf00          	ldw	c_x,x
 934  0025 320002        	pop	c_x+2
 935  0028 80            	iret	
 958                     ; 537 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 958                     ; 538 {
 959                     .text:	section	.text,new
 960  0000               f_EEPROM_EEC_IRQHandler:
 964                     ; 542 }
 967  0000 80            	iret	
 979                     	xref.b	_New_IR_Code_Flag
 980                     	xref.b	_IR_Code
 981                     	xref.b	_IR_time_cnt
 982                     	xref.b	_Speed_Pulse_cnt
 983                     	xref.b	_Speed_Origin
 984                     	xref.b	_Speed_Pulse_Status
 985                     	xref.b	_MT
 986                     	xref	_Tasks_1ms_TimeCritical
 987                     	xref.b	_Timebase_cnt
 988                     	xdef	f_EEPROM_EEC_IRQHandler
 989                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 990                     	xdef	f_ADC1_IRQHandler
 991                     	xdef	f_I2C_IRQHandler
 992                     	xdef	f_UART1_RX_IRQHandler
 993                     	xdef	f_UART1_TX_IRQHandler
 994                     	xdef	f_TIM2_CAP_COM_IRQHandler
 995                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 996                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 997                     	xdef	f_TIM1_CAP_COM_IRQHandler
 998                     	xdef	f_SPI_IRQHandler
 999                     	xdef	f_EXTI_PORTE_IRQHandler
1000                     	xdef	f_EXTI_PORTD_IRQHandler
1001                     	xdef	f_EXTI_PORTC_IRQHandler
1002                     	xdef	f_EXTI_PORTB_IRQHandler
1003                     	xdef	f_EXTI_PORTA_IRQHandler
1004                     	xdef	f_CLK_IRQHandler
1005                     	xdef	f_AWU_IRQHandler
1006                     	xdef	f_TLI_IRQHandler
1007                     	xdef	f_TRAP_IRQHandler
1008                     	xref	_TIM4_ClearITPendingBit
1009                     	xref	_TIM2_ClearITPendingBit
1010                     	xref	_TIM2_GetCapture3
1011                     	xref	_TIM2_SetCounter
1012                     	xref	_TIM1_ClearFlag
1013                     	xref.b	c_x
1014                     	xref.b	c_y
1033                     	end
