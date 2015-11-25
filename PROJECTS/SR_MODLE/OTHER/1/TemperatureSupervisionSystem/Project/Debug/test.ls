   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
  64                     ; 5 void delay_10us(uint8_t n)
  64                     ; 6 {
  66                     	switch	.text
  67  0000               _delay_10us:
  69  0000 88            	push	a
  70  0001 88            	push	a
  71       00000001      OFST:	set	1
  74  0002 200a          	jra	L53
  75  0004               L33:
  76                     ; 10 		for(i=0;i<15;i++);
  78  0004 0f01          	clr	(OFST+0,sp)
  80  0006               L14:
  84  0006 0c01          	inc	(OFST+0,sp)
  88  0008 7b01          	ld	a,(OFST+0,sp)
  89  000a a10f          	cp	a,#15
  90  000c 25f8          	jrult	L14
  91  000e               L53:
  92                     ; 8 	while(n--)
  94  000e 7b02          	ld	a,(OFST+1,sp)
  95  0010 0a02          	dec	(OFST+1,sp)
  96  0012 4d            	tnz	a
  97  0013 26ef          	jrne	L33
  98                     ; 12 }
 101  0015 85            	popw	x
 102  0016 81            	ret
 137                     ; 14 static void mydelay(uint8_t n)
 137                     ; 15 {
 138                     	switch	.text
 139  0017               L74_mydelay:
 141  0017 88            	push	a
 142       00000000      OFST:	set	0
 145  0018 2004          	jra	L17
 146  001a               L76:
 147                     ; 20 		delay_10us(100);
 149  001a a664          	ld	a,#100
 150  001c ade2          	call	_delay_10us
 152  001e               L17:
 153                     ; 17 	while(n--)
 155  001e 7b01          	ld	a,(OFST+1,sp)
 156  0020 0a01          	dec	(OFST+1,sp)
 157  0022 4d            	tnz	a
 158  0023 26f5          	jrne	L76
 159                     ; 22 }
 162  0025 84            	pop	a
 163  0026 81            	ret
 187                     ; 24 void LED_Init(void)
 187                     ; 25 {
 188                     	switch	.text
 189  0027               _LED_Init:
 193                     ; 26 	GPIO_Init(LED_PORT,LED_PIN,GPIO_MODE_OUT_PP_HIGH_SLOW);
 195  0027 4bd0          	push	#208
 196  0029 4b20          	push	#32
 197  002b ae5005        	ldw	x,#20485
 198  002e cd0000        	call	_GPIO_Init
 200  0031 85            	popw	x
 201                     ; 27 }
 204  0032 81            	ret
 230                     ; 28 void LED_Control(void)
 230                     ; 29 {
 231                     	switch	.text
 232  0033               _LED_Control:
 236                     ; 30 	GPIO_WriteHigh(LED_PORT,LED_PIN);
 238  0033 4b20          	push	#32
 239  0035 ae5005        	ldw	x,#20485
 240  0038 cd0000        	call	_GPIO_WriteHigh
 242  003b 84            	pop	a
 243                     ; 31 	mydelay(200);
 245  003c a6c8          	ld	a,#200
 246  003e add7          	call	L74_mydelay
 248                     ; 32 	GPIO_WriteLow(LED_PORT,LED_PIN);
 250  0040 4b20          	push	#32
 251  0042 ae5005        	ldw	x,#20485
 252  0045 cd0000        	call	_GPIO_WriteLow
 254  0048 84            	pop	a
 255                     ; 33 	mydelay(200);
 257  0049 a6c8          	ld	a,#200
 258  004b adca          	call	L74_mydelay
 260                     ; 34 }
 263  004d 81            	ret
 289                     ; 36 void LED_Control_2(void)
 289                     ; 37 {
 290                     	switch	.text
 291  004e               _LED_Control_2:
 295                     ; 38 	GPIO_WriteHigh(LED_PORT,LED_PIN);
 297  004e 4b20          	push	#32
 298  0050 ae5005        	ldw	x,#20485
 299  0053 cd0000        	call	_GPIO_WriteHigh
 301  0056 84            	pop	a
 302                     ; 39 	mydelay(200);
 304  0057 a6c8          	ld	a,#200
 305  0059 adbc          	call	L74_mydelay
 307                     ; 40 	mydelay(200);
 309  005b a6c8          	ld	a,#200
 310  005d adb8          	call	L74_mydelay
 312                     ; 41 	mydelay(200);
 314  005f a6c8          	ld	a,#200
 315  0061 adb4          	call	L74_mydelay
 317                     ; 42 	mydelay(200);
 319  0063 a6c8          	ld	a,#200
 320  0065 adb0          	call	L74_mydelay
 322                     ; 43 	mydelay(200);
 324  0067 a6c8          	ld	a,#200
 325  0069 adac          	call	L74_mydelay
 327                     ; 44 	GPIO_WriteLow(LED_PORT,LED_PIN);
 329  006b 4b20          	push	#32
 330  006d ae5005        	ldw	x,#20485
 331  0070 cd0000        	call	_GPIO_WriteLow
 333  0073 84            	pop	a
 334                     ; 45 	mydelay(100);
 336  0074 a664          	ld	a,#100
 337  0076 ad9f          	call	L74_mydelay
 339                     ; 46 }
 342  0078 81            	ret
 366                     ; 48 void LED_On(void)
 366                     ; 49 {
 367                     	switch	.text
 368  0079               _LED_On:
 372                     ; 50 	GPIO_WriteLow(LED_PORT,LED_PIN);
 374  0079 4b20          	push	#32
 375  007b ae5005        	ldw	x,#20485
 376  007e cd0000        	call	_GPIO_WriteLow
 378  0081 84            	pop	a
 379                     ; 52 }
 382  0082 81            	ret
 406                     ; 53 void LED_Off(void)
 406                     ; 54 {
 407                     	switch	.text
 408  0083               _LED_Off:
 412                     ; 55 	GPIO_WriteHigh(LED_PORT,LED_PIN);
 414  0083 4b20          	push	#32
 415  0085 ae5005        	ldw	x,#20485
 416  0088 cd0000        	call	_GPIO_WriteHigh
 418  008b 84            	pop	a
 419                     ; 56 }
 422  008c 81            	ret
 435                     	xdef	_LED_Off
 436                     	xdef	_LED_On
 437                     	xdef	_LED_Control_2
 438                     	xdef	_LED_Control
 439                     	xdef	_LED_Init
 440                     	xdef	_delay_10us
 441                     	xref	_GPIO_WriteLow
 442                     	xref	_GPIO_WriteHigh
 443                     	xref	_GPIO_Init
 462                     	end
