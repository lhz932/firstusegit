   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
  50                     ; 15 void Key_Init(void)
  50                     ; 16 {//Input pull-up, no external interrupt 
  52                     	switch	.text
  53  0000               _Key_Init:
  57                     ; 17 	GPIO_Init(KEY_PORT,KEY1_PIN|KEY2_PIN|KEY3_PIN,GPIO_MODE_IN_PU_NO_IT);	
  59  0000 4b40          	push	#64
  60  0002 4b2c          	push	#44
  61  0004 ae500f        	ldw	x,#20495
  62  0007 cd0000        	call	_GPIO_Init
  64  000a 85            	popw	x
  65                     ; 18 	PT_INIT(&pt_KeyScan);	
  67  000b 5f            	clrw	x
  68  000c bf01          	ldw	_pt_KeyScan,x
  69                     ; 19 }
  73  000e 81            	ret	
  76                     	switch	.ubsct
  77  0000               L12_keyvalue:
  78  0000 00            	ds.b	1
 141                     ; 21 PT_THREAD(Key_Scan(uint8_t *Key_Val))
 141                     ; 22 {
 142                     	switch	.text
 143  000f               _Key_Scan:
 145  000f 89            	pushw	x
 146  0010 89            	pushw	x
 147       00000002      OFST:	set	2
 150                     ; 26 	PT_BEGIN(&pt_KeyScan);
 154  0011 be01          	ldw	x,_pt_KeyScan
 156                     ; 51 			*Key_Val=keyvalue;							
 157  0013 270c          	jreq	L32
 158  0015 1d0022        	subw	x,#34
 159  0018 2718          	jreq	L52
 160  001a 1d000a        	subw	x,#10
 161  001d 273e          	jreq	L72
 162  001f 204d          	jra	L56
 163  0021               L32:
 164                     ; 28 	m8=GPIO_ReadInputData(KEY_PORT);
 167  0021 ad52          	call	LC002
 168  0023 6b02          	ld	(OFST+0,sp),a
 170                     ; 30 	if(m8!=KEY_MASK){
 172  0025 a12c          	cp	a,#44
 173  0027 2745          	jreq	L56
 174                     ; 31 		keyvalue=m8;		//保留原始键值
 176  0029 b700          	ld	L12_keyvalue,a
 177                     ; 33 		pt_KeyScan_cnt=0;
 179  002b 3f03          	clr	_pt_KeyScan_cnt
 180                     ; 34 		PT_WAIT_UNTIL(&pt_KeyScan,pt_KeyScan_cnt>9);
 182  002d ae0022        	ldw	x,#34
 183  0030 bf01          	ldw	_pt_KeyScan,x
 184  0032               L52:
 188  0032 b603          	ld	a,_pt_KeyScan_cnt
 189  0034 a10a          	cp	a,#10
 192  0036 252d          	jrult	LC001
 193                     ; 36 		m8=GPIO_ReadInputData(KEY_PORT);
 195  0038 ad3b          	call	LC002
 196  003a 6b02          	ld	(OFST+0,sp),a
 198                     ; 38 		if(m8==keyvalue){		//键有效按下，并非抖动	
 200  003c b100          	cp	a,L12_keyvalue
 201  003e 262e          	jrne	L56
 202                     ; 39 			if((m8&KEY1_PIN)==0)	keyvalue=V_KEY1;
 204  0040 a520          	bcp	a,#32
 205  0042 2604          	jrne	L101
 208  0044 35010000      	mov	L12_keyvalue,#1
 209  0048               L101:
 210                     ; 40 			if((m8&KEY2_PIN)==0)	keyvalue=V_KEY2;
 212  0048 a504          	bcp	a,#4
 213  004a 2604          	jrne	L301
 216  004c 35020000      	mov	L12_keyvalue,#2
 217  0050               L301:
 218                     ; 41 			if((m8&KEY3_PIN)==0)	keyvalue=V_KEY3;	
 220  0050 a508          	bcp	a,#8
 221  0052 2604          	jrne	L501
 224  0054 35030000      	mov	L12_keyvalue,#3
 225  0058               L501:
 226                     ; 44 			LC_SET((&pt_KeyScan)->lc);				
 228  0058 ae002c        	ldw	x,#44
 229  005b bf01          	ldw	_pt_KeyScan,x
 230  005d               L72:
 231                     ; 45 			m8=GPIO_ReadInputData(KEY_PORT);
 234  005d ad16          	call	LC002
 235  005f 6b02          	ld	(OFST+0,sp),a
 237                     ; 47 			if(m8!=KEY_MASK){	//仍有按键按下
 239  0061 a12c          	cp	a,#44
 240  0063 2704          	jreq	L701
 241                     ; 48 				return PT_WAITING;				
 243  0065               LC001:
 245  0065 4f            	clr	a
 247  0066               L22:
 249  0066 5b04          	addw	sp,#4
 250  0068 81            	ret	
 251  0069               L701:
 252                     ; 51 			*Key_Val=keyvalue;							
 254  0069 1e03          	ldw	x,(OFST+1,sp)
 255  006b b600          	ld	a,L12_keyvalue
 256  006d f7            	ld	(x),a
 257  006e               L56:
 258                     ; 55 	PT_END(&pt_KeyScan);
 263  006e 5f            	clrw	x
 264  006f bf01          	ldw	_pt_KeyScan,x
 268  0071 a602          	ld	a,#2
 270  0073 20f1          	jra	L22
 271  0075               LC002:
 272  0075 ae500f        	ldw	x,#20495
 273  0078 cd0000        	call	_GPIO_ReadInputData
 276                     ; 46 			m8&=KEY_MASK;				
 278  007b a42c          	and	a,#44
 279  007d 81            	ret	
 341                     ; 58 uint8_t xCal_crc(uint8_t *ptr,uint8_t len)
 341                     ; 59 {uint8_t crc;
 342                     	switch	.text
 343  007e               _xCal_crc:
 345  007e 89            	pushw	x
 346  007f 89            	pushw	x
 347       00000002      OFST:	set	2
 350                     ; 61     crc = 0;
 352  0080 0f02          	clr	(OFST+0,sp)
 355  0082 2023          	jra	L741
 356  0084               L341:
 357                     ; 64        crc ^= *ptr++;
 359  0084 1e03          	ldw	x,(OFST+1,sp)
 360  0086 7b02          	ld	a,(OFST+0,sp)
 361  0088 f8            	xor	a,(x)
 362  0089 5c            	incw	x
 363  008a 1f03          	ldw	(OFST+1,sp),x
 364  008c 6b02          	ld	(OFST+0,sp),a
 366                     ; 65        for(i = 0;i < 8;i++)
 368  008e 0f01          	clr	(OFST-1,sp)
 370  0090               L351:
 371                     ; 67            if(crc & 0x01)
 373  0090 7b02          	ld	a,(OFST+0,sp)
 374  0092 a501          	bcp	a,#1
 375  0094 2707          	jreq	L161
 376                     ; 69                crc = (uint8_t)((crc >> 1) ^ 0x8C);
 378  0096 44            	srl	a
 379  0097 a88c          	xor	a,#140
 380  0099 6b02          	ld	(OFST+0,sp),a
 383  009b 2002          	jra	L361
 384  009d               L161:
 385                     ; 70            }else crc >>= 1;
 387  009d 0402          	srl	(OFST+0,sp)
 389  009f               L361:
 390                     ; 65        for(i = 0;i < 8;i++)
 392  009f 0c01          	inc	(OFST-1,sp)
 396  00a1 7b01          	ld	a,(OFST-1,sp)
 397  00a3 a108          	cp	a,#8
 398  00a5 25e9          	jrult	L351
 399  00a7               L741:
 400                     ; 62     while(len--)
 402  00a7 7b07          	ld	a,(OFST+5,sp)
 403  00a9 0a07          	dec	(OFST+5,sp)
 404  00ab 4d            	tnz	a
 405  00ac 26d6          	jrne	L341
 406                     ; 73     return crc;
 408  00ae 7b02          	ld	a,(OFST+0,sp)
 411  00b0 5b04          	addw	sp,#4
 412  00b2 81            	ret	
 460                     	switch	.ubsct
 461  0001               _pt_KeyScan:
 462  0001 0000          	ds.b	2
 463                     	xdef	_pt_KeyScan
 464                     	xdef	_xCal_crc
 465                     	xdef	_Key_Scan
 466                     	xdef	_Key_Init
 467  0003               _pt_KeyScan_cnt:
 468  0003 00            	ds.b	1
 469                     	xdef	_pt_KeyScan_cnt
 470                     	xref	_GPIO_ReadInputData
 471                     	xref	_GPIO_Init
 491                     	end
