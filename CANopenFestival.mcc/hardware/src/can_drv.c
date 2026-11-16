#include "can_drv.h"
#include "canfestival.h"
#include "Encoder_Slave.h"

/*
 * CanFestival -> MCC CAN发送
 */
unsigned char canSend(CAN_PORT notused, Message *m)
{
    struct CAN_MSG_OBJ txMsg;

    // CAN ID
    txMsg.msgId = m->cob_id;

    // CAN 2.0 标准数据帧
    txMsg.field.idType = 0;     // Standard ID
    txMsg.field.frameType = 0;  // Data Frame
    txMsg.field.formatType = 0; // CAN 2.0
    txMsg.field.brs = 0;

    // 数据长度
    txMsg.field.dlc = m->len;

    // 数据指针
    txMsg.data = m->data;

    // FIFO0发送
    CAN1_Transmit(0, &txMsg);

    return 0;
}

/*
 * MCC CAN接收 -> CanFestival
 */
void canReceiveTask(void)
{
    struct CAN_MSG_OBJ rxMsg = {0};
    Message msg = {0};
    
    if (CAN1_Receive(&rxMsg))
    {
        msg.cob_id = rxMsg.msgId;
        msg.len = rxMsg.field.dlc;

        if (msg.len > 8)
            return;

        for (uint8_t i = 0; i < msg.len; i++)
        {
            msg.data[i] = rxMsg.data[i];
        }

        canDispatch(&Encoder_Slave_Data, &msg);
    }
}

// 1. 接收 FIFO 溢出回调
void CAN1_RxBufferOverFlowCallback(void)
{
    C1INTLbits.RXOVIF = 0; 
}

// 2. 总线错误回调（处理 Bus-Off 自动恢复）
void CAN1_BusErrorCallback(void)
{
    // 使用 MCC 提供的 CAN1_IsBusOff() 直接判断是否进入 Bus-Off 状态
    if (CAN1_IsBusOff() == true) 
    {
        // 1. 切回配置模式
        CAN1_OperationModeSet(CAN_CONFIGURATION_MODE);
        
        // 2. 重新切回正常模式（MCC 中普通 CAN 2.0 模式名为 CAN_NORMAL_2_0_MODE）
        CAN1_OperationModeSet(CAN_NORMAL_2_0_MODE);
    }
}

// 3. 系统错误回调
void CAN1_SystemErrorCallback(void)
{
    // 清除系统错误中断标志（SERRIF）
    C1INTLbits.SERRIF = 0;
}