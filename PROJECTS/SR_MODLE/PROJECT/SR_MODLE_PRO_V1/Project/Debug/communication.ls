   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
  49                     ; 25 static void IR_Init(void){
  51                     	switch	.text
  52  0000               L3_IR_Init:
  56                     ; 27 	GPIO_Init(IR_PORT,IR_PIN,GPIO_MODE_IN_PU_IT);	//带上拉输入，使用外中断
  58  0000 4b60          	push	#96
  59  0002 4b10          	push	#16
  60  0004 ae500a        	ldw	x,#20490
  61  0007 cd0000        	call	_GPIO_Init
  63  000a 85            	popw	x
  64                     ; 29 	disableInterrupts();
  67  000b 9b            sim
  69                     ; 30 	EXTI_SetExtIntSensitivity(IR_EXTI_PORT,EXTI_SENSITIVITY_FALL_ONLY);	//只在下降沿触发;设置之前先禁用总中断
  72  000c ae0202        	ldw	x,#514
  73  000f cd0000        	call	_EXTI_SetExtIntSensitivity
  75                     ; 31 	enableInterrupts();	
  78  0012 9a            rim
  80                     ; 33 	TIM1_ITConfig(TIM1_IT_UPDATE,ENABLE);	//利用TIMER1获取时间，重复计数器已在TIMER1初始化时设置为3，即更新中断
  83  0013 ae0101        	ldw	x,#257
  84  0016 cd0000        	call	_TIM1_ITConfig
  86                     ; 37 }
  89  0019 81            	ret
 112                     ; 38 static void NRF24L01_Init(void){
 113                     	switch	.text
 114  001a               L32_NRF24L01_Init:
 118                     ; 40 }
 121  001a 81            	ret
 146                     ; 42 void Comm_Init(void)
 146                     ; 43 {
 147                     	switch	.text
 148  001b               _Comm_Init:
 152                     ; 44 		IR_Init();
 154  001b ade3          	call	L3_IR_Init
 156                     ; 45 		NRF24L01_Init();
 158  001d adfb          	call	L32_NRF24L01_Init
 160                     ; 46 }
 163  001f 81            	ret
 187                     	xdef	_Comm_Init
 188                     	switch	.ubsct
 189  0000               _IR_time_cnt:
 190  0000 00            	ds.b	1
 191                     	xdef	_IR_time_cnt
 192                     	xref	_TIM1_ITConfig
 193                     	xref	_GPIO_Init
 194                     	xref	_EXTI_SetExtIntSensitivity
 214                     	end
