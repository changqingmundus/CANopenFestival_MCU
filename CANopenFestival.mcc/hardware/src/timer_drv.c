#include "sccp2.h"         // MCC生成
#include "timer.h"         // CanFestival

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
    SCCP2_Timer_PeriodSet(real_ticks);
    SCCP2_Timer_Start();
}

void SCCP2_TimeoutCallback(void)
{
    timer_dispatch_pending = 1;
    timer_counter++;
}