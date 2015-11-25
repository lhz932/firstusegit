   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
  49                     ; 8 int main(void)
  49                     ; 9 {
  51                     	switch	.text
  52  0000               _main:
  56                     ; 10 	GPIO_Config_SystemOn();
  58  0000 ad22          	call	_GPIO_Config_SystemOn
  60                     ; 11 	CLK_Config();	//Configure the Fcpu to 1MHz,Fmaster=2MHz	
  62  0002 ad4d          	call	_CLK_Config
  64                     ; 12 	Timer_Config();
  66  0004 ad54          	call	_Timer_Config
  68                     ; 14 	LED_Init();	
  70  0006 cd0000        	call	_LED_Init
  72                     ; 15 	delay_10us(1);
  74  0009 a601          	ld	a,#1
  75  000b cd0000        	call	_delay_10us
  77                     ; 16 	delay_10us(2);
  79  000e a602          	ld	a,#2
  80  0010 cd0000        	call	_delay_10us
  82                     ; 17 	delay_10us(3);
  84  0013 a603          	ld	a,#3
  85  0015 cd0000        	call	_delay_10us
  87                     ; 18 	delay_10us(10);
  89  0018 a60a          	ld	a,#10
  90  001a cd0000        	call	_delay_10us
  92                     ; 19 	delay_10us(50);
  94  001d a632          	ld	a,#50
  95  001f cd0000        	call	_delay_10us
  97  0022               L12:
  99  0022 20fe          	jra	L12
 124                     ; 29 void GPIO_Config_SystemOn(void)
 124                     ; 30 {
 125                     	switch	.text
 126  0024               _GPIO_Config_SystemOn:
 130                     ; 32 	GPIO_Init(GPIOA,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 132  0024 4b40          	push	#64
 133  0026 4bff          	push	#255
 134  0028 ae5000        	ldw	x,#20480
 135  002b cd0000        	call	_GPIO_Init
 137  002e 85            	popw	x
 138                     ; 33 	GPIO_Init(GPIOB,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 140  002f 4b40          	push	#64
 141  0031 4bff          	push	#255
 142  0033 ae5005        	ldw	x,#20485
 143  0036 cd0000        	call	_GPIO_Init
 145  0039 85            	popw	x
 146                     ; 34 	GPIO_Init(GPIOC,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 148  003a 4b40          	push	#64
 149  003c 4bff          	push	#255
 150  003e ae500a        	ldw	x,#20490
 151  0041 cd0000        	call	_GPIO_Init
 153  0044 85            	popw	x
 154                     ; 35 	GPIO_Init(GPIOD,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);	
 156  0045 4b40          	push	#64
 157  0047 4bff          	push	#255
 158  0049 ae500f        	ldw	x,#20495
 159  004c cd0000        	call	_GPIO_Init
 161  004f 85            	popw	x
 162                     ; 36 }
 165  0050 81            	ret
 190                     ; 38 void CLK_Config(void)
 190                     ; 39 {
 191                     	switch	.text
 192  0051               _CLK_Config:
 196                     ; 40   CLK_DeInit();  
 198  0051 cd0000        	call	_CLK_DeInit
 200                     ; 42 	CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV2);
 202  0054 a608          	ld	a,#8
 203  0056 cd0000        	call	_CLK_SYSCLKConfig
 205                     ; 44 }
 208  0059 81            	ret
 236                     ; 45 void Timer_Config(void)
 236                     ; 46 {
 237                     	switch	.text
 238  005a               _Timer_Config:
 242                     ; 48 	TIM4_TimeBaseInit(TIM4_PRESCALER_32,249);	//1ms---(x-1)*32=8000
 244  005a ae05f9        	ldw	x,#1529
 245  005d cd0000        	call	_TIM4_TimeBaseInit
 247                     ; 50   TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 249  0060 a601          	ld	a,#1
 250  0062 cd0000        	call	_TIM4_ClearFlag
 252                     ; 52   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);  
 254  0065 ae0101        	ldw	x,#257
 255  0068 cd0000        	call	_TIM4_ITConfig
 257                     ; 54   enableInterrupts();
 260  006b 9a            rim
 262                     ; 57   TIM4_Cmd(ENABLE);	
 265  006c a601          	ld	a,#1
 266  006e cd0000        	call	_TIM4_Cmd
 268                     ; 58 }
 271  0071 81            	ret
 307                     ; 70 void assert_failed(uint8_t* file, uint32_t line)
 307                     ; 71 { 
 308                     	switch	.text
 309  0072               _assert_failed:
 313  0072               L37:
 314                     ; 78 		LED_Control_2();
 316  0072 cd0000        	call	_LED_Control_2
 319  0075 20fb          	jra	L37
 332                     	xdef	_main
 333                     	xdef	_Timer_Config
 334                     	xdef	_CLK_Config
 335                     	xdef	_GPIO_Config_SystemOn
 336                     	xref	_delay_10us
 337                     	xref	_LED_Control_2
 338                     	xref	_LED_Init
 339                     	xdef	_assert_failed
 340                     	xref	_TIM4_ClearFlag
 341                     	xref	_TIM4_ITConfig
 342                     	xref	_TIM4_Cmd
 343                     	xref	_TIM4_TimeBaseInit
 344                     	xref	_GPIO_Init
 345                     	xref	_CLK_SYSCLKConfig
 346                     	xref	_CLK_DeInit
 365                     	end
