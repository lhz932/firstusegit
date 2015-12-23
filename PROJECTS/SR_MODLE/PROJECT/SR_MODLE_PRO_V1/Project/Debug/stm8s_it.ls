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
 212                     	switch	.ubsct
 213  0000               L17_cnt:
 214  0000 00            	ds.b	1
 259                     ; 136 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 259                     ; 137 {
 260                     	switch	.text
 261  0006               f_EXTI_PORTC_IRQHandler:
 263       00000001      OFST:	set	1
 264  0006 88            	push	a
 267                     ; 143 	time=IR_time_cnt;
 269  0007 b600          	ld	a,_IR_time_cnt
 270  0009 6b01          	ld	(OFST+0,sp),a
 272                     ; 144 	IR_time_cnt=0;
 274  000b 3f00          	clr	_IR_time_cnt
 275                     ; 151 	if((time>(135-10))&&(time<(135+10)))
 277  000d 7b01          	ld	a,(OFST+0,sp)
 278  000f a17e          	cp	a,#126
 279  0011 2512          	jrult	L511
 281  0013 7b01          	ld	a,(OFST+0,sp)
 282  0015 a191          	cp	a,#145
 283  0017 240c          	jruge	L511
 284                     ; 153 		cnt=0;
 286  0019 3f00          	clr	L17_cnt
 287                     ; 154 		IR_Code=0;
 289  001b ae0000        	ldw	x,#0
 290  001e bf02          	ldw	_IR_Code+2,x
 291  0020 ae0000        	ldw	x,#0
 292  0023 bf00          	ldw	_IR_Code,x
 293  0025               L511:
 294                     ; 156 	if(cnt<32)
 296  0025 b600          	ld	a,L17_cnt
 297  0027 a120          	cp	a,#32
 298  0029 243e          	jruge	L711
 299                     ; 158 		if((time>(11-5))&&(time<(11+5)))	//0
 301  002b 7b01          	ld	a,(OFST+0,sp)
 302  002d a107          	cp	a,#7
 303  002f 2518          	jrult	L121
 305  0031 7b01          	ld	a,(OFST+0,sp)
 306  0033 a110          	cp	a,#16
 307  0035 2412          	jruge	L121
 308                     ; 160 			if(cnt<31)	IR_Code<<=1;
 310  0037 b600          	ld	a,L17_cnt
 311  0039 a11f          	cp	a,#31
 312  003b 2408          	jruge	L321
 315  003d 3803          	sll	_IR_Code+3
 316  003f 3902          	rlc	_IR_Code+2
 317  0041 3901          	rlc	_IR_Code+1
 318  0043 3900          	rlc	_IR_Code
 319  0045               L321:
 320                     ; 161 			cnt++;
 322  0045 3c00          	inc	L17_cnt
 324  0047 2020          	jra	L711
 325  0049               L121:
 326                     ; 162 		}else if((time>(22-5))&&(time<(22+5)))
 328  0049 7b01          	ld	a,(OFST+0,sp)
 329  004b a112          	cp	a,#18
 330  004d 251a          	jrult	L711
 332  004f 7b01          	ld	a,(OFST+0,sp)
 333  0051 a11b          	cp	a,#27
 334  0053 2414          	jruge	L711
 335                     ; 164 			IR_Code|=1;
 337  0055 72100003      	bset	_IR_Code+3,#0
 338                     ; 165 			if(cnt<31)	IR_Code<<=1;
 340  0059 b600          	ld	a,L17_cnt
 341  005b a11f          	cp	a,#31
 342  005d 2408          	jruge	L131
 345  005f 3803          	sll	_IR_Code+3
 346  0061 3902          	rlc	_IR_Code+2
 347  0063 3901          	rlc	_IR_Code+1
 348  0065 3900          	rlc	_IR_Code
 349  0067               L131:
 350                     ; 166 			cnt++;
 352  0067 3c00          	inc	L17_cnt
 353  0069               L711:
 354                     ; 169 	if(cnt==32)
 356  0069 b600          	ld	a,L17_cnt
 357  006b a120          	cp	a,#32
 358  006d 2606          	jrne	L331
 359                     ; 171 		New_IR_Code_Flag=1;	//set the flag
 361  006f 35010000      	mov	_New_IR_Code_Flag,#1
 362                     ; 172 		cnt=0;
 364  0073 3f00          	clr	L17_cnt
 365  0075               L331:
 366                     ; 174 }
 369  0075 84            	pop	a
 370  0076 80            	iret
 393                     ; 181 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 393                     ; 182 {
 394                     	switch	.text
 395  0077               f_EXTI_PORTD_IRQHandler:
 399                     ; 186 }
 402  0077 80            	iret
 425                     ; 193 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 425                     ; 194 {
 426                     	switch	.text
 427  0078               f_EXTI_PORTE_IRQHandler:
 431                     ; 198 }
 434  0078 80            	iret
 456                     ; 244 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 456                     ; 245 {
 457                     	switch	.text
 458  0079               f_SPI_IRQHandler:
 462                     ; 249 }
 465  0079 80            	iret
 490                     ; 256 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 490                     ; 257 {
 491                     	switch	.text
 492  007a               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 494  007a 8a            	push	cc
 495  007b 84            	pop	a
 496  007c a4bf          	and	a,#191
 497  007e 88            	push	a
 498  007f 86            	pop	cc
 499  0080 3b0002        	push	c_x+2
 500  0083 be00          	ldw	x,c_x
 501  0085 89            	pushw	x
 502  0086 3b0002        	push	c_y+2
 503  0089 be00          	ldw	x,c_y
 504  008b 89            	pushw	x
 507                     ; 261 	TIM1_ClearFlag(TIM1_FLAG_UPDATE);
 509  008c ae0001        	ldw	x,#1
 510  008f cd0000        	call	_TIM1_ClearFlag
 512                     ; 262 	IR_time_cnt++;
 514  0092 3c00          	inc	_IR_time_cnt
 515                     ; 265 }
 518  0094 85            	popw	x
 519  0095 bf00          	ldw	c_y,x
 520  0097 320002        	pop	c_y+2
 521  009a 85            	popw	x
 522  009b bf00          	ldw	c_x,x
 523  009d 320002        	pop	c_x+2
 524  00a0 80            	iret
 547                     ; 272 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 547                     ; 273 {
 548                     	switch	.text
 549  00a1               f_TIM1_CAP_COM_IRQHandler:
 553                     ; 277 }
 556  00a1 80            	iret
 583                     ; 309  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 583                     ; 310 {
 584                     	switch	.text
 585  00a2               f_TIM2_UPD_OVF_BRK_IRQHandler:
 587  00a2 8a            	push	cc
 588  00a3 84            	pop	a
 589  00a4 a4bf          	and	a,#191
 590  00a6 88            	push	a
 591  00a7 86            	pop	cc
 592  00a8 3b0002        	push	c_x+2
 593  00ab be00          	ldw	x,c_x
 594  00ad 89            	pushw	x
 595  00ae 3b0002        	push	c_y+2
 596  00b1 be00          	ldw	x,c_y
 597  00b3 89            	pushw	x
 600                     ; 315 	TIM2_SetCounter(0X00);
 602  00b4 5f            	clrw	x
 603  00b5 cd0000        	call	_TIM2_SetCounter
 605                     ; 316 	TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
 607  00b8 a601          	ld	a,#1
 608  00ba cd0000        	call	_TIM2_ClearITPendingBit
 610                     ; 317 	Speed_Pulse_Status=SPEED_NO_PULSE;
 612  00bd 3f00          	clr	_Speed_Pulse_Status
 613                     ; 318 	Speed_Origin=0XFFFF;
 615  00bf aeffff        	ldw	x,#65535
 616  00c2 bf00          	ldw	_Speed_Origin,x
 617                     ; 320 }
 620  00c4 85            	popw	x
 621  00c5 bf00          	ldw	c_y,x
 622  00c7 320002        	pop	c_y+2
 623  00ca 85            	popw	x
 624  00cb bf00          	ldw	c_x,x
 625  00cd 320002        	pop	c_x+2
 626  00d0 80            	iret
 656                     ; 327  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 656                     ; 328 {
 657                     	switch	.text
 658  00d1               f_TIM2_CAP_COM_IRQHandler:
 660  00d1 8a            	push	cc
 661  00d2 84            	pop	a
 662  00d3 a4bf          	and	a,#191
 663  00d5 88            	push	a
 664  00d6 86            	pop	cc
 665  00d7 3b0002        	push	c_x+2
 666  00da be00          	ldw	x,c_x
 667  00dc 89            	pushw	x
 668  00dd 3b0002        	push	c_y+2
 669  00e0 be00          	ldw	x,c_y
 670  00e2 89            	pushw	x
 673                     ; 333 	TIM2_SetCounter(0X00);
 675  00e3 5f            	clrw	x
 676  00e4 cd0000        	call	_TIM2_SetCounter
 678                     ; 334 	TIM2_ClearITPendingBit(TIM2_IT_CC3);
 680  00e7 a608          	ld	a,#8
 681  00e9 cd0000        	call	_TIM2_ClearITPendingBit
 683                     ; 336 	if(MT.status==MT_RUNNING_FORWARD){
 685  00ec b600          	ld	a,_MT
 686  00ee a102          	cp	a,#2
 687  00f0 2609          	jrne	L522
 688                     ; 337 		Speed_Pulse_cnt++;
 690  00f2 be00          	ldw	x,_Speed_Pulse_cnt
 691  00f4 1c0001        	addw	x,#1
 692  00f7 bf00          	ldw	_Speed_Pulse_cnt,x
 694  00f9 200d          	jra	L722
 695  00fb               L522:
 696                     ; 338 	}else if(MT.status==MT_RUNNING_BACKWARD){
 698  00fb b600          	ld	a,_MT
 699  00fd a104          	cp	a,#4
 700  00ff 2607          	jrne	L722
 701                     ; 339 		Speed_Pulse_cnt--;
 703  0101 be00          	ldw	x,_Speed_Pulse_cnt
 704  0103 1d0001        	subw	x,#1
 705  0106 bf00          	ldw	_Speed_Pulse_cnt,x
 706  0108               L722:
 707                     ; 342 	if(Speed_Pulse_Status==SPEED_OK){
 709  0108 b600          	ld	a,_Speed_Pulse_Status
 710  010a a102          	cp	a,#2
 711  010c 2607          	jrne	L332
 712                     ; 343 		Speed_Origin=TIM2_GetCapture3();
 714  010e cd0000        	call	_TIM2_GetCapture3
 716  0111 bf00          	ldw	_Speed_Origin,x
 718  0113 201e          	jra	L532
 719  0115               L332:
 720                     ; 344 	}else if(Speed_Pulse_Status==SPEED_NO_PULSE){
 722  0115 3d00          	tnz	_Speed_Pulse_Status
 723  0117 260b          	jrne	L732
 724                     ; 345 		Speed_Pulse_Status=SPEED_FIRST_PULSE;
 726  0119 35010000      	mov	_Speed_Pulse_Status,#1
 727                     ; 346 		Speed_Origin=0XFFFF;
 729  011d aeffff        	ldw	x,#65535
 730  0120 bf00          	ldw	_Speed_Origin,x
 732  0122 200f          	jra	L532
 733  0124               L732:
 734                     ; 347 	}else if(Speed_Pulse_Status==SPEED_FIRST_PULSE){
 736  0124 b600          	ld	a,_Speed_Pulse_Status
 737  0126 a101          	cp	a,#1
 738  0128 2609          	jrne	L532
 739                     ; 348 		Speed_Pulse_Status=SPEED_OK;
 741  012a 35020000      	mov	_Speed_Pulse_Status,#2
 742                     ; 349 		Speed_Origin=TIM2_GetCapture3();		
 744  012e cd0000        	call	_TIM2_GetCapture3
 746  0131 bf00          	ldw	_Speed_Origin,x
 747  0133               L532:
 748                     ; 352 }
 751  0133 85            	popw	x
 752  0134 bf00          	ldw	c_y,x
 753  0136 320002        	pop	c_y+2
 754  0139 85            	popw	x
 755  013a bf00          	ldw	c_x,x
 756  013c 320002        	pop	c_x+2
 757  013f 80            	iret
 780                     ; 389  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 780                     ; 390 {
 781                     	switch	.text
 782  0140               f_UART1_TX_IRQHandler:
 786                     ; 394 }
 789  0140 80            	iret
 812                     ; 401  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 812                     ; 402 {
 813                     	switch	.text
 814  0141               f_UART1_RX_IRQHandler:
 818                     ; 406 }
 821  0141 80            	iret
 843                     ; 414 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 843                     ; 415 {
 844                     	switch	.text
 845  0142               f_I2C_IRQHandler:
 849                     ; 419 }
 852  0142 80            	iret
 874                     ; 494  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 874                     ; 495 {
 875                     	switch	.text
 876  0143               f_ADC1_IRQHandler:
 880                     ; 500     return;
 883  0143 80            	iret
 909                     ; 523  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 909                     ; 524 {	
 910                     	switch	.text
 911  0144               f_TIM4_UPD_OVF_IRQHandler:
 913  0144 8a            	push	cc
 914  0145 84            	pop	a
 915  0146 a4bf          	and	a,#191
 916  0148 88            	push	a
 917  0149 86            	pop	cc
 918  014a 3b0002        	push	c_x+2
 919  014d be00          	ldw	x,c_x
 920  014f 89            	pushw	x
 921  0150 3b0002        	push	c_y+2
 922  0153 be00          	ldw	x,c_y
 923  0155 89            	pushw	x
 926                     ; 525 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);	
 928  0156 a601          	ld	a,#1
 929  0158 cd0000        	call	_TIM4_ClearITPendingBit
 931                     ; 526 	Timebase_cnt++;	
 933  015b 3c00          	inc	_Timebase_cnt
 934                     ; 527 	Tasks_1ms_TimeCritical();
 936  015d cd0000        	call	_Tasks_1ms_TimeCritical
 938                     ; 529 }
 941  0160 85            	popw	x
 942  0161 bf00          	ldw	c_y,x
 943  0163 320002        	pop	c_y+2
 944  0166 85            	popw	x
 945  0167 bf00          	ldw	c_x,x
 946  0169 320002        	pop	c_x+2
 947  016c 80            	iret
 970                     ; 537 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 970                     ; 538 {
 971                     	switch	.text
 972  016d               f_EEPROM_EEC_IRQHandler:
 976                     ; 542 }
 979  016d 80            	iret
 991                     	xref.b	_New_IR_Code_Flag
 992                     	xref.b	_IR_Code
 993                     	xref.b	_IR_time_cnt
 994                     	xref.b	_Speed_Pulse_cnt
 995                     	xref.b	_Speed_Origin
 996                     	xref.b	_Speed_Pulse_Status
 997                     	xref.b	_MT
 998                     	xref	_Tasks_1ms_TimeCritical
 999                     	xref.b	_Timebase_cnt
1000                     	xdef	f_EEPROM_EEC_IRQHandler
1001                     	xdef	f_TIM4_UPD_OVF_IRQHandler
1002                     	xdef	f_ADC1_IRQHandler
1003                     	xdef	f_I2C_IRQHandler
1004                     	xdef	f_UART1_RX_IRQHandler
1005                     	xdef	f_UART1_TX_IRQHandler
1006                     	xdef	f_TIM2_CAP_COM_IRQHandler
1007                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
1008                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
1009                     	xdef	f_TIM1_CAP_COM_IRQHandler
1010                     	xdef	f_SPI_IRQHandler
1011                     	xdef	f_EXTI_PORTE_IRQHandler
1012                     	xdef	f_EXTI_PORTD_IRQHandler
1013                     	xdef	f_EXTI_PORTC_IRQHandler
1014                     	xdef	f_EXTI_PORTB_IRQHandler
1015                     	xdef	f_EXTI_PORTA_IRQHandler
1016                     	xdef	f_CLK_IRQHandler
1017                     	xdef	f_AWU_IRQHandler
1018                     	xdef	f_TLI_IRQHandler
1019                     	xdef	f_TRAP_IRQHandler
1020                     	xref	_TIM4_ClearITPendingBit
1021                     	xref	_TIM2_ClearITPendingBit
1022                     	xref	_TIM2_GetCapture3
1023                     	xref	_TIM2_SetCounter
1024                     	xref	_TIM1_ClearFlag
1025                     	xref.b	c_x
1026                     	xref.b	c_y
1045                     	end
