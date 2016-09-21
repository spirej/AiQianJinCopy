//
//  SJHelper.h
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/8/27.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SJHelper : NSObject

#pragma mark -- View

/**
 *  创建白View
 *
 *  @param frame <#frame description#>
 *
 *  @return <#return value description#>
 */
+ (UIView *)buildViewWithFrame:(CGRect)frame;

/**
 *  创建View
 *
 *  @param frame <#frame description#>
 *  @param color 背景色 默认 白色
 *
 *  @return <#return value description#>
 */
+ (UIView *)buildViewWithFrame:(CGRect)frame backColor:(UIColor *)color;

/**
 *  创建圆角View
 *
 *  @param frame  <#frame description#>
 *  @param color  背景色 默认 白色
 *  @param radius 圆角弧度 默认 5
 *
 *  @return <#return value description#>
 */
+ (UIView *)buildViewWithFrame:(CGRect)frame backColor:(UIColor *)color cornerRadius:(CGFloat)radius;

/**
 *  创建有边框线的View
 *
 *  @param frame  <#frame description#>
 *  @param color  背景色 默认 白色
 *  @param bWidth 边框线宽度 默认 0.6
 *  @param bColor 边框线颜色 默认 白色
 *
 *  @return <#return value description#>
 */
+ (UIView *)buildViewWithFrame:(CGRect)frame backColor:(UIColor *)color borderWidth:(CGFloat)bWidth borderColor:(UIColor *)bColor;

/**
 *  创建有边框线的圆角View
 *
 *  @param frame  <#frame description#>
 *  @param color  背景色 默认 白色
 *  @param bWidth 边框线宽度 默认 0.6
 *  @param bColor 边框线颜色 默认 白色
 *  @param radius 圆角弧度   默认 5
 *
 *  @return <#return value description#>
 */
+ (UIView *)buildViewWithFrame:(CGRect)frame backColor:(UIColor *)color borderWidth:(CGFloat)bWidth borderColor:(UIColor *)bColor cornerRadius:(CGFloat)radius;

#pragma mark -- AllView Property

/**
 *  给View设置圆角
 *
 *  @param radius 默认 5
 *  @param view   <#view description#>
 */
+ (void)setCornerRadius:(CGFloat)radius forView:(UIView *)view;

/**
 *  给View设置边框
 *
 *  @param bWidth 默认 0.6
 *  @param bColor 默认 白色
 *  @param view   <#view description#>
 */
+ (void)setBorderWidth:(CGFloat)bWidth borderColor:(UIColor *)bColor forView:(UIView *)view;


#pragma mark -- Label

/**
 *  创建Label 默认左对齐 不换行 系统字号
 *
 *  @param frame  <#frame description#>
 *  @param color  背景色 默认 透明
 *  @param text   内容
 *  @param tColor 内容颜色 默认 黑色
 *
 *  @return <#return value description#>
 */
+ (UILabel *)buildLabelWithFrame:(CGRect)frame backColor:(UIColor *)color content:(NSString *)text textColor:(UIColor *)tColor;

/**
 *  创建Label 默认左对齐 不换行
 *
 *  @param frame  <#frame description#>
 *  @param color  背景色 默认 透明
 *  @param text   内容
 *  @param tColor 内容颜色 默认 黑色
 *  @param font   字号 默认 15
 *
 *  @return <#return value description#>
 */
+ (UILabel *)buildLabelWithFrame:(CGRect)frame backColor:(UIColor *)color content:(NSString *)text textColor:(UIColor *)tColor font:(UIFont *)font;

/**
 *  创建Label 默认不换行
 *
 *  @param frame     <#frame description#>
 *  @param color     背景色 默认 透明
 *  @param text      内容
 *  @param tColor    内容颜色 默认 黑色
 *  @param font      字号  默认 15
 *  @param alignment 对齐方式  默认 左对齐
 *
 *  @return <#return value description#>
 */
+ (UILabel *)buildLabelWithFrame:(CGRect)frame backColor:(UIColor *)color content:(NSString *)text textColor:(UIColor *)tColor font:(UIFont *)font textAlignment:(NSTextAlignment)alignment;

/**
 *  创建Label
 *
 *  @param frame     <#frame description#>
 *  @param color     背景色 默认 透明
 *  @param text      内容
 *  @param tColor    内容颜色 默认 黑色
 *  @param font      字号 默认 15
 *  @param alignment 对齐方式 默认 左对齐
 *  @param line      显示行数 默认 无限制
 *
 *  @return <#return value description#>
 */
+ (UILabel *)buildLabelWithFrame:(CGRect)frame backColor:(UIColor *)color content:(NSString *)text textColor:(UIColor *)tColor font:(UIFont *)font textAlignment:(NSTextAlignment)alignment lines:(NSInteger)line;


#pragma mark -- Button

/**
 *  创建透明按钮  --> 点击区域放大等
 *
 *  @param frame <#frame description#>
 *
 *  @return <#return value description#>
 */
+ (UIButton *)buildButtonWithFrame:(CGRect)frame;

/**
 *  创建标题按钮
 *
 *  @param frame  <#frame description#>
 *  @param color  背景色  默认 透明
 *  @param title  标题
 *  @param tColor 标题颜色 默认 黑色
 *  @param font   字号 默认 15
 *
 *  @return <#return value description#>
 */
+ (UIButton *)buildButtonWithFrame:(CGRect)frame backColor:(UIColor *)color title:(NSString *)title textColor:(UIColor *)tColor font:(UIFont *)font;

/**
 *  创建图片按钮
 *
 *  @param frame <#frame description#>
 *  @param image <#image description#>
 *
 *  @return <#return value description#>
 */
+ (UIButton *)buildButtonWithFrame:(CGRect)frame image:(NSString *)image;


#pragma mark -- TableView

/**
 *  创建TableView
 *
 *  @param frame  <#frame description#>
 *  @param style  <#style description#>
 *  @param color  背景色 默认 白色
 *  @param target <#target description#>
 *
 *  @return <#return value description#>
 */
+ (UITableView *)buildTableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style backColor:(UIColor *)color target:(id)target;


#pragma mark -- ScrollView

/**
 *  创建ScrollView
 *
 *  @param frame  <#frame description#>
 *  @param color  背景色 默认 白色
 *  @param target <#target description#>
 *
 *  @return <#return value description#>
 */
+ (UIScrollView *)buildScrollViewWithFrame:(CGRect)frame backColor:(UIColor *)color target:(id)target;


#pragma mark - 功能方法

/**
 *
 *  @brief 检查string的合法性
 *
 *  @param str 待检查的string
 *
 *  @return 是否合法
 */
+ (BOOL)stringValid:(NSString *)str;

/**
 *  @author fushengjun, 16-09-06 10:09:16
 *
 *  读取本地文件
 *
 *  @param resource 数据源名称
 *  @param type     类型
 *
 *  @return <#return value description#>
 */
+ (id)readLocalFileResource:(NSString *)resource type:(NSString *)type;

/**
 *  @author fushengjun, 16-09-21 18:09:09
 *
 *  格式化时间显示风格
 *
 *  @param format   显示格式
 *  @param longDate 时间
 *
 *  @return <#return value description#>
 */
+ (NSString *)dateFormatter:(NSString *)format andLongDate:(NSString *)longDate;

#pragma mark - 设备相关
/**
 *  @author luohuichao, 16-02-25 14:02:11
 *
 *  @brief 获取设备的IDFA
 *
 *  @return IDFA
 */
+ (NSString *)obtainDeviceIDFA;

/**
 *  @author luohuichao, 16-06-02 11:06:05
 *
 *  @brief 获取设备的IDFV
 *
 *  @return IDFV
 */
+ (NSString *)obtainDeviceIDFV;

/**
 *  @author luohuichao, 16-02-25 14:02:14
 *
 *  @brief 设备类型
 *
 *  @return 设备类型
 */
+ (NSString *)obtainDeviceType;

/**
 *  @author luohuichao, 16-02-25 14:02:59
 *
 *  @brief 精确的获取当前设备的机型
 *
 *  @return <#return value description#>
 */
+ (NSString*) deviceString;

/**
 *  获取当前的app版本号
 */
+ (NSString *)currentAppVersion;


#pragma mark -- 快捷跳转

/**
 *
 *  默认push跳转
 *
 *  @param page   目标控制器类名
 *  @param target 跳转原类
 */
+ (void)normalPushWithPage:(NSString *)page target:(UIViewController *)target;

/**
 *
 *  隐藏tabbar push跳转
 *
 *  @param page   <#page description#>
 *  @param target <#target description#>
 */
+ (void)hidesBottomBarPushPage:(NSString *)page target:(UIViewController *)target;



@end
