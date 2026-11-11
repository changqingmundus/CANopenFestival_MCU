#include "sccp1.h"      // MCC生成
#include "timer.h"      // CanFestival
#include "encoder.h"


static TIMEVAL timer_counter = 0;


TIMEVAL getElapsedTime(void)
{
    TIMEVAL elapsed = timer_counter;
    timer_counter = 0;
    return elapsed;
}


void setTimer(TIMEVAL value)
{
    SCCP1_Timer_PeriodSet(value);
}


void SCCP1_TimeoutCallback(void)
{
    timer_counter++;
}