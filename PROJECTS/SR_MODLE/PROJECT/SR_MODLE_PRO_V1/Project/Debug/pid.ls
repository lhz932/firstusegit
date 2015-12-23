   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
  16                     	bsct
  17  0000               _pid:
  18  0000 05            	dc.b	5
  19  0001 02            	dc.b	2
  20  0002 01            	dc.b	1
  21  0003 04            	dc.b	4
  22  0004 01            	dc.b	1
  23  0005 0000          	dc.w	0
  24  0007 0000          	dc.w	0
  25  0009 0000          	dc.w	0
  26  000b 00            	dc.b	0
  27  000c 001e          	dc.w	30
  28  000e 0000          	dc.w	0
  29  0010 0000          	dc.w	0
 152                     ; 35 void pid_exe(pid_str* PID)
 152                     ; 36 {
 154                     	switch	.text
 155  0000               _pid_exe:
 157  0000 89            	pushw	x
 158  0001 5206          	subw	sp,#6
 159       00000006      OFST:	set	6
 162                     ; 37 	PID->Ek[2]=PID->Ek[1];
 164  0003 9093          	ldw	y,x
 165  0005 90ee07        	ldw	y,(7,y)
 166  0008 ef09          	ldw	(9,x),y
 167                     ; 38 	PID->Ek[1]=PID->Ek[0];
 169  000a 9093          	ldw	y,x
 170  000c 90ee05        	ldw	y,(5,y)
 171  000f ef07          	ldw	(7,x),y
 172                     ; 39 	PID->Ek[0]=(PID->Rk >> PID->BitMov_In_Right) - (PID->Ck >> PID->BitMov_In_Right);
 174  0011 ee0e          	ldw	x,(14,x)
 175  0013 1607          	ldw	y,(OFST+1,sp)
 176  0015 90e603        	ld	a,(3,y)
 177  0018 4d            	tnz	a
 178  0019 2704          	jreq	L6
 179  001b               L01:
 180  001b 57            	sraw	x
 181  001c 4a            	dec	a
 182  001d 26fc          	jrne	L01
 183  001f               L6:
 184  001f 1f05          	ldw	(OFST-1,sp),x
 186  0021 1e07          	ldw	x,(OFST+1,sp)
 187  0023 ee0c          	ldw	x,(12,x)
 188  0025 1607          	ldw	y,(OFST+1,sp)
 189  0027 90e603        	ld	a,(3,y)
 190  002a 4d            	tnz	a
 191  002b 2704          	jreq	L21
 192  002d               L41:
 193  002d 57            	sraw	x
 194  002e 4a            	dec	a
 195  002f 26fc          	jrne	L41
 196  0031               L21:
 197  0031 72f005        	subw	x,(OFST-1,sp)
 198  0034 1607          	ldw	y,(OFST+1,sp)
 199  0036 90ef05        	ldw	(5,y),x
 200                     ; 41 	PID->Uk_Real = 	PID->Uk_Real + 
 200                     ; 42 									PID->Kp * (PID->Ek[0] - PID->Ek[1]) +
 200                     ; 43 									PID->Ki * (PID->Ek[0]) +
 200                     ; 44 									PID->Kd * (PID->Ek[0] - 2 * PID->Ek[1] + PID->Ek[2]);
 202  0039 1e07          	ldw	x,(OFST+1,sp)
 203  003b ee07          	ldw	x,(7,x)
 204  003d 58            	sllw	x
 205  003e 1f05          	ldw	(OFST-1,sp),x
 207  0040 1e07          	ldw	x,(OFST+1,sp)
 208  0042 ee05          	ldw	x,(5,x)
 209  0044 72f005        	subw	x,(OFST-1,sp)
 210  0047 1607          	ldw	y,(OFST+1,sp)
 211  0049 01            	rrwa	x,a
 212  004a 90eb0a        	add	a,(10,y)
 213  004d 01            	rrwa	x,a
 214  004e 90e909        	adc	a,(9,y)
 215  0051 01            	rrwa	x,a
 216  0052 1607          	ldw	y,(OFST+1,sp)
 217  0054 90e602        	ld	a,(2,y)
 218  0057 905f          	clrw	y
 219  0059 4d            	tnz	a
 220  005a 2a02          	jrpl	L61
 221  005c 9053          	cplw	y
 222  005e               L61:
 223  005e 9097          	ld	yl,a
 224  0060 cd0000        	call	c_imul
 226  0063 51            	exgw	x,y
 227  0064 1703          	ldw	(OFST-3,sp),y
 229  0066 1e07          	ldw	x,(OFST+1,sp)
 230  0068 e601          	ld	a,(1,x)
 231  006a 5f            	clrw	x
 232  006b 4d            	tnz	a
 233  006c 2a01          	jrpl	L02
 234  006e 53            	cplw	x
 235  006f               L02:
 236  006f 97            	ld	xl,a
 237  0070 1607          	ldw	y,(OFST+1,sp)
 238  0072 90ee05        	ldw	y,(5,y)
 239  0075 cd0000        	call	c_imul
 241  0078 1f01          	ldw	(OFST-5,sp),x
 243  007a 1e07          	ldw	x,(OFST+1,sp)
 244  007c ee05          	ldw	x,(5,x)
 245  007e 1607          	ldw	y,(OFST+1,sp)
 246  0080 01            	rrwa	x,a
 247  0081 90e008        	sub	a,(8,y)
 248  0084 01            	rrwa	x,a
 249  0085 90e207        	sbc	a,(7,y)
 250  0088 01            	rrwa	x,a
 251  0089 1607          	ldw	y,(OFST+1,sp)
 252  008b 90f6          	ld	a,(y)
 253  008d 905f          	clrw	y
 254  008f 4d            	tnz	a
 255  0090 2a02          	jrpl	L22
 256  0092 9053          	cplw	y
 257  0094               L22:
 258  0094 9097          	ld	yl,a
 259  0096 cd0000        	call	c_imul
 261  0099 51            	exgw	x,y
 262  009a 1e07          	ldw	x,(OFST+1,sp)
 263  009c 9001          	rrwa	y,a
 264  009e eb11          	add	a,(17,x)
 265  00a0 9001          	rrwa	y,a
 266  00a2 e910          	adc	a,(16,x)
 267  00a4 9001          	rrwa	y,a
 268  00a6 72f901        	addw	y,(OFST-5,sp)
 269  00a9 72f903        	addw	y,(OFST-3,sp)
 270  00ac 1e07          	ldw	x,(OFST+1,sp)
 271  00ae ef10          	ldw	(16,x),y
 272                     ; 46 	if((PID->Uk_Real >> PID->BitMov_Out_Left) > MAXOUT)
 274  00b0 9c            	rvf
 275  00b1 1e07          	ldw	x,(OFST+1,sp)
 276  00b3 ee10          	ldw	x,(16,x)
 277  00b5 1607          	ldw	y,(OFST+1,sp)
 278  00b7 90e604        	ld	a,(4,y)
 279  00ba 4d            	tnz	a
 280  00bb 2704          	jreq	L42
 281  00bd               L62:
 282  00bd 57            	sraw	x
 283  00be 4a            	dec	a
 284  00bf 26fc          	jrne	L62
 285  00c1               L42:
 286  00c1 a30033        	cpw	x,#51
 287  00c4 2f08          	jrslt	L36
 288                     ; 48 		PID->Uk = MAXOUT;
 290  00c6 1e07          	ldw	x,(OFST+1,sp)
 291  00c8 a632          	ld	a,#50
 292  00ca e70b          	ld	(11,x),a
 294  00cc 2035          	jra	L56
 295  00ce               L36:
 296                     ; 49 	}else if((PID->Uk_Real >> PID->BitMov_Out_Left) <= -MAXOUT)
 298  00ce 9c            	rvf
 299  00cf 1e07          	ldw	x,(OFST+1,sp)
 300  00d1 ee10          	ldw	x,(16,x)
 301  00d3 1607          	ldw	y,(OFST+1,sp)
 302  00d5 90e604        	ld	a,(4,y)
 303  00d8 4d            	tnz	a
 304  00d9 2704          	jreq	L03
 305  00db               L23:
 306  00db 57            	sraw	x
 307  00dc 4a            	dec	a
 308  00dd 26fc          	jrne	L23
 309  00df               L03:
 310  00df a3ffcf        	cpw	x,#65487
 311  00e2 2e08          	jrsge	L76
 312                     ; 51 		PID->Uk = -MAXOUT;
 314  00e4 1e07          	ldw	x,(OFST+1,sp)
 315  00e6 a6ce          	ld	a,#206
 316  00e8 e70b          	ld	(11,x),a
 318  00ea 2017          	jra	L56
 319  00ec               L76:
 320                     ; 54 		PID->Uk =	PID->Uk_Real >> PID->BitMov_Out_Left;
 322  00ec 1e07          	ldw	x,(OFST+1,sp)
 323  00ee ee10          	ldw	x,(16,x)
 324  00f0 1607          	ldw	y,(OFST+1,sp)
 325  00f2 90e604        	ld	a,(4,y)
 326  00f5 4d            	tnz	a
 327  00f6 2704          	jreq	L43
 328  00f8               L63:
 329  00f8 57            	sraw	x
 330  00f9 4a            	dec	a
 331  00fa 26fc          	jrne	L63
 332  00fc               L43:
 333  00fc 1607          	ldw	y,(OFST+1,sp)
 334  00fe 01            	rrwa	x,a
 335  00ff 90e70b        	ld	(11,y),a
 336  0102 02            	rlwa	x,a
 337  0103               L56:
 338                     ; 56 }
 341  0103 5b08          	addw	sp,#8
 342  0105 81            	ret
 380                     ; 58 void PID_set(void)
 380                     ; 59 {
 381                     	switch	.text
 382  0106               _PID_set:
 384  0106 89            	pushw	x
 385       00000002      OFST:	set	2
 388                     ; 61 	if(Speed_Origin!=0xFFFF)
 390  0107 be00          	ldw	x,_Speed_Origin
 391  0109 a3ffff        	cpw	x,#65535
 392  010c 2711          	jreq	L111
 393                     ; 63 		m=Speed_Origin>>3;
 395  010e be00          	ldw	x,_Speed_Origin
 396  0110 54            	srlw	x
 397  0111 54            	srlw	x
 398  0112 54            	srlw	x
 399  0113 1f01          	ldw	(OFST-1,sp),x
 401                     ; 64 		pid.Ck=15000*25/8/m;
 403  0115 aef71b        	ldw	x,#63259
 404  0118 1601          	ldw	y,(OFST-1,sp)
 405  011a 65            	divw	x,y
 406  011b bf0e          	ldw	_pid+14,x
 408  011d 2003          	jra	L311
 409  011f               L111:
 410                     ; 67 		pid.Ck=0;
 412  011f 5f            	clrw	x
 413  0120 bf0e          	ldw	_pid+14,x
 414  0122               L311:
 415                     ; 69 	pid_exe(&pid);
 417  0122 ae0000        	ldw	x,#_pid
 418  0125 cd0000        	call	_pid_exe
 420                     ; 70 	TIM1_SetCompare3(150+pid.Uk);
 422  0128 5f            	clrw	x
 423  0129 b60b          	ld	a,_pid+11
 424  012b 2a01          	jrpl	L24
 425  012d 53            	cplw	x
 426  012e               L24:
 427  012e 97            	ld	xl,a
 428  012f 1c0096        	addw	x,#150
 429  0132 cd0000        	call	_TIM1_SetCompare3
 431                     ; 71 }
 434  0135 85            	popw	x
 435  0136 81            	ret
 460                     	xref.b	_Speed_Origin
 461                     	xdef	_PID_set
 462                     	xdef	_pid_exe
 463                     	xdef	_pid
 464                     	xref	_TIM1_SetCompare3
 465                     	xref.b	c_x
 484                     	xref	c_imul
 485                     	end
