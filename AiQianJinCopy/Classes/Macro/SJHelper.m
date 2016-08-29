//
//  SJHelper.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/8/27.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJHelper.h"

@implementation SJHelper

//------------------------------------------------------------------------------------------------//

+ (UIView *)buildViewWithFrame:(CGRect)frame {
    UIView *newView         = [[UIView alloc] initWithFrame:frame];
    newView.backgroundColor = kWhiteColor;
    
    return newView;
}

+ (UIView *)buildViewWithFrame:(CGRect)frame backColor:(UIColor *)color {
    UIView *newView         = [[UIView alloc] initWithFrame:frame];
    newView.backgroundColor = color==nil?kWhiteColor:color;
    
    return newView;
}

+ (UIView *)buildViewWithFrame:(CGRect)frame backColor:(UIColor *)color cornerRadius:(CGFloat)radius {
    UIView *newView            = [self buildViewWithFrame:frame backColor:color];
    [self setCornerRadius:radius forView:newView];
    
    return newView;
}

+ (UIView *)buildViewWithFrame:(CGRect)frame backColor:(UIColor *)color borderWidth:(CGFloat)bWidth borderColor:(UIColor *)bColor {
    UIView *newView           = [self buildViewWithFrame:frame backColor:color];
    [self setBorderWidth:bWidth borderColor:bColor forView:newView];
    
    return newView;
}

+ (UIView *)buildViewWithFrame:(CGRect)frame backColor:(UIColor *)color borderWidth:(CGFloat)bWidth borderColor:(UIColor *)bColor cornerRadius:(CGFloat)radius {
    UIView *newView           = [self buildViewWithFrame:frame backColor:color cornerRadius:radius];
    [self setBorderWidth:bWidth borderColor:bColor forView:newView];
    
    return newView;
}

//------------------------------------------------------------------------------------------------//

+ (void)setCornerRadius:(CGFloat)radius forView:(UIView *)view {
    view.clipsToBounds = YES;
    view.layer.cornerRadius = radius==0?cornerR:radius;
}

+ (void)setBorderWidth:(CGFloat)bWidth borderColor:(UIColor *)bColor forView:(UIView *)view {
    view.layer.borderWidth = bWidth==0?kLineH:bWidth;
    view.layer.borderColor = bColor==nil?kWhiteColor.CGColor:bColor.CGColor;
}


//------------------------------------------------------------------------------------------------//

+ (UILabel *)buildLabelWithFrame:(CGRect)frame backColor:(UIColor *)color content:(NSString *)text textColor:(UIColor *)tColor {
    UILabel *newLabel        = [[UILabel alloc] initWithFrame:frame];
    newLabel.backgroundColor = color==nil?kClearColor:color;
    newLabel.text            = text;
    newLabel.textColor       = tColor;
    
    return newLabel;
}

+ (UILabel *)buildLabelWithFrame:(CGRect)frame backColor:(UIColor *)color content:(NSString *)text textColor:(UIColor *)tColor font:(UIFont *)font {
    UILabel *newLabel = [self buildLabelWithFrame:frame backColor:color content:text textColor:tColor];
    newLabel.font     = font==nil?kFont15:font;
    
    return newLabel;
}

+ (UILabel *)buildLabelWithFrame:(CGRect)frame backColor:(UIColor *)color content:(NSString *)text textColor:(UIColor *)tColor font:(UIFont *)font textAlignment:(NSTextAlignment)alignment {
    UILabel *newLabel      = [self buildLabelWithFrame:frame backColor:color content:text textColor:tColor font:font];
    newLabel.textAlignment = alignment;
    
    return newLabel;
}

+ (UILabel *)buildLabelWithFrame:(CGRect)frame backColor:(UIColor *)color content:(NSString *)text textColor:(UIColor *)tColor font:(UIFont *)font textAlignment:(NSTextAlignment)alignment lines:(NSInteger)line {
    UILabel *newLabel      = [self buildLabelWithFrame:frame backColor:color content:text textColor:tColor font:font textAlignment:alignment];
    newLabel.numberOfLines = line;
    
    return newLabel;
}


//------------------------------------------------------------------------------------------------//

+ (UIButton *)buildButtonWithFrame:(CGRect)frame {
    UIButton *newButton       = [UIButton buttonWithType:UIButtonTypeCustom];
    newButton.backgroundColor = kClearColor;
    newButton.frame           = frame;
    
    return newButton;
}

+ (UIButton *)buildButtonWithFrame:(CGRect)frame backColor:(UIColor *)color title:(NSString *)title textColor:(UIColor *)tColor font:(UIFont *)font {
    UIButton *newButton       = [self buildButtonWithFrame:frame];
    newButton.backgroundColor = color==nil?kClearColor:color;
    newButton.titleLabel.font = font==nil?kFont15:font;
    [newButton setTitle:title forState:UIControlStateNormal];
    [newButton setTitleColor:tColor==nil?kDetailBlackColor:tColor forState:UIControlStateNormal];
    
    return newButton;
}

+ (UIButton *)buildButtonWithFrame:(CGRect)frame image:(NSString *)image {
    UIButton *newButton = [self buildButtonWithFrame:frame];
    [newButton setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    
    return newButton;
}

//------------------------------------------------------------------------------------------------//

+ (UITableView *)buildTableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style backColor:(UIColor *)color target:(id)target {
    UITableView *newTableView    = [[UITableView alloc] initWithFrame:frame style:style];
    newTableView.delegate        = target;
    newTableView.dataSource      = target;
    newTableView.backgroundColor = color==nil?kWhiteColor:color;
    newTableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    newTableView.showsVerticalScrollIndicator   = NO;
    newTableView.showsHorizontalScrollIndicator = NO;
    
    return newTableView;
}


@end
