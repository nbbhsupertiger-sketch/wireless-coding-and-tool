
#include	"syscfg.h"
#include	"ft60f01x.h"
#include	"user.h"

/**
* @brief  微秒级延时函数
* @param  Time: 延时时长 (单位: us)
*/
void DelayUs(unsigned char Time)
{
    unsigned char a;
    for(a = 0; a < Time; a++)
    {
        NOP();
    }
}

/**
* @brief  毫秒级延时函数
* @note   基于16M-4T时钟，误差约1%
* @param  Time: 延时时长 (单位: ms)
*/
void DelayMs(unsigned char Time)
{
    unsigned char a, b;
    for(a = 0; a < Time; a++)
    {
        for(b = 0; b < 5; b++)
        {
            DelayUs(98);
        }
    }
}

/**
* @brief  系统初始化函数
* @note   配置时钟、IO口、看门狗等
*/
void Sys_Init()
{
    CLRWDT();
    OSCCON  = 0B01011001;     // WDT 32KHZ, IRCF=101=4MHz
    INTCON  = 0;              // 禁止所有中断
    
    PORTA   = 0B00000000;     // 端口初始状态
    TRISA   = 0B00000100;     // PA方向: 0-输出, 1-输入 (PA2-IN; PA4/PA5-OUT)
    WPUA    = 0B00000100;     // 上拉控制: 1-开, 0-关 (PA2开上拉)
    
    OPTION  = 0B00000000;
    MSCKCON = 0B00000000;
    WDTCON  = 0B00010011;     // SWDTEN=1 (开看门狗), 分频 1:16384 (溢出约512ms)
    
    PEIE    = 0;              // 禁止外设中断
    GIE     = 0;              // 禁止全局中断
}