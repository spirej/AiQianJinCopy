//
//  XSSystemMaintenanceView.m
//  xiangshangV3
//
//  Created by luohuichao on 16/3/31.
//  Copyright © 2016年 xiangshang360. All rights reserved.
//

#import "XSSystemMaintenanceView.h"

@interface XSSystemMaintenanceView ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation XSSystemMaintenanceView

+ (instancetype)shareInstance
{
    static XSSystemMaintenanceView *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, kDeviceWidth, KDeviceHeight);
        self.backgroundColor = kWhiteColor;
        [self addSubview:self.scrollView];
        [self.scrollView addSubview:self.imageView];
        self.scrollView.contentSize = self.imageView.bounds.size;
    }
    return self;
}

- (UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, KDeviceHeight)];
        _scrollView.backgroundColor = kClearColor;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollView;
}

- (UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SystemMaintenance"]];
        CGFloat height =  _imageView.height * kDeviceWidth / _imageView.width;
        _imageView.frame = CGRectMake(0, 0, kDeviceWidth, height);
    }
    return _imageView;
}

- (void)show
{
    [[[UIApplication sharedApplication].delegate window] addSubview:self];
//    [XSConfigs sharedInstance].isSHowMaintenance = YES;
}

- (void)hide
{
    [self removeFromSuperview];
//    [XSConfigs sharedInstance].isSHowMaintenance = NO;
}

@end
