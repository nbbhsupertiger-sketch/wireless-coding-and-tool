//****************************************************************
//                      FT60F011A
//                   ---------------
//           VDD  -1-|VDD         VSS|-8-  GND 
//           KEY  -2-|PA2         PA4|-7-  RFDAT 
//       ICSPDAT  -3-|PA1         PA5|-6-  LED
//            NC  -4-|PA3         PA0|-5-  ICSPCLK
//                   ---------------
//*****************************************************************

//-----------------------------------------------------------------
// 硬件引脚定义
//-----------------------------------------------------------------
#define     KEY             PA2                 // 按键输入
#define     RFDAT           PA4                 // 编码输出
#define     LED             PA5                 // LED指示灯输出

//-----------------------------------------------------------------
// 状态控制宏定义
//-----------------------------------------------------------------
#define     LED_OFF         (LED = 0)           // LED 熄灭(低电平)
#define     LED_ON          (LED = 1)           // LED 点亮(高电平)
#define     LED_CPL         (LED = !LED)        // LED 状态翻转

#define     RFDAT_LOW       (RFDAT = 0)         // 数据输出低电平
#define     RFDAT_HIGH      (RFDAT = 1)         // 数据输出高电平

//-----------------------------------------------------------------
// 函数声明
//-----------------------------------------------------------------
void        Sys_Init        (void);
void        DelayUs         (unsigned char Time);
void        DelayMs         (unsigned char Time);

void        coding_syn_1527 (void);
void        coding_L_1527   (void);
void        coding_H_1527   (void);
void        coding_1527     (unsigned long Temp_Data);
void 		bag_1527		(unsigned long Data,unsigned int frame_num,unsigned int slp_time);