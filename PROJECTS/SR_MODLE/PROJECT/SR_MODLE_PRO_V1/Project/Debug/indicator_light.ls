   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
  49                     ; 8 void Indicator_Init(void)
  49                     ; 9 {
  51                     .text:	section	.text,new
  52  0000               _Indicator_Init:
  56                     ; 10 	GPIO_Init(INDICATOR_PORT,INDICATOR_PIN,GPIO_MODE_OUT_PP_HIGH_SLOW);
  58  0000 4bd0          	push	#208
  59  0002 4b20          	push	#32
  60  0004 ae5005        	ldw	x,#20485
  61  0007 cd0000        	call	_GPIO_Init
  63  000a 85            	popw	x
  64                     ; 11 }
  67  000b 81            	ret	
  70                     	switch	.ubsct
  71  0000               L12_status:
  72  0000 00            	ds.b	1
 107                     ; 14 void Indicator_Running(void)
 107                     ; 15 {
 108                     .text:	section	.text,new
 109  0000               _Indicator_Running:
 113                     ; 17 	if(Indcator_cnt>19){		
 115  0000 b601          	ld	a,_Indcator_cnt
 116  0002 a114          	cp	a,#20
 117  0004 251f          	jrult	L34
 118                     ; 18 		Indcator_cnt=0;
 120  0006 3f01          	clr	_Indcator_cnt
 121                     ; 19 		if(status==0){
 123  0008 b600          	ld	a,L12_status
 124  000a 260e          	jrne	L54
 125                     ; 20 			GPIO_WriteLow(INDICATOR_PORT,INDICATOR_PIN);	//µãÁÁ
 127  000c 4b20          	push	#32
 128  000e ae5005        	ldw	x,#20485
 129  0011 cd0000        	call	_GPIO_WriteLow
 131  0014 35010000      	mov	L12_status,#1
 132                     ; 21 			status=1;
 135  0018 200a          	jp	LC001
 136  001a               L54:
 137                     ; 24 			GPIO_WriteHigh(INDICATOR_PORT,INDICATOR_PIN);	//Ï¨Ãð
 139  001a 4b20          	push	#32
 140  001c ae5005        	ldw	x,#20485
 141  001f cd0000        	call	_GPIO_WriteHigh
 143  0022 3f00          	clr	L12_status
 144  0024               LC001:
 145  0024 84            	pop	a
 146                     ; 25 			status=0;
 148  0025               L34:
 149                     ; 29 }
 152  0025 81            	ret	
 176                     	xdef	_Indicator_Running
 177                     	xdef	_Indicator_Init
 178                     	switch	.ubsct
 179  0001               _Indcator_cnt:
 180  0001 00            	ds.b	1
 181                     	xdef	_Indcator_cnt
 182                     	xref	_GPIO_WriteLow
 183                     	xref	_GPIO_WriteHigh
 184                     	xref	_GPIO_Init
 204                     	end
