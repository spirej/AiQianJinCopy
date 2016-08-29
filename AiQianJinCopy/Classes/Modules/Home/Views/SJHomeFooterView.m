//
//  SJHomeFooterView.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/8/29.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJHomeFooterView.h"

#define kIconW  13
#define kIconH  15

#define kDetailColor    ColorWithHex(0x80c83c, 1)

@implementation SJHomeFooterView

- (instancetype)initWithFrame:(CGRect)frame text:(NSString *)text{
    self = [super initWithFrame:frame];
    if (self) {
        //
        self.frame = frame;
        [self setUIWithText:text];
    }
    return self;
}

- (void)setUIWithText:(NSString *)text {
    
    UIView *bgView = [SJHelper buildViewWithFrame:CGRectMake(0, kDistanceToScreen, kDeviceWidth, self.height - kDistanceToScreen) backColor:kWhiteColor];
    
    UILabel *textLB = [SJHelper buildLabelWithFrame:CGRectZero backColor:kClearColor content:text textColor:kDetailColor font:kFont12];
    [textLB sizeToFit];
    
    UIView *view = [SJHelper buildViewWithFrame:CGRectMake(0, 0, textLB.width + kIconW + 16, 20) backColor:kClearColor borderWidth:0.5 borderColor:kDetailColor cornerRadius:10];
    
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(8, 0, kIconW, kIconH)];
    icon.image = [UIImage imageNamed:@"icon_safe"];
    
    //布局
    view.center = CGPointMake(kDeviceWidth/2, bgView.height/2);
    textLB.x = icon.maxX;
    icon.centerY = view.height/2;
    textLB.centerY = view.height/2;
    
    [self addSubview:bgView];
    [bgView addSubview:view];
    [view addSubview:icon];
    [view addSubview:textLB];
}
@end
