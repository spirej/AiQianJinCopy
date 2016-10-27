//
//  SJHomeHeadView.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/8/29.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJHomeHeadView.h"

#define kBannerViewH    200
#define kAdsBarH        45
#define kMenuItemH      110

#define kMenuItemTag    768372

@interface SJHomeHeadView ()<KDCycleBannerViewDelegate, KDCycleBannerViewDataSource, LBAdsBarDelegate>

@property (nonatomic, copy) NSMutableArray *menuItems;
@property (nonatomic, copy) NSMutableArray *menuTitles;
@end

@implementation SJHomeHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        [self addSubview:self.bannerView];
        [self addSubview:self.adsBar];
        [self createMenuItems];
    }
    return self;
}

- (void)createMenuItems {
    //这里假定只有三个item 暂没做其他情况处理
    for(int i = 0; i < 3; i++) {
        SJMenuItem *item = [[SJMenuItem alloc] initWithFrame:CGRectMake(i * kDeviceWidth/3, self.adsBar.maxY, kDeviceWidth/3, kMenuItemH)];
        item.tag = kMenuItemTag + i;
        [item addTarget:self action:@selector(itemsDidSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self.menuItems addObject:item];
        [self addSubview:item];
    }
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

- (LBAdsBar *)adsBar {
    if (_adsBar == nil) {
        //
        _adsBar = [[LBAdsBar alloc] initWithFrame:CGRectMake(0, self.bannerView.maxY, kDeviceWidth, kAdsBarH)];
        _adsBar.delegate = self;
        _adsBar.textColor = ColorWithHex(0x2B2F4C, 1);
        _adsBar.font = kFont14;
        _adsBar.stayTime = 5;
        //line
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, _adsBar.height - kLineH, _adsBar.width, kLineH)];
        line.backgroundColor = kLineColor;
        [_adsBar addSubview:line];
    }
    return _adsBar;
}

//设置banner数据源
- (void)setBannerArr:(NSArray *)bannerArr {
    NSInteger currentPage = _bannerView.pageControl.currentPage;
    _bannerArr = [bannerArr copy];
    [self.bannerView reloadDataWithCompleteBlock:^{
        [_bannerView setCurrentPage:currentPage animated:NO];
    }];
}

//设置广告条数据源
- (void)setAdsBarArr:(NSArray *)adsBarArr {
    _adsBarArr = adsBarArr;
    _adsBar.displayTexts = _adsBarArr;
    [_adsBar startAnimation];
    
    [_adsBar mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.mas_leading).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(0);
        make.top.mas_equalTo(self.bannerView.mas_bottom).offset(0);
        make.height.mas_equalTo(@(kAdsBarH));
    }];
}

- (void)setMenuItemTitleArr:(NSArray *)menuItemTitleArr {
    self.menuTitles = [NSMutableArray arrayWithArray:menuItemTitleArr];
}

- (void)setMenuItemIconArr:(NSArray *)menuItemIconArr {
    [self.menuItems enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //
        SJMenuItem *item = (SJMenuItem *)obj;
        [item.iconView sd_setImageWithURL:[NSURL URLWithString:menuItemIconArr[idx]]];
        [item.titleLB setText:self.menuTitles[idx]];
    }];
}

- (NSMutableArray *)menuItems {
    if (_menuItems == nil) {
        _menuItems = [NSMutableArray array];
    }
    return _menuItems;
}

- (NSMutableArray *)menuTitles {
    if (_menuTitles == nil) {
        _menuTitles = [NSMutableArray array];
    }
    return _menuTitles;
}

#pragma mark - LBAdsBarDelegate

- (void)selectedIndex:(NSInteger)index
{
    if ([self.delegate respondsToSelector:@selector(adsBarDidSelectedAtIndex:)]) {
        [self.delegate adsBarDidSelectedAtIndex:index];
    }
}

#pragma mark - banner的点击事件
- (void)cycleBannerView:(KDCycleBannerView *)bannerView didSelectedAtIndex:(NSUInteger)index {
    if ([self.delegate respondsToSelector:@selector(bannerDidSelectedAtIndex:)]) {
        [self.delegate bannerDidSelectedAtIndex:index];
    }
}

#pragma mark - items点击事件
- (void)itemsDidSelected:(SJMenuItem *)item {
    if ([self.delegate respondsToSelector:@selector(itemsDidSelectedAtIndex:)]) {
        NSInteger index = item.tag - kMenuItemTag;
        [self.delegate itemsDidSelectedAtIndex:index];
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
