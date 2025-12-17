
#include	"syscfg.h"
#include	"ft60f01x.h"
#include	"user.h"

/**
* @brief  发送1527编码 - 同步码
* @note   格式：高电平4us + 低电平124us (总长128us)
*/
void coding_syn_1527(void)
{
    RFDAT_HIGH;     // 拉高
    DelayUs(4);     // 保持 4us
    RFDAT_LOW;      // 拉低
    DelayUs(124);   // 保持 124us
}

/**
* @brief  发送FB1527编码 - 数据 "0"
* @note   格式：高电平4us + 低电平12us (总长16us)
*/
void coding_L_1527(void)
{
    RFDAT_HIGH;     // 拉高
    DelayUs(4);     // 保持 4us
    RFDAT_LOW;      // 拉低
    DelayUs(12);    // 保持 12us
}

/**
* @brief  发送FB1527编码 - 数据 "1"
* @note   格式：高电平12us + 低电平4us (总长16us)
*/
void coding_H_1527(void)
{
    RFDAT_HIGH;     // 拉高
    DelayUs(12);    // 保持 12us
    RFDAT_LOW;      // 拉低
    DelayUs(4);     // 保持 4us
}

/**
* @brief  发送一帧完整的1527编码
* @param  Temp_Data: 24位编码数据 (20位地址 + 4位数据)
* @note   帧结构：同步码 + 24位数据码
*/
void coding_1527(unsigned long Temp_Data)
{
    unsigned char k;
    unsigned long Bit_Mask = 0x800000;	// 定义24位掩码: 1000...0000 (第23位为1)
     
    coding_syn_1527();					// 1. 发送同步码
    
    for(k = 0; k < 24; k++)				// 2. 循环发送24位数据 (高位先行)
    {
        if(Temp_Data & Bit_Mask)		// 检查当前位是否为1
        {
            coding_H_1527();    		// 发送 1
        }
        else
        {
            coding_L_1527();    		// 发送 0
        }
        Bit_Mask >>= 1; 		 		// 掩码右移，准备检查下一位
    }
}

/**
* @brief  发送一包完整的1527编码
* @param  Data: 要发送的数据
* @param  frame_num: 一个数据包发送的数据帧数量
* @param  slp_time：数据帧与帧之间间隔时间
* @note   包结构：数据帧--歇息2ms--数据帧
*/
void bag_1527(unsigned long Data,unsigned int frame_num,unsigned int slp_time)
{      
	LED_ON;                 	// 开始发送：点亮LED
    
	while(frame_num--)
	{
        coding_1527(Data); 		// 1. 发送数据帧 (20地址码+4数据码)
                    
		DelayMs(slp_time);      // 2. 帧间隔处
	}
	LED_OFF;					// 发送结束：熄灭LED，关闭RF输出
}