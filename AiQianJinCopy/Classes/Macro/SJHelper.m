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


@end
