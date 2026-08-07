#include "sccp1.h"      // MCC生成
#include "timer.h"      // CanFestival



static TIMEVAL timer_counter = 0;


TIMEVAL getElapsedTime(void)
{
    return timer_counter;
}


void setTimer(TIMEVAL value)
{
    //timer_counter = value;
    SCCP1_Timer_PeriodSet(value);
}


void SCCP1_TimeoutCallback(void)
{
    timer_counter++;
}