   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.4 - 12 Aug 2015
   3                     ; Generator (Limited) V4.4.3 - 13 Oct 2015
   4                     ; Optimizer V4.4.3 - 13 Oct 2015
  80                     ; 61 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  80                     ; 62 {
  82                     	switch	.text
  83  0000               _FLASH_Unlock:
  87                     ; 64   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  89                     ; 67   if(FLASH_MemType == FLASH_MEMTYPE_DATA)
  91  0000 a1f7          	cp	a,#247
  92  0002 2608          	jrne	L73
  93                     ; 75     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
  95  0004 35ae5064      	mov	20580,#174
  96                     ; 76     FLASH->DUKR = FLASH_RASS_KEY1;
  98  0008 35565064      	mov	20580,#86
  99  000c               L73:
 100                     ; 78 }
 103  000c 81            	ret	
 138                     ; 86 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 138                     ; 87 {
 139                     	switch	.text
 140  000d               _FLASH_Lock:
 144                     ; 89   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 146                     ; 92   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 148  000d c4505f        	and	a,20575
 149  0010 c7505f        	ld	20575,a
 150                     ; 93 }
 153  0013 81            	ret	
 176                     ; 100 void FLASH_DeInit(void)
 176                     ; 101 {
 177                     	switch	.text
 178  0014               _FLASH_DeInit:
 182                     ; 102   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 184  0014 725f505a      	clr	20570
 185                     ; 103   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 187  0018 725f505b      	clr	20571
 188                     ; 104   FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 190  001c 35ff505c      	mov	20572,#255
 191                     ; 105   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 193  0020 7217505f      	bres	20575,#3
 194                     ; 106   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 196  0024 7213505f      	bres	20575,#1
 197                     ; 107   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 199  0028 c6505f        	ld	a,20575
 200                     ; 108 }
 203  002b 81            	ret	
 237                     ; 139 void FLASH_EraseByte(uint32_t Address)
 237                     ; 140 {
 238                     	switch	.text
 239  002c               _FLASH_EraseByte:
 241       00000000      OFST:	set	0
 244                     ; 142   assert_param(IS_FLASH_ADDRESS_OK(Address));
 246                     ; 145   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; 
 248  002c 1e05          	ldw	x,(OFST+5,sp)
 249  002e 7f            	clr	(x)
 250                     ; 146 }
 253  002f 81            	ret	
 296                     ; 156 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 296                     ; 157 {
 297                     	switch	.text
 298  0030               _FLASH_ProgramByte:
 300       00000000      OFST:	set	0
 303                     ; 159   assert_param(IS_FLASH_ADDRESS_OK(Address));
 305                     ; 160   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 307  0030 1e05          	ldw	x,(OFST+5,sp)
 308  0032 7b07          	ld	a,(OFST+7,sp)
 309  0034 f7            	ld	(x),a
 310                     ; 161 }
 313  0035 81            	ret	
 347                     ; 170 uint8_t FLASH_ReadByte(uint32_t Address)
 347                     ; 171 {
 348                     	switch	.text
 349  0036               _FLASH_ReadByte:
 351       00000000      OFST:	set	0
 354                     ; 173   assert_param(IS_FLASH_ADDRESS_OK(Address));
 356                     ; 176   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address); 
 358  0036 1e05          	ldw	x,(OFST+5,sp)
 359  0038 f6            	ld	a,(x)
 362  0039 81            	ret	
 420                     ; 338 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
 420                     ; 339 {
 421                     	switch	.text
 422  003a               _FLASH_SetProgrammingTime:
 426                     ; 341   assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
 428                     ; 343   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
 430  003a 7211505a      	bres	20570,#0
 431                     ; 344   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
 433  003e ca505a        	or	a,20570
 434  0041 c7505a        	ld	20570,a
 435                     ; 345 }
 438  0044 81            	ret	
 451                     	xdef	_FLASH_SetProgrammingTime
 452                     	xdef	_FLASH_ReadByte
 453                     	xdef	_FLASH_ProgramByte
 454                     	xdef	_FLASH_EraseByte
 455                     	xdef	_FLASH_DeInit
 456                     	xdef	_FLASH_Lock
 457                     	xdef	_FLASH_Unlock
 476                     	end
