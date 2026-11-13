#include "sccp2.h"         // MCC生成
#include "timer.h"         // CanFestival

static TIMEVAL timer_counter = 0;

TIMEVAL getElapsedTime(void)
{
    TIMEVAL elapsed = timer_counter;
    timer_counter = 0;
    return elapsed;
}

void setTimer(TIMEVAL value)
{
    uint32_t real_ticks = value * 400U;
    SCCP2_Timer_PeriodSet(real_ticks);
}

void SCCP2_TimeoutCallback(void)
{
    TimeDispatch();
    timer_counter++;
}