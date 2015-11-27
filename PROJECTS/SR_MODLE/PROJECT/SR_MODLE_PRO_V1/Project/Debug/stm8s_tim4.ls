   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
  48                     ; 49 void TIM4_DeInit(void)
  48                     ; 50 {
  50                     .text:	section	.text,new
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
 183                     .text:	section	.text,new
 184  0000               _TIM4_TimeBaseInit:
 188                     ; 68   assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 190                     ; 70   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 192  0000 9e            	ld	a,xh
 193  0001 c75347        	ld	21319,a
 194                     ; 72   TIM4->ARR = (uint8_t)(TIM4_Period);
 196  0004 9f            	ld	a,xl
 197  0005 c75348        	ld	21320,a
 198                     ; 73 }
 201  0008 81            	ret	
 256                     ; 81 void TIM4_Cmd(FunctionalState NewState)
 256                     ; 82 {
 257                     .text:	section	.text,new
 258  0000               _TIM4_Cmd:
 262                     ; 84   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 264                     ; 87   if (NewState != DISABLE)
 266  0000 4d            	tnz	a
 267  0001 2705          	jreq	L511
 268                     ; 89     TIM4->CR1 |= TIM4_CR1_CEN;
 270  0003 72105340      	bset	21312,#0
 273  0007 81            	ret	
 274  0008               L511:
 275                     ; 93     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 277  0008 72115340      	bres	21312,#0
 278                     ; 95 }
 281  000c 81            	ret	
 339                     ; 107 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 339                     ; 108 {
 340                     .text:	section	.text,new
 341  0000               _TIM4_ITConfig:
 343  0000 89            	pushw	x
 344       00000000      OFST:	set	0
 347                     ; 110   assert_param(IS_TIM4_IT_OK(TIM4_IT));
 349                     ; 111   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 351                     ; 113   if (NewState != DISABLE)
 353  0001 9f            	ld	a,xl
 354  0002 4d            	tnz	a
 355  0003 2706          	jreq	L151
 356                     ; 116     TIM4->IER |= (uint8_t)TIM4_IT;
 358  0005 9e            	ld	a,xh
 359  0006 ca5343        	or	a,21315
 361  0009 2006          	jra	L351
 362  000b               L151:
 363                     ; 121     TIM4->IER &= (uint8_t)(~TIM4_IT);
 365  000b 7b01          	ld	a,(OFST+1,sp)
 366  000d 43            	cpl	a
 367  000e c45343        	and	a,21315
 368  0011               L351:
 369  0011 c75343        	ld	21315,a
 370                     ; 123 }
 373  0014 85            	popw	x
 374  0015 81            	ret	
 410                     ; 131 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 410                     ; 132 {
 411                     .text:	section	.text,new
 412  0000               _TIM4_UpdateDisableConfig:
 416                     ; 134   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 418                     ; 137   if (NewState != DISABLE)
 420  0000 4d            	tnz	a
 421  0001 2705          	jreq	L371
 422                     ; 139     TIM4->CR1 |= TIM4_CR1_UDIS;
 424  0003 72125340      	bset	21312,#1
 427  0007 81            	ret	
 428  0008               L371:
 429                     ; 143     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 431  0008 72135340      	bres	21312,#1
 432                     ; 145 }
 435  000c 81            	ret	
 493                     ; 155 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 493                     ; 156 {
 494                     .text:	section	.text,new
 495  0000               _TIM4_UpdateRequestConfig:
 499                     ; 158   assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 501                     ; 161   if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 503  0000 4d            	tnz	a
 504  0001 2705          	jreq	L522
 505                     ; 163     TIM4->CR1 |= TIM4_CR1_URS;
 507  0003 72145340      	bset	21312,#2
 510  0007 81            	ret	
 511  0008               L522:
 512                     ; 167     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 514  0008 72155340      	bres	21312,#2
 515                     ; 169 }
 518  000c 81            	ret	
 575                     ; 179 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 575                     ; 180 {
 576                     .text:	section	.text,new
 577  0000               _TIM4_SelectOnePulseMode:
 581                     ; 182   assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 583                     ; 185   if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 585  0000 4d            	tnz	a
 586  0001 2705          	jreq	L752
 587                     ; 187     TIM4->CR1 |= TIM4_CR1_OPM;
 589  0003 72165340      	bset	21312,#3
 592  0007 81            	ret	
 593  0008               L752:
 594                     ; 191     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 596  0008 72175340      	bres	21312,#3
 597                     ; 193 }
 600  000c 81            	ret	
 668                     ; 215 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 668                     ; 216 {
 669                     .text:	section	.text,new
 670  0000               _TIM4_PrescalerConfig:
 674                     ; 218   assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 676                     ; 219   assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 678                     ; 222   TIM4->PSCR = (uint8_t)Prescaler;
 680  0000 9e            	ld	a,xh
 681  0001 c75347        	ld	21319,a
 682                     ; 225   TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 684  0004 9f            	ld	a,xl
 685  0005 c75345        	ld	21317,a
 686                     ; 226 }
 689  0008 81            	ret	
 725                     ; 234 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 725                     ; 235 {
 726                     .text:	section	.text,new
 727  0000               _TIM4_ARRPreloadConfig:
 731                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 733                     ; 240   if (NewState != DISABLE)
 735  0000 4d            	tnz	a
 736  0001 2705          	jreq	L333
 737                     ; 242     TIM4->CR1 |= TIM4_CR1_ARPE;
 739  0003 721e5340      	bset	21312,#7
 742  0007 81            	ret	
 743  0008               L333:
 744                     ; 246     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 746  0008 721f5340      	bres	21312,#7
 747                     ; 248 }
 750  000c 81            	ret	
 799                     ; 257 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 799                     ; 258 {
 800                     .text:	section	.text,new
 801  0000               _TIM4_GenerateEvent:
 805                     ; 260   assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 807                     ; 263   TIM4->EGR = (uint8_t)(TIM4_EventSource);
 809  0000 c75345        	ld	21317,a
 810                     ; 264 }
 813  0003 81            	ret	
 847                     ; 272 void TIM4_SetCounter(uint8_t Counter)
 847                     ; 273 {
 848                     .text:	section	.text,new
 849  0000               _TIM4_SetCounter:
 853                     ; 275   TIM4->CNTR = (uint8_t)(Counter);
 855  0000 c75346        	ld	21318,a
 856                     ; 276 }
 859  0003 81            	ret	
 893                     ; 284 void TIM4_SetAutoreload(uint8_t Autoreload)
 893                     ; 285 {
 894                     .text:	section	.text,new
 895  0000               _TIM4_SetAutoreload:
 899                     ; 287   TIM4->ARR = (uint8_t)(Autoreload);
 901  0000 c75348        	ld	21320,a
 902                     ; 288 }
 905  0003 81            	ret	
 928                     ; 295 uint8_t TIM4_GetCounter(void)
 928                     ; 296 {
 929                     .text:	section	.text,new
 930  0000               _TIM4_GetCounter:
 934                     ; 298   return (uint8_t)(TIM4->CNTR);
 936  0000 c65346        	ld	a,21318
 939  0003 81            	ret	
 963                     ; 306 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 963                     ; 307 {
 964                     .text:	section	.text,new
 965  0000               _TIM4_GetPrescaler:
 969                     ; 309   return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
 971  0000 c65347        	ld	a,21319
 974  0003 81            	ret	
1053                     ; 319 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1053                     ; 320 {
1054                     .text:	section	.text,new
1055  0000               _TIM4_GetFlagStatus:
1057  0000 88            	push	a
1058       00000001      OFST:	set	1
1061                     ; 321   FlagStatus bitstatus = RESET;
1063                     ; 324   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1065                     ; 326   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1067  0001 c45344        	and	a,21316
1068  0004 2702          	jreq	L774
1069                     ; 328     bitstatus = SET;
1071  0006 a601          	ld	a,#1
1074  0008               L774:
1075                     ; 332     bitstatus = RESET;
1078                     ; 334   return ((FlagStatus)bitstatus);
1082  0008 5b01          	addw	sp,#1
1083  000a 81            	ret	
1118                     ; 344 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1118                     ; 345 {
1119                     .text:	section	.text,new
1120  0000               _TIM4_ClearFlag:
1124                     ; 347   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1126                     ; 350   TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1128  0000 43            	cpl	a
1129  0001 c75344        	ld	21316,a
1130                     ; 351 }
1133  0004 81            	ret	
1197                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1197                     ; 361 {
1198                     .text:	section	.text,new
1199  0000               _TIM4_GetITStatus:
1201  0000 88            	push	a
1202  0001 89            	pushw	x
1203       00000002      OFST:	set	2
1206                     ; 362   ITStatus bitstatus = RESET;
1208                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1212                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1214                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1216  0002 c45344        	and	a,21316
1217  0005 6b01          	ld	(OFST-1,sp),a
1219                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1221  0007 c65343        	ld	a,21315
1222  000a 1403          	and	a,(OFST+1,sp)
1223  000c 6b02          	ld	(OFST+0,sp),a
1225                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1227  000e 7b01          	ld	a,(OFST-1,sp)
1228  0010 2708          	jreq	L355
1230  0012 7b02          	ld	a,(OFST+0,sp)
1231  0014 2704          	jreq	L355
1232                     ; 375     bitstatus = (ITStatus)SET;
1234  0016 a601          	ld	a,#1
1237  0018 2001          	jra	L555
1238  001a               L355:
1239                     ; 379     bitstatus = (ITStatus)RESET;
1241  001a 4f            	clr	a
1243  001b               L555:
1244                     ; 381   return ((ITStatus)bitstatus);
1248  001b 5b03          	addw	sp,#3
1249  001d 81            	ret	
1285                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1285                     ; 392 {
1286                     .text:	section	.text,new
1287  0000               _TIM4_ClearITPendingBit:
1291                     ; 394   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1293                     ; 397   TIM4->SR1 = (uint8_t)(~TIM4_IT);
1295  0000 43            	cpl	a
1296  0001 c75344        	ld	21316,a
1297                     ; 398 }
1300  0004 81            	ret	
1313                     	xdef	_TIM4_ClearITPendingBit
1314                     	xdef	_TIM4_GetITStatus
1315                     	xdef	_TIM4_ClearFlag
1316                     	xdef	_TIM4_GetFlagStatus
1317                     	xdef	_TIM4_GetPrescaler
1318                     	xdef	_TIM4_GetCounter
1319                     	xdef	_TIM4_SetAutoreload
1320                     	xdef	_TIM4_SetCounter
1321                     	xdef	_TIM4_GenerateEvent
1322                     	xdef	_TIM4_ARRPreloadConfig
1323                     	xdef	_TIM4_PrescalerConfig
1324                     	xdef	_TIM4_SelectOnePulseMode
1325                     	xdef	_TIM4_UpdateRequestConfig
1326                     	xdef	_TIM4_UpdateDisableConfig
1327                     	xdef	_TIM4_ITConfig
1328                     	xdef	_TIM4_Cmd
1329                     	xdef	_TIM4_TimeBaseInit
1330                     	xdef	_TIM4_DeInit
1349                     	end
