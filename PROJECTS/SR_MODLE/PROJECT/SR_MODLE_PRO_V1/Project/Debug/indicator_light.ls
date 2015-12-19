   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
  50                     ; 8 void Indicator_Init(void)
  50                     ; 9 {
  52                     .text:	section	.text,new
  53  0000               _Indicator_Init:
  57                     ; 10 	GPIO_Init(INDICATOR_PORT,INDICATOR_PIN,GPIO_MODE_OUT_PP_HIGH_SLOW);
  59  0000 4bd0          	push	#208
  60  0002 4b20          	push	#32
  61  0004 ae5005        	ldw	x,#20485
  62  0007 cd0000        	call	_GPIO_Init
  64  000a 85            	popw	x
  65                     ; 11 }
  68  000b 81            	ret	
  71                     	switch	.ubsct
  72  0000               L12_status:
  73  0000 00            	ds.b	1
 108                     ; 14 void Indicator_Running(void)
 108                     ; 15 {
 109                     .text:	section	.text,new
 110  0000               _Indicator_Running:
 114                     ; 17 	if(Indcator_cnt>19){		
 116  0000 b601          	ld	a,_Indcator_cnt
 117  0002 a114          	cp	a,#20
 118  0004 251f          	jrult	L34
 119                     ; 18 		Indcator_cnt=0;
 121  0006 3f01          	clr	_Indcator_cnt
 122                     ; 19 		if(status==0){
 124  0008 b600          	ld	a,L12_status
 125  000a 260e          	jrne	L54
 126                     ; 20 			GPIO_WriteLow(INDICATOR_PORT,INDICATOR_PIN);	//µãÁÁ
 128  000c 4b20          	push	#32
 129  000e ae5005        	ldw	x,#20485
 130  0011 cd0000        	call	_GPIO_WriteLow
 132  0014 35010000      	mov	L12_status,#1
 133                     ; 21 			status=1;
 136  0018 200a          	jp	LC001
 137  001a               L54:
 138                     ; 24 			GPIO_WriteHigh(INDICATOR_PORT,INDICATOR_PIN);	//Ï¨Ãð
 140  001a 4b20          	push	#32
 141  001c ae5005        	ldw	x,#20485
 142  001f cd0000        	call	_GPIO_WriteHigh
 144  0022 3f00          	clr	L12_status
 145  0024               LC001:
 146  0024 84            	pop	a
 147                     ; 25 			status=0;
 149  0025               L34:
 150                     ; 29 }
 153  0025 81            	ret	
 177                     	xdef	_Indicator_Running
 178                     	xdef	_Indicator_Init
 179                     	switch	.ubsct
 180  0001               _Indcator_cnt:
 181  0001 00            	ds.b	1
 182                     	xdef	_Indcator_cnt
 183                     	xref	_GPIO_WriteLow
 184                     	xref	_GPIO_WriteHigh
 185                     	xref	_GPIO_Init
 205                     	end
