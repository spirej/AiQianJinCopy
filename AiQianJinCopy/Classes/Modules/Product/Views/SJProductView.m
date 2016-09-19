//
//  SJProductView.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/8.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJProductView.h"

#define kSlideTypeHeadViewH     64
#define kSlideTypeTitles         @[@"零存宝", @"整存宝",@"爱月投"]


@implementation SJProductView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //
        [self setUI];
    }
    return self;
}


- (void)setUI {
    [self addSubview:self.slideTypeHeadView];
    [self addSubview:self.slideScrollView];
    
    [self.slideScrollView addSubview:self.LcbScrollView];
    [self.slideScrollView addSubview:self.ZcbTableView];
    [self.slideScrollView addSubview:self.AytView];
}


- (SJSlideTypeHeadView *)slideTypeHeadView {
    if (_slideTypeHeadView == nil) {
        _slideTypeHeadView = [[SJSlideTypeHeadView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kSlideTypeHeadViewH) data:kSlideTypeTitles];
        _slideTypeHeadView.slideBgColor = kWhiteColor;
        _slideTypeHeadView.hasSelectedState = YES;
    }
    return _slideTypeHeadView;
}   

- (UIScrollView *)slideScrollView {
    if (_slideScrollView == nil) {
        _slideScrollView = [SJHelper buildScrollViewWithFrame:CGRectMake(0, kSlideTypeHeadViewH, kDeviceWidth, KDeviceHeight - kSlideTypeHeadViewH - KTabBarHeight) backColor:kClearColor target:nil];
        _slideScrollView.contentSize = CGSizeMake(kDeviceWidth * 3.0f, 0);
        _slideScrollView.pagingEnabled = YES;
    }
    return _slideScrollView;
}

- (UIScrollView *)LcbScrollView {
    if (_LcbScrollView == nil) {
        _LcbScrollView = [[SJLcbScrollView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, self.slideScrollView.height)];
        _LcbScrollView.contentSize = CGSizeMake(0, KDeviceHeight - kSlideTypeHeadViewH - KTabBarHeight + 1);
    }
    return _LcbScrollView;
}

- (UITableView *)ZcbTableView {
    if (_ZcbTableView == nil) {
        _ZcbTableView = [SJHelper buildTableViewWithFrame:CGRectMake(kDeviceWidth, 0, kDeviceWidth, self.slideScrollView.height) style:UITableViewStylePlain backColor:kClearColor target:nil];
    }
    return _ZcbTableView;
}

- (SJAytView *)AytView {
    if (_AytView == nil) {
        _AytView = [[SJAytView alloc] initWithFrame:CGRectMake(kDeviceWidth*2.0, 0, kDeviceWidth, KDeviceHeight - kSlideTypeHeadViewH - KTabBarHeight)];
    }
    return _AytView;
}

@end
