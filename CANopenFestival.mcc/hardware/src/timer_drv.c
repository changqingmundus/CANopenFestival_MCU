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
    SCCP2_Timer_PeriodSet(value);
}

void SCCP2_TimeoutCallback(void)
{
    timer_counter++;
}