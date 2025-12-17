//===========================================================
//Project:	FT60-1527-new.prj
// Device:	FT60F01X
// Memory:	Flash 1KX14b, EEPROM 256X8b, SRAM 64X8b
// Author:	Supertiger 
//Version:	V0.0.1
// Update: 	2025年12月17日
//=========================================================== 

#include	"syscfg.h"
#include	"ft60f01x.h"
#include	"user.h"

/**
* @brief  主函数
* @note   循环检测按键状态并发送编码
*/
void main(void)
{
    Sys_Init();				// 系统初始化
    while(1)
    {
        if(KEY == 0)		// 检测按键按下 (低电平有效)
        {
            DelayMs(10); 	// 消抖延时
            if(KEY == 0)
            {
               bag_1527(0xeeffef,256,3);	//3个参数分别是：要发射的数据
											//每个数据包里面包含的数据帧数量
                                            //两个数据帧之间间隔时间
            }
        }
        CLRWDT();
    }
}