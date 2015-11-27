   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
  68                     ; 5 void delay_10us(uint8_t n)
  68                     ; 6 {
  70                     	switch	.text
  71  0000               _delay_10us:
  73  0000 88            	push	a
  74  0001 88            	push	a
  75       00000001      OFST:	set	1
  78  0002 200a          	jra	L53
  79  0004               L33:
  80                     ; 10 		for(i=0;i<15;i++);
  82  0004 0f01          	clr	(OFST+0,sp)
  84  0006               L14:
  88  0006 0c01          	inc	(OFST+0,sp)
  92  0008 7b01          	ld	a,(OFST+0,sp)
  93  000a a10f          	cp	a,#15
  94  000c 25f8          	jrult	L14
  95  000e               L53:
  96                     ; 8 	while(n--)
  98  000e 7b02          	ld	a,(OFST+1,sp)
  99  0010 0a02          	dec	(OFST+1,sp)
 100  0012 4d            	tnz	a
 101  0013 26ef          	jrne	L33
 102                     ; 12 }
 105  0015 85            	popw	x
 106  0016 81            	ret	
 141                     ; 14 void delay_ms(uint8_t n)
 141                     ; 15 {
 142                     	switch	.text
 143  0017               _delay_ms:
 145  0017 88            	push	a
 146       00000000      OFST:	set	0
 149  0018 2004          	jra	L76
 150  001a               L56:
 151                     ; 20 		delay_10us(100);
 153  001a a664          	ld	a,#100
 154  001c ade2          	call	_delay_10us
 156  001e               L76:
 157                     ; 17 	while(n--)
 159  001e 7b01          	ld	a,(OFST+1,sp)
 160  0020 0a01          	dec	(OFST+1,sp)
 161  0022 4d            	tnz	a
 162  0023 26f5          	jrne	L56
 163                     ; 22 }
 166  0025 84            	pop	a
 167  0026 81            	ret	
 202                     ; 23 void delay_nx100ms(uint8_t n)
 202                     ; 24 {
 203                     	switch	.text
 204  0027               _delay_nx100ms:
 206  0027 88            	push	a
 207       00000000      OFST:	set	0
 210  0028 2004          	jra	L311
 211  002a               L111:
 212                     ; 26 		delay_ms(100);
 214  002a a664          	ld	a,#100
 215  002c ade9          	call	_delay_ms
 217  002e               L311:
 218                     ; 25 	while(n--){
 220  002e 7b01          	ld	a,(OFST+1,sp)
 221  0030 0a01          	dec	(OFST+1,sp)
 222  0032 4d            	tnz	a
 223  0033 26f5          	jrne	L111
 224                     ; 28 }
 227  0035 84            	pop	a
 228  0036 81            	ret	
 252                     ; 30 void LED_Init(void)
 252                     ; 31 {
 253                     	switch	.text
 254  0037               _LED_Init:
 258                     ; 32 	GPIO_Init(LED_PORT,LED_PIN,GPIO_MODE_OUT_PP_HIGH_SLOW);
 260  0037 4bd0          	push	#208
 261  0039 4b20          	push	#32
 262  003b ae5005        	ldw	x,#20485
 263  003e cd0000        	call	_GPIO_Init
 265  0041 85            	popw	x
 266                     ; 33 }
 269  0042 81            	ret	
 293                     ; 52 void LED_On(void)
 293                     ; 53 {
 294                     	switch	.text
 295  0043               _LED_On:
 299                     ; 54 	GPIO_WriteLow(LED_PORT,LED_PIN);
 301  0043 4b20          	push	#32
 302  0045 ae5005        	ldw	x,#20485
 303  0048 cd0000        	call	_GPIO_WriteLow
 305  004b 84            	pop	a
 306                     ; 56 }
 309  004c 81            	ret	
 333                     ; 57 void LED_Off(void)
 333                     ; 58 {
 334                     	switch	.text
 335  004d               _LED_Off:
 339                     ; 59 	GPIO_WriteHigh(LED_PORT,LED_PIN);
 341  004d 4b20          	push	#32
 342  004f ae5005        	ldw	x,#20485
 343  0052 cd0000        	call	_GPIO_WriteHigh
 345  0055 84            	pop	a
 346                     ; 60 }
 349  0056 81            	ret	
 362                     	xdef	_LED_Off
 363                     	xdef	_LED_On
 364                     	xdef	_LED_Init
 365                     	xdef	_delay_nx100ms
 366                     	xdef	_delay_ms
 367                     	xdef	_delay_10us
 368                     	xref	_GPIO_WriteLow
 369                     	xref	_GPIO_WriteHigh
 370                     	xref	_GPIO_Init
 389                     	end
