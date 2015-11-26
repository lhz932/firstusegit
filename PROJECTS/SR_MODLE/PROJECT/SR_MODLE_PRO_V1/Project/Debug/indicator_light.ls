   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
  45                     ; 6 void Indicator_Init(void)
  45                     ; 7 {
  47                     	switch	.text
  48  0000               _Indicator_Init:
  52                     ; 8 	GPIO_Init(INDICATOR_PORT,INDICATOR_PIN,GPIO_MODE_OUT_PP_HIGH_SLOW);
  54  0000 4bd0          	push	#208
  55  0002 4b20          	push	#32
  56  0004 ae5005        	ldw	x,#20485
  57  0007 cd0000        	call	_GPIO_Init
  59  000a 85            	popw	x
  60                     ; 9 }
  63  000b 81            	ret
  66                     	switch	.ubsct
  67  0000               L32_cnt:
  68  0000 00            	ds.b	1
  69  0001               L12_status:
  70  0001 00            	ds.b	1
 113                     ; 12 void Indicator_Running(void)
 113                     ; 13 {
 114                     	switch	.text
 115  000c               _Indicator_Running:
 119                     ; 15 	cnt++;
 121  000c 3c00          	inc	L32_cnt
 122                     ; 16 	if(cnt>1){
 124  000e b600          	ld	a,L32_cnt
 125  0010 a102          	cp	a,#2
 126  0012 2520          	jrult	L74
 127                     ; 17 		cnt=0;
 129  0014 3f00          	clr	L32_cnt
 130                     ; 18 		if(status==0){
 132  0016 3d01          	tnz	L12_status
 133  0018 260f          	jrne	L15
 134                     ; 19 			GPIO_WriteLow(INDICATOR_PORT,INDICATOR_PIN);	//µãÁÁ
 136  001a 4b20          	push	#32
 137  001c ae5005        	ldw	x,#20485
 138  001f cd0000        	call	_GPIO_WriteLow
 140  0022 84            	pop	a
 141                     ; 20 			status=1;
 143  0023 35010001      	mov	L12_status,#1
 145  0027 200b          	jra	L74
 146  0029               L15:
 147                     ; 23 			GPIO_WriteHigh(INDICATOR_PORT,INDICATOR_PIN);	//Ï¨Ãð
 149  0029 4b20          	push	#32
 150  002b ae5005        	ldw	x,#20485
 151  002e cd0000        	call	_GPIO_WriteHigh
 153  0031 84            	pop	a
 154                     ; 24 			status=0;
 156  0032 3f01          	clr	L12_status
 157  0034               L74:
 158                     ; 27 }
 161  0034 81            	ret
 174                     	xdef	_Indicator_Running
 175                     	xdef	_Indicator_Init
 176                     	xref	_GPIO_WriteLow
 177                     	xref	_GPIO_WriteHigh
 178                     	xref	_GPIO_Init
 197                     	end
