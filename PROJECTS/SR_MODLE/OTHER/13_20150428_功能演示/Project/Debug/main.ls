   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
  20                     	switch	.data
  21  0000               _Mode:
  22  0000 00            	dc.b	0
  23  0001               _KeyVal:
  24  0001 ff            	dc.b	255
  74                     ; 30 int main(void)
  74                     ; 31 {
  76                     	switch	.text
  77  0000               _main:
  81                     ; 36 	GPIO_Config_SystemOn();
  83  0000 cd00a9        	call	_GPIO_Config_SystemOn
  85                     ; 37 	CLK_Config();	//Configure the Fcpu to 1MHz,Fmaster=2MHz	
  87  0003 cd00d6        	call	_CLK_Config
  89                     ; 38 	Timer_Config();
  91  0006 cd00db        	call	_Timer_Config
  93                     ; 40   FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);
  95  0009 4f            	clr	a
  96  000a cd0000        	call	_FLASH_SetProgrammingTime
  98                     ; 43 	LED_Init();			
 100  000d cd0000        	call	_LED_Init
 102                     ; 44 	Key_Init();
 104  0010 cd0000        	call	_Key_Init
 106                     ; 45 	Nokia5110_Init();	
 108  0013 cd0000        	call	_Nokia5110_Init
 110                     ; 46 	Ds18b20_Init();	
 112  0016 cd0000        	call	_Ds18b20_Init
 114                     ; 48 	PT_INIT(&pt_MCL_Add);
 116  0019 5f            	clrw	x
 117  001a cf0014        	ldw	_pt_MCL_Add,x
 118                     ; 51 	LCD_Print(2,12*2,"卸船机");
 121  001d ae010c        	ldw	x,#L12
 122  0020 89            	pushw	x
 123  0021 ae0218        	ldw	x,#536
 124  0024 cd0000        	call	_LCD_Print
 126  0027 85            	popw	x
 127                     ; 52 	LCD_Print(16+2,12*1,"变频器温度");
 129  0028 ae0101        	ldw	x,#L32
 130  002b 89            	pushw	x
 131  002c ae120c        	ldw	x,#4620
 132  002f cd0000        	call	_LCD_Print
 134  0032 85            	popw	x
 135                     ; 53 	LCD_Print(32+2,6*3,"监测系统");			
 137  0033 ae00f8        	ldw	x,#L52
 138  0036 89            	pushw	x
 139  0037 ae2212        	ldw	x,#8722
 140  003a cd0000        	call	_LCD_Print
 142  003d a60a          	ld	a,#10
 143  003f 85            	popw	x
 144                     ; 54 	delay_nx100ms(10);
 146  0040 cd0000        	call	_delay_nx100ms
 148                     ; 56 	LCD_Clear();
 150  0043 cd0000        	call	_LCD_Clear
 152                     ; 57 	LCD_Print(2,12*1,"广州港新沙");
 154  0046 ae00ed        	ldw	x,#L72
 155  0049 89            	pushw	x
 156  004a ae020c        	ldw	x,#524
 157  004d cd0000        	call	_LCD_Print
 159  0050 85            	popw	x
 160                     ; 58 	LCD_Print(16+2,6*1,"港务有限公司");
 162  0051 ae00e0        	ldw	x,#L13
 163  0054 89            	pushw	x
 164  0055 ae1206        	ldw	x,#4614
 165  0058 cd0000        	call	_LCD_Print
 167  005b 85            	popw	x
 168                     ; 59 	LCD_Print(32+2,9,"作者 李宏洲");		
 170  005c ae00d4        	ldw	x,#L33
 171  005f 89            	pushw	x
 172  0060 ae2209        	ldw	x,#8713
 173  0063 cd0000        	call	_LCD_Print
 175  0066 a60a          	ld	a,#10
 176  0068 85            	popw	x
 177                     ; 60 	delay_nx100ms(10);
 179  0069 cd0000        	call	_delay_nx100ms
 181                     ; 62 	LCD_Clear();
 183  006c cd0000        	call	_LCD_Clear
 185                     ; 64 	Check_Sensor();
 187  006f cd010f        	call	_Check_Sensor
 189                     ; 65 	if(Sensors.Valid_Configured_Num==0){	//未配置传感器
 191  0072 c6000e        	ld	a,_Sensors+1
 192  0075 261c          	jrne	L53
 193                     ; 66 		LCD_Print(12*1,0,"没有配置传感器");
 195  0077 ae00c5        	ldw	x,#L73
 196  007a 89            	pushw	x
 197  007b ae0c00        	ldw	x,#3072
 198  007e cd0000        	call	_LCD_Print
 200  0081 85            	popw	x
 201                     ; 67 		LCD_Print(12*3,30,"确定");		
 203  0082 ae00c0        	ldw	x,#L14
 204  0085 89            	pushw	x
 205  0086 ae241e        	ldw	x,#9246
 206  0089 cd0000        	call	_LCD_Print
 208  008c 35110000      	mov	_Mode,#17
 209  0090 85            	popw	x
 210                     ; 68 		Mode=MODE_PREPROCESSING;		
 213  0091 2004          	jra	L54
 214  0093               L53:
 215                     ; 71 		Mode=MODE_NORMAL;
 217  0093 35010000      	mov	_Mode,#1
 218  0097               L54:
 219                     ; 76 		Task_1ms_NotCritical();
 221  0097 ad5c          	call	_Task_1ms_NotCritical
 223                     ; 77 		Task_10ms_NotCritical();
 225  0099 ad63          	call	_Task_10ms_NotCritical
 227                     ; 79 		Key_Scan(&KeyVal);
 229  009b ae0001        	ldw	x,#_KeyVal
 230  009e cd0000        	call	_Key_Scan
 232                     ; 81 		Main_Control_Logic();		
 234  00a1 cd057d        	call	_Main_Control_Logic
 236                     ; 82 		MCL_Add();
 238  00a4 cd01dd        	call	_MCL_Add
 241  00a7 20ee          	jra	L54
 266                     ; 88 void GPIO_Config_SystemOn(void)
 266                     ; 89 {
 267                     	switch	.text
 268  00a9               _GPIO_Config_SystemOn:
 272                     ; 91 	GPIO_Init(GPIOA,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 274  00a9 4b40          	push	#64
 275  00ab 4bff          	push	#255
 276  00ad ae5000        	ldw	x,#20480
 277  00b0 cd0000        	call	_GPIO_Init
 279  00b3 85            	popw	x
 280                     ; 92 	GPIO_Init(GPIOB,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 282  00b4 4b40          	push	#64
 283  00b6 4bff          	push	#255
 284  00b8 ae5005        	ldw	x,#20485
 285  00bb cd0000        	call	_GPIO_Init
 287  00be 85            	popw	x
 288                     ; 93 	GPIO_Init(GPIOC,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 290  00bf 4b40          	push	#64
 291  00c1 4bff          	push	#255
 292  00c3 ae500a        	ldw	x,#20490
 293  00c6 cd0000        	call	_GPIO_Init
 295  00c9 85            	popw	x
 296                     ; 94 	GPIO_Init(GPIOD,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 298  00ca 4b40          	push	#64
 299  00cc 4bff          	push	#255
 300  00ce ae500f        	ldw	x,#20495
 301  00d1 cd0000        	call	_GPIO_Init
 303  00d4 85            	popw	x
 304                     ; 95 }
 307  00d5 81            	ret	
 330                     ; 97 void CLK_Config(void)
 330                     ; 98 {	/*
 331                     	switch	.text
 332  00d6               _CLK_Config:
 336                     ; 105 	CLK->CKDIVR=0x08;
 338  00d6 350850c6      	mov	20678,#8
 339                     ; 107 }
 342  00da 81            	ret	
 366                     ; 108 void Timer_Config(void)
 366                     ; 109 {
 367                     	switch	.text
 368  00db               _Timer_Config:
 372                     ; 123 	TIM4->PSCR=((uint8_t)0x05);//TIM4_PRESCALER_32
 374  00db 35055347      	mov	21319,#5
 375                     ; 124 	TIM4->ARR=249;
 377  00df 35f95348      	mov	21320,#249
 378                     ; 125 	TIM4->SR1=(uint8_t)(~0x01);
 380  00e3 35fe5344      	mov	21316,#254
 381                     ; 126 	TIM4->IER |= (uint8_t)0x01;// Enable the Interrupt sources 
 383  00e7 72105343      	bset	21315,#0
 384                     ; 127 	enableInterrupts();
 387  00eb 9a            	rim	
 389                     ; 128 	TIM4->CR1 |= TIM4_CR1_CEN;// set the CEN Bit 	
 392  00ec 72105340      	bset	21312,#0
 393                     ; 129 	TIM4->SR1 = (uint8_t)(~0x01);/* Clear the IT pending Bit */
 395  00f0 35fe5344      	mov	21316,#254
 396                     ; 131 }
 399  00f4 81            	ret	
 425                     ; 133 void 	Task_1ms_NotCritical(void)
 425                     ; 134 {
 426                     	switch	.text
 427  00f5               _Task_1ms_NotCritical:
 431                     ; 135 	if(Task_1ms_NotCritical_cnt)
 433  00f5 3d02          	tnz	_Task_1ms_NotCritical_cnt
 434  00f7 2704          	jreq	L111
 435                     ; 137 		Task_1ms_NotCritical_cnt--;
 437  00f9 3a02          	dec	_Task_1ms_NotCritical_cnt
 438                     ; 140 		pt_KeyScan_cnt++;
 440  00fb 3c00          	inc	_pt_KeyScan_cnt
 441  00fd               L111:
 442                     ; 142 }
 445  00fd 81            	ret	
 471                     ; 144 void 	Task_10ms_NotCritical(void)
 471                     ; 145 {
 472                     	switch	.text
 473  00fe               _Task_10ms_NotCritical:
 477                     ; 146 	if(Task_10ms_NotCritical_cnt>9)
 479  00fe b601          	ld	a,_Task_10ms_NotCritical_cnt
 480  0100 a10a          	cp	a,#10
 481  0102 250a          	jrult	L321
 482                     ; 148 		Task_10ms_NotCritical_cnt-=10;
 484  0104 b601          	ld	a,_Task_10ms_NotCritical_cnt
 485  0106 a00a          	sub	a,#10
 486  0108 b701          	ld	_Task_10ms_NotCritical_cnt,a
 487                     ; 151 		pt_MCL_Add_cnt++;
 489  010a 725c0013      	inc	_pt_MCL_Add_cnt
 490  010e               L321:
 491                     ; 154 }
 494  010e 81            	ret	
 569                     ; 182 void Check_Sensor(void)
 569                     ; 183 {
 570                     	switch	.text
 571  010f               _Check_Sensor:
 573  010f 5205          	subw	sp,#5
 574       00000005      OFST:	set	5
 577                     ; 186 	j=r=0;
 579  0111 0f02          	clr	(OFST-3,sp)
 581  0113 0f03          	clr	(OFST-2,sp)
 583                     ; 187 	m8=Ds18b20_SearchROM();
 585  0115 cd0000        	call	_Ds18b20_SearchROM
 587  0118 6b04          	ld	(OFST-1,sp),a
 589                     ; 188 	for(i=0;i<m8;i++){
 591  011a 0f05          	clr	(OFST+0,sp)
 594  011c 2033          	jra	L761
 595  011e               L361:
 596                     ; 189 		if(xCal_crc(&ROM_Buf[i][0],7)==ROM_Buf[i][7]){
 598  011e 97            	ld	xl,a
 599  011f a608          	ld	a,#8
 600  0121 42            	mul	x,a
 601  0122 e607          	ld	a,(_ROM_Buf+7,x)
 602  0124 6b01          	ld	(OFST-4,sp),a
 604  0126 4b07          	push	#7
 605  0128 7b06          	ld	a,(OFST+1,sp)
 606  012a 97            	ld	xl,a
 607  012b a608          	ld	a,#8
 608  012d 42            	mul	x,a
 609  012e 01            	rrwa	x,a
 610  012f ab00          	add	a,#_ROM_Buf
 611  0131 5f            	clrw	x
 612  0132 97            	ld	xl,a
 613  0133 cd0000        	call	_xCal_crc
 615  0136 5b01          	addw	sp,#1
 616  0138 1101          	cp	a,(OFST-4,sp)
 617  013a 2613          	jrne	L371
 618                     ; 190 			r|=(uint8_t)(1<<i);
 620  013c 7b05          	ld	a,(OFST+0,sp)
 621  013e 5f            	clrw	x
 622  013f 97            	ld	xl,a
 623  0140 a601          	ld	a,#1
 624  0142 5d            	tnzw	x
 625  0143 2704          	jreq	L421
 626  0145               L621:
 627  0145 48            	sll	a
 628  0146 5a            	decw	x
 629  0147 26fc          	jrne	L621
 630  0149               L421:
 631  0149 1a02          	or	a,(OFST-3,sp)
 632  014b 6b02          	ld	(OFST-3,sp),a
 634                     ; 191 			j++;
 636  014d 0c03          	inc	(OFST-2,sp)
 638  014f               L371:
 639                     ; 188 	for(i=0;i<m8;i++){
 641  014f 0c05          	inc	(OFST+0,sp)
 643  0151               L761:
 646  0151 7b05          	ld	a,(OFST+0,sp)
 647  0153 1104          	cp	a,(OFST-1,sp)
 648  0155 25c7          	jrult	L361
 649                     ; 194 	Sensors.Valid_Mark=r;
 651  0157 7b02          	ld	a,(OFST-3,sp)
 652  0159 c70010        	ld	_Sensors+3,a
 653                     ; 195 	Sensors.Valid_Num=j;
 655  015c 7b03          	ld	a,(OFST-2,sp)
 656  015e c7000d        	ld	_Sensors,a
 657                     ; 197 	m8=FLASH_ReadByte(EEPROM_ROMMASK_ADDRESS);
 659  0161 ae407f        	ldw	x,#16511
 660  0164 89            	pushw	x
 661  0165 5f            	clrw	x
 662  0166 89            	pushw	x
 663  0167 cd0000        	call	_FLASH_ReadByte
 665  016a 5b04          	addw	sp,#4
 667                     ; 198 	m80=m8;m8&=r;
 669  016c 6b03          	ld	(OFST-2,sp),a
 673  016e 1402          	and	a,(OFST-3,sp)
 674  0170 6b04          	ld	(OFST-1,sp),a
 676                     ; 199 	Sensors.Valid_Configured_Mark=m8;
 678  0172 c70011        	ld	_Sensors+4,a
 679                     ; 200 	r&=(uint8_t)(~m80);
 681  0175 7b03          	ld	a,(OFST-2,sp)
 682  0177 43            	cpl	a
 683  0178 1402          	and	a,(OFST-3,sp)
 684  017a 6b02          	ld	(OFST-3,sp),a
 686                     ; 201 	Sensors.Valid_NotConfigured_Mark=r;
 688  017c c70012        	ld	_Sensors+5,a
 689                     ; 202 	for(i=0,j=0;i<8;i++){
 691  017f 0f05          	clr	(OFST+0,sp)
 693  0181 0f03          	clr	(OFST-2,sp)
 695  0183               L571:
 696                     ; 203 		if(m8&0x01){
 698  0183 7b04          	ld	a,(OFST-1,sp)
 699  0185 a501          	bcp	a,#1
 700  0187 2702          	jreq	L302
 701                     ; 204 			j++;
 703  0189 0c03          	inc	(OFST-2,sp)
 705  018b               L302:
 706                     ; 206 		m8>>=1;
 708  018b 0404          	srl	(OFST-1,sp)
 710                     ; 202 	for(i=0,j=0;i<8;i++){
 712  018d 0c05          	inc	(OFST+0,sp)
 716  018f 7b05          	ld	a,(OFST+0,sp)
 717  0191 a108          	cp	a,#8
 718  0193 25ee          	jrult	L571
 719                     ; 208 	Sensors.Valid_Configured_Num=j;
 721  0195 7b03          	ld	a,(OFST-2,sp)
 722  0197 c7000e        	ld	_Sensors+1,a
 723                     ; 209 	Sensors.Valid_NotConfigured_Num=(uint8_t)(Sensors.Valid_Num-j);	
 725  019a c6000d        	ld	a,_Sensors
 726  019d 1003          	sub	a,(OFST-2,sp)
 727  019f c7000f        	ld	_Sensors+2,a
 728                     ; 210 }
 731  01a2 5b05          	addw	sp,#5
 732  01a4 81            	ret	
 735                     	bsct
 736  0000               L502_Sig_En:
 737  0000 01            	dc.b	1
 788                     ; 224 static void MCL_Mouse(uint8_t row,uint8_t column,uint8_t add_del)
 788                     ; 225 {
 789                     	switch	.text
 790  01a5               L112_MCL_Mouse:
 792  01a5 89            	pushw	x
 793       00000000      OFST:	set	0
 796                     ; 226 	if(add_del){
 798  01a6 7b05          	ld	a,(OFST+5,sp)
 799  01a8 2713          	jreq	L142
 800                     ; 227 		LCD_Print(row,column,">");
 802  01aa ae00be        	ldw	x,#L342
 803  01ad 89            	pushw	x
 804  01ae 7b04          	ld	a,(OFST+4,sp)
 805  01b0 97            	ld	xl,a
 806  01b1 7b03          	ld	a,(OFST+3,sp)
 807  01b3 95            	ld	xh,a
 808  01b4 cd0000        	call	_LCD_Print
 810  01b7 85            	popw	x
 811                     ; 228 		LCD_Print(row,(uint8_t)(column+30),"<");
 813  01b8 ae00bc        	ldw	x,#L542
 816  01bb 2011          	jra	L742
 817  01bd               L142:
 818                     ; 230 		LCD_Print(row,column," ");
 820  01bd ae00ba        	ldw	x,#L152
 821  01c0 89            	pushw	x
 822  01c1 7b04          	ld	a,(OFST+4,sp)
 823  01c3 97            	ld	xl,a
 824  01c4 7b03          	ld	a,(OFST+3,sp)
 825  01c6 95            	ld	xh,a
 826  01c7 cd0000        	call	_LCD_Print
 828  01ca 85            	popw	x
 829                     ; 231 		LCD_Print(row,(uint8_t)(column+30)," ");
 831  01cb ae00ba        	ldw	x,#L152
 833  01ce               L742:
 834  01ce 89            	pushw	x
 835  01cf 7b04          	ld	a,(OFST+4,sp)
 836  01d1 ab1e          	add	a,#30
 837  01d3 97            	ld	xl,a
 838  01d4 7b03          	ld	a,(OFST+3,sp)
 839  01d6 95            	ld	xh,a
 840  01d7 cd0000        	call	_LCD_Print
 841  01da 85            	popw	x
 842                     ; 233 }
 845  01db 85            	popw	x
 846  01dc 81            	ret	
 849                     	switch	.bss
 850  0000               L352_cnt:
 851  0000 00            	ds.b	1
 924                     ; 235 PT_THREAD(MCL_Add(void))
 924                     ; 236 {	
 925                     	switch	.text
 926  01dd               _MCL_Add:
 928  01dd 5205          	subw	sp,#5
 929       00000005      OFST:	set	5
 932                     ; 241 	PT_BEGIN(&pt_MCL_Add);
 936  01df ce0014        	ldw	x,_pt_MCL_Add
 938                     ; 419 	Sig_En|=Sig_MainLogic_En;	//启动调用程序
 939  01e2 273d          	jreq	L163
 940  01e4 1d00f2        	subw	x,#242
 941  01e7 273e          	jreq	L362
 942  01e9 1d0006        	subw	x,#6
 943  01ec 2754          	jreq	L562
 944  01ee 1d0008        	subw	x,#8
 945  01f1 2603cc028c    	jreq	L762
 946  01f6 1d0002        	subw	x,#2
 947  01f9 2603cc029d    	jreq	L172
 948  01fe 1d0017        	subw	x,#23
 949  0201 2603cc0367    	jreq	L372
 950  0206 1d0020        	subw	x,#32
 951  0209 2603cc0419    	jreq	L513
 952  020e 1d0021        	subw	x,#33
 953  0211 2603cc04fc    	jreq	L713
 954  0216 1d0018        	subw	x,#24
 955  0219 2603cc0559    	jreq	L123
 956  021e cc0566        	jra	L753
 957  0221               L163:
 958                     ; 242 	PT_WAIT_UNTIL(&pt_MCL_Add,(Sig_En&Sig_Add_En));		//等待启动信号
 960  0221 ae00f2        	ldw	x,#242
 961  0224 cf0014        	ldw	_pt_MCL_Add,x
 962  0227               L362:
 966  0227 7202000002    	btjt	L502_Sig_En,#1,L563
 969  022c 201b          	jp	LC001
 970  022e               L563:
 971                     ; 243 	KeyVal=V_KEY_NONE;	
 973  022e 35ff0001      	mov	_KeyVal,#255
 974                     ; 244 	LCD_Clear();
 976  0232 cd0000        	call	_LCD_Clear
 978                     ; 246 	Check_Sensor();
 980  0235 cd010f        	call	_Check_Sensor
 982                     ; 247 	pt_MCL_Add_cnt=0;
 984  0238 725f0013      	clr	_pt_MCL_Add_cnt
 985                     ; 248 	PT_WAIT_UNTIL(&pt_MCL_Add,pt_MCL_Add_cnt>5);	//等待50ms
 987  023c ae00f8        	ldw	x,#248
 988  023f cf0014        	ldw	_pt_MCL_Add,x
 989  0242               L562:
 993  0242 c60013        	ld	a,_pt_MCL_Add_cnt
 994  0245 a106          	cp	a,#6
 995  0247 2404          	jruge	L373
 998  0249               LC001:
1006  0249 4f            	clr	a
1008  024a               L672:
1010  024a 5b05          	addw	sp,#5
1011  024c 81            	ret	
1012  024d               L373:
1013                     ; 250 	LCD_Print(0,12,"检测到 个");
1015  024d ae00b0        	ldw	x,#L573
1016  0250 89            	pushw	x
1017  0251 ae000c        	ldw	x,#12
1018  0254 cd0000        	call	_LCD_Print
1020  0257 85            	popw	x
1021                     ; 251 	LCD_Print(12*1,12,"传感器");
1023  0258 ae00a9        	ldw	x,#L773
1024  025b 89            	pushw	x
1025  025c ae0c0c        	ldw	x,#3084
1026  025f cd0000        	call	_LCD_Print
1028  0262 85            	popw	x
1029                     ; 252 	LCD_Print_0to9DecNum(0,12+12*3,Sensors.Valid_Num);
1031  0263 3b000d        	push	_Sensors
1032  0266 ae0030        	ldw	x,#48
1033  0269 cd0000        	call	_LCD_Print_0to9DecNum
1035  026c ae009f        	ldw	x,#L104
1036  026f 84            	pop	a
1037                     ; 253 	LCD_Print(12*2,12," 个未配置");
1039  0270 89            	pushw	x
1040  0271 ae180c        	ldw	x,#6156
1041  0274 cd0000        	call	_LCD_Print
1043  0277 85            	popw	x
1044                     ; 254 	LCD_Print_0to9DecNum(12*2,12,Sensors.Valid_NotConfigured_Num);
1046  0278 3b000f        	push	_Sensors+2
1047  027b ae180c        	ldw	x,#6156
1048  027e cd0000        	call	_LCD_Print_0to9DecNum
1050  0281 725f0013      	clr	_pt_MCL_Add_cnt
1051  0285 ae0100        	ldw	x,#256
1052  0288 cf0014        	ldw	_pt_MCL_Add,x
1053  028b 84            	pop	a
1054                     ; 255 	pt_MCL_Add_cnt=0;
1056                     ; 256 	PT_WAIT_UNTIL(&pt_MCL_Add,pt_MCL_Add_cnt>200);	//等待1s
1058  028c               L762:
1062  028c c60013        	ld	a,_pt_MCL_Add_cnt
1063  028f a1c9          	cp	a,#201
1066  0291 25b6          	jrult	LC001
1067                     ; 257 	pt_MCL_Add_cnt=0;
1069  0293 725f0013      	clr	_pt_MCL_Add_cnt
1070                     ; 258 	PT_WAIT_UNTIL(&pt_MCL_Add,pt_MCL_Add_cnt>200);	//等待1s
1072  0297 ae0102        	ldw	x,#258
1073  029a cf0014        	ldw	_pt_MCL_Add,x
1074  029d               L172:
1078  029d c60013        	ld	a,_pt_MCL_Add_cnt
1079  02a0 a1c9          	cp	a,#201
1082  02a2 25a5          	jrult	LC001
1083                     ; 260 	LCD_Clear();
1085  02a4 cd0000        	call	_LCD_Clear
1087                     ; 261 	LCD_Print(0,12,"为传感器命名");
1089  02a7 ae0092        	ldw	x,#L714
1090  02aa 89            	pushw	x
1091  02ab ae000c        	ldw	x,#12
1092  02ae cd0000        	call	_LCD_Print
1094  02b1 85            	popw	x
1095                     ; 262 	LCD_Print(12*1,12,"ID:");	
1097  02b2 ae008e        	ldw	x,#L124
1098  02b5 89            	pushw	x
1099  02b6 ae0c0c        	ldw	x,#3084
1100  02b9 cd0000        	call	_LCD_Print
1102  02bc 85            	popw	x
1103                     ; 264 	for(i=0;i<8;i++){
1105  02bd 0f05          	clr	(OFST+0,sp)
1107  02bf               L324:
1108                     ; 265 		if(Sensors.Valid_NotConfigured_Mark&(1<<i)){
1110  02bf c60012        	ld	a,_Sensors+5
1111  02c2 5f            	clrw	x
1112  02c3 97            	ld	xl,a
1113  02c4 1f01          	ldw	(OFST-4,sp),x
1115  02c6 ae0001        	ldw	x,#1
1116  02c9 7b05          	ld	a,(OFST+0,sp)
1117  02cb 2704          	jreq	L271
1118  02cd               L471:
1119  02cd 58            	sllw	x
1120  02ce 4a            	dec	a
1121  02cf 26fc          	jrne	L471
1122  02d1               L271:
1123  02d1 01            	rrwa	x,a
1124  02d2 1402          	and	a,(OFST-3,sp)
1125  02d4 01            	rrwa	x,a
1126  02d5 1401          	and	a,(OFST-4,sp)
1127  02d7 01            	rrwa	x,a
1128  02d8 5d            	tnzw	x
1129  02d9 2608          	jrne	L724
1130                     ; 266 			break;
1132                     ; 264 	for(i=0;i<8;i++){
1134  02db 0c05          	inc	(OFST+0,sp)
1138  02dd 7b05          	ld	a,(OFST+0,sp)
1139  02df a108          	cp	a,#8
1140  02e1 25dc          	jrult	L324
1141  02e3               L724:
1142                     ; 269 	LCD_Print_HexNum(12*2,6*1,ROM_Buf[i][6]);
1144  02e3 7b05          	ld	a,(OFST+0,sp)
1145  02e5 cd056f        	call	LC004
1146  02e8 e606          	ld	a,(_ROM_Buf+6,x)
1147  02ea 88            	push	a
1148  02eb ae1806        	ldw	x,#6150
1149  02ee cd0000        	call	_LCD_Print_HexNum
1151  02f1 84            	pop	a
1152                     ; 270 	LCD_Print_HexNum(12*2,6*3,ROM_Buf[i][5]);
1154  02f2 7b05          	ld	a,(OFST+0,sp)
1155  02f4 cd056f        	call	LC004
1156  02f7 e605          	ld	a,(_ROM_Buf+5,x)
1157  02f9 88            	push	a
1158  02fa ae1812        	ldw	x,#6162
1159  02fd cd0000        	call	_LCD_Print_HexNum
1161  0300 84            	pop	a
1162                     ; 271 	LCD_Print_HexNum(12*2,6*5,ROM_Buf[i][4]);	
1164  0301 7b05          	ld	a,(OFST+0,sp)
1165  0303 cd056f        	call	LC004
1166  0306 e604          	ld	a,(_ROM_Buf+4,x)
1167  0308 88            	push	a
1168  0309 ae181e        	ldw	x,#6174
1169  030c cd0000        	call	_LCD_Print_HexNum
1171  030f 84            	pop	a
1172                     ; 272 	LCD_Print_HexNum(12*2,6*7,ROM_Buf[i][3]);
1174  0310 7b05          	ld	a,(OFST+0,sp)
1175  0312 cd056f        	call	LC004
1176  0315 e603          	ld	a,(_ROM_Buf+3,x)
1177  0317 88            	push	a
1178  0318 ae182a        	ldw	x,#6186
1179  031b cd0000        	call	_LCD_Print_HexNum
1181  031e 84            	pop	a
1182                     ; 273 	LCD_Print_HexNum(12*2,6*9,ROM_Buf[i][2]);
1184  031f 7b05          	ld	a,(OFST+0,sp)
1185  0321 cd056f        	call	LC004
1186  0324 e602          	ld	a,(_ROM_Buf+2,x)
1187  0326 88            	push	a
1188  0327 ae1836        	ldw	x,#6198
1189  032a cd0000        	call	_LCD_Print_HexNum
1191  032d 84            	pop	a
1192                     ; 274 	LCD_Print_HexNum(12*2,6*11,ROM_Buf[i][1]);
1194  032e 7b05          	ld	a,(OFST+0,sp)
1195  0330 cd056f        	call	LC004
1196  0333 e601          	ld	a,(_ROM_Buf+1,x)
1197  0335 88            	push	a
1198  0336 ae1842        	ldw	x,#6210
1199  0339 cd0000        	call	_LCD_Print_HexNum
1201  033c 84            	pop	a
1202                     ; 276 	for(j=0;j<8;j++){
1204  033d 4f            	clr	a
1205  033e 6b04          	ld	(OFST-1,sp),a
1207  0340               L334:
1208                     ; 277 		SensorConfigData.ROM_ID[j]=ROM_Buf[i][j];
1210  0340 5f            	clrw	x
1211  0341 97            	ld	xl,a
1212  0342 89            	pushw	x
1213  0343 7b07          	ld	a,(OFST+2,sp)
1214  0345 cd056f        	call	LC004
1215  0348 01            	rrwa	x,a
1216  0349 1b06          	add	a,(OFST+1,sp)
1217  034b 2401          	jrnc	L212
1218  034d 5c            	incw	x
1219  034e               L212:
1220  034e 02            	rlwa	x,a
1221  034f e600          	ld	a,(_ROM_Buf,x)
1222  0351 85            	popw	x
1223  0352 d70003        	ld	(_SensorConfigData+1,x),a
1224                     ; 276 	for(j=0;j<8;j++){
1226  0355 0c04          	inc	(OFST-1,sp)
1230  0357 7b04          	ld	a,(OFST-1,sp)
1231  0359 a108          	cp	a,#8
1232  035b 25e3          	jrult	L334
1233                     ; 280 	pt_MCL_Add_cnt=0;
1235  035d 725f0013      	clr	_pt_MCL_Add_cnt
1236                     ; 281 	PT_WAIT_UNTIL(&pt_MCL_Add,pt_MCL_Add_cnt>5);	//等待50ms	
1238  0361 ae0119        	ldw	x,#281
1239  0364 cf0014        	ldw	_pt_MCL_Add,x
1240  0367               L372:
1244  0367 c60013        	ld	a,_pt_MCL_Add_cnt
1245  036a a106          	cp	a,#6
1248  036c 2403cc0249    	jrult	LC001
1249                     ; 282 	LCD_Print(12*3,6*2,"<        >");
1251  0371 ae0083        	ldw	x,#L744
1252  0374 89            	pushw	x
1253  0375 ae240c        	ldw	x,#9228
1254  0378 cd0000        	call	_LCD_Print
1256  037b 35010000      	mov	L352_cnt,#1
1257  037f 85            	popw	x
1258                     ; 285 	cnt=1;
1260  0380               L154:
1261                     ; 288 		switch(cnt){
1263  0380 c60000        	ld	a,L352_cnt
1265                     ; 306 			default	:	cnt=1;	break;
1266  0383 2711          	jreq	L572
1267  0385 4a            	dec	a
1268  0386 2714          	jreq	L772
1269  0388 4a            	dec	a
1270  0389 2716          	jreq	L103
1271  038b 4a            	dec	a
1272  038c 2718          	jreq	L303
1273  038e 4a            	dec	a
1274  038f 271a          	jreq	L503
1275  0391 4a            	dec	a
1276  0392 2724          	jreq	L703
1280  0394 2027          	jp	L113
1281  0396               L572:
1282                     ; 289 			case	0:	cnt=5;break;
1284  0396 35050000      	mov	L352_cnt,#5
1287  039a 2025          	jra	L754
1288  039c               L772:
1289                     ; 290 			case	1:	//if(Sensors.Valid_NotConfigured_Mark&0x01)	{
1289                     ; 291 									LCD_Print(12*3,6*5,"大车");	break;
1291  039c ae007e        	ldw	x,#L164
1295  039f 200d          	jp	LC003
1296  03a1               L103:
1297                     ; 293 			case	2:	//if(Sensors.Valid_NotConfigured_Mark&0x02)	{
1297                     ; 294 									LCD_Print(12*3,6*5,"小车");	break;
1299  03a1 ae0079        	ldw	x,#L364
1303  03a4 2008          	jp	LC003
1304  03a6               L303:
1305                     ; 296 			case	3:	//if(Sensors.Valid_NotConfigured_Mark&0x04)	{
1305                     ; 297 									LCD_Print(12*3,6*5,"起升");	break;
1307  03a6 ae0074        	ldw	x,#L564
1311  03a9 2003          	jp	LC003
1312  03ab               L503:
1313                     ; 299 			case	4:	//if(Sensors.Valid_NotConfigured_Mark&0x08)	{
1313                     ; 300 									LCD_Print(12*3,6*5,"开闭");	break;
1315  03ab ae006f        	ldw	x,#L764
1317  03ae               LC003:
1318  03ae 89            	pushw	x
1319  03af ae241e        	ldw	x,#9246
1320  03b2 cd0000        	call	_LCD_Print
1321  03b5 85            	popw	x
1324  03b6 2009          	jra	L754
1325  03b8               L703:
1326                     ; 302 			case	5:	//if(Sensors.Valid_NotConfigured_Mark&0x10)	{
1326                     ; 303 									LCD_Print(12*3,6*5,"俯仰");	break;
1328  03b8 ae006a        	ldw	x,#L174
1332  03bb 20f1          	jp	LC003
1333  03bd               L113:
1334                     ; 305 			case	6:	cnt=1;	break;		
1337  03bd 35010000      	mov	L352_cnt,#1
1340  03c1               L754:
1341                     ; 308 		if(KeyVal==V_KEY1)	cnt--;
1343  03c1 c60001        	ld	a,_KeyVal
1344  03c4 a101          	cp	a,#1
1345  03c6 2604          	jrne	L374
1348  03c8 725a0000      	dec	L352_cnt
1349  03cc               L374:
1350                     ; 309 		if(KeyVal==V_KEY3)	cnt++;
1352  03cc a103          	cp	a,#3
1353  03ce 2604          	jrne	L574
1356  03d0 725c0000      	inc	L352_cnt
1357  03d4               L574:
1358                     ; 310 		if(KeyVal==V_KEY2)	{KeyVal=V_KEY_NONE;	break;}
1360  03d4 a102          	cp	a,#2
1361  03d6 2633          	jrne	L774
1364  03d8 35ff0001      	mov	_KeyVal,#255
1366                     ; 316 	SensorConfigData.Name_ID=cnt;
1368  03dc 5500000002    	mov	_SensorConfigData,L352_cnt
1369                     ; 318 	LCD_Clear();
1371  03e1 cd0000        	call	_LCD_Clear
1373                     ; 319 	LCD_Print(12*1,6*1,"设置报警温度");
1375  03e4 ae005d        	ldw	x,#L705
1376  03e7 89            	pushw	x
1377  03e8 ae0c06        	ldw	x,#3078
1378  03eb cd0000        	call	_LCD_Print
1380  03ee 85            	popw	x
1381                     ; 320 	LCD_Print(12*3,6*2,"-  30    +");
1383  03ef ae0052        	ldw	x,#L115
1384  03f2 89            	pushw	x
1385  03f3 ae240c        	ldw	x,#9228
1386  03f6 cd0000        	call	_LCD_Print
1388  03f9 85            	popw	x
1389                     ; 321 	LCD_Print(12*3,6*7,pSheshidu);	
1391  03fa ce0000        	ldw	x,_pSheshidu
1392  03fd 89            	pushw	x
1393  03fe ae242a        	ldw	x,#9258
1394  0401 cd0000        	call	_LCD_Print
1396  0404 351e0000      	mov	L352_cnt,#30
1397  0408 85            	popw	x
1398                     ; 323 	cnt=30;
1400  0409 201b          	jra	L315
1401  040b               L774:
1402                     ; 311 		KeyVal=V_KEY_NONE;	//清除按键
1404  040b 35ff0001      	mov	_KeyVal,#255
1405                     ; 312 		pt_MCL_Add_cnt=0;
1407  040f 725f0013      	clr	_pt_MCL_Add_cnt
1408                     ; 313 		PT_WAIT_UNTIL(&pt_MCL_Add,pt_MCL_Add_cnt>5);	//等待50ms		
1410  0413 ae0139        	ldw	x,#313
1411  0416 cf0014        	ldw	_pt_MCL_Add,x
1412  0419               L513:
1416  0419 c60013        	ld	a,_pt_MCL_Add_cnt
1417  041c a106          	cp	a,#6
1418  041e 2503cc0380    	jruge	L154
1421  0423 cc0249        	jp	LC001
1422  0426               L315:
1423                     ; 325 		if(KeyVal==V_KEY1)	cnt--;
1425  0426 c60001        	ld	a,_KeyVal
1426  0429 a101          	cp	a,#1
1427  042b 2604          	jrne	L715
1430  042d 725a0000      	dec	L352_cnt
1431  0431               L715:
1432                     ; 326 		if(KeyVal==V_KEY3)	cnt++;
1434  0431 a103          	cp	a,#3
1435  0433 2604          	jrne	L125
1438  0435 725c0000      	inc	L352_cnt
1439  0439               L125:
1440                     ; 327 		if(KeyVal==V_KEY2)	{KeyVal=V_KEY_NONE;	break;}
1442  0439 a102          	cp	a,#2
1443  043b 264b          	jrne	L325
1446  043d 35ff0001      	mov	_KeyVal,#255
1448                     ; 348 	SensorConfigData.TH=cnt;
1450  0441 550000000b    	mov	_SensorConfigData+9,L352_cnt
1451                     ; 350 	LCD_Clear();
1453  0446 cd0000        	call	_LCD_Clear
1455                     ; 351 	LCD_Print(12*1,6*3,"报警设置");
1457  0449 ae0049        	ldw	x,#L545
1458  044c 89            	pushw	x
1459  044d ae0c12        	ldw	x,#3090
1460  0450 cd0000        	call	_LCD_Print
1462  0453 85            	popw	x
1463                     ; 352 	LCD_Print(12*2,6*4,"< 开 >");
1465  0454 ae0042        	ldw	x,#L745
1466  0457 89            	pushw	x
1467  0458 ae1818        	ldw	x,#6168
1468  045b cd0000        	call	_LCD_Print
1470  045e 85            	popw	x
1471                     ; 353 	LCD_Print(12*3,6*5,"确定 改变");
1473  045f ae0038        	ldw	x,#L155
1474  0462 89            	pushw	x
1475  0463 ae241e        	ldw	x,#9246
1476  0466 cd0000        	call	_LCD_Print
1478  0469 35010000      	mov	L352_cnt,#1
1479  046d 85            	popw	x
1480                     ; 354 	cnt=1;
1482  046e               L355:
1483                     ; 356 		if(KeyVal==V_KEY3)	{
1485  046e c60001        	ld	a,_KeyVal
1486  0471 a103          	cp	a,#3
1487  0473 2703cc050d    	jrne	L755
1488                     ; 357 			if(cnt){
1490  0478 725d0000      	tnz	L352_cnt
1491  047c 2603cc0509    	jreq	L165
1492                     ; 358 				cnt=0;
1494  0481 725f0000      	clr	L352_cnt
1496  0485 cc050d        	jra	L755
1497  0488               L325:
1498                     ; 329 		if(cnt<20)	cnt=20;
1500  0488 c60000        	ld	a,L352_cnt
1501  048b a114          	cp	a,#20
1502  048d 2405          	jruge	L525
1505  048f a614          	ld	a,#20
1506  0491 c70000        	ld	L352_cnt,a
1507  0494               L525:
1508                     ; 330 		if(cnt>49)	cnt=49;
1510  0494 a132          	cp	a,#50
1511  0496 2505          	jrult	L725
1514  0498 a631          	ld	a,#49
1515  049a c70000        	ld	L352_cnt,a
1516  049d               L725:
1517                     ; 331 		if(cnt>=20&&cnt<30){
1519  049d a114          	cp	a,#20
1520  049f 2518          	jrult	L135
1522  04a1 a11e          	cp	a,#30
1523  04a3 2414          	jruge	L135
1524                     ; 332 			LCD_Print_0to9DecNum(12*3,6*5,2);
1526  04a5 4b02          	push	#2
1527  04a7 ae241e        	ldw	x,#9246
1528  04aa cd0000        	call	_LCD_Print_0to9DecNum
1530  04ad 84            	pop	a
1531                     ; 333 			LCD_Print_0to9DecNum(12*3,6*6,(uint8_t)(cnt-20));			
1533  04ae c60000        	ld	a,L352_cnt
1534  04b1 a014          	sub	a,#20
1535  04b3 cd0574        	call	LC005
1536  04b6 c60000        	ld	a,L352_cnt
1537  04b9               L135:
1538                     ; 335 		if(cnt>=30&&cnt<40){
1540  04b9 a11e          	cp	a,#30
1541  04bb 2518          	jrult	L335
1543  04bd a128          	cp	a,#40
1544  04bf 2414          	jruge	L335
1545                     ; 336 			LCD_Print_0to9DecNum(12*3,6*5,3);
1547  04c1 4b03          	push	#3
1548  04c3 ae241e        	ldw	x,#9246
1549  04c6 cd0000        	call	_LCD_Print_0to9DecNum
1551  04c9 84            	pop	a
1552                     ; 337 			LCD_Print_0to9DecNum(12*3,6*6,(uint8_t)(cnt-30));
1554  04ca c60000        	ld	a,L352_cnt
1555  04cd a01e          	sub	a,#30
1556  04cf cd0574        	call	LC005
1557  04d2 c60000        	ld	a,L352_cnt
1558  04d5               L335:
1559                     ; 339 		if(cnt>=40&&cnt<50){
1561  04d5 a128          	cp	a,#40
1562  04d7 2515          	jrult	L535
1564  04d9 a132          	cp	a,#50
1565  04db 2411          	jruge	L535
1566                     ; 340 			LCD_Print_0to9DecNum(12*3,6*5,4);
1568  04dd 4b04          	push	#4
1569  04df ae241e        	ldw	x,#9246
1570  04e2 cd0000        	call	_LCD_Print_0to9DecNum
1572  04e5 84            	pop	a
1573                     ; 341 			LCD_Print_0to9DecNum(12*3,6*6,(uint8_t)(cnt-40));
1575  04e6 c60000        	ld	a,L352_cnt
1576  04e9 a028          	sub	a,#40
1577  04eb cd0574        	call	LC005
1578  04ee               L535:
1579                     ; 344 		KeyVal=V_KEY_NONE;	//清除按键
1581  04ee 35ff0001      	mov	_KeyVal,#255
1582                     ; 345 		pt_MCL_Add_cnt=0;
1584  04f2 725f0013      	clr	_pt_MCL_Add_cnt
1585                     ; 346 		PT_WAIT_UNTIL(&pt_MCL_Add,pt_MCL_Add_cnt>5);	//等待50ms
1587  04f6 ae015a        	ldw	x,#346
1588  04f9 cf0014        	ldw	_pt_MCL_Add,x
1589  04fc               L713:
1593  04fc c60013        	ld	a,_pt_MCL_Add_cnt
1594  04ff a106          	cp	a,#6
1595  0501 2503cc0426    	jruge	L315
1598  0506 cc0249        	jp	LC001
1599  0509               L165:
1600                     ; 360 				cnt=1;
1602  0509 35010000      	mov	L352_cnt,#1
1603  050d               L755:
1604                     ; 363 		if(KeyVal==V_KEY2)	{KeyVal=V_KEY_NONE;	break;}
1606  050d a102          	cp	a,#2
1607  050f 2625          	jrne	L565
1610  0511 35ff0001      	mov	_KeyVal,#255
1612                     ; 372 	SensorConfigData.AlarmSet=cnt;
1614  0515 550000000c    	mov	_SensorConfigData+10,L352_cnt
1615                     ; 374 	LCD_Clear();
1617  051a cd0000        	call	_LCD_Clear
1619                     ; 375 	LCD_Print(12*1,6*0,"保存数据中...");
1621  051d ae0024        	ldw	x,#L506
1622  0520 89            	pushw	x
1623  0521 ae0c00        	ldw	x,#3072
1624  0524 cd0000        	call	_LCD_Print
1626  0527 72130000      	bres	L502_Sig_En,#1
1627  052b 35200000      	mov	L702_Config_Func,#32
1628  052f 85            	popw	x
1629  0530 72100000      	bset	L502_Sig_En,#0
1630                     ; 417 	Sig_En&=(uint8_t)(~Sig_Add_En);	//禁止本程序再次启动
1632                     ; 418 	Config_Func=FUNC_LOGO;	//配置调用程序
1634                     ; 419 	Sig_En|=Sig_MainLogic_En;	//启动调用程序
1636  0534 2030          	jra	L753
1637  0536               L565:
1638                     ; 365 		if(cnt)		LCD_Print(12*2,6*6,"开");
1640  0536 c60000        	ld	a,L352_cnt
1641  0539 2705          	jreq	L765
1644  053b ae0035        	ldw	x,#L175
1647  053e 2003          	jra	L375
1648  0540               L765:
1649                     ; 366 		else			LCD_Print(12*2,6*6,"关");
1651  0540 ae0032        	ldw	x,#L575
1653  0543               L375:
1654  0543 89            	pushw	x
1655  0544 ae1824        	ldw	x,#6180
1656  0547 cd0000        	call	_LCD_Print
1657  054a 35ff0001      	mov	_KeyVal,#255
1658  054e 725f0013      	clr	_pt_MCL_Add_cnt
1659  0552 85            	popw	x
1660                     ; 368 		KeyVal=V_KEY_NONE;	//清除按键
1662                     ; 369 		pt_MCL_Add_cnt=0;
1664                     ; 370 		PT_WAIT_UNTIL(&pt_MCL_Add,pt_MCL_Add_cnt>5);	//等待50ms
1666  0553 ae0172        	ldw	x,#370
1667  0556 cf0014        	ldw	_pt_MCL_Add,x
1668  0559               L123:
1672  0559 c60013        	ld	a,_pt_MCL_Add_cnt
1673  055c a106          	cp	a,#6
1674  055e 2503cc046e    	jruge	L355
1677  0563 cc0249        	jp	LC001
1678  0566               L753:
1679                     ; 420 	PT_END(&pt_MCL_Add);
1684  0566 5f            	clrw	x
1685  0567 cf0014        	ldw	_pt_MCL_Add,x
1689  056a a602          	ld	a,#2
1691  056c cc024a        	jra	L672
1692  056f               LC004:
1693  056f 97            	ld	xl,a
1694  0570 a608          	ld	a,#8
1695  0572 42            	mul	x,a
1696  0573 81            	ret	
1697  0574               LC005:
1698  0574 88            	push	a
1699  0575 ae2424        	ldw	x,#9252
1700  0578 cd0000        	call	_LCD_Print_0to9DecNum
1702  057b 84            	pop	a
1703  057c 81            	ret	
1706                     	switch	.bss
1707  0001               L706_flag:
1708  0001 00            	ds.b	1
1750                     ; 423 void Main_Control_Logic(void)
1750                     ; 424 {		
1751                     	switch	.text
1752  057d               _Main_Control_Logic:
1756                     ; 427 		if((Sig_En&Sig_MainLogic_En)==0){
1758  057d 7200000001    	btjt	L502_Sig_En,#0,L756
1759                     ; 428 			return;			//有子程序在运行，禁止以下程序运行
1762  0582 81            	ret	
1763  0583               L756:
1764                     ; 430 		switch(Mode){
1766  0583 c60000        	ld	a,_Mode
1768                     ; 541 			default	:break;
1769  0586 4a            	dec	a
1770  0587 270b          	jreq	L116
1771  0589 4a            	dec	a
1772  058a 2717          	jreq	L316
1773  058c a00f          	sub	a,#15
1774  058e 2603cc073b    	jreq	L336
1776  0593 81            	ret	
1777  0594               L116:
1778                     ; 431 			case	MODE_NORMAL:	
1778                     ; 432 						if(KeyVal==V_KEY2){
1780  0594 c60001        	ld	a,_KeyVal
1781  0597 a102          	cp	a,#2
1782  0599 2703cc074e    	jrne	L366
1783                     ; 434 							Mode=MODE_PREPROCESSING;
1785  059e 35110000      	mov	_Mode,#17
1787  05a2 81            	ret	
1788  05a3               L316:
1789                     ; 437 			case	MODE_CONFIG:						
1789                     ; 438 						switch(Config_Func) {
1791  05a3 b600          	ld	a,L702_Config_Func
1793                     ; 528 							default : break;
1794  05a5 4a            	dec	a
1795  05a6 2720          	jreq	L516
1796  05a8 4a            	dec	a
1797  05a9 2764          	jreq	L716
1798  05ab a002          	sub	a,#2
1799  05ad 2603cc063a    	jreq	L126
1800  05b2 a004          	sub	a,#4
1801  05b4 2603cc0665    	jreq	L326
1802  05b9 a008          	sub	a,#8
1803  05bb 2603cc06b0    	jreq	L526
1804  05c0 a010          	sub	a,#16
1805  05c2 2603cc06ed    	jreq	L726
1807  05c7 81            	ret	
1808  05c8               L516:
1809                     ; 439 							case	FUNC_ADD:	
1809                     ; 440 									if((flag&0x02)==0){	//只执行1次
1811  05c8 720200010d    	btjt	L706_flag,#1,L376
1812                     ; 441 										flag|=0x02;	
1814  05cd 72120001      	bset	L706_flag,#1
1815                     ; 442 										MCL_Mouse(12*1,6*0,1);	//打印自身光标
1817  05d1 4b01          	push	#1
1818  05d3 ae0c00        	ldw	x,#3072
1819  05d6 cd01a5        	call	L112_MCL_Mouse
1821  05d9 84            	pop	a
1822  05da               L376:
1823                     ; 444 									if(KeyVal==V_KEY3){																
1825  05da c60001        	ld	a,_KeyVal
1826  05dd a103          	cp	a,#3
1827  05df 2606          	jrne	L576
1828                     ; 445 										Config_Func=FUNC_DEL;
1830  05e1 35020000      	mov	L702_Config_Func,#2
1831                     ; 446 										MCL_Mouse(12*1,6*0,0);		//清除自身的光标	
1833                     ; 447 										flag&=(uint8_t)(~0x02);	//允许再次打印光标
1836  05e5 2008          	jp	LC006
1837  05e7               L576:
1838                     ; 448 									}else if(KeyVal==V_KEY1){																
1840  05e7 a101          	cp	a,#1
1841  05e9 2613          	jrne	L107
1842                     ; 449 													Config_Func=FUNC_RESET;		
1844  05eb 35080000      	mov	L702_Config_Func,#8
1845                     ; 450 													MCL_Mouse(12*1,6*0,0);		//清除自身的光标	
1848  05ef               LC006:
1850  05ef 4b00          	push	#0
1851  05f1 ae0c00        	ldw	x,#3072
1852  05f4 cd01a5        	call	L112_MCL_Mouse
1853  05f7 72130001      	bres	L706_flag,#1
1854  05fb 84            	pop	a
1855                     ; 451 													flag&=(uint8_t)(~0x02);	//允许再次打印光标
1858  05fc 200c          	jra	L776
1859  05fe               L107:
1860                     ; 452 									}else if(KeyVal==V_KEY2){																						
1862  05fe a102          	cp	a,#2
1863  0600 2608          	jrne	L776
1864                     ; 453 													Sig_En|=Sig_Add_En;		//启动MCL_Add()
1866  0602 72120000      	bset	L502_Sig_En,#1
1867                     ; 454 													Sig_En&=(uint8_t)(~Sig_MainLogic_En);	//禁用本程序
1869  0606 72110000      	bres	L502_Sig_En,#0
1870  060a               L776:
1871                     ; 457 									KeyVal=V_KEY_NONE;
1873  060a 35ff0001      	mov	_KeyVal,#255
1874                     ; 458 									break;
1877  060e 81            	ret	
1878  060f               L716:
1879                     ; 459 							case	FUNC_DEL:	
1879                     ; 460 									MCL_Mouse(12*1,6*8,1);	//打印自身光标
1881  060f 4b01          	push	#1
1882  0611 ae0c30        	ldw	x,#3120
1883  0614 cd01a5        	call	L112_MCL_Mouse
1885  0617 84            	pop	a
1886                     ; 461 									if(KeyVal==V_KEY3){																
1888  0618 c60001        	ld	a,_KeyVal
1889  061b a103          	cp	a,#3
1890  061d 2606          	jrne	L707
1891                     ; 462 										Config_Func=FUNC_CHANGE;				
1893  061f 35040000      	mov	L702_Config_Func,#4
1894                     ; 463 										MCL_Mouse(12*1,6*8,0);		//清除自身的光标	
1897  0623 2007          	jp	LC007
1898  0625               L707:
1899                     ; 464 									}else if(KeyVal==V_KEY1){																
1901  0625 4a            	dec	a
1902  0626 260d          	jrne	L317
1903                     ; 465 										Config_Func=FUNC_ADD;					
1905  0628 35010000      	mov	L702_Config_Func,#1
1906                     ; 466 										MCL_Mouse(12*1,6*8,0);		//清除自身的光标	
1909  062c               LC007:
1911  062c 4b00          	push	#0
1912  062e ae0c30        	ldw	x,#3120
1913  0631 cd01a5        	call	L112_MCL_Mouse
1914  0634 84            	pop	a
1916  0635               L317:
1917                     ; 467 									}else if(KeyVal==V_KEY2){
1919                     ; 470 									KeyVal=V_KEY_NONE;
1921  0635 35ff0001      	mov	_KeyVal,#255
1922                     ; 471 									break;
1925  0639 81            	ret	
1926  063a               L126:
1927                     ; 472 							case	FUNC_CHANGE:	
1927                     ; 473 									MCL_Mouse(12*2,6*8,1);	//打印自身光标							
1929  063a 4b01          	push	#1
1930  063c ae1830        	ldw	x,#6192
1931  063f cd01a5        	call	L112_MCL_Mouse
1933  0642 84            	pop	a
1934                     ; 474 									if(KeyVal==V_KEY3){																
1936  0643 c60001        	ld	a,_KeyVal
1937  0646 a103          	cp	a,#3
1938  0648 2606          	jrne	L127
1939                     ; 475 										Config_Func=FUNC_RETURN;
1941  064a 35100000      	mov	L702_Config_Func,#16
1942                     ; 476 										MCL_Mouse(12*2,6*8,0);		//清除自身的光标																			
1945  064e 2007          	jp	LC008
1946  0650               L127:
1947                     ; 477 									}else if(KeyVal==V_KEY1){																
1949  0650 4a            	dec	a
1950  0651 260d          	jrne	L527
1951                     ; 478 										Config_Func=FUNC_DEL;		
1953  0653 35020000      	mov	L702_Config_Func,#2
1954                     ; 479 										MCL_Mouse(12*2,6*8,0);		//清除自身的光标																			
1957  0657               LC008:
1959  0657 4b00          	push	#0
1960  0659 ae1830        	ldw	x,#6192
1961  065c cd01a5        	call	L112_MCL_Mouse
1962  065f 84            	pop	a
1964  0660               L527:
1965                     ; 480 									}else if(KeyVal==V_KEY2){
1967                     ; 483 									KeyVal=V_KEY_NONE;
1969  0660 35ff0001      	mov	_KeyVal,#255
1970                     ; 484 									break;
1973  0664 81            	ret	
1974  0665               L326:
1975                     ; 485 							case	FUNC_RESET:		
1975                     ; 486 									MCL_Mouse(12*2,6*0,1);	//打印自身光标
1977  0665 4b01          	push	#1
1978  0667 ae1800        	ldw	x,#6144
1979  066a cd01a5        	call	L112_MCL_Mouse
1981  066d 84            	pop	a
1982                     ; 487 									if(KeyVal==V_KEY3){																
1984  066e c60001        	ld	a,_KeyVal
1985  0671 a103          	cp	a,#3
1986  0673 2606          	jrne	L337
1987                     ; 488 										Config_Func=FUNC_ADD;	
1989  0675 35010000      	mov	L702_Config_Func,#1
1990                     ; 489 										MCL_Mouse(12*2,6*0,0);		//清除自身的光标																			
1993  0679 2008          	jp	LC009
1994  067b               L337:
1995                     ; 490 									}else if(KeyVal==V_KEY1){																
1997  067b a101          	cp	a,#1
1998  067d 260f          	jrne	L737
1999                     ; 491 										Config_Func=FUNC_RETURN;			
2001  067f 35100000      	mov	L702_Config_Func,#16
2002                     ; 492 										MCL_Mouse(12*2,6*0,0);		//清除自身的光标																		
2005  0683               LC009:
2007  0683 4b00          	push	#0
2008  0685 ae1800        	ldw	x,#6144
2009  0688 cd01a5        	call	L112_MCL_Mouse
2010  068b 84            	pop	a
2012  068c 201d          	jra	L537
2013  068e               L737:
2014                     ; 493 									}else if(KeyVal==V_KEY2){
2016  068e a102          	cp	a,#2
2017  0690 2619          	jrne	L537
2018                     ; 494 										KeyVal=V_KEY_NONE;
2020  0692 35ff0001      	mov	_KeyVal,#255
2021                     ; 495 										FLASH_Unlock(FLASH_MEMTYPE_DATA);
2023  0696 a6f7          	ld	a,#247
2024  0698 cd0000        	call	_FLASH_Unlock
2026                     ; 496 										FLASH_EraseByte(EEPROM_ROMMASK_ADDRESS);		//清除
2028  069b ae407f        	ldw	x,#16511
2029  069e 89            	pushw	x
2030  069f 5f            	clrw	x
2031  06a0 89            	pushw	x
2032  06a1 cd0000        	call	_FLASH_EraseByte
2034  06a4 5b04          	addw	sp,#4
2035                     ; 497 										FLASH_Lock(FLASH_MEMTYPE_DATA);
2037  06a6 a6f7          	ld	a,#247
2038  06a8 cd0000        	call	_FLASH_Lock
2040  06ab               L537:
2041                     ; 500 									KeyVal=V_KEY_NONE;
2043  06ab 35ff0001      	mov	_KeyVal,#255
2044                     ; 501 									break;
2047  06af 81            	ret	
2048  06b0               L526:
2049                     ; 502 							case	FUNC_RETURN:	
2049                     ; 503 									MCL_Mouse(12*3,6*4,1);	//打印自身光标																	
2051  06b0 4b01          	push	#1
2052  06b2 ae2418        	ldw	x,#9240
2053  06b5 cd01a5        	call	L112_MCL_Mouse
2055  06b8 84            	pop	a
2056                     ; 504 									if(KeyVal==V_KEY3){																
2058  06b9 c60001        	ld	a,_KeyVal
2059  06bc a103          	cp	a,#3
2060  06be 2606          	jrne	L547
2061                     ; 505 										Config_Func=FUNC_RESET;	
2063  06c0 35080000      	mov	L702_Config_Func,#8
2064                     ; 506 										MCL_Mouse(12*3,6*4,0);		//清除自身的光标																			
2067  06c4 2008          	jp	LC010
2068  06c6               L547:
2069                     ; 507 									}else if(KeyVal==V_KEY1){		
2071  06c6 a101          	cp	a,#1
2072  06c8 260f          	jrne	L157
2073                     ; 508 										Config_Func=FUNC_CHANGE;			
2075  06ca 35040000      	mov	L702_Config_Func,#4
2076                     ; 509 										MCL_Mouse(12*3,6*4,0);		//清除自身的光标																			
2079  06ce               LC010:
2081  06ce 4b00          	push	#0
2082  06d0 ae2418        	ldw	x,#9240
2083  06d3 cd01a5        	call	L112_MCL_Mouse
2084  06d6 84            	pop	a
2086  06d7 200f          	jra	L747
2087  06d9               L157:
2088                     ; 510 									}else if(KeyVal==V_KEY2){
2090  06d9 a102          	cp	a,#2
2091  06db 260b          	jrne	L747
2092                     ; 511 										flag=0;
2094  06dd 725f0001      	clr	L706_flag
2095                     ; 512 										LCD_Clear();
2097  06e1 cd0000        	call	_LCD_Clear
2099                     ; 513 										Mode=MODE_NORMAL;																	
2101  06e4 35010000      	mov	_Mode,#1
2102  06e8               L747:
2103                     ; 515 									KeyVal=V_KEY_NONE;
2105  06e8 35ff0001      	mov	_KeyVal,#255
2106                     ; 516 									break;
2109  06ec 81            	ret	
2110  06ed               L726:
2111                     ; 517 							case	FUNC_LOGO:	
2111                     ; 518 									LCD_Clear();
2113  06ed cd0000        	call	_LCD_Clear
2115                     ; 519 									LCD_Print(0,12,"传感器配置");
2117  06f0 ae0019        	ldw	x,#L757
2118  06f3 89            	pushw	x
2119  06f4 ae000c        	ldw	x,#12
2120  06f7 cd0000        	call	_LCD_Print
2122  06fa 85            	popw	x
2123                     ; 520 									LCD_Print(12*1,6*1,"添加");	LCD_Print(12*1,6*9,"删除");
2125  06fb ae0014        	ldw	x,#L167
2126  06fe 89            	pushw	x
2127  06ff ae0c06        	ldw	x,#3078
2128  0702 cd0000        	call	_LCD_Print
2130  0705 85            	popw	x
2133  0706 ae000f        	ldw	x,#L367
2134  0709 89            	pushw	x
2135  070a ae0c36        	ldw	x,#3126
2136  070d cd0000        	call	_LCD_Print
2138  0710 85            	popw	x
2139                     ; 521 									LCD_Print(12*2,6*1,"重置");	LCD_Print(12*2,6*9,"编辑");							
2141  0711 ae000a        	ldw	x,#L567
2142  0714 89            	pushw	x
2143  0715 ae1806        	ldw	x,#6150
2144  0718 cd0000        	call	_LCD_Print
2146  071b 85            	popw	x
2149  071c ae0005        	ldw	x,#L767
2150  071f 89            	pushw	x
2151  0720 ae1836        	ldw	x,#6198
2152  0723 cd0000        	call	_LCD_Print
2154  0726 85            	popw	x
2155                     ; 522 									LCD_Print(12*3,6*5,"返回");
2157  0727 ae0000        	ldw	x,#L177
2158  072a 89            	pushw	x
2159  072b ae241e        	ldw	x,#9246
2160  072e cd0000        	call	_LCD_Print
2162  0731 72130001      	bres	L706_flag,#1
2163  0735 35010000      	mov	L702_Config_Func,#1
2164  0739 85            	popw	x
2165                     ; 524 									flag&=(uint8_t)(~0x02);	//允许再次打印光标
2167                     ; 525 									Config_Func=FUNC_ADD;																
2169                     ; 526 									break;
2172  073a 81            	ret	
2173                     ; 528 							default : break;
2175                     ; 531 			break;
2177  073b               L336:
2178                     ; 532 			case	MODE_PREPROCESSING:
2178                     ; 533 						if(KeyVal==V_KEY2){
2180  073b c60001        	ld	a,_KeyVal
2181  073e a102          	cp	a,#2
2182  0740 260c          	jrne	L366
2183                     ; 534 							KeyVal=V_KEY_NONE;
2185  0742 35ff0001      	mov	_KeyVal,#255
2186                     ; 535 							Config_Func=FUNC_LOGO;		//进入配置界面的配置参数
2188  0746 35200000      	mov	L702_Config_Func,#32
2189                     ; 536 							Mode=MODE_CONFIG;
2191  074a 35020000      	mov	_Mode,#2
2192                     ; 540 			case	MODE_DONOTHING:	break;
2194                     ; 541 			default	:break;
2196  074e               L366:
2197                     ; 544 }
2200  074e 81            	ret	
2416                     	switch	.ubsct
2417  0000               L702_Config_Func:
2418  0000 00            	ds.b	1
2419                     	xdef	_main
2420                     	switch	.bss
2421  0002               _SensorConfigData:
2422  0002 000000000000  	ds.b	11
2423                     	xdef	_SensorConfigData
2424  000d               _Sensors:
2425  000d 000000000000  	ds.b	6
2426                     	xdef	_Sensors
2427  0013               _pt_MCL_Add_cnt:
2428  0013 00            	ds.b	1
2429                     	xdef	_pt_MCL_Add_cnt
2430  0014               _pt_MCL_Add:
2431  0014 0000          	ds.b	2
2432                     	xdef	_pt_MCL_Add
2433                     	xdef	_KeyVal
2434                     	xdef	_Mode
2435                     	xdef	_MCL_Add
2436                     	xdef	_Main_Control_Logic
2437                     	xdef	_Task_10ms_NotCritical
2438                     	xdef	_Task_1ms_NotCritical
2439                     	xdef	_Timer_Config
2440                     	xdef	_CLK_Config
2441                     	xdef	_GPIO_Config_SystemOn
2442                     	xref	_xCal_crc
2443                     	xref	_Key_Scan
2444                     	xref	_Key_Init
2445                     	xref.b	_pt_KeyScan_cnt
2446                     	xref	_Ds18b20_SearchROM
2447                     	xref	_Ds18b20_Init
2448                     	xref.b	_ROM_Buf
2449                     	xref	_pSheshidu
2450                     	xref	_LCD_Clear
2451                     	xref	_LCD_Print_0to9DecNum
2452                     	xref	_LCD_Print_HexNum
2453                     	xref	_LCD_Print
2454                     	xref	_Nokia5110_Init
2455                     	xref	_delay_nx100ms
2456                     	xref	_LED_Init
2457                     	xdef	_Check_Sensor
2458                     	switch	.ubsct
2459  0001               _Task_10ms_NotCritical_cnt:
2460  0001 00            	ds.b	1
2461                     	xdef	_Task_10ms_NotCritical_cnt
2462  0002               _Task_1ms_NotCritical_cnt:
2463  0002 00            	ds.b	1
2464                     	xdef	_Task_1ms_NotCritical_cnt
2465                     	xref	_GPIO_Init
2466                     	xref	_FLASH_SetProgrammingTime
2467                     	xref	_FLASH_ReadByte
2468                     	xref	_FLASH_EraseByte
2469                     	xref	_FLASH_Lock
2470                     	xref	_FLASH_Unlock
2471                     .const:	section	.text
2472  0000               L177:
2473  0000 b7b5bbd800    	dc.b	183,181,187,216,0
2474  0005               L767:
2475  0005 b1e0bcad00    	dc.b	177,224,188,173,0
2476  000a               L567:
2477  000a d6d8d6c300    	dc.b	214,216,214,195,0
2478  000f               L367:
2479  000f c9beb3fd00    	dc.b	201,190,179,253,0
2480  0014               L167:
2481  0014 ccedbcd300    	dc.b	204,237,188,211,0
2482  0019               L757:
2483  0019 b4abb8d0c6f7  	dc.b	180,171,184,208,198,247
2484  001f c5e4d6c300    	dc.b	197,228,214,195,0
2485  0024               L506:
2486  0024 b1a3b4e6cafd  	dc.b	177,163,180,230,202,253
2487  002a beddd6d02e2e  	dc.b	190,221,214,208,46,46
2488  0030 2e00          	dc.b	".",0
2489  0032               L575:
2490  0032 b9d800        	dc.b	185,216,0
2491  0035               L175:
2492  0035 bfaa00        	dc.b	191,170,0
2493  0038               L155:
2494  0038 c8b7b6a820b8  	dc.b	200,183,182,168,32,184
2495  003e c4b1e400      	dc.b	196,177,228,0
2496  0042               L745:
2497  0042 3c20bf        	dc.b	"< ",191
2498  0045 aa203e00      	dc.b	170,32,62,0
2499  0049               L545:
2500  0049 b1a8beafc9e8  	dc.b	177,168,190,175,201,232
2501  004f d6c300        	dc.b	214,195,0
2502  0052               L115:
2503  0052 2d2020333020  	dc.b	"-  30    +",0
2504  005d               L705:
2505  005d c9e8d6c3b1a8  	dc.b	201,232,214,195,177,168
2506  0063 beafcec2b6c8  	dc.b	190,175,206,194,182,200,0
2507  006a               L174:
2508  006a b8a9d1f600    	dc.b	184,169,209,246,0
2509  006f               L764:
2510  006f bfaab1d500    	dc.b	191,170,177,213,0
2511  0074               L564:
2512  0074 c6f0c9fd00    	dc.b	198,240,201,253,0
2513  0079               L364:
2514  0079 d0a1b3b500    	dc.b	208,161,179,181,0
2515  007e               L164:
2516  007e b4f3b3b500    	dc.b	180,243,179,181,0
2517  0083               L744:
2518  0083 3c2020202020  	dc.b	"<        >",0
2519  008e               L124:
2520  008e 49443a00      	dc.b	"ID:",0
2521  0092               L714:
2522  0092 ceaab4abb8d0  	dc.b	206,170,180,171,184,208
2523  0098 c6f7c3fcc3fb  	dc.b	198,247,195,252,195,251,0
2524  009f               L104:
2525  009f 20b8          	dc.b	" ",184
2526  00a1 f6ceb4c5e4d6  	dc.b	246,206,180,197,228,214
2527  00a7 c300          	dc.b	195,0
2528  00a9               L773:
2529  00a9 b4abb8d0c6f7  	dc.b	180,171,184,208,198,247,0
2530  00b0               L573:
2531  00b0 bcecb2e2b5bd  	dc.b	188,236,178,226,181,189
2532  00b6 20b8          	dc.b	" ",184
2533  00b8 f600          	dc.b	246,0
2534  00ba               L152:
2535  00ba 2000          	dc.b	" ",0
2536  00bc               L542:
2537  00bc 3c00          	dc.b	"<",0
2538  00be               L342:
2539  00be 3e00          	dc.b	">",0
2540  00c0               L14:
2541  00c0 c8b7b6a800    	dc.b	200,183,182,168,0
2542  00c5               L73:
2543  00c5 c3bbd3d0c5e4  	dc.b	195,187,211,208,197,228
2544  00cb d6c3b4abb8d0  	dc.b	214,195,180,171,184,208
2545  00d1 c6f700        	dc.b	198,247,0
2546  00d4               L33:
2547  00d4 d7f7d5df20c0  	dc.b	215,247,213,223,32,192
2548  00da eebaead6de00  	dc.b	238,186,234,214,222,0
2549  00e0               L13:
2550  00e0 b8dbcef1d3d0  	dc.b	184,219,206,241,211,208
2551  00e6 cfdeb9abcbbe  	dc.b	207,222,185,171,203,190,0
2552  00ed               L72:
2553  00ed b9e3d6ddb8db  	dc.b	185,227,214,221,184,219
2554  00f3 d0c2c9b300    	dc.b	208,194,201,179,0
2555  00f8               L52:
2556  00f8 bce0b2e2cfb5  	dc.b	188,224,178,226,207,181
2557  00fe cdb300        	dc.b	205,179,0
2558  0101               L32:
2559  0101 b1e4c6b5c6f7  	dc.b	177,228,198,181,198,247
2560  0107 cec2b6c800    	dc.b	206,194,182,200,0
2561  010c               L12:
2562  010c d0b6b4acbbfa  	dc.b	208,182,180,172,187,250,0
2582                     	end
