   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
  45                     ; 8 void Indicator_Init(void)
  45                     ; 9 {
  47                     	switch	.text
  48  0000               _Indicator_Init:
  52                     ; 10 	GPIO_Init(INDICATOR_PORT,INDICATOR_PIN,GPIO_MODE_OUT_PP_HIGH_SLOW);
  54  0000 4bd0          	push	#208
  55  0002 4b20          	push	#32
  56  0004 ae5005        	ldw	x,#20485
  57  0007 cd0000        	call	_GPIO_Init
  59  000a 85            	popw	x
  60                     ; 11 }
  63  000b 81            	ret
  66                     	switch	.ubsct
  67  0000               L12_status:
  68  0000 00            	ds.b	1
 103                     ; 14 void Indicator_Running(void)
 103                     ; 15 {
 104                     	switch	.text
 105  000c               _Indicator_Running:
 109                     ; 17 	if(Indcator_cnt>19){		
 111  000c b601          	ld	a,_Indcator_cnt
 112  000e a114          	cp	a,#20
 113  0010 2520          	jrult	L34
 114                     ; 18 		Indcator_cnt=0;
 116  0012 3f01          	clr	_Indcator_cnt
 117                     ; 19 		if(status==0){
 119  0014 3d00          	tnz	L12_status
 120  0016 260f          	jrne	L54
 121                     ; 20 			GPIO_WriteLow(INDICATOR_PORT,INDICATOR_PIN);	//µãÁÁ
 123  0018 4b20          	push	#32
 124  001a ae5005        	ldw	x,#20485
 125  001d cd0000        	call	_GPIO_WriteLow
 127  0020 84            	pop	a
 128                     ; 21 			status=1;
 130  0021 35010000      	mov	L12_status,#1
 132  0025 200b          	jra	L34
 133  0027               L54:
 134                     ; 24 			GPIO_WriteHigh(INDICATOR_PORT,INDICATOR_PIN);	//Ï¨Ãð
 136  0027 4b20          	push	#32
 137  0029 ae5005        	ldw	x,#20485
 138  002c cd0000        	call	_GPIO_WriteHigh
 140  002f 84            	pop	a
 141                     ; 25 			status=0;
 143  0030 3f00          	clr	L12_status
 144  0032               L34:
 145                     ; 29 }
 148  0032 81            	ret
 172                     	xdef	_Indicator_Running
 173                     	xdef	_Indicator_Init
 174                     	switch	.ubsct
 175  0001               _Indcator_cnt:
 176  0001 00            	ds.b	1
 177                     	xdef	_Indcator_cnt
 178                     	xref	_GPIO_WriteLow
 179                     	xref	_GPIO_WriteHigh
 180                     	xref	_GPIO_Init
 200                     	end
