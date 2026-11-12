#include "sccp2.h"      // MCC生成
#include "timer.h"      // CanFestival


static TIMEVAL timer_counter = 0;


TIMEVAL getElapsedTime(void)
{
    TIMEVAL elapsed = timer_counter;
    timer_counter = 0;
    return elapsed;
}


void setTimer(TIMEVAL value)
{
    //SCCP1_Timer_Stop();
    //SCCP1_Timer_PeriodSet(value);
    //SCCP1_Timer_Start();
}


void SCCP2_TimeoutCallback(void)
{
    timer_counter++;
}