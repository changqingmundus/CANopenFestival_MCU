#ifndef ENCODER_H
#define ENCODER_H

#include "dee/dee.h"
#include "stdbool.h"
#include "stdint.h"

#define DEE_Encoder_MagicKey 0            //DEE存放編碼器出廠狀態數據
#define DEE_Encoder_MultiturnBitSize 1    //DEE存放編碼器多圈位數配置
#define DEE_Encoder_SingleTurnBitSize 2   //DEE存放編碼器單圈位數配置

#define Factory_Magic_Value 0x500A        //編碼器出廠特徵碼

typedef struct
{
    uint16_t Multiturn_Bit;    //配置編碼器多圈位數
    uint16_t SingleTurn_Bit;   //配置編碼器單圈位數
    bool Warning_Bit;           //配置編碼器警告位數
    bool Error_Bit;            //配置編碼器錯誤位數
    uint16_t CRC_Bit;          //配置編碼器CRC位數
    //ReadoutData
    uint64_t Raw_Data;         //編碼器原始數據
    uint32_t Multiturn_Data;   //編碼器多圈數據
    uint32_t SingleTurn_Data;  //編碼器單圈數據
    bool Warning_Data;          //編碼器警告數據
    bool Error_Data;           //編碼器錯誤數據
    uint16_t CRC_Data;         //編碼器CRC數據
}ENCODER_CONFIG;

extern ENCODER_CONFIG Encoder_Config;  //聲明為全局變量

void Encoder_Init(void);
void Encoder_Read_Data(void);
void Encoder_Clear_Data(void);

void Encoder_Update_To_CANopen(void);

#endif