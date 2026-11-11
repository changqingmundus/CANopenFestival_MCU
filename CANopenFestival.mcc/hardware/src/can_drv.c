#include "can_drv.h"
#include "canfestival.h"
#include "Encoder_Slave.h"

static void CAN_Test_Transmit(void);

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
    uint8_t rxData[8];

    struct CAN_MSG_OBJ rxMsg = {0};
    Message msg = {0};

    rxMsg.data = rxData;

    if (CAN1_Receive(&rxMsg))
    {
        CAN_Test_Transmit();

        msg.cob_id = rxMsg.msgId;
        msg.len = rxMsg.field.dlc;

        if (msg.len > 8)
            return;

        for (uint8_t i = 0; i < msg.len; i++)
        {
            msg.data[i] = rxData[i];
        }

        canDispatch(&Encoder_Slave_Data, &msg);
    }
}

static uint8_t txData[8];

static struct CAN_MSG_OBJ txMsg;

void CAN_Test_Transmit(void)
{
    memset(&txMsg, 0, sizeof(txMsg));

    txData[0] = 0x55;
    txData[1] = 0xAC;
    txData[2] = 0x52;
    txData[3] = 0x23;
    txData[4] = 0x53;
    txData[5] = 0x75;
    txData[6] = 0xFF;
    txData[7] = 0x00;

    txMsg.msgId = 0x582;
    txMsg.field.dlc = 8;

    txMsg.data = txData;

    txMsg.field.idType = CAN_FRAME_STD;
    txMsg.field.frameType = CAN_FRAME_DATA;

    enum CAN_TX_MSG_REQUEST_STATUS status;

    status = CAN1_Transmit(0, &txMsg);
}