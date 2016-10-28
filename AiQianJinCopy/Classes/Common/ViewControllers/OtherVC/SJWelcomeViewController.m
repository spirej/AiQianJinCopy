//
//  SJWelcomeViewController.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 2016/10/27.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJWelcomeViewController.h"
#import "AppDelegate.h"

#define kNumberOfPage   4

@interface SJWelcomeViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *welcomeScrollView;
@property (nonatomic, strong) NSArray *imagesArray;
@property (nonatomic, strong) UIButton *startBtn;
@property (nonatomic, strong) UIPageControl *pageControl;
@end

@implementation SJWelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.welcomeScrollView];
    [self welcomeImages];
    [self.welcomeScrollView addSubview:self.startBtn];
    [self.view addSubview:self.pageControl];
}

- (void)welcomeImages {
    NSString *imageStr1 = @"starpage1_667h@2x.jpg";
    NSString *imageStr2 = @"starpage2_667h@2x.jpg";
    NSString *imageStr3 = @"starpage3_667h@2x.jpg";
    NSString *imageStr4 = @"starpage4_667h@2x.jpg";
    _imagesArray = @[imageStr1, imageStr2, imageStr3, imageStr4];
    
    for (int i = 0; i < _imagesArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kDeviceWidth*i, 0, kDeviceWidth, KDeviceHeight)];
        imageView.image = [UIImage imageNamed:[_imagesArray objectAtIndex:i]];
        [self.welcomeScrollView addSubview:imageView];
    }
    
    self.startBtn.center = CGPointMake(kDeviceWidth * (_imagesArray.count - 1) + kDeviceWidth/2.0, KDeviceHeight - dsize(75*3, 70*2, 60*2, 50*2));
}

#pragma mark - Actions
- (void)startAction:(UIButton *)btn {
    //
    [SJHelper setUsed];
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate setHomeRootViewController];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.pageControl.currentPage = (scrollView.contentOffset.x + kDeviceWidth/2.0)/kDeviceWidth;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.pageControl.currentPage = scrollView.contentOffset.x/kDeviceWidth;
}

#pragma mark - setter & getter
- (UIScrollView *)welcomeScrollView {
    if (_welcomeScrollView == nil) {
        _welcomeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, KDeviceHeight)];
        _welcomeScrollView.contentSize = CGSizeMake(kDeviceWidth * kNumberOfPage, KDeviceHeight);
        _welcomeScrollView.showsVerticalScrollIndicator = YES;
        _welcomeScrollView.showsHorizontalScrollIndicator = YES;
        _welcomeScrollView.pagingEnabled = YES;
        _welcomeScrollView.delegate = self;
    }
    return _welcomeScrollView;
}

- (UIButton *)startBtn {
    if (_startBtn == nil) {
        _startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _startBtn.frame = CGRectMake(0, 0, 150, 50);
        [_startBtn addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startBtn;
}

- (UIPageControl *)pageControl {
    if (_pageControl == nil) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, 100, 10)];
        _pageControl.center = CGPointMake(kDeviceWidth/2.0, KDeviceHeight - 30);
        _pageControl.numberOfPages = kNumberOfPage;
        _pageControl.currentPage = 0;
        _pageControl.defersCurrentPageDisplay = YES;
        _pageControl.pageIndicatorTintColor = ColorWithHex(0xf1f1f1, 1);
        _pageControl.currentPageIndicatorTintColor = ColorWithHex(0x52adff, 1);
    }
    return _pageControl;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
