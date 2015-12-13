   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
  46                     ; 8 void Indicator_Init(void)
  46                     ; 9 {
  48                     .text:	section	.text,new
  49  0000               _Indicator_Init:
  53                     ; 10 	GPIO_Init(INDICATOR_PORT,INDICATOR_PIN,GPIO_MODE_OUT_PP_HIGH_SLOW);
  55  0000 4bd0          	push	#208
  56  0002 4b20          	push	#32
  57  0004 ae5005        	ldw	x,#20485
  58  0007 cd0000        	call	_GPIO_Init
  60  000a 85            	popw	x
  61                     ; 11 }
  64  000b 81            	ret
  67                     	switch	.ubsct
  68  0000               L12_status:
  69  0000 00            	ds.b	1
 104                     ; 14 void Indicator_Running(void)
 104                     ; 15 {
 105                     .text:	section	.text,new
 106  0000               _Indicator_Running:
 110                     ; 17 	if(Indcator_cnt>19){		
 112  0000 b601          	ld	a,_Indcator_cnt
 113  0002 a114          	cp	a,#20
 114  0004 2520          	jrult	L34
 115                     ; 18 		Indcator_cnt=0;
 117  0006 3f01          	clr	_Indcator_cnt
 118                     ; 19 		if(status==0){
 120  0008 3d00          	tnz	L12_status
 121  000a 260f          	jrne	L54
 122                     ; 20 			GPIO_WriteLow(INDICATOR_PORT,INDICATOR_PIN);	//µãÁÁ
 124  000c 4b20          	push	#32
 125  000e ae5005        	ldw	x,#20485
 126  0011 cd0000        	call	_GPIO_WriteLow
 128  0014 84            	pop	a
 129                     ; 21 			status=1;
 131  0015 35010000      	mov	L12_status,#1
 133  0019 200b          	jra	L34
 134  001b               L54:
 135                     ; 24 			GPIO_WriteHigh(INDICATOR_PORT,INDICATOR_PIN);	//Ï¨Ãð
 137  001b 4b20          	push	#32
 138  001d ae5005        	ldw	x,#20485
 139  0020 cd0000        	call	_GPIO_WriteHigh
 141  0023 84            	pop	a
 142                     ; 25 			status=0;
 144  0024 3f00          	clr	L12_status
 145  0026               L34:
 146                     ; 29 }
 149  0026 81            	ret
 173                     	xdef	_Indicator_Running
 174                     	xdef	_Indicator_Init
 175                     	switch	.ubsct
 176  0001               _Indcator_cnt:
 177  0001 00            	ds.b	1
 178                     	xdef	_Indcator_cnt
 179                     	xref	_GPIO_WriteLow
 180                     	xref	_GPIO_WriteHigh
 181                     	xref	_GPIO_Init
 201                     	end
