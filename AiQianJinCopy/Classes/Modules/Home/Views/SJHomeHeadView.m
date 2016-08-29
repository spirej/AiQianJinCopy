//
//  SJHomeHeadView.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/8/29.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJHomeHeadView.h"

#define kBannerViewH 200

@interface SJHomeHeadView ()<KDCycleBannerViewDelegate, KDCycleBannerViewDataSource>

@end

@implementation SJHomeHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        self.backgroundColor = [UIColor orangeColor];
        [self addSubview:self.bannerView];
    }
    return self;
}

#pragma mark - getter & setter
- (KDCycleBannerView *)bannerView {
    if (_bannerView == nil) {
        _bannerView = [[KDCycleBannerView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kBannerViewH)];
        _bannerView.backgroundColor = kClearColor;
        _bannerView.continuous = YES;
        _bannerView.delegate = self;
        _bannerView.datasource = self;
        _bannerView.autoPlayTimeInterval = 3;
    }
    return _bannerView;
}

//设置banner数据源
- (void)setBannerArr:(NSArray *)bannerArr {
    NSInteger currentPage = _bannerView.pageControl.currentPage;
    _bannerArr = [bannerArr copy];
    [self.bannerView reloadDataWithCompleteBlock:^{
        [_bannerView setCurrentPage:currentPage animated:NO];
    }];
}

#pragma mark - banner的点击事件
- (void)cycleBannerView:(KDCycleBannerView *)bannerView didSelectedAtIndex:(NSUInteger)index {
    if ([self.delegate respondsToSelector:@selector(bannerDidSelectedAtIndex:)]) {
        [self.delegate bannerDidSelectedAtIndex:index];
    }
}

#pragma mark - KDCycleBannerViewDataSource
- (NSArray *)numberOfKDCycleBannerView:(KDCycleBannerView *)bannerView {
    if (self.bannerArr && self.bannerArr.count > 1) {
        bannerView.pageControl.hidden = NO;
        bannerView.continuous = YES;
    }else {
        bannerView.pageControl.hidden = YES;
        bannerView.continuous = NO;
    }
    if (self.bannerArr.count > 0) {
        return self.bannerArr;
    }
    return nil;
}

- (UIViewContentMode)contentModeForImageIndex:(NSUInteger)index {
    if (self.bannerArr.count > 0) {
        return UIViewContentModeScaleToFill;
    }
    return UIViewContentModeCenter;
}

- (UIImage *)placeHolderImageOfZeroBannerView {
    return [UIImage imageNamed:@"banner_defaut_icon"];
}

- (UIImage *)placeHolderImageOfBannerView:(KDCycleBannerView *)bannerView atIndex:(NSUInteger)index {
    return [UIImage imageNamed:@"banner_defaut_icon"];
}
@end
