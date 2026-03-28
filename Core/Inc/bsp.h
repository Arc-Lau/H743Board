#ifndef USER_BSP_H
#define USER_BSP_H

/* 包含头文件 ----------------------------------------------------------------*/
#include "main.h"
// #include "../../SEGGER_RTT/SEGGER_RTT.h"

/* 全局注册表 ----------------------------------------------------------------*/
#define MAX_LOOP_EVENT 32
void LOOP_EVENT_Handle(void);
typedef void (*LOOP_Event)(void);
extern LOOP_Event loop_event[MAX_LOOP_EVENT];
extern uint8_t loop_event_num;

// /* JScope ------------------------------------------------------------------*/
// #include "../../SEGGER_RTT/user_JScope_Transmit.h"
// extern CCMRAM JScope_Transmit_t jscope_transmit;
// extern CCMRAM uint8_t JScope_RTT_UpBuffer[BUFFER_SIZE_UP];

/* 接口定义 ------------------------------------------------------------------*/

// 调试串口
#include "../../User_Drives/Inc/user_uart.h"
extern UART_DRIVES user_debug_uart;

// can 总线
#include "../../User_Drives/Inc/user_can.h"
extern CAN_DRIVES user_can_1;
extern CAN_DRIVES user_can_2;

//避障
#include "../../User_Algorithm/Inc/user_distance_control.h"
extern DistanceControl user_distance_control;

#include "../../User_Drives/Inc/user_stp23.h"
extern STP23_DRIVES user_stp23[8];





#endif // USER_BSP_H
