#include "xc.h"

#include "mcc_generated_files/can/can_types.h"
#include "mcc_generated_files/can/can1.h"
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
    CAN1.Transmit(0, &txMsg);

    return 0;
}

/*
 * MCC CAN接收 -> CanFestival
 */
void canReceiveTask(void)
{
    struct CAN_MSG_OBJ rxMsg;
    Message msg;

    if (CAN1.Receive(&rxMsg))
    {
        msg.cob_id = rxMsg.msgId;
        msg.len = rxMsg.field.dlc;

        for (uint8_t i = 0; i < msg.len; i++)
        {
            msg.data[i] = rxMsg.data[i];
        }
        canDispatch(
            &Encoder_Slave_Data,
            &msg);
    }
}