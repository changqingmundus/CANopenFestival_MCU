#include "encoder.h"

void Encoder_Init(void)
{
   uint16_t Magic_Value = 0;
   DEE_Read(DEE_Encoder_MagicKey, &Magic_Value);
   if(Magic_Value == Factory_Magic_Value)
   {
      Encoder_Config.Multiturn_Bit = 0;
      Encoder_Config.SingleTurn_Bit = 0;
      DEE_Read(DEE_Encoder_MultiturnBitSize, &Encoder_Config.Multiturn_Bit);
      DEE_Read(DEE_Encoder_SingleTurnBitSize, &Encoder_Config.SingleTurn_Bit);
   }
   else
   {
      Encoder_Config.Multiturn_Bit = 12;
      Encoder_Config.SingleTurn_Bit = 13;
   }
}