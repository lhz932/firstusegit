   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
  48                     ; 52 void TIM2_DeInit(void)
  48                     ; 53 {
  50                     .text:	section	.text,new
  51  0000               _TIM2_DeInit:
  55                     ; 54   TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  57  0000 725f5300      	clr	21248
  58                     ; 55   TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  60  0004 725f5303      	clr	21251
  61                     ; 56   TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  63  0008 725f5305      	clr	21253
  64                     ; 59   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  66  000c 725f530a      	clr	21258
  67                     ; 60   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  69  0010 725f530b      	clr	21259
  70                     ; 64   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  72  0014 725f530a      	clr	21258
  73                     ; 65   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  75  0018 725f530b      	clr	21259
  76                     ; 66   TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  78  001c 725f5307      	clr	21255
  79                     ; 67   TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  81  0020 725f5308      	clr	21256
  82                     ; 68   TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  84  0024 725f5309      	clr	21257
  85                     ; 69   TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  87  0028 725f530c      	clr	21260
  88                     ; 70   TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  90  002c 725f530d      	clr	21261
  91                     ; 71   TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  93  0030 725f530e      	clr	21262
  94                     ; 72   TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  96  0034 35ff530f      	mov	21263,#255
  97                     ; 73   TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
  99  0038 35ff5310      	mov	21264,#255
 100                     ; 74   TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
 102  003c 725f5311      	clr	21265
 103                     ; 75   TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
 105  0040 725f5312      	clr	21266
 106                     ; 76   TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 108  0044 725f5313      	clr	21267
 109                     ; 77   TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 111  0048 725f5314      	clr	21268
 112                     ; 78   TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 114  004c 725f5315      	clr	21269
 115                     ; 79   TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 117  0050 725f5316      	clr	21270
 118                     ; 80   TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 120  0054 725f5304      	clr	21252
 121                     ; 81 }
 124  0058 81            	ret	
 292                     ; 89 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 292                     ; 90                         uint16_t TIM2_Period)
 292                     ; 91 {
 293                     .text:	section	.text,new
 294  0000               _TIM2_TimeBaseInit:
 296  0000 88            	push	a
 297       00000000      OFST:	set	0
 300                     ; 93   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 302  0001 c7530e        	ld	21262,a
 303                     ; 95   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 305  0004 7b04          	ld	a,(OFST+4,sp)
 306  0006 c7530f        	ld	21263,a
 307                     ; 96   TIM2->ARRL = (uint8_t)(TIM2_Period);
 309  0009 7b05          	ld	a,(OFST+5,sp)
 310  000b c75310        	ld	21264,a
 311                     ; 97 }
 314  000e 84            	pop	a
 315  000f 81            	ret	
 472                     ; 108 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 472                     ; 109                   TIM2_OutputState_TypeDef TIM2_OutputState,
 472                     ; 110                   uint16_t TIM2_Pulse,
 472                     ; 111                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 472                     ; 112 {
 473                     .text:	section	.text,new
 474  0000               _TIM2_OC1Init:
 476  0000 89            	pushw	x
 477  0001 88            	push	a
 478       00000001      OFST:	set	1
 481                     ; 114   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 483                     ; 115   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 485                     ; 116   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 487                     ; 119   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 489  0002 c6530a        	ld	a,21258
 490  0005 a4fc          	and	a,#252
 491  0007 c7530a        	ld	21258,a
 492                     ; 121   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 492                     ; 122                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 494  000a 7b08          	ld	a,(OFST+7,sp)
 495  000c a402          	and	a,#2
 496  000e 6b01          	ld	(OFST+0,sp),a
 498  0010 9f            	ld	a,xl
 499  0011 a401          	and	a,#1
 500  0013 1a01          	or	a,(OFST+0,sp)
 501  0015 ca530a        	or	a,21258
 502  0018 c7530a        	ld	21258,a
 503                     ; 125   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 503                     ; 126                           (uint8_t)TIM2_OCMode);
 505  001b c65307        	ld	a,21255
 506  001e a48f          	and	a,#143
 507  0020 1a02          	or	a,(OFST+1,sp)
 508  0022 c75307        	ld	21255,a
 509                     ; 129   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 511  0025 7b06          	ld	a,(OFST+5,sp)
 512  0027 c75311        	ld	21265,a
 513                     ; 130   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 515  002a 7b07          	ld	a,(OFST+6,sp)
 516  002c c75312        	ld	21266,a
 517                     ; 131 }
 520  002f 5b03          	addw	sp,#3
 521  0031 81            	ret	
 585                     ; 142 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 585                     ; 143                   TIM2_OutputState_TypeDef TIM2_OutputState,
 585                     ; 144                   uint16_t TIM2_Pulse,
 585                     ; 145                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 585                     ; 146 {
 586                     .text:	section	.text,new
 587  0000               _TIM2_OC2Init:
 589  0000 89            	pushw	x
 590  0001 88            	push	a
 591       00000001      OFST:	set	1
 594                     ; 148   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 596                     ; 149   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 598                     ; 150   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 600                     ; 154   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 602  0002 c6530a        	ld	a,21258
 603  0005 a4cf          	and	a,#207
 604  0007 c7530a        	ld	21258,a
 605                     ; 156   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 605                     ; 157                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 607  000a 7b08          	ld	a,(OFST+7,sp)
 608  000c a420          	and	a,#32
 609  000e 6b01          	ld	(OFST+0,sp),a
 611  0010 9f            	ld	a,xl
 612  0011 a410          	and	a,#16
 613  0013 1a01          	or	a,(OFST+0,sp)
 614  0015 ca530a        	or	a,21258
 615  0018 c7530a        	ld	21258,a
 616                     ; 161   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 616                     ; 162                           (uint8_t)TIM2_OCMode);
 618  001b c65308        	ld	a,21256
 619  001e a48f          	and	a,#143
 620  0020 1a02          	or	a,(OFST+1,sp)
 621  0022 c75308        	ld	21256,a
 622                     ; 166   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 624  0025 7b06          	ld	a,(OFST+5,sp)
 625  0027 c75313        	ld	21267,a
 626                     ; 167   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 628  002a 7b07          	ld	a,(OFST+6,sp)
 629  002c c75314        	ld	21268,a
 630                     ; 168 }
 633  002f 5b03          	addw	sp,#3
 634  0031 81            	ret	
 698                     ; 179 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 698                     ; 180                   TIM2_OutputState_TypeDef TIM2_OutputState,
 698                     ; 181                   uint16_t TIM2_Pulse,
 698                     ; 182                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 698                     ; 183 {
 699                     .text:	section	.text,new
 700  0000               _TIM2_OC3Init:
 702  0000 89            	pushw	x
 703  0001 88            	push	a
 704       00000001      OFST:	set	1
 707                     ; 185   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 709                     ; 186   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 711                     ; 187   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 713                     ; 189   TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 715  0002 c6530b        	ld	a,21259
 716  0005 a4fc          	and	a,#252
 717  0007 c7530b        	ld	21259,a
 718                     ; 191   TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 718                     ; 192                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 720  000a 7b08          	ld	a,(OFST+7,sp)
 721  000c a402          	and	a,#2
 722  000e 6b01          	ld	(OFST+0,sp),a
 724  0010 9f            	ld	a,xl
 725  0011 a401          	and	a,#1
 726  0013 1a01          	or	a,(OFST+0,sp)
 727  0015 ca530b        	or	a,21259
 728  0018 c7530b        	ld	21259,a
 729                     ; 195   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 729                     ; 196                           (uint8_t)TIM2_OCMode);
 731  001b c65309        	ld	a,21257
 732  001e a48f          	and	a,#143
 733  0020 1a02          	or	a,(OFST+1,sp)
 734  0022 c75309        	ld	21257,a
 735                     ; 199   TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 737  0025 7b06          	ld	a,(OFST+5,sp)
 738  0027 c75315        	ld	21269,a
 739                     ; 200   TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 741  002a 7b07          	ld	a,(OFST+6,sp)
 742  002c c75316        	ld	21270,a
 743                     ; 201 }
 746  002f 5b03          	addw	sp,#3
 747  0031 81            	ret	
 940                     ; 212 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
 940                     ; 213                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
 940                     ; 214                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
 940                     ; 215                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
 940                     ; 216                  uint8_t TIM2_ICFilter)
 940                     ; 217 {
 941                     .text:	section	.text,new
 942  0000               _TIM2_ICInit:
 944  0000 89            	pushw	x
 945       00000000      OFST:	set	0
 948                     ; 219   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
 950                     ; 220   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
 952                     ; 221   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
 954                     ; 222   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
 956                     ; 223   assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
 958                     ; 225   if (TIM2_Channel == TIM2_CHANNEL_1)
 960  0001 9e            	ld	a,xh
 961  0002 4d            	tnz	a
 962  0003 2614          	jrne	L104
 963                     ; 228     TI1_Config((uint8_t)TIM2_ICPolarity,
 963                     ; 229                (uint8_t)TIM2_ICSelection,
 963                     ; 230                (uint8_t)TIM2_ICFilter);
 965  0005 7b07          	ld	a,(OFST+7,sp)
 966  0007 88            	push	a
 967  0008 7b06          	ld	a,(OFST+6,sp)
 968  000a 97            	ld	xl,a
 969  000b 7b03          	ld	a,(OFST+3,sp)
 970  000d 95            	ld	xh,a
 971  000e cd0000        	call	L3_TI1_Config
 973  0011 84            	pop	a
 974                     ; 233     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
 976  0012 7b06          	ld	a,(OFST+6,sp)
 977  0014 cd0000        	call	_TIM2_SetIC1Prescaler
 980  0017 202b          	jra	L304
 981  0019               L104:
 982                     ; 235   else if (TIM2_Channel == TIM2_CHANNEL_2)
 984  0019 7b01          	ld	a,(OFST+1,sp)
 985  001b 4a            	dec	a
 986  001c 2614          	jrne	L504
 987                     ; 238     TI2_Config((uint8_t)TIM2_ICPolarity,
 987                     ; 239                (uint8_t)TIM2_ICSelection,
 987                     ; 240                (uint8_t)TIM2_ICFilter);
 989  001e 7b07          	ld	a,(OFST+7,sp)
 990  0020 88            	push	a
 991  0021 7b06          	ld	a,(OFST+6,sp)
 992  0023 97            	ld	xl,a
 993  0024 7b03          	ld	a,(OFST+3,sp)
 994  0026 95            	ld	xh,a
 995  0027 cd0000        	call	L5_TI2_Config
 997  002a 84            	pop	a
 998                     ; 243     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1000  002b 7b06          	ld	a,(OFST+6,sp)
1001  002d cd0000        	call	_TIM2_SetIC2Prescaler
1004  0030 2012          	jra	L304
1005  0032               L504:
1006                     ; 248     TI3_Config((uint8_t)TIM2_ICPolarity,
1006                     ; 249                (uint8_t)TIM2_ICSelection,
1006                     ; 250                (uint8_t)TIM2_ICFilter);
1008  0032 7b07          	ld	a,(OFST+7,sp)
1009  0034 88            	push	a
1010  0035 7b06          	ld	a,(OFST+6,sp)
1011  0037 97            	ld	xl,a
1012  0038 7b03          	ld	a,(OFST+3,sp)
1013  003a 95            	ld	xh,a
1014  003b cd0000        	call	L7_TI3_Config
1016  003e 84            	pop	a
1017                     ; 253     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1019  003f 7b06          	ld	a,(OFST+6,sp)
1020  0041 cd0000        	call	_TIM2_SetIC3Prescaler
1022  0044               L304:
1023                     ; 255 }
1026  0044 85            	popw	x
1027  0045 81            	ret	
1123                     ; 266 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1123                     ; 267                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1123                     ; 268                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1123                     ; 269                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1123                     ; 270                      uint8_t TIM2_ICFilter)
1123                     ; 271 {
1124                     .text:	section	.text,new
1125  0000               _TIM2_PWMIConfig:
1127  0000 89            	pushw	x
1128  0001 89            	pushw	x
1129       00000002      OFST:	set	2
1132                     ; 272   uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1134                     ; 273   uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1136                     ; 276   assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1138                     ; 277   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1140                     ; 278   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1142                     ; 279   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1144                     ; 282   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1146  0002 9f            	ld	a,xl
1147  0003 a144          	cp	a,#68
1148  0005 2706          	jreq	L754
1149                     ; 284     icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1151  0007 a644          	ld	a,#68
1152  0009 6b01          	ld	(OFST-1,sp),a
1155  000b 2002          	jra	L164
1156  000d               L754:
1157                     ; 288     icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1159  000d 0f01          	clr	(OFST-1,sp)
1161  000f               L164:
1162                     ; 292   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1164  000f 7b07          	ld	a,(OFST+5,sp)
1165  0011 4a            	dec	a
1166  0012 2604          	jrne	L364
1167                     ; 294     icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1169  0014 a602          	ld	a,#2
1171  0016 2002          	jra	L564
1172  0018               L364:
1173                     ; 298     icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1175  0018 a601          	ld	a,#1
1176  001a               L564:
1177  001a 6b02          	ld	(OFST+0,sp),a
1179                     ; 301   if (TIM2_Channel == TIM2_CHANNEL_1)
1181  001c 7b03          	ld	a,(OFST+1,sp)
1182  001e 2626          	jrne	L764
1183                     ; 304     TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1183                     ; 305                (uint8_t)TIM2_ICFilter);
1185  0020 7b09          	ld	a,(OFST+7,sp)
1186  0022 88            	push	a
1187  0023 7b08          	ld	a,(OFST+6,sp)
1188  0025 97            	ld	xl,a
1189  0026 7b05          	ld	a,(OFST+3,sp)
1190  0028 95            	ld	xh,a
1191  0029 cd0000        	call	L3_TI1_Config
1193  002c 84            	pop	a
1194                     ; 308     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1196  002d 7b08          	ld	a,(OFST+6,sp)
1197  002f cd0000        	call	_TIM2_SetIC1Prescaler
1199                     ; 311     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1201  0032 7b09          	ld	a,(OFST+7,sp)
1202  0034 88            	push	a
1203  0035 7b03          	ld	a,(OFST+1,sp)
1204  0037 97            	ld	xl,a
1205  0038 7b02          	ld	a,(OFST+0,sp)
1206  003a 95            	ld	xh,a
1207  003b cd0000        	call	L5_TI2_Config
1209  003e 84            	pop	a
1210                     ; 314     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1212  003f 7b08          	ld	a,(OFST+6,sp)
1213  0041 cd0000        	call	_TIM2_SetIC2Prescaler
1216  0044 2024          	jra	L174
1217  0046               L764:
1218                     ; 319     TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1218                     ; 320                (uint8_t)TIM2_ICFilter);
1220  0046 7b09          	ld	a,(OFST+7,sp)
1221  0048 88            	push	a
1222  0049 7b08          	ld	a,(OFST+6,sp)
1223  004b 97            	ld	xl,a
1224  004c 7b05          	ld	a,(OFST+3,sp)
1225  004e 95            	ld	xh,a
1226  004f cd0000        	call	L5_TI2_Config
1228  0052 84            	pop	a
1229                     ; 323     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1231  0053 7b08          	ld	a,(OFST+6,sp)
1232  0055 cd0000        	call	_TIM2_SetIC2Prescaler
1234                     ; 326     TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1236  0058 7b09          	ld	a,(OFST+7,sp)
1237  005a 88            	push	a
1238  005b 7b03          	ld	a,(OFST+1,sp)
1239  005d 97            	ld	xl,a
1240  005e 7b02          	ld	a,(OFST+0,sp)
1241  0060 95            	ld	xh,a
1242  0061 cd0000        	call	L3_TI1_Config
1244  0064 84            	pop	a
1245                     ; 329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1247  0065 7b08          	ld	a,(OFST+6,sp)
1248  0067 cd0000        	call	_TIM2_SetIC1Prescaler
1250  006a               L174:
1251                     ; 331 }
1254  006a 5b04          	addw	sp,#4
1255  006c 81            	ret	
1310                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1310                     ; 340 {
1311                     .text:	section	.text,new
1312  0000               _TIM2_Cmd:
1316                     ; 342   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1318                     ; 345   if (NewState != DISABLE)
1320  0000 4d            	tnz	a
1321  0001 2705          	jreq	L125
1322                     ; 347     TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1324  0003 72105300      	bset	21248,#0
1327  0007 81            	ret	
1328  0008               L125:
1329                     ; 351     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1331  0008 72115300      	bres	21248,#0
1332                     ; 353 }
1335  000c 81            	ret	
1414                     ; 368 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1414                     ; 369 {
1415                     .text:	section	.text,new
1416  0000               _TIM2_ITConfig:
1418  0000 89            	pushw	x
1419       00000000      OFST:	set	0
1422                     ; 371   assert_param(IS_TIM2_IT_OK(TIM2_IT));
1424                     ; 372   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1426                     ; 374   if (NewState != DISABLE)
1428  0001 9f            	ld	a,xl
1429  0002 4d            	tnz	a
1430  0003 2706          	jreq	L365
1431                     ; 377     TIM2->IER |= (uint8_t)TIM2_IT;
1433  0005 9e            	ld	a,xh
1434  0006 ca5303        	or	a,21251
1436  0009 2006          	jra	L565
1437  000b               L365:
1438                     ; 382     TIM2->IER &= (uint8_t)(~TIM2_IT);
1440  000b 7b01          	ld	a,(OFST+1,sp)
1441  000d 43            	cpl	a
1442  000e c45303        	and	a,21251
1443  0011               L565:
1444  0011 c75303        	ld	21251,a
1445                     ; 384 }
1448  0014 85            	popw	x
1449  0015 81            	ret	
1485                     ; 392 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1485                     ; 393 {
1486                     .text:	section	.text,new
1487  0000               _TIM2_UpdateDisableConfig:
1491                     ; 395   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1493                     ; 398   if (NewState != DISABLE)
1495  0000 4d            	tnz	a
1496  0001 2705          	jreq	L506
1497                     ; 400     TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1499  0003 72125300      	bset	21248,#1
1502  0007 81            	ret	
1503  0008               L506:
1504                     ; 404     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1506  0008 72135300      	bres	21248,#1
1507                     ; 406 }
1510  000c 81            	ret	
1568                     ; 416 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1568                     ; 417 {
1569                     .text:	section	.text,new
1570  0000               _TIM2_UpdateRequestConfig:
1574                     ; 419   assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
1576                     ; 422   if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
1578  0000 4d            	tnz	a
1579  0001 2705          	jreq	L736
1580                     ; 424     TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
1582  0003 72145300      	bset	21248,#2
1585  0007 81            	ret	
1586  0008               L736:
1587                     ; 428     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
1589  0008 72155300      	bres	21248,#2
1590                     ; 430 }
1593  000c 81            	ret	
1650                     ; 440 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1650                     ; 441 {
1651                     .text:	section	.text,new
1652  0000               _TIM2_SelectOnePulseMode:
1656                     ; 443   assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
1658                     ; 446   if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
1660  0000 4d            	tnz	a
1661  0001 2705          	jreq	L176
1662                     ; 448     TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
1664  0003 72165300      	bset	21248,#3
1667  0007 81            	ret	
1668  0008               L176:
1669                     ; 452     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
1671  0008 72175300      	bres	21248,#3
1672                     ; 454 }
1675  000c 81            	ret	
1743                     ; 484 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
1743                     ; 485                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
1743                     ; 486 {
1744                     .text:	section	.text,new
1745  0000               _TIM2_PrescalerConfig:
1749                     ; 488   assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
1751                     ; 489   assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
1753                     ; 492   TIM2->PSCR = (uint8_t)Prescaler;
1755  0000 9e            	ld	a,xh
1756  0001 c7530e        	ld	21262,a
1757                     ; 495   TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
1759  0004 9f            	ld	a,xl
1760  0005 c75306        	ld	21254,a
1761                     ; 496 }
1764  0008 81            	ret	
1822                     ; 507 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1822                     ; 508 {
1823                     .text:	section	.text,new
1824  0000               _TIM2_ForcedOC1Config:
1826  0000 88            	push	a
1827       00000000      OFST:	set	0
1830                     ; 510   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1832                     ; 513   TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
1832                     ; 514                             | (uint8_t)TIM2_ForcedAction);
1834  0001 c65307        	ld	a,21255
1835  0004 a48f          	and	a,#143
1836  0006 1a01          	or	a,(OFST+1,sp)
1837  0008 c75307        	ld	21255,a
1838                     ; 515 }
1841  000b 84            	pop	a
1842  000c 81            	ret	
1878                     ; 526 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1878                     ; 527 {
1879                     .text:	section	.text,new
1880  0000               _TIM2_ForcedOC2Config:
1882  0000 88            	push	a
1883       00000000      OFST:	set	0
1886                     ; 529   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1888                     ; 532   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
1888                     ; 533                           | (uint8_t)TIM2_ForcedAction);
1890  0001 c65308        	ld	a,21256
1891  0004 a48f          	and	a,#143
1892  0006 1a01          	or	a,(OFST+1,sp)
1893  0008 c75308        	ld	21256,a
1894                     ; 534 }
1897  000b 84            	pop	a
1898  000c 81            	ret	
1934                     ; 545 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1934                     ; 546 {
1935                     .text:	section	.text,new
1936  0000               _TIM2_ForcedOC3Config:
1938  0000 88            	push	a
1939       00000000      OFST:	set	0
1942                     ; 548   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1944                     ; 551   TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
1944                     ; 552                             | (uint8_t)TIM2_ForcedAction);
1946  0001 c65309        	ld	a,21257
1947  0004 a48f          	and	a,#143
1948  0006 1a01          	or	a,(OFST+1,sp)
1949  0008 c75309        	ld	21257,a
1950                     ; 553 }
1953  000b 84            	pop	a
1954  000c 81            	ret	
1990                     ; 561 void TIM2_ARRPreloadConfig(FunctionalState NewState)
1990                     ; 562 {
1991                     .text:	section	.text,new
1992  0000               _TIM2_ARRPreloadConfig:
1996                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1998                     ; 567   if (NewState != DISABLE)
2000  0000 4d            	tnz	a
2001  0001 2705          	jreq	L7201
2002                     ; 569     TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
2004  0003 721e5300      	bset	21248,#7
2007  0007 81            	ret	
2008  0008               L7201:
2009                     ; 573     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
2011  0008 721f5300      	bres	21248,#7
2012                     ; 575 }
2015  000c 81            	ret	
2051                     ; 583 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2051                     ; 584 {
2052                     .text:	section	.text,new
2053  0000               _TIM2_OC1PreloadConfig:
2057                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2059                     ; 589   if (NewState != DISABLE)
2061  0000 4d            	tnz	a
2062  0001 2705          	jreq	L1501
2063                     ; 591     TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2065  0003 72165307      	bset	21255,#3
2068  0007 81            	ret	
2069  0008               L1501:
2070                     ; 595     TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2072  0008 72175307      	bres	21255,#3
2073                     ; 597 }
2076  000c 81            	ret	
2112                     ; 605 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2112                     ; 606 {
2113                     .text:	section	.text,new
2114  0000               _TIM2_OC2PreloadConfig:
2118                     ; 608   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2120                     ; 611   if (NewState != DISABLE)
2122  0000 4d            	tnz	a
2123  0001 2705          	jreq	L3701
2124                     ; 613     TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2126  0003 72165308      	bset	21256,#3
2129  0007 81            	ret	
2130  0008               L3701:
2131                     ; 617     TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2133  0008 72175308      	bres	21256,#3
2134                     ; 619 }
2137  000c 81            	ret	
2173                     ; 627 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2173                     ; 628 {
2174                     .text:	section	.text,new
2175  0000               _TIM2_OC3PreloadConfig:
2179                     ; 630   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2181                     ; 633   if (NewState != DISABLE)
2183  0000 4d            	tnz	a
2184  0001 2705          	jreq	L5111
2185                     ; 635     TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2187  0003 72165309      	bset	21257,#3
2190  0007 81            	ret	
2191  0008               L5111:
2192                     ; 639     TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2194  0008 72175309      	bres	21257,#3
2195                     ; 641 }
2198  000c 81            	ret	
2271                     ; 653 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2271                     ; 654 {
2272                     .text:	section	.text,new
2273  0000               _TIM2_GenerateEvent:
2277                     ; 656   assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2279                     ; 659   TIM2->EGR = (uint8_t)TIM2_EventSource;
2281  0000 c75306        	ld	21254,a
2282                     ; 660 }
2285  0003 81            	ret	
2321                     ; 670 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2321                     ; 671 {
2322                     .text:	section	.text,new
2323  0000               _TIM2_OC1PolarityConfig:
2327                     ; 673   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2329                     ; 676   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2331  0000 4d            	tnz	a
2332  0001 2705          	jreq	L1711
2333                     ; 678     TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
2335  0003 7212530a      	bset	21258,#1
2338  0007 81            	ret	
2339  0008               L1711:
2340                     ; 682     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
2342  0008 7213530a      	bres	21258,#1
2343                     ; 684 }
2346  000c 81            	ret	
2382                     ; 694 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2382                     ; 695 {
2383                     .text:	section	.text,new
2384  0000               _TIM2_OC2PolarityConfig:
2388                     ; 697   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2390                     ; 700   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2392  0000 4d            	tnz	a
2393  0001 2705          	jreq	L3121
2394                     ; 702     TIM2->CCER1 |= TIM2_CCER1_CC2P;
2396  0003 721a530a      	bset	21258,#5
2399  0007 81            	ret	
2400  0008               L3121:
2401                     ; 706     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
2403  0008 721b530a      	bres	21258,#5
2404                     ; 708 }
2407  000c 81            	ret	
2443                     ; 718 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2443                     ; 719 {
2444                     .text:	section	.text,new
2445  0000               _TIM2_OC3PolarityConfig:
2449                     ; 721   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2451                     ; 724   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2453  0000 4d            	tnz	a
2454  0001 2705          	jreq	L5321
2455                     ; 726     TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
2457  0003 7212530b      	bset	21259,#1
2460  0007 81            	ret	
2461  0008               L5321:
2462                     ; 730     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
2464  0008 7213530b      	bres	21259,#1
2465                     ; 732 }
2468  000c 81            	ret	
2513                     ; 745 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
2513                     ; 746 {
2514                     .text:	section	.text,new
2515  0000               _TIM2_CCxCmd:
2517  0000 89            	pushw	x
2518       00000000      OFST:	set	0
2521                     ; 748   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2523                     ; 749   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2525                     ; 751   if (TIM2_Channel == TIM2_CHANNEL_1)
2527  0001 9e            	ld	a,xh
2528  0002 4d            	tnz	a
2529  0003 2610          	jrne	L3621
2530                     ; 754     if (NewState != DISABLE)
2532  0005 9f            	ld	a,xl
2533  0006 4d            	tnz	a
2534  0007 2706          	jreq	L5621
2535                     ; 756       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
2537  0009 7210530a      	bset	21258,#0
2539  000d 2029          	jra	L1721
2540  000f               L5621:
2541                     ; 760       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2543  000f 7211530a      	bres	21258,#0
2544  0013 2023          	jra	L1721
2545  0015               L3621:
2546                     ; 764   else if (TIM2_Channel == TIM2_CHANNEL_2)
2548  0015 7b01          	ld	a,(OFST+1,sp)
2549  0017 4a            	dec	a
2550  0018 2610          	jrne	L3721
2551                     ; 767     if (NewState != DISABLE)
2553  001a 7b02          	ld	a,(OFST+2,sp)
2554  001c 2706          	jreq	L5721
2555                     ; 769       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
2557  001e 7218530a      	bset	21258,#4
2559  0022 2014          	jra	L1721
2560  0024               L5721:
2561                     ; 773       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2563  0024 7219530a      	bres	21258,#4
2564  0028 200e          	jra	L1721
2565  002a               L3721:
2566                     ; 779     if (NewState != DISABLE)
2568  002a 7b02          	ld	a,(OFST+2,sp)
2569  002c 2706          	jreq	L3031
2570                     ; 781       TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
2572  002e 7210530b      	bset	21259,#0
2574  0032 2004          	jra	L1721
2575  0034               L3031:
2576                     ; 785       TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2578  0034 7211530b      	bres	21259,#0
2579  0038               L1721:
2580                     ; 788 }
2583  0038 85            	popw	x
2584  0039 81            	ret	
2629                     ; 810 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
2629                     ; 811 {
2630                     .text:	section	.text,new
2631  0000               _TIM2_SelectOCxM:
2633  0000 89            	pushw	x
2634       00000000      OFST:	set	0
2637                     ; 813   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2639                     ; 814   assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
2641                     ; 816   if (TIM2_Channel == TIM2_CHANNEL_1)
2643  0001 9e            	ld	a,xh
2644  0002 4d            	tnz	a
2645  0003 2610          	jrne	L1331
2646                     ; 819     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2648  0005 7211530a      	bres	21258,#0
2649                     ; 822     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
2649                     ; 823                             | (uint8_t)TIM2_OCMode);
2651  0009 c65307        	ld	a,21255
2652  000c a48f          	and	a,#143
2653  000e 1a02          	or	a,(OFST+2,sp)
2654  0010 c75307        	ld	21255,a
2656  0013 2023          	jra	L3331
2657  0015               L1331:
2658                     ; 825   else if (TIM2_Channel == TIM2_CHANNEL_2)
2660  0015 7b01          	ld	a,(OFST+1,sp)
2661  0017 4a            	dec	a
2662  0018 2610          	jrne	L5331
2663                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2665  001a 7219530a      	bres	21258,#4
2666                     ; 831     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
2666                     ; 832                             | (uint8_t)TIM2_OCMode);
2668  001e c65308        	ld	a,21256
2669  0021 a48f          	and	a,#143
2670  0023 1a02          	or	a,(OFST+2,sp)
2671  0025 c75308        	ld	21256,a
2673  0028 200e          	jra	L3331
2674  002a               L5331:
2675                     ; 837     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2677  002a 7211530b      	bres	21259,#0
2678                     ; 840     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2678                     ; 841                             | (uint8_t)TIM2_OCMode);
2680  002e c65309        	ld	a,21257
2681  0031 a48f          	and	a,#143
2682  0033 1a02          	or	a,(OFST+2,sp)
2683  0035 c75309        	ld	21257,a
2684  0038               L3331:
2685                     ; 843 }
2688  0038 85            	popw	x
2689  0039 81            	ret	
2723                     ; 851 void TIM2_SetCounter(uint16_t Counter)
2723                     ; 852 {
2724                     .text:	section	.text,new
2725  0000               _TIM2_SetCounter:
2729                     ; 854   TIM2->CNTRH = (uint8_t)(Counter >> 8);
2731  0000 9e            	ld	a,xh
2732  0001 c7530c        	ld	21260,a
2733                     ; 855   TIM2->CNTRL = (uint8_t)(Counter);
2735  0004 9f            	ld	a,xl
2736  0005 c7530d        	ld	21261,a
2737                     ; 856 }
2740  0008 81            	ret	
2774                     ; 864 void TIM2_SetAutoreload(uint16_t Autoreload)
2774                     ; 865 {
2775                     .text:	section	.text,new
2776  0000               _TIM2_SetAutoreload:
2780                     ; 867   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
2782  0000 9e            	ld	a,xh
2783  0001 c7530f        	ld	21263,a
2784                     ; 868   TIM2->ARRL = (uint8_t)(Autoreload);
2786  0004 9f            	ld	a,xl
2787  0005 c75310        	ld	21264,a
2788                     ; 869 }
2791  0008 81            	ret	
2825                     ; 877 void TIM2_SetCompare1(uint16_t Compare1)
2825                     ; 878 {
2826                     .text:	section	.text,new
2827  0000               _TIM2_SetCompare1:
2831                     ; 880   TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
2833  0000 9e            	ld	a,xh
2834  0001 c75311        	ld	21265,a
2835                     ; 881   TIM2->CCR1L = (uint8_t)(Compare1);
2837  0004 9f            	ld	a,xl
2838  0005 c75312        	ld	21266,a
2839                     ; 882 }
2842  0008 81            	ret	
2876                     ; 890 void TIM2_SetCompare2(uint16_t Compare2)
2876                     ; 891 {
2877                     .text:	section	.text,new
2878  0000               _TIM2_SetCompare2:
2882                     ; 893   TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
2884  0000 9e            	ld	a,xh
2885  0001 c75313        	ld	21267,a
2886                     ; 894   TIM2->CCR2L = (uint8_t)(Compare2);
2888  0004 9f            	ld	a,xl
2889  0005 c75314        	ld	21268,a
2890                     ; 895 }
2893  0008 81            	ret	
2927                     ; 903 void TIM2_SetCompare3(uint16_t Compare3)
2927                     ; 904 {
2928                     .text:	section	.text,new
2929  0000               _TIM2_SetCompare3:
2933                     ; 906   TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
2935  0000 9e            	ld	a,xh
2936  0001 c75315        	ld	21269,a
2937                     ; 907   TIM2->CCR3L = (uint8_t)(Compare3);
2939  0004 9f            	ld	a,xl
2940  0005 c75316        	ld	21270,a
2941                     ; 908 }
2944  0008 81            	ret	
2980                     ; 920 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
2980                     ; 921 {
2981                     .text:	section	.text,new
2982  0000               _TIM2_SetIC1Prescaler:
2984  0000 88            	push	a
2985       00000000      OFST:	set	0
2988                     ; 923   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
2990                     ; 926   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
2990                     ; 927                           | (uint8_t)TIM2_IC1Prescaler);
2992  0001 c65307        	ld	a,21255
2993  0004 a4f3          	and	a,#243
2994  0006 1a01          	or	a,(OFST+1,sp)
2995  0008 c75307        	ld	21255,a
2996                     ; 928 }
2999  000b 84            	pop	a
3000  000c 81            	ret	
3036                     ; 940 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3036                     ; 941 {
3037                     .text:	section	.text,new
3038  0000               _TIM2_SetIC2Prescaler:
3040  0000 88            	push	a
3041       00000000      OFST:	set	0
3044                     ; 943   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3046                     ; 946   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3046                     ; 947                           | (uint8_t)TIM2_IC2Prescaler);
3048  0001 c65308        	ld	a,21256
3049  0004 a4f3          	and	a,#243
3050  0006 1a01          	or	a,(OFST+1,sp)
3051  0008 c75308        	ld	21256,a
3052                     ; 948 }
3055  000b 84            	pop	a
3056  000c 81            	ret	
3092                     ; 960 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
3092                     ; 961 {
3093                     .text:	section	.text,new
3094  0000               _TIM2_SetIC3Prescaler:
3096  0000 88            	push	a
3097       00000000      OFST:	set	0
3100                     ; 964   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
3102                     ; 966   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3102                     ; 967                           | (uint8_t)TIM2_IC3Prescaler);
3104  0001 c65309        	ld	a,21257
3105  0004 a4f3          	and	a,#243
3106  0006 1a01          	or	a,(OFST+1,sp)
3107  0008 c75309        	ld	21257,a
3108                     ; 968 }
3111  000b 84            	pop	a
3112  000c 81            	ret	
3164                     ; 975 uint16_t TIM2_GetCapture1(void)
3164                     ; 976 {
3165                     .text:	section	.text,new
3166  0000               _TIM2_GetCapture1:
3168  0000 5204          	subw	sp,#4
3169       00000004      OFST:	set	4
3172                     ; 978   uint16_t tmpccr1 = 0;
3174                     ; 979   uint8_t tmpccr1l=0, tmpccr1h=0;
3178                     ; 981   tmpccr1h = TIM2->CCR1H;
3180  0002 c65311        	ld	a,21265
3181  0005 6b02          	ld	(OFST-2,sp),a
3183                     ; 982   tmpccr1l = TIM2->CCR1L;
3185  0007 c65312        	ld	a,21266
3186  000a 6b01          	ld	(OFST-3,sp),a
3188                     ; 984   tmpccr1 = (uint16_t)(tmpccr1l);
3190  000c 5f            	clrw	x
3191  000d 97            	ld	xl,a
3192  000e 1f03          	ldw	(OFST-1,sp),x
3194                     ; 985   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3196  0010 5f            	clrw	x
3197  0011 7b02          	ld	a,(OFST-2,sp)
3198  0013 97            	ld	xl,a
3199  0014 7b04          	ld	a,(OFST+0,sp)
3200  0016 01            	rrwa	x,a
3201  0017 1a03          	or	a,(OFST-1,sp)
3202  0019 01            	rrwa	x,a
3204                     ; 987   return (uint16_t)tmpccr1;
3208  001a 5b04          	addw	sp,#4
3209  001c 81            	ret	
3261                     ; 995 uint16_t TIM2_GetCapture2(void)
3261                     ; 996 {
3262                     .text:	section	.text,new
3263  0000               _TIM2_GetCapture2:
3265  0000 5204          	subw	sp,#4
3266       00000004      OFST:	set	4
3269                     ; 998   uint16_t tmpccr2 = 0;
3271                     ; 999   uint8_t tmpccr2l=0, tmpccr2h=0;
3275                     ; 1001   tmpccr2h = TIM2->CCR2H;
3277  0002 c65313        	ld	a,21267
3278  0005 6b02          	ld	(OFST-2,sp),a
3280                     ; 1002   tmpccr2l = TIM2->CCR2L;
3282  0007 c65314        	ld	a,21268
3283  000a 6b01          	ld	(OFST-3,sp),a
3285                     ; 1004   tmpccr2 = (uint16_t)(tmpccr2l);
3287  000c 5f            	clrw	x
3288  000d 97            	ld	xl,a
3289  000e 1f03          	ldw	(OFST-1,sp),x
3291                     ; 1005   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3293  0010 5f            	clrw	x
3294  0011 7b02          	ld	a,(OFST-2,sp)
3295  0013 97            	ld	xl,a
3296  0014 7b04          	ld	a,(OFST+0,sp)
3297  0016 01            	rrwa	x,a
3298  0017 1a03          	or	a,(OFST-1,sp)
3299  0019 01            	rrwa	x,a
3301                     ; 1007   return (uint16_t)tmpccr2;
3305  001a 5b04          	addw	sp,#4
3306  001c 81            	ret	
3358                     ; 1015 uint16_t TIM2_GetCapture3(void)
3358                     ; 1016 {
3359                     .text:	section	.text,new
3360  0000               _TIM2_GetCapture3:
3362  0000 5204          	subw	sp,#4
3363       00000004      OFST:	set	4
3366                     ; 1018   uint16_t tmpccr3 = 0;
3368                     ; 1019   uint8_t tmpccr3l=0, tmpccr3h=0;
3372                     ; 1021   tmpccr3h = TIM2->CCR3H;
3374  0002 c65315        	ld	a,21269
3375  0005 6b02          	ld	(OFST-2,sp),a
3377                     ; 1022   tmpccr3l = TIM2->CCR3L;
3379  0007 c65316        	ld	a,21270
3380  000a 6b01          	ld	(OFST-3,sp),a
3382                     ; 1024   tmpccr3 = (uint16_t)(tmpccr3l);
3384  000c 5f            	clrw	x
3385  000d 97            	ld	xl,a
3386  000e 1f03          	ldw	(OFST-1,sp),x
3388                     ; 1025   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
3390  0010 5f            	clrw	x
3391  0011 7b02          	ld	a,(OFST-2,sp)
3392  0013 97            	ld	xl,a
3393  0014 7b04          	ld	a,(OFST+0,sp)
3394  0016 01            	rrwa	x,a
3395  0017 1a03          	or	a,(OFST-1,sp)
3396  0019 01            	rrwa	x,a
3398                     ; 1027   return (uint16_t)tmpccr3;
3402  001a 5b04          	addw	sp,#4
3403  001c 81            	ret	
3437                     ; 1035 uint16_t TIM2_GetCounter(void)
3437                     ; 1036 {
3438                     .text:	section	.text,new
3439  0000               _TIM2_GetCounter:
3441  0000 89            	pushw	x
3442       00000002      OFST:	set	2
3445                     ; 1037   uint16_t tmpcntr = 0;
3447                     ; 1039   tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
3449  0001 c6530c        	ld	a,21260
3450  0004 97            	ld	xl,a
3451  0005 4f            	clr	a
3452  0006 02            	rlwa	x,a
3453  0007 1f01          	ldw	(OFST-1,sp),x
3455                     ; 1041   return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
3457  0009 c6530d        	ld	a,21261
3458  000c 5f            	clrw	x
3459  000d 97            	ld	xl,a
3460  000e 01            	rrwa	x,a
3461  000f 1a02          	or	a,(OFST+0,sp)
3462  0011 01            	rrwa	x,a
3463  0012 1a01          	or	a,(OFST-1,sp)
3464  0014 01            	rrwa	x,a
3467  0015 5b02          	addw	sp,#2
3468  0017 81            	ret	
3492                     ; 1049 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
3492                     ; 1050 {
3493                     .text:	section	.text,new
3494  0000               _TIM2_GetPrescaler:
3498                     ; 1052   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
3500  0000 c6530e        	ld	a,21262
3503  0003 81            	ret	
3642                     ; 1068 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3642                     ; 1069 {
3643                     .text:	section	.text,new
3644  0000               _TIM2_GetFlagStatus:
3646  0000 89            	pushw	x
3647  0001 89            	pushw	x
3648       00000002      OFST:	set	2
3651                     ; 1070   FlagStatus bitstatus = RESET;
3653                     ; 1071   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
3657                     ; 1074   assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
3659                     ; 1076   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
3661  0002 9f            	ld	a,xl
3662  0003 c45304        	and	a,21252
3663  0006 6b01          	ld	(OFST-1,sp),a
3665                     ; 1077   tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
3667  0008 7b03          	ld	a,(OFST+1,sp)
3668  000a 6b02          	ld	(OFST+0,sp),a
3670                     ; 1079   if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
3672  000c c45305        	and	a,21253
3673  000f 1a01          	or	a,(OFST-1,sp)
3674  0011 2702          	jreq	L5371
3675                     ; 1081     bitstatus = SET;
3677  0013 a601          	ld	a,#1
3680  0015               L5371:
3681                     ; 1085     bitstatus = RESET;
3684                     ; 1087   return (FlagStatus)bitstatus;
3688  0015 5b04          	addw	sp,#4
3689  0017 81            	ret	
3724                     ; 1103 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
3724                     ; 1104 {
3725                     .text:	section	.text,new
3726  0000               _TIM2_ClearFlag:
3730                     ; 1106   assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
3732                     ; 1109   TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
3734  0000 9f            	ld	a,xl
3735  0001 43            	cpl	a
3736  0002 c75304        	ld	21252,a
3737                     ; 1110   TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
3739  0005 35ff5305      	mov	21253,#255
3740                     ; 1111 }
3743  0009 81            	ret	
3807                     ; 1123 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
3807                     ; 1124 {
3808                     .text:	section	.text,new
3809  0000               _TIM2_GetITStatus:
3811  0000 88            	push	a
3812  0001 89            	pushw	x
3813       00000002      OFST:	set	2
3816                     ; 1125   ITStatus bitstatus = RESET;
3818                     ; 1126   uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
3822                     ; 1129   assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
3824                     ; 1131   TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
3826  0002 c45304        	and	a,21252
3827  0005 6b01          	ld	(OFST-1,sp),a
3829                     ; 1133   TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
3831  0007 c65303        	ld	a,21251
3832  000a 1403          	and	a,(OFST+1,sp)
3833  000c 6b02          	ld	(OFST+0,sp),a
3835                     ; 1135   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
3837  000e 7b01          	ld	a,(OFST-1,sp)
3838  0010 2708          	jreq	L1102
3840  0012 7b02          	ld	a,(OFST+0,sp)
3841  0014 2704          	jreq	L1102
3842                     ; 1137     bitstatus = SET;
3844  0016 a601          	ld	a,#1
3847  0018 2001          	jra	L3102
3848  001a               L1102:
3849                     ; 1141     bitstatus = RESET;
3851  001a 4f            	clr	a
3853  001b               L3102:
3854                     ; 1143   return (ITStatus)(bitstatus);
3858  001b 5b03          	addw	sp,#3
3859  001d 81            	ret	
3895                     ; 1156 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
3895                     ; 1157 {
3896                     .text:	section	.text,new
3897  0000               _TIM2_ClearITPendingBit:
3901                     ; 1159   assert_param(IS_TIM2_IT_OK(TIM2_IT));
3903                     ; 1162   TIM2->SR1 = (uint8_t)(~TIM2_IT);
3905  0000 43            	cpl	a
3906  0001 c75304        	ld	21252,a
3907                     ; 1163 }
3910  0004 81            	ret	
3962                     ; 1181 static void TI1_Config(uint8_t TIM2_ICPolarity,
3962                     ; 1182                        uint8_t TIM2_ICSelection,
3962                     ; 1183                        uint8_t TIM2_ICFilter)
3962                     ; 1184 {
3963                     .text:	section	.text,new
3964  0000               L3_TI1_Config:
3966  0000 89            	pushw	x
3967  0001 88            	push	a
3968       00000001      OFST:	set	1
3971                     ; 1186   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3973  0002 7211530a      	bres	21258,#0
3974                     ; 1189   TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
3974                     ; 1190                            | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
3976  0006 7b06          	ld	a,(OFST+5,sp)
3977  0008 97            	ld	xl,a
3978  0009 a610          	ld	a,#16
3979  000b 42            	mul	x,a
3980  000c 9f            	ld	a,xl
3981  000d 1a03          	or	a,(OFST+2,sp)
3982  000f 6b01          	ld	(OFST+0,sp),a
3984  0011 c65307        	ld	a,21255
3985  0014 a40c          	and	a,#12
3986  0016 1a01          	or	a,(OFST+0,sp)
3987  0018 c75307        	ld	21255,a
3988                     ; 1193   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
3990  001b 7b02          	ld	a,(OFST+1,sp)
3991  001d 2706          	jreq	L1602
3992                     ; 1195     TIM2->CCER1 |= TIM2_CCER1_CC1P;
3994  001f 7212530a      	bset	21258,#1
3996  0023 2004          	jra	L3602
3997  0025               L1602:
3998                     ; 1199     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
4000  0025 7213530a      	bres	21258,#1
4001  0029               L3602:
4002                     ; 1202   TIM2->CCER1 |= TIM2_CCER1_CC1E;
4004  0029 7210530a      	bset	21258,#0
4005                     ; 1203 }
4008  002d 5b03          	addw	sp,#3
4009  002f 81            	ret	
4061                     ; 1221 static void TI2_Config(uint8_t TIM2_ICPolarity,
4061                     ; 1222                        uint8_t TIM2_ICSelection,
4061                     ; 1223                        uint8_t TIM2_ICFilter)
4061                     ; 1224 {
4062                     .text:	section	.text,new
4063  0000               L5_TI2_Config:
4065  0000 89            	pushw	x
4066  0001 88            	push	a
4067       00000001      OFST:	set	1
4070                     ; 1226   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
4072  0002 7219530a      	bres	21258,#4
4073                     ; 1229   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
4073                     ; 1230                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4075  0006 7b06          	ld	a,(OFST+5,sp)
4076  0008 97            	ld	xl,a
4077  0009 a610          	ld	a,#16
4078  000b 42            	mul	x,a
4079  000c 9f            	ld	a,xl
4080  000d 1a03          	or	a,(OFST+2,sp)
4081  000f 6b01          	ld	(OFST+0,sp),a
4083  0011 c65308        	ld	a,21256
4084  0014 a40c          	and	a,#12
4085  0016 1a01          	or	a,(OFST+0,sp)
4086  0018 c75308        	ld	21256,a
4087                     ; 1234   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4089  001b 7b02          	ld	a,(OFST+1,sp)
4090  001d 2706          	jreq	L3112
4091                     ; 1236     TIM2->CCER1 |= TIM2_CCER1_CC2P;
4093  001f 721a530a      	bset	21258,#5
4095  0023 2004          	jra	L5112
4096  0025               L3112:
4097                     ; 1240     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
4099  0025 721b530a      	bres	21258,#5
4100  0029               L5112:
4101                     ; 1244   TIM2->CCER1 |= TIM2_CCER1_CC2E;
4103  0029 7218530a      	bset	21258,#4
4104                     ; 1245 }
4107  002d 5b03          	addw	sp,#3
4108  002f 81            	ret	
4160                     ; 1261 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
4160                     ; 1262                        uint8_t TIM2_ICFilter)
4160                     ; 1263 {
4161                     .text:	section	.text,new
4162  0000               L7_TI3_Config:
4164  0000 89            	pushw	x
4165  0001 88            	push	a
4166       00000001      OFST:	set	1
4169                     ; 1265   TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
4171  0002 7211530b      	bres	21259,#0
4172                     ; 1268   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
4172                     ; 1269                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4174  0006 7b06          	ld	a,(OFST+5,sp)
4175  0008 97            	ld	xl,a
4176  0009 a610          	ld	a,#16
4177  000b 42            	mul	x,a
4178  000c 9f            	ld	a,xl
4179  000d 1a03          	or	a,(OFST+2,sp)
4180  000f 6b01          	ld	(OFST+0,sp),a
4182  0011 c65309        	ld	a,21257
4183  0014 a40c          	and	a,#12
4184  0016 1a01          	or	a,(OFST+0,sp)
4185  0018 c75309        	ld	21257,a
4186                     ; 1273   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4188  001b 7b02          	ld	a,(OFST+1,sp)
4189  001d 2706          	jreq	L5412
4190                     ; 1275     TIM2->CCER2 |= TIM2_CCER2_CC3P;
4192  001f 7212530b      	bset	21259,#1
4194  0023 2004          	jra	L7412
4195  0025               L5412:
4196                     ; 1279     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
4198  0025 7213530b      	bres	21259,#1
4199  0029               L7412:
4200                     ; 1282   TIM2->CCER2 |= TIM2_CCER2_CC3E;
4202  0029 7210530b      	bset	21259,#0
4203                     ; 1283 }
4206  002d 5b03          	addw	sp,#3
4207  002f 81            	ret	
4220                     	xdef	_TIM2_ClearITPendingBit
4221                     	xdef	_TIM2_GetITStatus
4222                     	xdef	_TIM2_ClearFlag
4223                     	xdef	_TIM2_GetFlagStatus
4224                     	xdef	_TIM2_GetPrescaler
4225                     	xdef	_TIM2_GetCounter
4226                     	xdef	_TIM2_GetCapture3
4227                     	xdef	_TIM2_GetCapture2
4228                     	xdef	_TIM2_GetCapture1
4229                     	xdef	_TIM2_SetIC3Prescaler
4230                     	xdef	_TIM2_SetIC2Prescaler
4231                     	xdef	_TIM2_SetIC1Prescaler
4232                     	xdef	_TIM2_SetCompare3
4233                     	xdef	_TIM2_SetCompare2
4234                     	xdef	_TIM2_SetCompare1
4235                     	xdef	_TIM2_SetAutoreload
4236                     	xdef	_TIM2_SetCounter
4237                     	xdef	_TIM2_SelectOCxM
4238                     	xdef	_TIM2_CCxCmd
4239                     	xdef	_TIM2_OC3PolarityConfig
4240                     	xdef	_TIM2_OC2PolarityConfig
4241                     	xdef	_TIM2_OC1PolarityConfig
4242                     	xdef	_TIM2_GenerateEvent
4243                     	xdef	_TIM2_OC3PreloadConfig
4244                     	xdef	_TIM2_OC2PreloadConfig
4245                     	xdef	_TIM2_OC1PreloadConfig
4246                     	xdef	_TIM2_ARRPreloadConfig
4247                     	xdef	_TIM2_ForcedOC3Config
4248                     	xdef	_TIM2_ForcedOC2Config
4249                     	xdef	_TIM2_ForcedOC1Config
4250                     	xdef	_TIM2_PrescalerConfig
4251                     	xdef	_TIM2_SelectOnePulseMode
4252                     	xdef	_TIM2_UpdateRequestConfig
4253                     	xdef	_TIM2_UpdateDisableConfig
4254                     	xdef	_TIM2_ITConfig
4255                     	xdef	_TIM2_Cmd
4256                     	xdef	_TIM2_PWMIConfig
4257                     	xdef	_TIM2_ICInit
4258                     	xdef	_TIM2_OC3Init
4259                     	xdef	_TIM2_OC2Init
4260                     	xdef	_TIM2_OC1Init
4261                     	xdef	_TIM2_TimeBaseInit
4262                     	xdef	_TIM2_DeInit
4281                     	end
