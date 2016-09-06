//
//  SJCustomNavBarView.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/8/27.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJCustomNavBarView.h"

@implementation SJCustomNavBarView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, kDeviceWidth, KNavigationBarHeight);
        [self addSubview:self.navBarView];
    }
    return self;
}

- (instancetype)initWithLeftAction:(LeftBarButtonAction)leftAction rightAction:(RightBarButtonAction)rightAction {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, kDeviceWidth, KNavigationBarHeight);
        [self addSubview:self.navBarView];
        self.leftAction = leftAction;
        self.rightAction = rightAction;
    }
    return self;
}

- (UIView *)navBarView {
    if (_navBarView == nil) {
        _navBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, KNavigationBarHeight)];
        _navBarView.backgroundColor = kWhiteColor;
        [_navBarView addSubview:self.navTitleLB];
        [_navBarView addSubview:self.leftBarButton];
        [_navBarView addSubview:self.rightBarButton];
    }
    return _navBarView;
}

- (UILabel *)navTitleLB
{
    if (_navTitleLB == nil) {
        _navTitleLB = [SJHelper buildLabelWithFrame:CGRectMake(0, 0, kDeviceWidth - 160, 44) backColor:kClearColor content:@"" textColor:kWhiteColor font:SJBlodFont(18) textAlignment:NSTextAlignmentCenter];
        _navTitleLB.center = CGPointMake(kDeviceWidth/2.0, 20 + 22);
        
        _navTitleLB.hidden = YES;
    }
    return _navTitleLB;
}

- (UIButton *)leftBarButton
{
    if (_leftBarButton == nil) {
        //
        _leftBarButton = [SJHelper buildButtonWithFrame:CGRectMake(10, 20, 60, 44) backColor:kClearColor title:@"" textColor:kWhiteColor font:kFont15];
        [_leftBarButton addTarget:self action:@selector(leftBarButtonItemAction) forControlEvents:UIControlEventTouchUpInside];
        _leftBarButton.hidden = YES;
    }
    return _leftBarButton;
}

- (UIButton *)rightBarButton
{
    if (_rightBarButton == nil) {
        //
        _leftBarButton = [SJHelper buildButtonWithFrame:CGRectMake(kDeviceWidth - 80 - 10, 20, 80, 44) backColor:kClearColor title:@"" textColor:kWhiteColor font:kFont15];
        [_rightBarButton addTarget:self action:@selector(rightBarButtonItemAction) forControlEvents:UIControlEventTouchUpInside];
        _rightBarButton.hidden = YES;
        _rightBarButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    }
    return _rightBarButton;
}

- (void)leftBarButtonItemAction {
    if (_leftAction) {
        _leftAction();
    }
}

- (void)rightBarButtonItemAction {
    if (_rightAction) {
        _rightAction();
    }
}

@end
