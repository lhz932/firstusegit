   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
  48                     ; 58 void TIM1_DeInit(void)
  48                     ; 59 {
  50                     .text:	section	.text,new
  51  0000               _TIM1_DeInit:
  55                     ; 60   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  57  0000 725f5250      	clr	21072
  58                     ; 61   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  60  0004 725f5251      	clr	21073
  61                     ; 62   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  63  0008 725f5252      	clr	21074
  64                     ; 63   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  66  000c 725f5253      	clr	21075
  67                     ; 64   TIM1->IER  = TIM1_IER_RESET_VALUE;
  69  0010 725f5254      	clr	21076
  70                     ; 65   TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  72  0014 725f5256      	clr	21078
  73                     ; 67   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  75  0018 725f525c      	clr	21084
  76                     ; 68   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  78  001c 725f525d      	clr	21085
  79                     ; 70   TIM1->CCMR1 = 0x01;
  81  0020 35015258      	mov	21080,#1
  82                     ; 71   TIM1->CCMR2 = 0x01;
  84  0024 35015259      	mov	21081,#1
  85                     ; 72   TIM1->CCMR3 = 0x01;
  87  0028 3501525a      	mov	21082,#1
  88                     ; 73   TIM1->CCMR4 = 0x01;
  90  002c 3501525b      	mov	21083,#1
  91                     ; 75   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  93  0030 725f525c      	clr	21084
  94                     ; 76   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  96  0034 725f525d      	clr	21085
  97                     ; 77   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  99  0038 725f5258      	clr	21080
 100                     ; 78   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
 102  003c 725f5259      	clr	21081
 103                     ; 79   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 105  0040 725f525a      	clr	21082
 106                     ; 80   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 108  0044 725f525b      	clr	21083
 109                     ; 81   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 111  0048 725f525e      	clr	21086
 112                     ; 82   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 114  004c 725f525f      	clr	21087
 115                     ; 83   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 117  0050 725f5260      	clr	21088
 118                     ; 84   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 120  0054 725f5261      	clr	21089
 121                     ; 85   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 123  0058 35ff5262      	mov	21090,#255
 124                     ; 86   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 126  005c 35ff5263      	mov	21091,#255
 127                     ; 87   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 129  0060 725f5265      	clr	21093
 130                     ; 88   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 132  0064 725f5266      	clr	21094
 133                     ; 89   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 135  0068 725f5267      	clr	21095
 136                     ; 90   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 138  006c 725f5268      	clr	21096
 139                     ; 91   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 141  0070 725f5269      	clr	21097
 142                     ; 92   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 144  0074 725f526a      	clr	21098
 145                     ; 93   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 147  0078 725f526b      	clr	21099
 148                     ; 94   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 150  007c 725f526c      	clr	21100
 151                     ; 95   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 153  0080 725f526f      	clr	21103
 154                     ; 96   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 156  0084 35015257      	mov	21079,#1
 157                     ; 97   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 159  0088 725f526e      	clr	21102
 160                     ; 98   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 162  008c 725f526d      	clr	21101
 163                     ; 99   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 165  0090 725f5264      	clr	21092
 166                     ; 100   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 168  0094 725f5255      	clr	21077
 169                     ; 101 }
 172  0098 81            	ret	
 281                     ; 111 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 281                     ; 112                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 281                     ; 113                        uint16_t TIM1_Period,
 281                     ; 114                        uint8_t TIM1_RepetitionCounter)
 281                     ; 115 {
 282                     .text:	section	.text,new
 283  0000               _TIM1_TimeBaseInit:
 285  0000 89            	pushw	x
 286       00000000      OFST:	set	0
 289                     ; 117   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 291                     ; 120   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 293  0001 7b06          	ld	a,(OFST+6,sp)
 294  0003 c75262        	ld	21090,a
 295                     ; 121   TIM1->ARRL = (uint8_t)(TIM1_Period);
 297  0006 7b07          	ld	a,(OFST+7,sp)
 298  0008 c75263        	ld	21091,a
 299                     ; 124   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 301  000b 9e            	ld	a,xh
 302  000c c75260        	ld	21088,a
 303                     ; 125   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 305  000f 9f            	ld	a,xl
 306  0010 c75261        	ld	21089,a
 307                     ; 128   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 307                     ; 129                         | (uint8_t)(TIM1_CounterMode));
 309  0013 c65250        	ld	a,21072
 310  0016 a48f          	and	a,#143
 311  0018 1a05          	or	a,(OFST+5,sp)
 312  001a c75250        	ld	21072,a
 313                     ; 132   TIM1->RCR = TIM1_RepetitionCounter;
 315  001d 7b08          	ld	a,(OFST+8,sp)
 316  001f c75264        	ld	21092,a
 317                     ; 133 }
 320  0022 85            	popw	x
 321  0023 81            	ret	
 606                     ; 154 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 606                     ; 155                   TIM1_OutputState_TypeDef TIM1_OutputState,
 606                     ; 156                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 606                     ; 157                   uint16_t TIM1_Pulse,
 606                     ; 158                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 606                     ; 159                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 606                     ; 160                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 606                     ; 161                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 606                     ; 162 {
 607                     .text:	section	.text,new
 608  0000               _TIM1_OC1Init:
 610  0000 89            	pushw	x
 611  0001 5203          	subw	sp,#3
 612       00000003      OFST:	set	3
 615                     ; 164   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 617                     ; 165   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 619                     ; 166   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 621                     ; 167   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 623                     ; 168   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 625                     ; 169   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 627                     ; 170   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 629                     ; 174   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 629                     ; 175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 631  0003 c6525c        	ld	a,21084
 632  0006 a4f0          	and	a,#240
 633  0008 c7525c        	ld	21084,a
 634                     ; 178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 634                     ; 179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 634                     ; 180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 634                     ; 181                                        | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 636  000b 7b0c          	ld	a,(OFST+9,sp)
 637  000d a408          	and	a,#8
 638  000f 6b03          	ld	(OFST+0,sp),a
 640  0011 7b0b          	ld	a,(OFST+8,sp)
 641  0013 a402          	and	a,#2
 642  0015 1a03          	or	a,(OFST+0,sp)
 643  0017 6b02          	ld	(OFST-1,sp),a
 645  0019 7b08          	ld	a,(OFST+5,sp)
 646  001b a404          	and	a,#4
 647  001d 6b01          	ld	(OFST-2,sp),a
 649  001f 9f            	ld	a,xl
 650  0020 a401          	and	a,#1
 651  0022 1a01          	or	a,(OFST-2,sp)
 652  0024 1a02          	or	a,(OFST-1,sp)
 653  0026 ca525c        	or	a,21084
 654  0029 c7525c        	ld	21084,a
 655                     ; 184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 655                     ; 185                           (uint8_t)TIM1_OCMode);
 657  002c c65258        	ld	a,21080
 658  002f a48f          	and	a,#143
 659  0031 1a04          	or	a,(OFST+1,sp)
 660  0033 c75258        	ld	21080,a
 661                     ; 188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 663  0036 c6526f        	ld	a,21103
 664  0039 a4fc          	and	a,#252
 665  003b c7526f        	ld	21103,a
 666                     ; 190   TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 666                     ; 191                           (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 668  003e 7b0e          	ld	a,(OFST+11,sp)
 669  0040 a402          	and	a,#2
 670  0042 6b03          	ld	(OFST+0,sp),a
 672  0044 7b0d          	ld	a,(OFST+10,sp)
 673  0046 a401          	and	a,#1
 674  0048 1a03          	or	a,(OFST+0,sp)
 675  004a ca526f        	or	a,21103
 676  004d c7526f        	ld	21103,a
 677                     ; 194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 679  0050 7b09          	ld	a,(OFST+6,sp)
 680  0052 c75265        	ld	21093,a
 681                     ; 195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 683  0055 7b0a          	ld	a,(OFST+7,sp)
 684  0057 c75266        	ld	21094,a
 685                     ; 196 }
 688  005a 5b05          	addw	sp,#5
 689  005c 81            	ret	
 793                     ; 217 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 793                     ; 218                   TIM1_OutputState_TypeDef TIM1_OutputState,
 793                     ; 219                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 793                     ; 220                   uint16_t TIM1_Pulse,
 793                     ; 221                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 793                     ; 222                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 793                     ; 223                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 793                     ; 224                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 793                     ; 225 {
 794                     .text:	section	.text,new
 795  0000               _TIM1_OC2Init:
 797  0000 89            	pushw	x
 798  0001 5203          	subw	sp,#3
 799       00000003      OFST:	set	3
 802                     ; 227   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 804                     ; 228   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 806                     ; 229   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 808                     ; 230   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 810                     ; 231   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 812                     ; 232   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 814                     ; 233   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 816                     ; 237   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
 816                     ; 238                              TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 818  0003 c6525c        	ld	a,21084
 819  0006 a40f          	and	a,#15
 820  0008 c7525c        	ld	21084,a
 821                     ; 242   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
 821                     ; 243                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
 821                     ; 244                            (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
 821                     ; 245                                      (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
 823  000b 7b0c          	ld	a,(OFST+9,sp)
 824  000d a480          	and	a,#128
 825  000f 6b03          	ld	(OFST+0,sp),a
 827  0011 7b0b          	ld	a,(OFST+8,sp)
 828  0013 a420          	and	a,#32
 829  0015 1a03          	or	a,(OFST+0,sp)
 830  0017 6b02          	ld	(OFST-1,sp),a
 832  0019 7b08          	ld	a,(OFST+5,sp)
 833  001b a440          	and	a,#64
 834  001d 6b01          	ld	(OFST-2,sp),a
 836  001f 9f            	ld	a,xl
 837  0020 a410          	and	a,#16
 838  0022 1a01          	or	a,(OFST-2,sp)
 839  0024 1a02          	or	a,(OFST-1,sp)
 840  0026 ca525c        	or	a,21084
 841  0029 c7525c        	ld	21084,a
 842                     ; 248   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 842                     ; 249                           (uint8_t)TIM1_OCMode);
 844  002c c65259        	ld	a,21081
 845  002f a48f          	and	a,#143
 846  0031 1a04          	or	a,(OFST+1,sp)
 847  0033 c75259        	ld	21081,a
 848                     ; 252   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 850  0036 c6526f        	ld	a,21103
 851  0039 a4f3          	and	a,#243
 852  003b c7526f        	ld	21103,a
 853                     ; 254   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
 853                     ; 255                           (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 855  003e 7b0e          	ld	a,(OFST+11,sp)
 856  0040 a408          	and	a,#8
 857  0042 6b03          	ld	(OFST+0,sp),a
 859  0044 7b0d          	ld	a,(OFST+10,sp)
 860  0046 a404          	and	a,#4
 861  0048 1a03          	or	a,(OFST+0,sp)
 862  004a ca526f        	or	a,21103
 863  004d c7526f        	ld	21103,a
 864                     ; 258   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 866  0050 7b09          	ld	a,(OFST+6,sp)
 867  0052 c75267        	ld	21095,a
 868                     ; 259   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 870  0055 7b0a          	ld	a,(OFST+7,sp)
 871  0057 c75268        	ld	21096,a
 872                     ; 260 }
 875  005a 5b05          	addw	sp,#5
 876  005c 81            	ret	
 980                     ; 281 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 980                     ; 282                   TIM1_OutputState_TypeDef TIM1_OutputState,
 980                     ; 283                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 980                     ; 284                   uint16_t TIM1_Pulse,
 980                     ; 285                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 980                     ; 286                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 980                     ; 287                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 980                     ; 288                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 980                     ; 289 {
 981                     .text:	section	.text,new
 982  0000               _TIM1_OC3Init:
 984  0000 89            	pushw	x
 985  0001 5203          	subw	sp,#3
 986       00000003      OFST:	set	3
 989                     ; 291   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 991                     ; 292   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 993                     ; 293   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 995                     ; 294   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 997                     ; 295   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 999                     ; 296   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1001                     ; 297   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1003                     ; 301   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
1003                     ; 302                              TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1005  0003 c6525d        	ld	a,21085
1006  0006 a4f0          	and	a,#240
1007  0008 c7525d        	ld	21085,a
1008                     ; 305   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
1008                     ; 306                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
1008                     ; 307                            (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
1008                     ; 308                                      (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
1010  000b 7b0c          	ld	a,(OFST+9,sp)
1011  000d a408          	and	a,#8
1012  000f 6b03          	ld	(OFST+0,sp),a
1014  0011 7b0b          	ld	a,(OFST+8,sp)
1015  0013 a402          	and	a,#2
1016  0015 1a03          	or	a,(OFST+0,sp)
1017  0017 6b02          	ld	(OFST-1,sp),a
1019  0019 7b08          	ld	a,(OFST+5,sp)
1020  001b a404          	and	a,#4
1021  001d 6b01          	ld	(OFST-2,sp),a
1023  001f 9f            	ld	a,xl
1024  0020 a401          	and	a,#1
1025  0022 1a01          	or	a,(OFST-2,sp)
1026  0024 1a02          	or	a,(OFST-1,sp)
1027  0026 ca525d        	or	a,21085
1028  0029 c7525d        	ld	21085,a
1029                     ; 311   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1029                     ; 312                           (uint8_t)TIM1_OCMode);
1031  002c c6525a        	ld	a,21082
1032  002f a48f          	and	a,#143
1033  0031 1a04          	or	a,(OFST+1,sp)
1034  0033 c7525a        	ld	21082,a
1035                     ; 315   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1037  0036 c6526f        	ld	a,21103
1038  0039 a4cf          	and	a,#207
1039  003b c7526f        	ld	21103,a
1040                     ; 317   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1040                     ; 318                           (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1042  003e 7b0e          	ld	a,(OFST+11,sp)
1043  0040 a420          	and	a,#32
1044  0042 6b03          	ld	(OFST+0,sp),a
1046  0044 7b0d          	ld	a,(OFST+10,sp)
1047  0046 a410          	and	a,#16
1048  0048 1a03          	or	a,(OFST+0,sp)
1049  004a ca526f        	or	a,21103
1050  004d c7526f        	ld	21103,a
1051                     ; 321   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1053  0050 7b09          	ld	a,(OFST+6,sp)
1054  0052 c75269        	ld	21097,a
1055                     ; 322   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1057  0055 7b0a          	ld	a,(OFST+7,sp)
1058  0057 c7526a        	ld	21098,a
1059                     ; 323 }
1062  005a 5b05          	addw	sp,#5
1063  005c 81            	ret	
1137                     ; 338 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1137                     ; 339                   TIM1_OutputState_TypeDef TIM1_OutputState,
1137                     ; 340                   uint16_t TIM1_Pulse,
1137                     ; 341                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1137                     ; 342                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1137                     ; 343 {
1138                     .text:	section	.text,new
1139  0000               _TIM1_OC4Init:
1141  0000 89            	pushw	x
1142  0001 88            	push	a
1143       00000001      OFST:	set	1
1146                     ; 345   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1148                     ; 346   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1150                     ; 347   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1152                     ; 348   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1154                     ; 351   TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1156  0002 c6525d        	ld	a,21085
1157  0005 a4cf          	and	a,#207
1158  0007 c7525d        	ld	21085,a
1159                     ; 353   TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1159                     ; 354                            (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1161  000a 7b08          	ld	a,(OFST+7,sp)
1162  000c a420          	and	a,#32
1163  000e 6b01          	ld	(OFST+0,sp),a
1165  0010 9f            	ld	a,xl
1166  0011 a410          	and	a,#16
1167  0013 1a01          	or	a,(OFST+0,sp)
1168  0015 ca525d        	or	a,21085
1169  0018 c7525d        	ld	21085,a
1170                     ; 357   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1170                     ; 358                           TIM1_OCMode);
1172  001b c6525b        	ld	a,21083
1173  001e a48f          	and	a,#143
1174  0020 1a02          	or	a,(OFST+1,sp)
1175  0022 c7525b        	ld	21083,a
1176                     ; 361   if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1178  0025 7b09          	ld	a,(OFST+8,sp)
1179  0027 270a          	jreq	L534
1180                     ; 363     TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1182  0029 c6526f        	ld	a,21103
1183  002c aadf          	or	a,#223
1184  002e c7526f        	ld	21103,a
1186  0031 2004          	jra	L734
1187  0033               L534:
1188                     ; 367     TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1190  0033 721d526f      	bres	21103,#6
1191  0037               L734:
1192                     ; 371   TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1194  0037 7b06          	ld	a,(OFST+5,sp)
1195  0039 c7526b        	ld	21099,a
1196                     ; 372   TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1198  003c 7b07          	ld	a,(OFST+6,sp)
1199  003e c7526c        	ld	21100,a
1200                     ; 373 }
1203  0041 5b03          	addw	sp,#3
1204  0043 81            	ret	
1409                     ; 388 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1409                     ; 389                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1409                     ; 390                      uint8_t TIM1_DeadTime,
1409                     ; 391                      TIM1_BreakState_TypeDef TIM1_Break,
1409                     ; 392                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1409                     ; 393                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1409                     ; 394 {
1410                     .text:	section	.text,new
1411  0000               _TIM1_BDTRConfig:
1413  0000 89            	pushw	x
1414  0001 88            	push	a
1415       00000001      OFST:	set	1
1418                     ; 396   assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1420                     ; 397   assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1422                     ; 398   assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1424                     ; 399   assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1426                     ; 400   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
1428                     ; 402   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
1430  0002 7b06          	ld	a,(OFST+5,sp)
1431  0004 c7526e        	ld	21102,a
1432                     ; 406   TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
1432                     ; 407                           (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
1432                     ; 408                           (uint8_t)TIM1_AutomaticOutput));
1434  0007 7b07          	ld	a,(OFST+6,sp)
1435  0009 1a08          	or	a,(OFST+7,sp)
1436  000b 1a09          	or	a,(OFST+8,sp)
1437  000d 6b01          	ld	(OFST+0,sp),a
1439  000f 9f            	ld	a,xl
1440  0010 1a02          	or	a,(OFST+1,sp)
1441  0012 1a01          	or	a,(OFST+0,sp)
1442  0014 c7526d        	ld	21101,a
1443                     ; 409 }
1446  0017 5b03          	addw	sp,#3
1447  0019 81            	ret	
1649                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
1649                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1649                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
1649                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1649                     ; 427                  uint8_t TIM1_ICFilter)
1649                     ; 428 {
1650                     .text:	section	.text,new
1651  0000               _TIM1_ICInit:
1653  0000 89            	pushw	x
1654       00000000      OFST:	set	0
1657                     ; 430   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
1659                     ; 431   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1661                     ; 432   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1663                     ; 433   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1665                     ; 434   assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
1667                     ; 436   if (TIM1_Channel == TIM1_CHANNEL_1)
1669  0001 9e            	ld	a,xh
1670  0002 4d            	tnz	a
1671  0003 2614          	jrne	L766
1672                     ; 439     TI1_Config((uint8_t)TIM1_ICPolarity,
1672                     ; 440                (uint8_t)TIM1_ICSelection,
1672                     ; 441                (uint8_t)TIM1_ICFilter);
1674  0005 7b07          	ld	a,(OFST+7,sp)
1675  0007 88            	push	a
1676  0008 7b06          	ld	a,(OFST+6,sp)
1677  000a 97            	ld	xl,a
1678  000b 7b03          	ld	a,(OFST+3,sp)
1679  000d 95            	ld	xh,a
1680  000e cd0000        	call	L3_TI1_Config
1682  0011 84            	pop	a
1683                     ; 443     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1685  0012 7b06          	ld	a,(OFST+6,sp)
1686  0014 cd0000        	call	_TIM1_SetIC1Prescaler
1689  0017 2044          	jra	L176
1690  0019               L766:
1691                     ; 445   else if (TIM1_Channel == TIM1_CHANNEL_2)
1693  0019 7b01          	ld	a,(OFST+1,sp)
1694  001b a101          	cp	a,#1
1695  001d 2614          	jrne	L376
1696                     ; 448     TI2_Config((uint8_t)TIM1_ICPolarity,
1696                     ; 449                (uint8_t)TIM1_ICSelection,
1696                     ; 450                (uint8_t)TIM1_ICFilter);
1698  001f 7b07          	ld	a,(OFST+7,sp)
1699  0021 88            	push	a
1700  0022 7b06          	ld	a,(OFST+6,sp)
1701  0024 97            	ld	xl,a
1702  0025 7b03          	ld	a,(OFST+3,sp)
1703  0027 95            	ld	xh,a
1704  0028 cd0000        	call	L5_TI2_Config
1706  002b 84            	pop	a
1707                     ; 452     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1709  002c 7b06          	ld	a,(OFST+6,sp)
1710  002e cd0000        	call	_TIM1_SetIC2Prescaler
1713  0031 202a          	jra	L176
1714  0033               L376:
1715                     ; 454   else if (TIM1_Channel == TIM1_CHANNEL_3)
1717  0033 a102          	cp	a,#2
1718  0035 2614          	jrne	L776
1719                     ; 457     TI3_Config((uint8_t)TIM1_ICPolarity,
1719                     ; 458                (uint8_t)TIM1_ICSelection,
1719                     ; 459                (uint8_t)TIM1_ICFilter);
1721  0037 7b07          	ld	a,(OFST+7,sp)
1722  0039 88            	push	a
1723  003a 7b06          	ld	a,(OFST+6,sp)
1724  003c 97            	ld	xl,a
1725  003d 7b03          	ld	a,(OFST+3,sp)
1726  003f 95            	ld	xh,a
1727  0040 cd0000        	call	L7_TI3_Config
1729  0043 84            	pop	a
1730                     ; 461     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
1732  0044 7b06          	ld	a,(OFST+6,sp)
1733  0046 cd0000        	call	_TIM1_SetIC3Prescaler
1736  0049 2012          	jra	L176
1737  004b               L776:
1738                     ; 466     TI4_Config((uint8_t)TIM1_ICPolarity,
1738                     ; 467                (uint8_t)TIM1_ICSelection,
1738                     ; 468                (uint8_t)TIM1_ICFilter);
1740  004b 7b07          	ld	a,(OFST+7,sp)
1741  004d 88            	push	a
1742  004e 7b06          	ld	a,(OFST+6,sp)
1743  0050 97            	ld	xl,a
1744  0051 7b03          	ld	a,(OFST+3,sp)
1745  0053 95            	ld	xh,a
1746  0054 cd0000        	call	L11_TI4_Config
1748  0057 84            	pop	a
1749                     ; 470     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
1751  0058 7b06          	ld	a,(OFST+6,sp)
1752  005a cd0000        	call	_TIM1_SetIC4Prescaler
1754  005d               L176:
1755                     ; 472 }
1758  005d 85            	popw	x
1759  005e 81            	ret	
1855                     ; 488 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
1855                     ; 489                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1855                     ; 490                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
1855                     ; 491                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1855                     ; 492                      uint8_t TIM1_ICFilter)
1855                     ; 493 {
1856                     .text:	section	.text,new
1857  0000               _TIM1_PWMIConfig:
1859  0000 89            	pushw	x
1860  0001 89            	pushw	x
1861       00000002      OFST:	set	2
1864                     ; 494   uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
1866                     ; 495   uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
1868                     ; 498   assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
1870                     ; 499   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1872                     ; 500   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1874                     ; 501   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1876                     ; 504   if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
1878  0002 9f            	ld	a,xl
1879  0003 4a            	dec	a
1880  0004 2702          	jreq	L157
1881                     ; 506     icpolarity = TIM1_ICPOLARITY_FALLING;
1883  0006 a601          	ld	a,#1
1885  0008               L157:
1886                     ; 510     icpolarity = TIM1_ICPOLARITY_RISING;
1888  0008 6b01          	ld	(OFST-1,sp),a
1890                     ; 514   if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
1892  000a 7b07          	ld	a,(OFST+5,sp)
1893  000c 4a            	dec	a
1894  000d 2604          	jrne	L557
1895                     ; 516     icselection = TIM1_ICSELECTION_INDIRECTTI;
1897  000f a602          	ld	a,#2
1899  0011 2002          	jra	L757
1900  0013               L557:
1901                     ; 520     icselection = TIM1_ICSELECTION_DIRECTTI;
1903  0013 a601          	ld	a,#1
1904  0015               L757:
1905  0015 6b02          	ld	(OFST+0,sp),a
1907                     ; 523   if (TIM1_Channel == TIM1_CHANNEL_1)
1909  0017 7b03          	ld	a,(OFST+1,sp)
1910  0019 2626          	jrne	L167
1911                     ; 526     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1911                     ; 527                (uint8_t)TIM1_ICFilter);
1913  001b 7b09          	ld	a,(OFST+7,sp)
1914  001d 88            	push	a
1915  001e 7b08          	ld	a,(OFST+6,sp)
1916  0020 97            	ld	xl,a
1917  0021 7b05          	ld	a,(OFST+3,sp)
1918  0023 95            	ld	xh,a
1919  0024 cd0000        	call	L3_TI1_Config
1921  0027 84            	pop	a
1922                     ; 530     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1924  0028 7b08          	ld	a,(OFST+6,sp)
1925  002a cd0000        	call	_TIM1_SetIC1Prescaler
1927                     ; 533     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
1929  002d 7b09          	ld	a,(OFST+7,sp)
1930  002f 88            	push	a
1931  0030 7b03          	ld	a,(OFST+1,sp)
1932  0032 97            	ld	xl,a
1933  0033 7b02          	ld	a,(OFST+0,sp)
1934  0035 95            	ld	xh,a
1935  0036 cd0000        	call	L5_TI2_Config
1937  0039 84            	pop	a
1938                     ; 536     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1940  003a 7b08          	ld	a,(OFST+6,sp)
1941  003c cd0000        	call	_TIM1_SetIC2Prescaler
1944  003f 2024          	jra	L367
1945  0041               L167:
1946                     ; 541     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1946                     ; 542                (uint8_t)TIM1_ICFilter);
1948  0041 7b09          	ld	a,(OFST+7,sp)
1949  0043 88            	push	a
1950  0044 7b08          	ld	a,(OFST+6,sp)
1951  0046 97            	ld	xl,a
1952  0047 7b05          	ld	a,(OFST+3,sp)
1953  0049 95            	ld	xh,a
1954  004a cd0000        	call	L5_TI2_Config
1956  004d 84            	pop	a
1957                     ; 545     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1959  004e 7b08          	ld	a,(OFST+6,sp)
1960  0050 cd0000        	call	_TIM1_SetIC2Prescaler
1962                     ; 548     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
1964  0053 7b09          	ld	a,(OFST+7,sp)
1965  0055 88            	push	a
1966  0056 7b03          	ld	a,(OFST+1,sp)
1967  0058 97            	ld	xl,a
1968  0059 7b02          	ld	a,(OFST+0,sp)
1969  005b 95            	ld	xh,a
1970  005c cd0000        	call	L3_TI1_Config
1972  005f 84            	pop	a
1973                     ; 551     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1975  0060 7b08          	ld	a,(OFST+6,sp)
1976  0062 cd0000        	call	_TIM1_SetIC1Prescaler
1978  0065               L367:
1979                     ; 553 }
1982  0065 5b04          	addw	sp,#4
1983  0067 81            	ret	
2038                     ; 561 void TIM1_Cmd(FunctionalState NewState)
2038                     ; 562 {
2039                     .text:	section	.text,new
2040  0000               _TIM1_Cmd:
2044                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2046                     ; 567   if (NewState != DISABLE)
2048  0000 4d            	tnz	a
2049  0001 2705          	jreq	L3101
2050                     ; 569     TIM1->CR1 |= TIM1_CR1_CEN;
2052  0003 72105250      	bset	21072,#0
2055  0007 81            	ret	
2056  0008               L3101:
2057                     ; 573     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2059  0008 72115250      	bres	21072,#0
2060                     ; 575 }
2063  000c 81            	ret	
2099                     ; 583 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2099                     ; 584 {
2100                     .text:	section	.text,new
2101  0000               _TIM1_CtrlPWMOutputs:
2105                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2107                     ; 590   if (NewState != DISABLE)
2109  0000 4d            	tnz	a
2110  0001 2705          	jreq	L5301
2111                     ; 592     TIM1->BKR |= TIM1_BKR_MOE;
2113  0003 721e526d      	bset	21101,#7
2116  0007 81            	ret	
2117  0008               L5301:
2118                     ; 596     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2120  0008 721f526d      	bres	21101,#7
2121                     ; 598 }
2124  000c 81            	ret	
2231                     ; 617 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
2231                     ; 618 {
2232                     .text:	section	.text,new
2233  0000               _TIM1_ITConfig:
2235  0000 89            	pushw	x
2236       00000000      OFST:	set	0
2239                     ; 620   assert_param(IS_TIM1_IT_OK(TIM1_IT));
2241                     ; 621   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2243                     ; 623   if (NewState != DISABLE)
2245  0001 9f            	ld	a,xl
2246  0002 4d            	tnz	a
2247  0003 2706          	jreq	L7011
2248                     ; 626     TIM1->IER |= (uint8_t)TIM1_IT;
2250  0005 9e            	ld	a,xh
2251  0006 ca5254        	or	a,21076
2253  0009 2006          	jra	L1111
2254  000b               L7011:
2255                     ; 631     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
2257  000b 7b01          	ld	a,(OFST+1,sp)
2258  000d 43            	cpl	a
2259  000e c45254        	and	a,21076
2260  0011               L1111:
2261  0011 c75254        	ld	21076,a
2262                     ; 633 }
2265  0014 85            	popw	x
2266  0015 81            	ret	
2290                     ; 640 void TIM1_InternalClockConfig(void)
2290                     ; 641 {
2291                     .text:	section	.text,new
2292  0000               _TIM1_InternalClockConfig:
2296                     ; 643   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
2298  0000 c65252        	ld	a,21074
2299  0003 a4f8          	and	a,#248
2300  0005 c75252        	ld	21074,a
2301                     ; 644 }
2304  0008 81            	ret	
2421                     ; 662 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2421                     ; 663                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2421                     ; 664                               uint8_t ExtTRGFilter)
2421                     ; 665 {
2422                     .text:	section	.text,new
2423  0000               _TIM1_ETRClockMode1Config:
2425  0000 89            	pushw	x
2426       00000000      OFST:	set	0
2429                     ; 667   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2431                     ; 668   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2433                     ; 671   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2435  0001 7b05          	ld	a,(OFST+5,sp)
2436  0003 88            	push	a
2437  0004 7b02          	ld	a,(OFST+2,sp)
2438  0006 95            	ld	xh,a
2439  0007 cd0000        	call	_TIM1_ETRConfig
2441  000a 84            	pop	a
2442                     ; 674   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
2442                     ; 675                          | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
2444  000b c65252        	ld	a,21074
2445  000e aa77          	or	a,#119
2446  0010 c75252        	ld	21074,a
2447                     ; 676 }
2450  0013 85            	popw	x
2451  0014 81            	ret	
2509                     ; 694 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2509                     ; 695                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2509                     ; 696                               uint8_t ExtTRGFilter)
2509                     ; 697 {
2510                     .text:	section	.text,new
2511  0000               _TIM1_ETRClockMode2Config:
2513  0000 89            	pushw	x
2514       00000000      OFST:	set	0
2517                     ; 699   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2519                     ; 700   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2521                     ; 703   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2523  0001 7b05          	ld	a,(OFST+5,sp)
2524  0003 88            	push	a
2525  0004 7b02          	ld	a,(OFST+2,sp)
2526  0006 95            	ld	xh,a
2527  0007 cd0000        	call	_TIM1_ETRConfig
2529  000a 721c5253      	bset	21075,#6
2530  000e 84            	pop	a
2531                     ; 706   TIM1->ETR |= TIM1_ETR_ECE;
2533                     ; 707 }
2536  000f 85            	popw	x
2537  0010 81            	ret	
2593                     ; 725 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2593                     ; 726                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2593                     ; 727                     uint8_t ExtTRGFilter)
2593                     ; 728 {
2594                     .text:	section	.text,new
2595  0000               _TIM1_ETRConfig:
2597  0000 89            	pushw	x
2598       00000000      OFST:	set	0
2601                     ; 730   assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
2603                     ; 732   TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
2603                     ; 733                          (uint8_t)ExtTRGFilter );
2605  0001 9f            	ld	a,xl
2606  0002 1a01          	or	a,(OFST+1,sp)
2607  0004 1a05          	or	a,(OFST+5,sp)
2608  0006 ca5253        	or	a,21075
2609  0009 c75253        	ld	21075,a
2610                     ; 734 }
2613  000c 85            	popw	x
2614  000d 81            	ret	
2703                     ; 751 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
2703                     ; 752                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2703                     ; 753                                  uint8_t ICFilter)
2703                     ; 754 {
2704                     .text:	section	.text,new
2705  0000               _TIM1_TIxExternalClockConfig:
2707  0000 89            	pushw	x
2708       00000000      OFST:	set	0
2711                     ; 756   assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
2713                     ; 757   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2715                     ; 758   assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
2717                     ; 761   if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
2719  0001 9e            	ld	a,xh
2720  0002 a160          	cp	a,#96
2721  0004 260d          	jrne	L1131
2722                     ; 763     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2724  0006 7b05          	ld	a,(OFST+5,sp)
2725  0008 88            	push	a
2726  0009 9f            	ld	a,xl
2727  000a ae0001        	ldw	x,#1
2728  000d 95            	ld	xh,a
2729  000e cd0000        	call	L5_TI2_Config
2732  0011 200c          	jra	L3131
2733  0013               L1131:
2734                     ; 767     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2736  0013 7b05          	ld	a,(OFST+5,sp)
2737  0015 88            	push	a
2738  0016 7b03          	ld	a,(OFST+3,sp)
2739  0018 ae0001        	ldw	x,#1
2740  001b 95            	ld	xh,a
2741  001c cd0000        	call	L3_TI1_Config
2743  001f               L3131:
2744  001f 84            	pop	a
2745                     ; 771   TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
2747  0020 7b01          	ld	a,(OFST+1,sp)
2748  0022 cd0000        	call	_TIM1_SelectInputTrigger
2750                     ; 774   TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
2752  0025 c65252        	ld	a,21074
2753  0028 aa07          	or	a,#7
2754  002a c75252        	ld	21074,a
2755                     ; 775 }
2758  002d 85            	popw	x
2759  002e 81            	ret	
2844                     ; 787 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
2844                     ; 788 {
2845                     .text:	section	.text,new
2846  0000               _TIM1_SelectInputTrigger:
2848  0000 88            	push	a
2849       00000000      OFST:	set	0
2852                     ; 790   assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
2854                     ; 793   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
2856  0001 c65252        	ld	a,21074
2857  0004 a48f          	and	a,#143
2858  0006 1a01          	or	a,(OFST+1,sp)
2859  0008 c75252        	ld	21074,a
2860                     ; 794 }
2863  000b 84            	pop	a
2864  000c 81            	ret	
2900                     ; 803 void TIM1_UpdateDisableConfig(FunctionalState NewState)
2900                     ; 804 {
2901                     .text:	section	.text,new
2902  0000               _TIM1_UpdateDisableConfig:
2906                     ; 806   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2908                     ; 809   if (NewState != DISABLE)
2910  0000 4d            	tnz	a
2911  0001 2705          	jreq	L1731
2912                     ; 811     TIM1->CR1 |= TIM1_CR1_UDIS;
2914  0003 72125250      	bset	21072,#1
2917  0007 81            	ret	
2918  0008               L1731:
2919                     ; 815     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
2921  0008 72135250      	bres	21072,#1
2922                     ; 817 }
2925  000c 81            	ret	
2983                     ; 827 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
2983                     ; 828 {
2984                     .text:	section	.text,new
2985  0000               _TIM1_UpdateRequestConfig:
2989                     ; 830   assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
2991                     ; 833   if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
2993  0000 4d            	tnz	a
2994  0001 2705          	jreq	L3241
2995                     ; 835     TIM1->CR1 |= TIM1_CR1_URS;
2997  0003 72145250      	bset	21072,#2
3000  0007 81            	ret	
3001  0008               L3241:
3002                     ; 839     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
3004  0008 72155250      	bres	21072,#2
3005                     ; 841 }
3008  000c 81            	ret	
3044                     ; 849 void TIM1_SelectHallSensor(FunctionalState NewState)
3044                     ; 850 {
3045                     .text:	section	.text,new
3046  0000               _TIM1_SelectHallSensor:
3050                     ; 852   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3052                     ; 855   if (NewState != DISABLE)
3054  0000 4d            	tnz	a
3055  0001 2705          	jreq	L5441
3056                     ; 857     TIM1->CR2 |= TIM1_CR2_TI1S;
3058  0003 721e5251      	bset	21073,#7
3061  0007 81            	ret	
3062  0008               L5441:
3063                     ; 861     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
3065  0008 721f5251      	bres	21073,#7
3066                     ; 863 }
3069  000c 81            	ret	
3126                     ; 873 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
3126                     ; 874 {
3127                     .text:	section	.text,new
3128  0000               _TIM1_SelectOnePulseMode:
3132                     ; 876   assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
3134                     ; 879   if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
3136  0000 4d            	tnz	a
3137  0001 2705          	jreq	L7741
3138                     ; 881     TIM1->CR1 |= TIM1_CR1_OPM;
3140  0003 72165250      	bset	21072,#3
3143  0007 81            	ret	
3144  0008               L7741:
3145                     ; 885     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
3147  0008 72175250      	bres	21072,#3
3148                     ; 888 }
3151  000c 81            	ret	
3249                     ; 903 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
3249                     ; 904 {
3250                     .text:	section	.text,new
3251  0000               _TIM1_SelectOutputTrigger:
3253  0000 88            	push	a
3254       00000000      OFST:	set	0
3257                     ; 906   assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
3259                     ; 909   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
3259                     ; 910                         (uint8_t) TIM1_TRGOSource);
3261  0001 c65251        	ld	a,21073
3262  0004 a48f          	and	a,#143
3263  0006 1a01          	or	a,(OFST+1,sp)
3264  0008 c75251        	ld	21073,a
3265                     ; 911 }
3268  000b 84            	pop	a
3269  000c 81            	ret	
3343                     ; 923 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
3343                     ; 924 {
3344                     .text:	section	.text,new
3345  0000               _TIM1_SelectSlaveMode:
3347  0000 88            	push	a
3348       00000000      OFST:	set	0
3351                     ; 926   assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
3353                     ; 929   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
3353                     ; 930                          (uint8_t)TIM1_SlaveMode);
3355  0001 c65252        	ld	a,21074
3356  0004 a4f8          	and	a,#248
3357  0006 1a01          	or	a,(OFST+1,sp)
3358  0008 c75252        	ld	21074,a
3359                     ; 931 }
3362  000b 84            	pop	a
3363  000c 81            	ret	
3399                     ; 939 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
3399                     ; 940 {
3400                     .text:	section	.text,new
3401  0000               _TIM1_SelectMasterSlaveMode:
3405                     ; 942   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3407                     ; 945   if (NewState != DISABLE)
3409  0000 4d            	tnz	a
3410  0001 2705          	jreq	L3161
3411                     ; 947     TIM1->SMCR |= TIM1_SMCR_MSM;
3413  0003 721e5252      	bset	21074,#7
3416  0007 81            	ret	
3417  0008               L3161:
3418                     ; 951     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
3420  0008 721f5252      	bres	21074,#7
3421                     ; 953 }
3424  000c 81            	ret	
3510                     ; 975 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
3510                     ; 976                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
3510                     ; 977                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
3510                     ; 978 {
3511                     .text:	section	.text,new
3512  0000               _TIM1_EncoderInterfaceConfig:
3514  0000 89            	pushw	x
3515       00000000      OFST:	set	0
3518                     ; 980   assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
3520                     ; 981   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
3522                     ; 982   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
3524                     ; 985   if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
3526  0001 9f            	ld	a,xl
3527  0002 4d            	tnz	a
3528  0003 2706          	jreq	L7561
3529                     ; 987     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3531  0005 7212525c      	bset	21084,#1
3533  0009 2004          	jra	L1661
3534  000b               L7561:
3535                     ; 991     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3537  000b 7213525c      	bres	21084,#1
3538  000f               L1661:
3539                     ; 994   if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
3541  000f 7b05          	ld	a,(OFST+5,sp)
3542  0011 2706          	jreq	L3661
3543                     ; 996     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3545  0013 721a525c      	bset	21084,#5
3547  0017 2004          	jra	L5661
3548  0019               L3661:
3549                     ; 1000     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3551  0019 721b525c      	bres	21084,#5
3552  001d               L5661:
3553                     ; 1003   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
3553                     ; 1004                          | (uint8_t) TIM1_EncoderMode);
3555  001d c65252        	ld	a,21074
3556  0020 a4f0          	and	a,#240
3557  0022 1a01          	or	a,(OFST+1,sp)
3558  0024 c75252        	ld	21074,a
3559                     ; 1007   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
3559                     ; 1008                           | (uint8_t) CCMR_TIxDirect_Set);
3561  0027 c65258        	ld	a,21080
3562  002a a4fc          	and	a,#252
3563  002c aa01          	or	a,#1
3564  002e c75258        	ld	21080,a
3565                     ; 1009   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
3565                     ; 1010                           | (uint8_t) CCMR_TIxDirect_Set);
3567  0031 c65259        	ld	a,21081
3568  0034 a4fc          	and	a,#252
3569  0036 aa01          	or	a,#1
3570  0038 c75259        	ld	21081,a
3571                     ; 1011 }
3574  003b 85            	popw	x
3575  003c 81            	ret	
3642                     ; 1023 void TIM1_PrescalerConfig(uint16_t Prescaler,
3642                     ; 1024                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
3642                     ; 1025 {
3643                     .text:	section	.text,new
3644  0000               _TIM1_PrescalerConfig:
3646  0000 89            	pushw	x
3647       00000000      OFST:	set	0
3650                     ; 1027   assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
3652                     ; 1030   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
3654  0001 9e            	ld	a,xh
3655  0002 c75260        	ld	21088,a
3656                     ; 1031   TIM1->PSCRL = (uint8_t)(Prescaler);
3658  0005 9f            	ld	a,xl
3659  0006 c75261        	ld	21089,a
3660                     ; 1034   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
3662  0009 7b05          	ld	a,(OFST+5,sp)
3663  000b c75257        	ld	21079,a
3664                     ; 1035 }
3667  000e 85            	popw	x
3668  000f 81            	ret	
3704                     ; 1048 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
3704                     ; 1049 {
3705                     .text:	section	.text,new
3706  0000               _TIM1_CounterModeConfig:
3708  0000 88            	push	a
3709       00000000      OFST:	set	0
3712                     ; 1051   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
3714                     ; 1055   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
3714                     ; 1056                         | (uint8_t)TIM1_CounterMode);
3716  0001 c65250        	ld	a,21072
3717  0004 a48f          	and	a,#143
3718  0006 1a01          	or	a,(OFST+1,sp)
3719  0008 c75250        	ld	21072,a
3720                     ; 1057 }
3723  000b 84            	pop	a
3724  000c 81            	ret	
3782                     ; 1067 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3782                     ; 1068 {
3783                     .text:	section	.text,new
3784  0000               _TIM1_ForcedOC1Config:
3786  0000 88            	push	a
3787       00000000      OFST:	set	0
3790                     ; 1070   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3792                     ; 1073   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
3792                     ; 1074                            (uint8_t)TIM1_ForcedAction);
3794  0001 c65258        	ld	a,21080
3795  0004 a48f          	and	a,#143
3796  0006 1a01          	or	a,(OFST+1,sp)
3797  0008 c75258        	ld	21080,a
3798                     ; 1075 }
3801  000b 84            	pop	a
3802  000c 81            	ret	
3838                     ; 1085 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3838                     ; 1086 {
3839                     .text:	section	.text,new
3840  0000               _TIM1_ForcedOC2Config:
3842  0000 88            	push	a
3843       00000000      OFST:	set	0
3846                     ; 1088   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3848                     ; 1091   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
3848                     ; 1092                             | (uint8_t)TIM1_ForcedAction);
3850  0001 c65259        	ld	a,21081
3851  0004 a48f          	and	a,#143
3852  0006 1a01          	or	a,(OFST+1,sp)
3853  0008 c75259        	ld	21081,a
3854                     ; 1093 }
3857  000b 84            	pop	a
3858  000c 81            	ret	
3894                     ; 1104 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3894                     ; 1105 {
3895                     .text:	section	.text,new
3896  0000               _TIM1_ForcedOC3Config:
3898  0000 88            	push	a
3899       00000000      OFST:	set	0
3902                     ; 1107   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3904                     ; 1110   TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
3904                     ; 1111                             | (uint8_t)TIM1_ForcedAction);
3906  0001 c6525a        	ld	a,21082
3907  0004 a48f          	and	a,#143
3908  0006 1a01          	or	a,(OFST+1,sp)
3909  0008 c7525a        	ld	21082,a
3910                     ; 1112 }
3913  000b 84            	pop	a
3914  000c 81            	ret	
3950                     ; 1123 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3950                     ; 1124 {
3951                     .text:	section	.text,new
3952  0000               _TIM1_ForcedOC4Config:
3954  0000 88            	push	a
3955       00000000      OFST:	set	0
3958                     ; 1126   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3960                     ; 1129   TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
3960                     ; 1130                             | (uint8_t)TIM1_ForcedAction);
3962  0001 c6525b        	ld	a,21083
3963  0004 a48f          	and	a,#143
3964  0006 1a01          	or	a,(OFST+1,sp)
3965  0008 c7525b        	ld	21083,a
3966                     ; 1131 }
3969  000b 84            	pop	a
3970  000c 81            	ret	
4006                     ; 1139 void TIM1_ARRPreloadConfig(FunctionalState NewState)
4006                     ; 1140 {
4007                     .text:	section	.text,new
4008  0000               _TIM1_ARRPreloadConfig:
4012                     ; 1142   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4014                     ; 1145   if (NewState != DISABLE)
4016  0000 4d            	tnz	a
4017  0001 2705          	jreq	L5502
4018                     ; 1147     TIM1->CR1 |= TIM1_CR1_ARPE;
4020  0003 721e5250      	bset	21072,#7
4023  0007 81            	ret	
4024  0008               L5502:
4025                     ; 1151     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
4027  0008 721f5250      	bres	21072,#7
4028                     ; 1153 }
4031  000c 81            	ret	
4066                     ; 1161 void TIM1_SelectCOM(FunctionalState NewState)
4066                     ; 1162 {
4067                     .text:	section	.text,new
4068  0000               _TIM1_SelectCOM:
4072                     ; 1164   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4074                     ; 1167   if (NewState != DISABLE)
4076  0000 4d            	tnz	a
4077  0001 2705          	jreq	L7702
4078                     ; 1169     TIM1->CR2 |= TIM1_CR2_COMS;
4080  0003 72145251      	bset	21073,#2
4083  0007 81            	ret	
4084  0008               L7702:
4085                     ; 1173     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
4087  0008 72155251      	bres	21073,#2
4088                     ; 1175 }
4091  000c 81            	ret	
4127                     ; 1183 void TIM1_CCPreloadControl(FunctionalState NewState)
4127                     ; 1184 {
4128                     .text:	section	.text,new
4129  0000               _TIM1_CCPreloadControl:
4133                     ; 1186   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4135                     ; 1189   if (NewState != DISABLE)
4137  0000 4d            	tnz	a
4138  0001 2705          	jreq	L1212
4139                     ; 1191     TIM1->CR2 |= TIM1_CR2_CCPC;
4141  0003 72105251      	bset	21073,#0
4144  0007 81            	ret	
4145  0008               L1212:
4146                     ; 1195     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
4148  0008 72115251      	bres	21073,#0
4149                     ; 1197 }
4152  000c 81            	ret	
4188                     ; 1205 void TIM1_OC1PreloadConfig(FunctionalState NewState)
4188                     ; 1206 {
4189                     .text:	section	.text,new
4190  0000               _TIM1_OC1PreloadConfig:
4194                     ; 1208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4196                     ; 1211   if (NewState != DISABLE)
4198  0000 4d            	tnz	a
4199  0001 2705          	jreq	L3412
4200                     ; 1213     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
4202  0003 72165258      	bset	21080,#3
4205  0007 81            	ret	
4206  0008               L3412:
4207                     ; 1217     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4209  0008 72175258      	bres	21080,#3
4210                     ; 1219 }
4213  000c 81            	ret	
4249                     ; 1227 void TIM1_OC2PreloadConfig(FunctionalState NewState)
4249                     ; 1228 {
4250                     .text:	section	.text,new
4251  0000               _TIM1_OC2PreloadConfig:
4255                     ; 1230   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4257                     ; 1233   if (NewState != DISABLE)
4259  0000 4d            	tnz	a
4260  0001 2705          	jreq	L5612
4261                     ; 1235     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
4263  0003 72165259      	bset	21081,#3
4266  0007 81            	ret	
4267  0008               L5612:
4268                     ; 1239     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4270  0008 72175259      	bres	21081,#3
4271                     ; 1241 }
4274  000c 81            	ret	
4310                     ; 1249 void TIM1_OC3PreloadConfig(FunctionalState NewState)
4310                     ; 1250 {
4311                     .text:	section	.text,new
4312  0000               _TIM1_OC3PreloadConfig:
4316                     ; 1252   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4318                     ; 1255   if (NewState != DISABLE)
4320  0000 4d            	tnz	a
4321  0001 2705          	jreq	L7022
4322                     ; 1257     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
4324  0003 7216525a      	bset	21082,#3
4327  0007 81            	ret	
4328  0008               L7022:
4329                     ; 1261     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4331  0008 7217525a      	bres	21082,#3
4332                     ; 1263 }
4335  000c 81            	ret	
4371                     ; 1271 void TIM1_OC4PreloadConfig(FunctionalState NewState)
4371                     ; 1272 {
4372                     .text:	section	.text,new
4373  0000               _TIM1_OC4PreloadConfig:
4377                     ; 1274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4379                     ; 1277   if (NewState != DISABLE)
4381  0000 4d            	tnz	a
4382  0001 2705          	jreq	L1322
4383                     ; 1279     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
4385  0003 7216525b      	bset	21083,#3
4388  0007 81            	ret	
4389  0008               L1322:
4390                     ; 1283     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4392  0008 7217525b      	bres	21083,#3
4393                     ; 1285 }
4396  000c 81            	ret	
4431                     ; 1293 void TIM1_OC1FastConfig(FunctionalState NewState)
4431                     ; 1294 {
4432                     .text:	section	.text,new
4433  0000               _TIM1_OC1FastConfig:
4437                     ; 1296   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4439                     ; 1299   if (NewState != DISABLE)
4441  0000 4d            	tnz	a
4442  0001 2705          	jreq	L3522
4443                     ; 1301     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
4445  0003 72145258      	bset	21080,#2
4448  0007 81            	ret	
4449  0008               L3522:
4450                     ; 1305     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4452  0008 72155258      	bres	21080,#2
4453                     ; 1307 }
4456  000c 81            	ret	
4491                     ; 1315 void TIM1_OC2FastConfig(FunctionalState NewState)
4491                     ; 1316 {
4492                     .text:	section	.text,new
4493  0000               _TIM1_OC2FastConfig:
4497                     ; 1318   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4499                     ; 1321   if (NewState != DISABLE)
4501  0000 4d            	tnz	a
4502  0001 2705          	jreq	L5722
4503                     ; 1323     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
4505  0003 72145259      	bset	21081,#2
4508  0007 81            	ret	
4509  0008               L5722:
4510                     ; 1327     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4512  0008 72155259      	bres	21081,#2
4513                     ; 1329 }
4516  000c 81            	ret	
4551                     ; 1337 void TIM1_OC3FastConfig(FunctionalState NewState)
4551                     ; 1338 {
4552                     .text:	section	.text,new
4553  0000               _TIM1_OC3FastConfig:
4557                     ; 1340   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4559                     ; 1343   if (NewState != DISABLE)
4561  0000 4d            	tnz	a
4562  0001 2705          	jreq	L7132
4563                     ; 1345     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
4565  0003 7214525a      	bset	21082,#2
4568  0007 81            	ret	
4569  0008               L7132:
4570                     ; 1349     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4572  0008 7215525a      	bres	21082,#2
4573                     ; 1351 }
4576  000c 81            	ret	
4611                     ; 1359 void TIM1_OC4FastConfig(FunctionalState NewState)
4611                     ; 1360 {
4612                     .text:	section	.text,new
4613  0000               _TIM1_OC4FastConfig:
4617                     ; 1362   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4619                     ; 1365   if (NewState != DISABLE)
4621  0000 4d            	tnz	a
4622  0001 2705          	jreq	L1432
4623                     ; 1367     TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
4625  0003 7214525b      	bset	21083,#2
4628  0007 81            	ret	
4629  0008               L1432:
4630                     ; 1371     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4632  0008 7215525b      	bres	21083,#2
4633                     ; 1373 }
4636  000c 81            	ret	
4741                     ; 1389 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
4741                     ; 1390 {
4742                     .text:	section	.text,new
4743  0000               _TIM1_GenerateEvent:
4747                     ; 1392   assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
4749                     ; 1395   TIM1->EGR = (uint8_t)TIM1_EventSource;
4751  0000 c75257        	ld	21079,a
4752                     ; 1396 }
4755  0003 81            	ret	
4791                     ; 1406 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4791                     ; 1407 {
4792                     .text:	section	.text,new
4793  0000               _TIM1_OC1PolarityConfig:
4797                     ; 1409   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4799                     ; 1412   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4801  0000 4d            	tnz	a
4802  0001 2705          	jreq	L5242
4803                     ; 1414     TIM1->CCER1 |= TIM1_CCER1_CC1P;
4805  0003 7212525c      	bset	21084,#1
4808  0007 81            	ret	
4809  0008               L5242:
4810                     ; 1418     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4812  0008 7213525c      	bres	21084,#1
4813                     ; 1420 }
4816  000c 81            	ret	
4852                     ; 1430 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4852                     ; 1431 {
4853                     .text:	section	.text,new
4854  0000               _TIM1_OC1NPolarityConfig:
4858                     ; 1433   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4860                     ; 1436   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4862  0000 4d            	tnz	a
4863  0001 2705          	jreq	L7442
4864                     ; 1438     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
4866  0003 7216525c      	bset	21084,#3
4869  0007 81            	ret	
4870  0008               L7442:
4871                     ; 1442     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
4873  0008 7217525c      	bres	21084,#3
4874                     ; 1444 }
4877  000c 81            	ret	
4913                     ; 1454 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4913                     ; 1455 {
4914                     .text:	section	.text,new
4915  0000               _TIM1_OC2PolarityConfig:
4919                     ; 1457   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4921                     ; 1460   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4923  0000 4d            	tnz	a
4924  0001 2705          	jreq	L1742
4925                     ; 1462     TIM1->CCER1 |= TIM1_CCER1_CC2P;
4927  0003 721a525c      	bset	21084,#5
4930  0007 81            	ret	
4931  0008               L1742:
4932                     ; 1466     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4934  0008 721b525c      	bres	21084,#5
4935                     ; 1468 }
4938  000c 81            	ret	
4974                     ; 1478 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4974                     ; 1479 {
4975                     .text:	section	.text,new
4976  0000               _TIM1_OC2NPolarityConfig:
4980                     ; 1481   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4982                     ; 1484   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4984  0000 4d            	tnz	a
4985  0001 2705          	jreq	L3152
4986                     ; 1486     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
4988  0003 721e525c      	bset	21084,#7
4991  0007 81            	ret	
4992  0008               L3152:
4993                     ; 1490     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
4995  0008 721f525c      	bres	21084,#7
4996                     ; 1492 }
4999  000c 81            	ret	
5035                     ; 1502 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5035                     ; 1503 {
5036                     .text:	section	.text,new
5037  0000               _TIM1_OC3PolarityConfig:
5041                     ; 1505   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5043                     ; 1508   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5045  0000 4d            	tnz	a
5046  0001 2705          	jreq	L5352
5047                     ; 1510     TIM1->CCER2 |= TIM1_CCER2_CC3P;
5049  0003 7212525d      	bset	21085,#1
5052  0007 81            	ret	
5053  0008               L5352:
5054                     ; 1514     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
5056  0008 7213525d      	bres	21085,#1
5057                     ; 1516 }
5060  000c 81            	ret	
5096                     ; 1527 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5096                     ; 1528 {
5097                     .text:	section	.text,new
5098  0000               _TIM1_OC3NPolarityConfig:
5102                     ; 1530   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5104                     ; 1533   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5106  0000 4d            	tnz	a
5107  0001 2705          	jreq	L7552
5108                     ; 1535     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
5110  0003 7216525d      	bset	21085,#3
5113  0007 81            	ret	
5114  0008               L7552:
5115                     ; 1539     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
5117  0008 7217525d      	bres	21085,#3
5118                     ; 1541 }
5121  000c 81            	ret	
5157                     ; 1551 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5157                     ; 1552 {
5158                     .text:	section	.text,new
5159  0000               _TIM1_OC4PolarityConfig:
5163                     ; 1554   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5165                     ; 1557   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5167  0000 4d            	tnz	a
5168  0001 2705          	jreq	L1062
5169                     ; 1559     TIM1->CCER2 |= TIM1_CCER2_CC4P;
5171  0003 721a525d      	bset	21085,#5
5174  0007 81            	ret	
5175  0008               L1062:
5176                     ; 1563     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
5178  0008 721b525d      	bres	21085,#5
5179                     ; 1565 }
5182  000c 81            	ret	
5227                     ; 1579 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5227                     ; 1580 {
5228                     .text:	section	.text,new
5229  0000               _TIM1_CCxCmd:
5231  0000 89            	pushw	x
5232       00000000      OFST:	set	0
5235                     ; 1582   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5237                     ; 1583   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5239                     ; 1585   if (TIM1_Channel == TIM1_CHANNEL_1)
5241  0001 9e            	ld	a,xh
5242  0002 4d            	tnz	a
5243  0003 2610          	jrne	L7262
5244                     ; 1588     if (NewState != DISABLE)
5246  0005 9f            	ld	a,xl
5247  0006 4d            	tnz	a
5248  0007 2706          	jreq	L1362
5249                     ; 1590       TIM1->CCER1 |= TIM1_CCER1_CC1E;
5251  0009 7210525c      	bset	21084,#0
5253  000d 203e          	jra	L5362
5254  000f               L1362:
5255                     ; 1594       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5257  000f 7211525c      	bres	21084,#0
5258  0013 2038          	jra	L5362
5259  0015               L7262:
5260                     ; 1598   else if (TIM1_Channel == TIM1_CHANNEL_2)
5262  0015 7b01          	ld	a,(OFST+1,sp)
5263  0017 a101          	cp	a,#1
5264  0019 2610          	jrne	L7362
5265                     ; 1601     if (NewState != DISABLE)
5267  001b 7b02          	ld	a,(OFST+2,sp)
5268  001d 2706          	jreq	L1462
5269                     ; 1603       TIM1->CCER1 |= TIM1_CCER1_CC2E;
5271  001f 7218525c      	bset	21084,#4
5273  0023 2028          	jra	L5362
5274  0025               L1462:
5275                     ; 1607       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5277  0025 7219525c      	bres	21084,#4
5278  0029 2022          	jra	L5362
5279  002b               L7362:
5280                     ; 1610   else if (TIM1_Channel == TIM1_CHANNEL_3)
5282  002b a102          	cp	a,#2
5283  002d 2610          	jrne	L7462
5284                     ; 1613     if (NewState != DISABLE)
5286  002f 7b02          	ld	a,(OFST+2,sp)
5287  0031 2706          	jreq	L1562
5288                     ; 1615       TIM1->CCER2 |= TIM1_CCER2_CC3E;
5290  0033 7210525d      	bset	21085,#0
5292  0037 2014          	jra	L5362
5293  0039               L1562:
5294                     ; 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5296  0039 7211525d      	bres	21085,#0
5297  003d 200e          	jra	L5362
5298  003f               L7462:
5299                     ; 1625     if (NewState != DISABLE)
5301  003f 7b02          	ld	a,(OFST+2,sp)
5302  0041 2706          	jreq	L7562
5303                     ; 1627       TIM1->CCER2 |= TIM1_CCER2_CC4E;
5305  0043 7218525d      	bset	21085,#4
5307  0047 2004          	jra	L5362
5308  0049               L7562:
5309                     ; 1631       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5311  0049 7219525d      	bres	21085,#4
5312  004d               L5362:
5313                     ; 1634 }
5316  004d 85            	popw	x
5317  004e 81            	ret	
5362                     ; 1647 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5362                     ; 1648 {
5363                     .text:	section	.text,new
5364  0000               _TIM1_CCxNCmd:
5366  0000 89            	pushw	x
5367       00000000      OFST:	set	0
5370                     ; 1650   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
5372                     ; 1651   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5374                     ; 1653   if (TIM1_Channel == TIM1_CHANNEL_1)
5376  0001 9e            	ld	a,xh
5377  0002 4d            	tnz	a
5378  0003 2610          	jrne	L5072
5379                     ; 1656     if (NewState != DISABLE)
5381  0005 9f            	ld	a,xl
5382  0006 4d            	tnz	a
5383  0007 2706          	jreq	L7072
5384                     ; 1658       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
5386  0009 7214525c      	bset	21084,#2
5388  000d 2029          	jra	L3172
5389  000f               L7072:
5390                     ; 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
5392  000f 7215525c      	bres	21084,#2
5393  0013 2023          	jra	L3172
5394  0015               L5072:
5395                     ; 1665   else if (TIM1_Channel == TIM1_CHANNEL_2)
5397  0015 7b01          	ld	a,(OFST+1,sp)
5398  0017 4a            	dec	a
5399  0018 2610          	jrne	L5172
5400                     ; 1668     if (NewState != DISABLE)
5402  001a 7b02          	ld	a,(OFST+2,sp)
5403  001c 2706          	jreq	L7172
5404                     ; 1670       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
5406  001e 721c525c      	bset	21084,#6
5408  0022 2014          	jra	L3172
5409  0024               L7172:
5410                     ; 1674       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
5412  0024 721d525c      	bres	21084,#6
5413  0028 200e          	jra	L3172
5414  002a               L5172:
5415                     ; 1680     if (NewState != DISABLE)
5417  002a 7b02          	ld	a,(OFST+2,sp)
5418  002c 2706          	jreq	L5272
5419                     ; 1682       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
5421  002e 7214525d      	bset	21085,#2
5423  0032 2004          	jra	L3172
5424  0034               L5272:
5425                     ; 1686       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
5427  0034 7215525d      	bres	21085,#2
5428  0038               L3172:
5429                     ; 1689 }
5432  0038 85            	popw	x
5433  0039 81            	ret	
5478                     ; 1712 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
5478                     ; 1713 {
5479                     .text:	section	.text,new
5480  0000               _TIM1_SelectOCxM:
5482  0000 89            	pushw	x
5483       00000000      OFST:	set	0
5486                     ; 1715   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5488                     ; 1716   assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
5490                     ; 1718   if (TIM1_Channel == TIM1_CHANNEL_1)
5492  0001 9e            	ld	a,xh
5493  0002 4d            	tnz	a
5494  0003 2610          	jrne	L3572
5495                     ; 1721     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5497  0005 7211525c      	bres	21084,#0
5498                     ; 1724     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
5498                     ; 1725                             | (uint8_t)TIM1_OCMode);
5500  0009 c65258        	ld	a,21080
5501  000c a48f          	and	a,#143
5502  000e 1a02          	or	a,(OFST+2,sp)
5503  0010 c75258        	ld	21080,a
5505  0013 2038          	jra	L5572
5506  0015               L3572:
5507                     ; 1727   else if (TIM1_Channel == TIM1_CHANNEL_2)
5509  0015 7b01          	ld	a,(OFST+1,sp)
5510  0017 a101          	cp	a,#1
5511  0019 2610          	jrne	L7572
5512                     ; 1730     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5514  001b 7219525c      	bres	21084,#4
5515                     ; 1733     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5515                     ; 1734                             | (uint8_t)TIM1_OCMode);
5517  001f c65259        	ld	a,21081
5518  0022 a48f          	and	a,#143
5519  0024 1a02          	or	a,(OFST+2,sp)
5520  0026 c75259        	ld	21081,a
5522  0029 2022          	jra	L5572
5523  002b               L7572:
5524                     ; 1736   else if (TIM1_Channel == TIM1_CHANNEL_3)
5526  002b a102          	cp	a,#2
5527  002d 2610          	jrne	L3672
5528                     ; 1739     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5530  002f 7211525d      	bres	21085,#0
5531                     ; 1742     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
5531                     ; 1743                             | (uint8_t)TIM1_OCMode);
5533  0033 c6525a        	ld	a,21082
5534  0036 a48f          	and	a,#143
5535  0038 1a02          	or	a,(OFST+2,sp)
5536  003a c7525a        	ld	21082,a
5538  003d 200e          	jra	L5572
5539  003f               L3672:
5540                     ; 1748     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5542  003f 7219525d      	bres	21085,#4
5543                     ; 1751     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5543                     ; 1752                             | (uint8_t)TIM1_OCMode);
5545  0043 c6525b        	ld	a,21083
5546  0046 a48f          	and	a,#143
5547  0048 1a02          	or	a,(OFST+2,sp)
5548  004a c7525b        	ld	21083,a
5549  004d               L5572:
5550                     ; 1754 }
5553  004d 85            	popw	x
5554  004e 81            	ret	
5588                     ; 1762 void TIM1_SetCounter(uint16_t Counter)
5588                     ; 1763 {
5589                     .text:	section	.text,new
5590  0000               _TIM1_SetCounter:
5594                     ; 1765   TIM1->CNTRH = (uint8_t)(Counter >> 8);
5596  0000 9e            	ld	a,xh
5597  0001 c7525e        	ld	21086,a
5598                     ; 1766   TIM1->CNTRL = (uint8_t)(Counter);
5600  0004 9f            	ld	a,xl
5601  0005 c7525f        	ld	21087,a
5602                     ; 1767 }
5605  0008 81            	ret	
5639                     ; 1775 void TIM1_SetAutoreload(uint16_t Autoreload)
5639                     ; 1776 {
5640                     .text:	section	.text,new
5641  0000               _TIM1_SetAutoreload:
5645                     ; 1778   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
5647  0000 9e            	ld	a,xh
5648  0001 c75262        	ld	21090,a
5649                     ; 1779   TIM1->ARRL = (uint8_t)(Autoreload);
5651  0004 9f            	ld	a,xl
5652  0005 c75263        	ld	21091,a
5653                     ; 1780  }
5656  0008 81            	ret	
5690                     ; 1788 void TIM1_SetCompare1(uint16_t Compare1)
5690                     ; 1789 {
5691                     .text:	section	.text,new
5692  0000               _TIM1_SetCompare1:
5696                     ; 1791   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
5698  0000 9e            	ld	a,xh
5699  0001 c75265        	ld	21093,a
5700                     ; 1792   TIM1->CCR1L = (uint8_t)(Compare1);
5702  0004 9f            	ld	a,xl
5703  0005 c75266        	ld	21094,a
5704                     ; 1793 }
5707  0008 81            	ret	
5741                     ; 1801 void TIM1_SetCompare2(uint16_t Compare2)
5741                     ; 1802 {
5742                     .text:	section	.text,new
5743  0000               _TIM1_SetCompare2:
5747                     ; 1804   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
5749  0000 9e            	ld	a,xh
5750  0001 c75267        	ld	21095,a
5751                     ; 1805   TIM1->CCR2L = (uint8_t)(Compare2);
5753  0004 9f            	ld	a,xl
5754  0005 c75268        	ld	21096,a
5755                     ; 1806 }
5758  0008 81            	ret	
5792                     ; 1814 void TIM1_SetCompare3(uint16_t Compare3)
5792                     ; 1815 {
5793                     .text:	section	.text,new
5794  0000               _TIM1_SetCompare3:
5798                     ; 1817   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
5800  0000 9e            	ld	a,xh
5801  0001 c75269        	ld	21097,a
5802                     ; 1818   TIM1->CCR3L = (uint8_t)(Compare3);
5804  0004 9f            	ld	a,xl
5805  0005 c7526a        	ld	21098,a
5806                     ; 1819 }
5809  0008 81            	ret	
5843                     ; 1827 void TIM1_SetCompare4(uint16_t Compare4)
5843                     ; 1828 {
5844                     .text:	section	.text,new
5845  0000               _TIM1_SetCompare4:
5849                     ; 1830   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
5851  0000 9e            	ld	a,xh
5852  0001 c7526b        	ld	21099,a
5853                     ; 1831   TIM1->CCR4L = (uint8_t)(Compare4);
5855  0004 9f            	ld	a,xl
5856  0005 c7526c        	ld	21100,a
5857                     ; 1832 }
5860  0008 81            	ret	
5896                     ; 1844 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5896                     ; 1845 {
5897                     .text:	section	.text,new
5898  0000               _TIM1_SetIC1Prescaler:
5900  0000 88            	push	a
5901       00000000      OFST:	set	0
5904                     ; 1847   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
5906                     ; 1850   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
5906                     ; 1851                           | (uint8_t)TIM1_IC1Prescaler);
5908  0001 c65258        	ld	a,21080
5909  0004 a4f3          	and	a,#243
5910  0006 1a01          	or	a,(OFST+1,sp)
5911  0008 c75258        	ld	21080,a
5912                     ; 1852 }
5915  000b 84            	pop	a
5916  000c 81            	ret	
5952                     ; 1864 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5952                     ; 1865 {
5953                     .text:	section	.text,new
5954  0000               _TIM1_SetIC2Prescaler:
5956  0000 88            	push	a
5957       00000000      OFST:	set	0
5960                     ; 1868   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
5962                     ; 1871   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
5962                     ; 1872                           | (uint8_t)TIM1_IC2Prescaler);
5964  0001 c65259        	ld	a,21081
5965  0004 a4f3          	and	a,#243
5966  0006 1a01          	or	a,(OFST+1,sp)
5967  0008 c75259        	ld	21081,a
5968                     ; 1873 }
5971  000b 84            	pop	a
5972  000c 81            	ret	
6008                     ; 1885 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
6008                     ; 1886 {
6009                     .text:	section	.text,new
6010  0000               _TIM1_SetIC3Prescaler:
6012  0000 88            	push	a
6013       00000000      OFST:	set	0
6016                     ; 1889   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
6018                     ; 1892   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
6018                     ; 1893                           (uint8_t)TIM1_IC3Prescaler);
6020  0001 c6525a        	ld	a,21082
6021  0004 a4f3          	and	a,#243
6022  0006 1a01          	or	a,(OFST+1,sp)
6023  0008 c7525a        	ld	21082,a
6024                     ; 1894 }
6027  000b 84            	pop	a
6028  000c 81            	ret	
6064                     ; 1906 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
6064                     ; 1907 {
6065                     .text:	section	.text,new
6066  0000               _TIM1_SetIC4Prescaler:
6068  0000 88            	push	a
6069       00000000      OFST:	set	0
6072                     ; 1910   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
6074                     ; 1913   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
6074                     ; 1914                           (uint8_t)TIM1_IC4Prescaler);
6076  0001 c6525b        	ld	a,21083
6077  0004 a4f3          	and	a,#243
6078  0006 1a01          	or	a,(OFST+1,sp)
6079  0008 c7525b        	ld	21083,a
6080                     ; 1915 }
6083  000b 84            	pop	a
6084  000c 81            	ret	
6136                     ; 1922 uint16_t TIM1_GetCapture1(void)
6136                     ; 1923 {
6137                     .text:	section	.text,new
6138  0000               _TIM1_GetCapture1:
6140  0000 5204          	subw	sp,#4
6141       00000004      OFST:	set	4
6144                     ; 1926   uint16_t tmpccr1 = 0;
6146                     ; 1927   uint8_t tmpccr1l=0, tmpccr1h=0;
6150                     ; 1929   tmpccr1h = TIM1->CCR1H;
6152  0002 c65265        	ld	a,21093
6153  0005 6b02          	ld	(OFST-2,sp),a
6155                     ; 1930   tmpccr1l = TIM1->CCR1L;
6157  0007 c65266        	ld	a,21094
6158  000a 6b01          	ld	(OFST-3,sp),a
6160                     ; 1932   tmpccr1 = (uint16_t)(tmpccr1l);
6162  000c 5f            	clrw	x
6163  000d 97            	ld	xl,a
6164  000e 1f03          	ldw	(OFST-1,sp),x
6166                     ; 1933   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
6168  0010 5f            	clrw	x
6169  0011 7b02          	ld	a,(OFST-2,sp)
6170  0013 97            	ld	xl,a
6171  0014 7b04          	ld	a,(OFST+0,sp)
6172  0016 01            	rrwa	x,a
6173  0017 1a03          	or	a,(OFST-1,sp)
6174  0019 01            	rrwa	x,a
6176                     ; 1935   return (uint16_t)tmpccr1;
6180  001a 5b04          	addw	sp,#4
6181  001c 81            	ret	
6233                     ; 1943 uint16_t TIM1_GetCapture2(void)
6233                     ; 1944 {
6234                     .text:	section	.text,new
6235  0000               _TIM1_GetCapture2:
6237  0000 5204          	subw	sp,#4
6238       00000004      OFST:	set	4
6241                     ; 1947   uint16_t tmpccr2 = 0;
6243                     ; 1948   uint8_t tmpccr2l=0, tmpccr2h=0;
6247                     ; 1950   tmpccr2h = TIM1->CCR2H;
6249  0002 c65267        	ld	a,21095
6250  0005 6b02          	ld	(OFST-2,sp),a
6252                     ; 1951   tmpccr2l = TIM1->CCR2L;
6254  0007 c65268        	ld	a,21096
6255  000a 6b01          	ld	(OFST-3,sp),a
6257                     ; 1953   tmpccr2 = (uint16_t)(tmpccr2l);
6259  000c 5f            	clrw	x
6260  000d 97            	ld	xl,a
6261  000e 1f03          	ldw	(OFST-1,sp),x
6263                     ; 1954   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
6265  0010 5f            	clrw	x
6266  0011 7b02          	ld	a,(OFST-2,sp)
6267  0013 97            	ld	xl,a
6268  0014 7b04          	ld	a,(OFST+0,sp)
6269  0016 01            	rrwa	x,a
6270  0017 1a03          	or	a,(OFST-1,sp)
6271  0019 01            	rrwa	x,a
6273                     ; 1956   return (uint16_t)tmpccr2;
6277  001a 5b04          	addw	sp,#4
6278  001c 81            	ret	
6330                     ; 1964 uint16_t TIM1_GetCapture3(void)
6330                     ; 1965 {
6331                     .text:	section	.text,new
6332  0000               _TIM1_GetCapture3:
6334  0000 5204          	subw	sp,#4
6335       00000004      OFST:	set	4
6338                     ; 1967   uint16_t tmpccr3 = 0;
6340                     ; 1968   uint8_t tmpccr3l=0, tmpccr3h=0;
6344                     ; 1970   tmpccr3h = TIM1->CCR3H;
6346  0002 c65269        	ld	a,21097
6347  0005 6b02          	ld	(OFST-2,sp),a
6349                     ; 1971   tmpccr3l = TIM1->CCR3L;
6351  0007 c6526a        	ld	a,21098
6352  000a 6b01          	ld	(OFST-3,sp),a
6354                     ; 1973   tmpccr3 = (uint16_t)(tmpccr3l);
6356  000c 5f            	clrw	x
6357  000d 97            	ld	xl,a
6358  000e 1f03          	ldw	(OFST-1,sp),x
6360                     ; 1974   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
6362  0010 5f            	clrw	x
6363  0011 7b02          	ld	a,(OFST-2,sp)
6364  0013 97            	ld	xl,a
6365  0014 7b04          	ld	a,(OFST+0,sp)
6366  0016 01            	rrwa	x,a
6367  0017 1a03          	or	a,(OFST-1,sp)
6368  0019 01            	rrwa	x,a
6370                     ; 1976   return (uint16_t)tmpccr3;
6374  001a 5b04          	addw	sp,#4
6375  001c 81            	ret	
6427                     ; 1984 uint16_t TIM1_GetCapture4(void)
6427                     ; 1985 {
6428                     .text:	section	.text,new
6429  0000               _TIM1_GetCapture4:
6431  0000 5204          	subw	sp,#4
6432       00000004      OFST:	set	4
6435                     ; 1987   uint16_t tmpccr4 = 0;
6437                     ; 1988   uint8_t tmpccr4l=0, tmpccr4h=0;
6441                     ; 1990   tmpccr4h = TIM1->CCR4H;
6443  0002 c6526b        	ld	a,21099
6444  0005 6b02          	ld	(OFST-2,sp),a
6446                     ; 1991   tmpccr4l = TIM1->CCR4L;
6448  0007 c6526c        	ld	a,21100
6449  000a 6b01          	ld	(OFST-3,sp),a
6451                     ; 1993   tmpccr4 = (uint16_t)(tmpccr4l);
6453  000c 5f            	clrw	x
6454  000d 97            	ld	xl,a
6455  000e 1f03          	ldw	(OFST-1,sp),x
6457                     ; 1994   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
6459  0010 5f            	clrw	x
6460  0011 7b02          	ld	a,(OFST-2,sp)
6461  0013 97            	ld	xl,a
6462  0014 7b04          	ld	a,(OFST+0,sp)
6463  0016 01            	rrwa	x,a
6464  0017 1a03          	or	a,(OFST-1,sp)
6465  0019 01            	rrwa	x,a
6467                     ; 1996   return (uint16_t)tmpccr4;
6471  001a 5b04          	addw	sp,#4
6472  001c 81            	ret	
6506                     ; 2004 uint16_t TIM1_GetCounter(void)
6506                     ; 2005 {
6507                     .text:	section	.text,new
6508  0000               _TIM1_GetCounter:
6510  0000 89            	pushw	x
6511       00000002      OFST:	set	2
6514                     ; 2006   uint16_t tmpcntr = 0;
6516                     ; 2008   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
6518  0001 c6525e        	ld	a,21086
6519  0004 97            	ld	xl,a
6520  0005 4f            	clr	a
6521  0006 02            	rlwa	x,a
6522  0007 1f01          	ldw	(OFST-1,sp),x
6524                     ; 2011   return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
6526  0009 c6525f        	ld	a,21087
6527  000c 5f            	clrw	x
6528  000d 97            	ld	xl,a
6529  000e 01            	rrwa	x,a
6530  000f 1a02          	or	a,(OFST+0,sp)
6531  0011 01            	rrwa	x,a
6532  0012 1a01          	or	a,(OFST-1,sp)
6533  0014 01            	rrwa	x,a
6536  0015 5b02          	addw	sp,#2
6537  0017 81            	ret	
6571                     ; 2019 uint16_t TIM1_GetPrescaler(void)
6571                     ; 2020 {
6572                     .text:	section	.text,new
6573  0000               _TIM1_GetPrescaler:
6575  0000 89            	pushw	x
6576       00000002      OFST:	set	2
6579                     ; 2021   uint16_t temp = 0;
6581                     ; 2023   temp = ((uint16_t)TIM1->PSCRH << 8);
6583  0001 c65260        	ld	a,21088
6584  0004 97            	ld	xl,a
6585  0005 4f            	clr	a
6586  0006 02            	rlwa	x,a
6587  0007 1f01          	ldw	(OFST-1,sp),x
6589                     ; 2026   return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
6591  0009 c65261        	ld	a,21089
6592  000c 5f            	clrw	x
6593  000d 97            	ld	xl,a
6594  000e 01            	rrwa	x,a
6595  000f 1a02          	or	a,(OFST+0,sp)
6596  0011 01            	rrwa	x,a
6597  0012 1a01          	or	a,(OFST-1,sp)
6598  0014 01            	rrwa	x,a
6601  0015 5b02          	addw	sp,#2
6602  0017 81            	ret	
6776                     ; 2047 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
6776                     ; 2048 {
6777                     .text:	section	.text,new
6778  0000               _TIM1_GetFlagStatus:
6780  0000 89            	pushw	x
6781  0001 89            	pushw	x
6782       00000002      OFST:	set	2
6785                     ; 2049   FlagStatus bitstatus = RESET;
6787                     ; 2050   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
6791                     ; 2053   assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
6793                     ; 2055   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
6795  0002 9f            	ld	a,xl
6796  0003 c45255        	and	a,21077
6797  0006 6b01          	ld	(OFST-1,sp),a
6799                     ; 2056   tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
6801  0008 7b03          	ld	a,(OFST+1,sp)
6802  000a 6b02          	ld	(OFST+0,sp),a
6804                     ; 2058   if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
6806  000c c45256        	and	a,21078
6807  000f 1a01          	or	a,(OFST-1,sp)
6808  0011 2702          	jreq	L5643
6809                     ; 2060     bitstatus = SET;
6811  0013 a601          	ld	a,#1
6814  0015               L5643:
6815                     ; 2064     bitstatus = RESET;
6818                     ; 2066   return (FlagStatus)(bitstatus);
6822  0015 5b04          	addw	sp,#4
6823  0017 81            	ret	
6858                     ; 2087 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
6858                     ; 2088 {
6859                     .text:	section	.text,new
6860  0000               _TIM1_ClearFlag:
6862  0000 89            	pushw	x
6863       00000000      OFST:	set	0
6866                     ; 2090   assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
6868                     ; 2093   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
6870  0001 9f            	ld	a,xl
6871  0002 43            	cpl	a
6872  0003 c75255        	ld	21077,a
6873                     ; 2094   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
6873                     ; 2095                         (uint8_t)0x1E);
6875  0006 7b01          	ld	a,(OFST+1,sp)
6876  0008 43            	cpl	a
6877  0009 a41e          	and	a,#30
6878  000b c75256        	ld	21078,a
6879                     ; 2096 }
6882  000e 85            	popw	x
6883  000f 81            	ret	
6947                     ; 2112 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
6947                     ; 2113 {
6948                     .text:	section	.text,new
6949  0000               _TIM1_GetITStatus:
6951  0000 88            	push	a
6952  0001 89            	pushw	x
6953       00000002      OFST:	set	2
6956                     ; 2114   ITStatus bitstatus = RESET;
6958                     ; 2115   uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
6962                     ; 2118   assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
6964                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
6966  0002 c45255        	and	a,21077
6967  0005 6b01          	ld	(OFST-1,sp),a
6969                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
6971  0007 c65254        	ld	a,21076
6972  000a 1403          	and	a,(OFST+1,sp)
6973  000c 6b02          	ld	(OFST+0,sp),a
6975                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
6977  000e 7b01          	ld	a,(OFST-1,sp)
6978  0010 2708          	jreq	L1453
6980  0012 7b02          	ld	a,(OFST+0,sp)
6981  0014 2704          	jreq	L1453
6982                     ; 2126     bitstatus = SET;
6984  0016 a601          	ld	a,#1
6987  0018 2001          	jra	L3453
6988  001a               L1453:
6989                     ; 2130     bitstatus = RESET;
6991  001a 4f            	clr	a
6993  001b               L3453:
6994                     ; 2132   return (ITStatus)(bitstatus);
6998  001b 5b03          	addw	sp,#3
6999  001d 81            	ret	
7035                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
7035                     ; 2150 {
7036                     .text:	section	.text,new
7037  0000               _TIM1_ClearITPendingBit:
7041                     ; 2152   assert_param(IS_TIM1_IT_OK(TIM1_IT));
7043                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
7045  0000 43            	cpl	a
7046  0001 c75255        	ld	21077,a
7047                     ; 2156 }
7050  0004 81            	ret	
7102                     ; 2174 static void TI1_Config(uint8_t TIM1_ICPolarity,
7102                     ; 2175                        uint8_t TIM1_ICSelection,
7102                     ; 2176                        uint8_t TIM1_ICFilter)
7102                     ; 2177 {
7103                     .text:	section	.text,new
7104  0000               L3_TI1_Config:
7106  0000 89            	pushw	x
7107  0001 88            	push	a
7108       00000001      OFST:	set	1
7111                     ; 2179   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7113  0002 7211525c      	bres	21084,#0
7114                     ; 2182   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
7114                     ; 2183                           (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7116  0006 7b06          	ld	a,(OFST+5,sp)
7117  0008 97            	ld	xl,a
7118  0009 a610          	ld	a,#16
7119  000b 42            	mul	x,a
7120  000c 9f            	ld	a,xl
7121  000d 1a03          	or	a,(OFST+2,sp)
7122  000f 6b01          	ld	(OFST+0,sp),a
7124  0011 c65258        	ld	a,21080
7125  0014 a40c          	and	a,#12
7126  0016 1a01          	or	a,(OFST+0,sp)
7127  0018 c75258        	ld	21080,a
7128                     ; 2186   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7130  001b 7b02          	ld	a,(OFST+1,sp)
7131  001d 2706          	jreq	L1163
7132                     ; 2188     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7134  001f 7212525c      	bset	21084,#1
7136  0023 2004          	jra	L3163
7137  0025               L1163:
7138                     ; 2192     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7140  0025 7213525c      	bres	21084,#1
7141  0029               L3163:
7142                     ; 2196   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7144  0029 7210525c      	bset	21084,#0
7145                     ; 2197 }
7148  002d 5b03          	addw	sp,#3
7149  002f 81            	ret	
7201                     ; 2215 static void TI2_Config(uint8_t TIM1_ICPolarity,
7201                     ; 2216                        uint8_t TIM1_ICSelection,
7201                     ; 2217                        uint8_t TIM1_ICFilter)
7201                     ; 2218 {
7202                     .text:	section	.text,new
7203  0000               L5_TI2_Config:
7205  0000 89            	pushw	x
7206  0001 88            	push	a
7207       00000001      OFST:	set	1
7210                     ; 2220   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7212  0002 7219525c      	bres	21084,#4
7213                     ; 2223   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
7213                     ; 2224                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7215  0006 7b06          	ld	a,(OFST+5,sp)
7216  0008 97            	ld	xl,a
7217  0009 a610          	ld	a,#16
7218  000b 42            	mul	x,a
7219  000c 9f            	ld	a,xl
7220  000d 1a03          	or	a,(OFST+2,sp)
7221  000f 6b01          	ld	(OFST+0,sp),a
7223  0011 c65259        	ld	a,21081
7224  0014 a40c          	and	a,#12
7225  0016 1a01          	or	a,(OFST+0,sp)
7226  0018 c75259        	ld	21081,a
7227                     ; 2226   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7229  001b 7b02          	ld	a,(OFST+1,sp)
7230  001d 2706          	jreq	L3463
7231                     ; 2228     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7233  001f 721a525c      	bset	21084,#5
7235  0023 2004          	jra	L5463
7236  0025               L3463:
7237                     ; 2232     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7239  0025 721b525c      	bres	21084,#5
7240  0029               L5463:
7241                     ; 2235   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7243  0029 7218525c      	bset	21084,#4
7244                     ; 2236 }
7247  002d 5b03          	addw	sp,#3
7248  002f 81            	ret	
7300                     ; 2254 static void TI3_Config(uint8_t TIM1_ICPolarity,
7300                     ; 2255                        uint8_t TIM1_ICSelection,
7300                     ; 2256                        uint8_t TIM1_ICFilter)
7300                     ; 2257 {
7301                     .text:	section	.text,new
7302  0000               L7_TI3_Config:
7304  0000 89            	pushw	x
7305  0001 88            	push	a
7306       00000001      OFST:	set	1
7309                     ; 2259   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7311  0002 7211525d      	bres	21085,#0
7312                     ; 2262   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
7312                     ; 2263                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7314  0006 7b06          	ld	a,(OFST+5,sp)
7315  0008 97            	ld	xl,a
7316  0009 a610          	ld	a,#16
7317  000b 42            	mul	x,a
7318  000c 9f            	ld	a,xl
7319  000d 1a03          	or	a,(OFST+2,sp)
7320  000f 6b01          	ld	(OFST+0,sp),a
7322  0011 c6525a        	ld	a,21082
7323  0014 a40c          	and	a,#12
7324  0016 1a01          	or	a,(OFST+0,sp)
7325  0018 c7525a        	ld	21082,a
7326                     ; 2266   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7328  001b 7b02          	ld	a,(OFST+1,sp)
7329  001d 2706          	jreq	L5763
7330                     ; 2268     TIM1->CCER2 |= TIM1_CCER2_CC3P;
7332  001f 7212525d      	bset	21085,#1
7334  0023 2004          	jra	L7763
7335  0025               L5763:
7336                     ; 2272     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7338  0025 7213525d      	bres	21085,#1
7339  0029               L7763:
7340                     ; 2275   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7342  0029 7210525d      	bset	21085,#0
7343                     ; 2276 }
7346  002d 5b03          	addw	sp,#3
7347  002f 81            	ret	
7399                     ; 2294 static void TI4_Config(uint8_t TIM1_ICPolarity,
7399                     ; 2295                        uint8_t TIM1_ICSelection,
7399                     ; 2296                        uint8_t TIM1_ICFilter)
7399                     ; 2297 {
7400                     .text:	section	.text,new
7401  0000               L11_TI4_Config:
7403  0000 89            	pushw	x
7404  0001 88            	push	a
7405       00000001      OFST:	set	1
7408                     ; 2299   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
7410  0002 7219525d      	bres	21085,#4
7411                     ; 2302   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
7411                     ; 2303                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7413  0006 7b06          	ld	a,(OFST+5,sp)
7414  0008 97            	ld	xl,a
7415  0009 a610          	ld	a,#16
7416  000b 42            	mul	x,a
7417  000c 9f            	ld	a,xl
7418  000d 1a03          	or	a,(OFST+2,sp)
7419  000f 6b01          	ld	(OFST+0,sp),a
7421  0011 c6525b        	ld	a,21083
7422  0014 a40c          	and	a,#12
7423  0016 1a01          	or	a,(OFST+0,sp)
7424  0018 c7525b        	ld	21083,a
7425                     ; 2306   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7427  001b 7b02          	ld	a,(OFST+1,sp)
7428  001d 2706          	jreq	L7273
7429                     ; 2308     TIM1->CCER2 |= TIM1_CCER2_CC4P;
7431  001f 721a525d      	bset	21085,#5
7433  0023 2004          	jra	L1373
7434  0025               L7273:
7435                     ; 2312     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
7437  0025 721b525d      	bres	21085,#5
7438  0029               L1373:
7439                     ; 2316   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
7441  0029 7218525d      	bset	21085,#4
7442                     ; 2317 }
7445  002d 5b03          	addw	sp,#3
7446  002f 81            	ret	
7459                     	xdef	_TIM1_ClearITPendingBit
7460                     	xdef	_TIM1_GetITStatus
7461                     	xdef	_TIM1_ClearFlag
7462                     	xdef	_TIM1_GetFlagStatus
7463                     	xdef	_TIM1_GetPrescaler
7464                     	xdef	_TIM1_GetCounter
7465                     	xdef	_TIM1_GetCapture4
7466                     	xdef	_TIM1_GetCapture3
7467                     	xdef	_TIM1_GetCapture2
7468                     	xdef	_TIM1_GetCapture1
7469                     	xdef	_TIM1_SetIC4Prescaler
7470                     	xdef	_TIM1_SetIC3Prescaler
7471                     	xdef	_TIM1_SetIC2Prescaler
7472                     	xdef	_TIM1_SetIC1Prescaler
7473                     	xdef	_TIM1_SetCompare4
7474                     	xdef	_TIM1_SetCompare3
7475                     	xdef	_TIM1_SetCompare2
7476                     	xdef	_TIM1_SetCompare1
7477                     	xdef	_TIM1_SetAutoreload
7478                     	xdef	_TIM1_SetCounter
7479                     	xdef	_TIM1_SelectOCxM
7480                     	xdef	_TIM1_CCxNCmd
7481                     	xdef	_TIM1_CCxCmd
7482                     	xdef	_TIM1_OC4PolarityConfig
7483                     	xdef	_TIM1_OC3NPolarityConfig
7484                     	xdef	_TIM1_OC3PolarityConfig
7485                     	xdef	_TIM1_OC2NPolarityConfig
7486                     	xdef	_TIM1_OC2PolarityConfig
7487                     	xdef	_TIM1_OC1NPolarityConfig
7488                     	xdef	_TIM1_OC1PolarityConfig
7489                     	xdef	_TIM1_GenerateEvent
7490                     	xdef	_TIM1_OC4FastConfig
7491                     	xdef	_TIM1_OC3FastConfig
7492                     	xdef	_TIM1_OC2FastConfig
7493                     	xdef	_TIM1_OC1FastConfig
7494                     	xdef	_TIM1_OC4PreloadConfig
7495                     	xdef	_TIM1_OC3PreloadConfig
7496                     	xdef	_TIM1_OC2PreloadConfig
7497                     	xdef	_TIM1_OC1PreloadConfig
7498                     	xdef	_TIM1_CCPreloadControl
7499                     	xdef	_TIM1_SelectCOM
7500                     	xdef	_TIM1_ARRPreloadConfig
7501                     	xdef	_TIM1_ForcedOC4Config
7502                     	xdef	_TIM1_ForcedOC3Config
7503                     	xdef	_TIM1_ForcedOC2Config
7504                     	xdef	_TIM1_ForcedOC1Config
7505                     	xdef	_TIM1_CounterModeConfig
7506                     	xdef	_TIM1_PrescalerConfig
7507                     	xdef	_TIM1_EncoderInterfaceConfig
7508                     	xdef	_TIM1_SelectMasterSlaveMode
7509                     	xdef	_TIM1_SelectSlaveMode
7510                     	xdef	_TIM1_SelectOutputTrigger
7511                     	xdef	_TIM1_SelectOnePulseMode
7512                     	xdef	_TIM1_SelectHallSensor
7513                     	xdef	_TIM1_UpdateRequestConfig
7514                     	xdef	_TIM1_UpdateDisableConfig
7515                     	xdef	_TIM1_SelectInputTrigger
7516                     	xdef	_TIM1_TIxExternalClockConfig
7517                     	xdef	_TIM1_ETRConfig
7518                     	xdef	_TIM1_ETRClockMode2Config
7519                     	xdef	_TIM1_ETRClockMode1Config
7520                     	xdef	_TIM1_InternalClockConfig
7521                     	xdef	_TIM1_ITConfig
7522                     	xdef	_TIM1_CtrlPWMOutputs
7523                     	xdef	_TIM1_Cmd
7524                     	xdef	_TIM1_PWMIConfig
7525                     	xdef	_TIM1_ICInit
7526                     	xdef	_TIM1_BDTRConfig
7527                     	xdef	_TIM1_OC4Init
7528                     	xdef	_TIM1_OC3Init
7529                     	xdef	_TIM1_OC2Init
7530                     	xdef	_TIM1_OC1Init
7531                     	xdef	_TIM1_TimeBaseInit
7532                     	xdef	_TIM1_DeInit
7551                     	end
