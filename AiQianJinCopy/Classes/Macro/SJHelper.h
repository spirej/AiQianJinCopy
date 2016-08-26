//
//  SJHelper.h
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/8/27.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJHelper : NSObject

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

@end
