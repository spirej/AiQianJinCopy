//
//  Constants.h
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/8/18.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

/***************************************************************************
 * 基本信息
 **************************/

#define AppVersionCode              @"2"

//tabbar items个数
#define kTabbarNumberOfItems    4

#define kNetWorkErrorDomain         @"jieyuelicaiError"

/**
 *  日志输出
 */
//#ifdef DEBUG

#define Print(fmt, ...)          NSLog((@"[文件名:%s]\n" "[方法名:%s]\n" "[行号:%d] \n Log:--->" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__)

/***************************************************************************
 * 尺寸相关
 **************************/

#define kDeviceWidth           [UIScreen mainScreen].bounds.size.width
#define KDeviceHeight          [UIScreen mainScreen].bounds.size.height
#define KNavigationBarHeight   (CurrentIOS7?64:44)
#define kStatusBarHeight        20
#define KTabBarHeight           49
//View距离屏幕的距离
#define kDistanceToScreen       10
//线条的默认高度
#define kLineH                  0.6
//默认圆角弧度
#define cornerR                5


/***************************************************************************
 * 颜色相关
 **************************/
//RGB
#define   ColorWithRGB(_R,_G,_B,_A)       [UIColor colorWithRed:_R/255.0 green:_G/255.0 blue:_B/255.0 alpha:_A]

//16进制颜色转换成UIColor
#define ColorWithHex(hex,alph)  [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:(alph)]

//常用的颜色
#define kClearColor  [UIColor clearColor]
#define kWhiteColor  [UIColor whiteColor]
#define kBlackColor  [UIColor blackColor]
//控制器的背景颜色
#define kVCBackGroundColor     ColorWithRGB(248, 248, 248, 1)

//内容灰色
#define kDetailGrayColor       ColorWithHex(0x888888, 1)
//内容浅灰色
#define kDetailLightGrayColor  ColorWithHex(0xc8cfd4, 1)
#define kDetailLightGrayColorT ColorWithHex(0xbebebe, 1)
//内容黑色
#define kDetailBlackColor      ColorWithHex(0x222222, 1)
//内容浅黑色
#define kDetailLightBlackColor ColorWithHex(0x555555, 1)
//内容红色
#define kDetailRedColor        ColorWithHex(0xfa5645, 1)
//内容绿色
#define kDetailGreenColor      ColorWithHex(0xb3d582, 1)
//内容橘色
#define kDetailOrangeColor     ColorWithHex(0xfd8a25, 1)

//默认红色
#define kNormalRedColor        ColorWithHex(0xee5e5e, 1)

//默认分割线色
#define kLineColor             ColorWithHex(0xe3e3e3, 1)



/***************************************************************************
 * 字号相关
 **************************/

#define SJFont(_size)       [UIFont systemFontOfSize:_size]
#define SJBlodFont(_size)   [UIFont boldSystemFontOfSize:_size]

#define kFont12 SJFont(12)
#define kFont13 SJFont(13)
#define kFont14 SJFont(14)
#define kFont15 SJFont(15)
#define kFont16 SJFont(16)
#define kFont17 SJFont(17)
#define kFont18 SJFont(18)
#define kFont20 SJFont(20)
#define kFont26 SJFont(26)
#define kFont36 SJFont(36)

#define kBFont10 SJBlodFont(10)
#define kBFont12 SJBlodFont(12)
#define kBFont15 SJBlodFont(15)
#define kBFont16 SJBlodFont(16)
#define kBFont18 SJBlodFont(18)
#define kBFont20 SJBlodFont(20)
#define kBFont26 SJBlodFont(26)
#define kBFont36 SJBlodFont(36)


/***************************************************************************
 * 手机相关
 **************************/
#define CurrentIOS9            [[[UIDevice currentDevice] systemVersion] floatValue] >= 9
#define CurrentIOS8_3          [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.3
#define CurrentIOS8            [[[UIDevice currentDevice] systemVersion] floatValue] >= 8
#define CurrentIOS7            [[[UIDevice currentDevice] systemVersion] floatValue] >= 7
#define CurrentIOS6            [[[UIDevice currentDevice] systemVersion] floatValue] >= 6
#define CurrentOnlyIOS6        [[[UIDevice currentDevice] systemVersion] floatValue] <7

#define CurrentIPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640,960), [[UIScreen mainScreen] currentMode].size) : NO)

#define CurrentIPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define CurrentIPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750,1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define CurrentIPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242,2208), [[UIScreen mainScreen] currentMode].size) : NO)

//适配
#define size(_plus,_6,_5) (kDeviceWidth>370?(kDeviceWidth>400?(_plus/3.0):(_6/2.0)):(_5/2.0))
#define dsize(_plus,_6,_5,_4) (kDeviceWidth>320?(kDeviceWidth>375?(_plus/3.0):(_6/2.0)):(KDeviceHeight>480?(_5/2.0):(_4/2.0)))




#endif /* Constants_h */
