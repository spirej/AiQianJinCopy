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

@end
