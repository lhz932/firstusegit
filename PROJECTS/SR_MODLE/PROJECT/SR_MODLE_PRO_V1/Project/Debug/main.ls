   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
  46                     ; 10 main()
  46                     ; 11 {
  48                     	switch	.text
  49  0000               _main:
  53                     ; 12 	GPIO_Config_SystemOn();
  55  0000 ad04          	call	_GPIO_Config_SystemOn
  57                     ; 13 	CLK_Config();	//Configure the Fcpu to 8MHz,Fmaster=8MHz	
  59  0002 ad2f          	call	_CLK_Config
  61  0004               L12:
  62                     ; 14 	while (1);
  64  0004 20fe          	jra	L12
  89                     ; 18 void GPIO_Config_SystemOn(void)
  89                     ; 19 {
  90                     	switch	.text
  91  0006               _GPIO_Config_SystemOn:
  95                     ; 21 	GPIO_Init(GPIOA,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
  97  0006 4b40          	push	#64
  98  0008 4bff          	push	#255
  99  000a ae5000        	ldw	x,#20480
 100  000d cd0000        	call	_GPIO_Init
 102  0010 85            	popw	x
 103                     ; 22 	GPIO_Init(GPIOB,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 105  0011 4b40          	push	#64
 106  0013 4bff          	push	#255
 107  0015 ae5005        	ldw	x,#20485
 108  0018 cd0000        	call	_GPIO_Init
 110  001b 85            	popw	x
 111                     ; 23 	GPIO_Init(GPIOC,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);
 113  001c 4b40          	push	#64
 114  001e 4bff          	push	#255
 115  0020 ae500a        	ldw	x,#20490
 116  0023 cd0000        	call	_GPIO_Init
 118  0026 85            	popw	x
 119                     ; 24 	GPIO_Init(GPIOD,GPIO_PIN_ALL,GPIO_MODE_IN_PU_NO_IT);	
 121  0027 4b40          	push	#64
 122  0029 4bff          	push	#255
 123  002b ae500f        	ldw	x,#20495
 124  002e cd0000        	call	_GPIO_Init
 126  0031 85            	popw	x
 127                     ; 25 }
 130  0032 81            	ret
 155                     ; 27 void CLK_Config(void)
 155                     ; 28 {
 156                     	switch	.text
 157  0033               _CLK_Config:
 161                     ; 29   CLK_DeInit();  
 163  0033 cd0000        	call	_CLK_DeInit
 165                     ; 31 	CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV2);
 167  0036 a608          	ld	a,#8
 168  0038 cd0000        	call	_CLK_SYSCLKConfig
 170                     ; 33 }
 173  003b 81            	ret
 201                     ; 34 void 	Timer_Config(void)
 201                     ; 35 {
 202                     	switch	.text
 203  003c               _Timer_Config:
 207                     ; 37 	TIM4_TimeBaseInit(TIM4_PRESCALER_32,249);	//1ms---(x-1)*32=8000
 209  003c ae05f9        	ldw	x,#1529
 210  003f cd0000        	call	_TIM4_TimeBaseInit
 212                     ; 39   TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 214  0042 a601          	ld	a,#1
 215  0044 cd0000        	call	_TIM4_ClearFlag
 217                     ; 41   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);  
 219  0047 ae0101        	ldw	x,#257
 220  004a cd0000        	call	_TIM4_ITConfig
 222                     ; 43   enableInterrupts();
 225  004d 9a            rim
 227                     ; 46   TIM4_Cmd(ENABLE);
 230  004e a601          	ld	a,#1
 231  0050 cd0000        	call	_TIM4_Cmd
 233                     ; 47 }
 236  0053 81            	ret
 249                     	xdef	_main
 250                     	xdef	_Timer_Config
 251                     	xdef	_CLK_Config
 252                     	xdef	_GPIO_Config_SystemOn
 253                     	xref	_TIM4_ClearFlag
 254                     	xref	_TIM4_ITConfig
 255                     	xref	_TIM4_Cmd
 256                     	xref	_TIM4_TimeBaseInit
 257                     	xref	_GPIO_Init
 258                     	xref	_CLK_SYSCLKConfig
 259                     	xref	_CLK_DeInit
 278                     	end
