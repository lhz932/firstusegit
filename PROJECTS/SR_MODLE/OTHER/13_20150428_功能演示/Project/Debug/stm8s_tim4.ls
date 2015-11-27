   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  48                     ; 49 void TIM4_DeInit(void)
  48                     ; 50 {
  50                     	switch	.text
  51  0000               _TIM4_DeInit:
  55                     ; 51   TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  57  0000 725f5340      	clr	21312
  58                     ; 52   TIM4->IER = TIM4_IER_RESET_VALUE;
  60  0004 725f5343      	clr	21315
  61                     ; 53   TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  63  0008 725f5346      	clr	21318
  64                     ; 54   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  66  000c 725f5347      	clr	21319
  67                     ; 55   TIM4->ARR = TIM4_ARR_RESET_VALUE;
  69  0010 35ff5348      	mov	21320,#255
  70                     ; 56   TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  72  0014 725f5344      	clr	21316
  73                     ; 57 }
  76  0018 81            	ret	
 182                     ; 65 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 182                     ; 66 {
 183                     	switch	.text
 184  0019               _TIM4_TimeBaseInit:
 188                     ; 68   assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 190                     ; 70   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 192  0019 9e            	ld	a,xh
 193  001a c75347        	ld	21319,a
 194                     ; 72   TIM4->ARR = (uint8_t)(TIM4_Period);
 196  001d 9f            	ld	a,xl
 197  001e c75348        	ld	21320,a
 198                     ; 73 }
 201  0021 81            	ret	
 256                     ; 81 void TIM4_Cmd(FunctionalState NewState)
 256                     ; 82 {
 257                     	switch	.text
 258  0022               _TIM4_Cmd:
 262                     ; 84   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 264                     ; 87   if (NewState != DISABLE)
 266  0022 4d            	tnz	a
 267  0023 2705          	jreq	L511
 268                     ; 89     TIM4->CR1 |= TIM4_CR1_CEN;
 270  0025 72105340      	bset	21312,#0
 273  0029 81            	ret	
 274  002a               L511:
 275                     ; 93     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 277  002a 72115340      	bres	21312,#0
 278                     ; 95 }
 281  002e 81            	ret	
 339                     ; 107 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 339                     ; 108 {
 340                     	switch	.text
 341  002f               _TIM4_ITConfig:
 343  002f 89            	pushw	x
 344       00000000      OFST:	set	0
 347                     ; 110   assert_param(IS_TIM4_IT_OK(TIM4_IT));
 349                     ; 111   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 351                     ; 113   if (NewState != DISABLE)
 353  0030 9f            	ld	a,xl
 354  0031 4d            	tnz	a
 355  0032 2706          	jreq	L151
 356                     ; 116     TIM4->IER |= (uint8_t)TIM4_IT;
 358  0034 9e            	ld	a,xh
 359  0035 ca5343        	or	a,21315
 361  0038 2006          	jra	L351
 362  003a               L151:
 363                     ; 121     TIM4->IER &= (uint8_t)(~TIM4_IT);
 365  003a 7b01          	ld	a,(OFST+1,sp)
 366  003c 43            	cpl	a
 367  003d c45343        	and	a,21315
 368  0040               L351:
 369  0040 c75343        	ld	21315,a
 370                     ; 123 }
 373  0043 85            	popw	x
 374  0044 81            	ret	
 410                     ; 131 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 410                     ; 132 {
 411                     	switch	.text
 412  0045               _TIM4_UpdateDisableConfig:
 416                     ; 134   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 418                     ; 137   if (NewState != DISABLE)
 420  0045 4d            	tnz	a
 421  0046 2705          	jreq	L371
 422                     ; 139     TIM4->CR1 |= TIM4_CR1_UDIS;
 424  0048 72125340      	bset	21312,#1
 427  004c 81            	ret	
 428  004d               L371:
 429                     ; 143     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 431  004d 72135340      	bres	21312,#1
 432                     ; 145 }
 435  0051 81            	ret	
 493                     ; 155 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 493                     ; 156 {
 494                     	switch	.text
 495  0052               _TIM4_UpdateRequestConfig:
 499                     ; 158   assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 501                     ; 161   if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 503  0052 4d            	tnz	a
 504  0053 2705          	jreq	L522
 505                     ; 163     TIM4->CR1 |= TIM4_CR1_URS;
 507  0055 72145340      	bset	21312,#2
 510  0059 81            	ret	
 511  005a               L522:
 512                     ; 167     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 514  005a 72155340      	bres	21312,#2
 515                     ; 169 }
 518  005e 81            	ret	
 575                     ; 179 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 575                     ; 180 {
 576                     	switch	.text
 577  005f               _TIM4_SelectOnePulseMode:
 581                     ; 182   assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 583                     ; 185   if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 585  005f 4d            	tnz	a
 586  0060 2705          	jreq	L752
 587                     ; 187     TIM4->CR1 |= TIM4_CR1_OPM;
 589  0062 72165340      	bset	21312,#3
 592  0066 81            	ret	
 593  0067               L752:
 594                     ; 191     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 596  0067 72175340      	bres	21312,#3
 597                     ; 193 }
 600  006b 81            	ret	
 668                     ; 215 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 668                     ; 216 {
 669                     	switch	.text
 670  006c               _TIM4_PrescalerConfig:
 674                     ; 218   assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 676                     ; 219   assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 678                     ; 222   TIM4->PSCR = (uint8_t)Prescaler;
 680  006c 9e            	ld	a,xh
 681  006d c75347        	ld	21319,a
 682                     ; 225   TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 684  0070 9f            	ld	a,xl
 685  0071 c75345        	ld	21317,a
 686                     ; 226 }
 689  0074 81            	ret	
 725                     ; 234 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 725                     ; 235 {
 726                     	switch	.text
 727  0075               _TIM4_ARRPreloadConfig:
 731                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 733                     ; 240   if (NewState != DISABLE)
 735  0075 4d            	tnz	a
 736  0076 2705          	jreq	L333
 737                     ; 242     TIM4->CR1 |= TIM4_CR1_ARPE;
 739  0078 721e5340      	bset	21312,#7
 742  007c 81            	ret	
 743  007d               L333:
 744                     ; 246     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 746  007d 721f5340      	bres	21312,#7
 747                     ; 248 }
 750  0081 81            	ret	
 799                     ; 257 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 799                     ; 258 {
 800                     	switch	.text
 801  0082               _TIM4_GenerateEvent:
 805                     ; 260   assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 807                     ; 263   TIM4->EGR = (uint8_t)(TIM4_EventSource);
 809  0082 c75345        	ld	21317,a
 810                     ; 264 }
 813  0085 81            	ret	
 847                     ; 272 void TIM4_SetCounter(uint8_t Counter)
 847                     ; 273 {
 848                     	switch	.text
 849  0086               _TIM4_SetCounter:
 853                     ; 275   TIM4->CNTR = (uint8_t)(Counter);
 855  0086 c75346        	ld	21318,a
 856                     ; 276 }
 859  0089 81            	ret	
 893                     ; 284 void TIM4_SetAutoreload(uint8_t Autoreload)
 893                     ; 285 {
 894                     	switch	.text
 895  008a               _TIM4_SetAutoreload:
 899                     ; 287   TIM4->ARR = (uint8_t)(Autoreload);
 901  008a c75348        	ld	21320,a
 902                     ; 288 }
 905  008d 81            	ret	
 928                     ; 295 uint8_t TIM4_GetCounter(void)
 928                     ; 296 {
 929                     	switch	.text
 930  008e               _TIM4_GetCounter:
 934                     ; 298   return (uint8_t)(TIM4->CNTR);
 936  008e c65346        	ld	a,21318
 939  0091 81            	ret	
 963                     ; 306 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 963                     ; 307 {
 964                     	switch	.text
 965  0092               _TIM4_GetPrescaler:
 969                     ; 309   return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
 971  0092 c65347        	ld	a,21319
 974  0095 81            	ret	
1053                     ; 319 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1053                     ; 320 {
1054                     	switch	.text
1055  0096               _TIM4_GetFlagStatus:
1057  0096 88            	push	a
1058       00000001      OFST:	set	1
1061                     ; 321   FlagStatus bitstatus = RESET;
1063                     ; 324   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1065                     ; 326   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1067  0097 c45344        	and	a,21316
1068  009a 2702          	jreq	L774
1069                     ; 328     bitstatus = SET;
1071  009c a601          	ld	a,#1
1073  009e               L774:
1074                     ; 332     bitstatus = RESET;
1076                     ; 334   return ((FlagStatus)bitstatus);
1080  009e 5b01          	addw	sp,#1
1081  00a0 81            	ret	
1116                     ; 344 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1116                     ; 345 {
1117                     	switch	.text
1118  00a1               _TIM4_ClearFlag:
1122                     ; 347   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1124                     ; 350   TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1126  00a1 43            	cpl	a
1127  00a2 c75344        	ld	21316,a
1128                     ; 351 }
1131  00a5 81            	ret	
1195                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1195                     ; 361 {
1196                     	switch	.text
1197  00a6               _TIM4_GetITStatus:
1199  00a6 88            	push	a
1200  00a7 89            	pushw	x
1201       00000002      OFST:	set	2
1204                     ; 362   ITStatus bitstatus = RESET;
1206                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1210                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1212                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1214  00a8 c45344        	and	a,21316
1215  00ab 6b01          	ld	(OFST-1,sp),a
1216                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1218  00ad c65343        	ld	a,21315
1219  00b0 1403          	and	a,(OFST+1,sp)
1220  00b2 6b02          	ld	(OFST+0,sp),a
1221                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1223  00b4 7b01          	ld	a,(OFST-1,sp)
1224  00b6 2708          	jreq	L355
1226  00b8 7b02          	ld	a,(OFST+0,sp)
1227  00ba 2704          	jreq	L355
1228                     ; 375     bitstatus = (ITStatus)SET;
1230  00bc a601          	ld	a,#1
1232  00be 2001          	jra	L555
1233  00c0               L355:
1234                     ; 379     bitstatus = (ITStatus)RESET;
1236  00c0 4f            	clr	a
1237  00c1               L555:
1238                     ; 381   return ((ITStatus)bitstatus);
1242  00c1 5b03          	addw	sp,#3
1243  00c3 81            	ret	
1279                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1279                     ; 392 {
1280                     	switch	.text
1281  00c4               _TIM4_ClearITPendingBit:
1285                     ; 394   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1287                     ; 397   TIM4->SR1 = (uint8_t)(~TIM4_IT);
1289  00c4 43            	cpl	a
1290  00c5 c75344        	ld	21316,a
1291                     ; 398 }
1294  00c8 81            	ret	
1307                     	xdef	_TIM4_ClearITPendingBit
1308                     	xdef	_TIM4_GetITStatus
1309                     	xdef	_TIM4_ClearFlag
1310                     	xdef	_TIM4_GetFlagStatus
1311                     	xdef	_TIM4_GetPrescaler
1312                     	xdef	_TIM4_GetCounter
1313                     	xdef	_TIM4_SetAutoreload
1314                     	xdef	_TIM4_SetCounter
1315                     	xdef	_TIM4_GenerateEvent
1316                     	xdef	_TIM4_ARRPreloadConfig
1317                     	xdef	_TIM4_PrescalerConfig
1318                     	xdef	_TIM4_SelectOnePulseMode
1319                     	xdef	_TIM4_UpdateRequestConfig
1320                     	xdef	_TIM4_UpdateDisableConfig
1321                     	xdef	_TIM4_ITConfig
1322                     	xdef	_TIM4_Cmd
1323                     	xdef	_TIM4_TimeBaseInit
1324                     	xdef	_TIM4_DeInit
1343                     	end
