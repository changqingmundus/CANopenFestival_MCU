#include "sccp2.h" // MCC生成
#include "timer.h" // CanFestival

static TIMEVAL timer_counter = 0;
volatile uint8_t timer_dispatch_pending = 0;

TIMEVAL getElapsedTime(void)
{
    TIMEVAL elapsed = timer_counter;
    timer_counter = 0;
    return elapsed;
}

void setTimer(TIMEVAL value)
{
    SCCP2_Timer_Stop();
    uint32_t real_ticks = value * 400U; // 40MHz

    if (real_ticks == 0)
    {
        real_ticks = 10000; // 给个 0.25ms 的保底值防止死机
    }

    SCCP2_Timer_PeriodSet(real_ticks);

    CCP2TMRL = 0; // 关键：清零32位计数器
    CCP2TMRH = 0;

    SCCP2_Timer_Start();
}

void SCCP2_TimeoutCallback(void)
{
    timer_dispatch_pending = 1;
    timer_counter++;
}