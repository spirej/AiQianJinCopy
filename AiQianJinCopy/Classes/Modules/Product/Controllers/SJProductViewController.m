//
//  SJProductViewController.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/8/18.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJProductViewController.h"
#import "SJProductView.h"
#import "SJLcbModel.h"

@interface SJProductViewController ()<SJSlideTypeDelegate, UIScrollViewDelegate>
@property (nonatomic, strong) SJProductView     *productView;

@property (nonatomic, strong) SJLcbModel        *lcbModel;
@end

@implementation SJProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self getNetWorkData];
}

#pragma mark - NetWorkData
- (void)getNetWorkData {
    NSDictionary *jsonDic = [SJHelper readLocalFileResource:@"fakeData_Lcb" type:@"json"];
    _lcbModel = [SJLcbModel mj_objectWithKeyValues:jsonDic];
    
    self.productView.LcbScrollView.lcbView.lcbModel = _lcbModel;
    
    
}

#pragma mark - Action
- (void)topIconTouch {
    Print(@"点击了顶部图片");
}

- (void)productTouch {
    Print(@"跳转详情");
}

- (void)joinBtnTouch {
    Print(@"立即加入");
}


#pragma mark - SJSlideTypeDelegate
- (void)selectItemIndex:(NSInteger)index {
    [UIView animateWithDuration:0.38 animations:^{
        [self.productView.slideScrollView setContentOffset:CGPointMake(kDeviceWidth * index, 0) animated:YES];
    }];

}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //
    CGPoint p = scrollView.contentOffset;
    if (scrollView == self.productView.slideScrollView) {
        //
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.productView.slideScrollView) {
        CGFloat x = scrollView.contentOffset.x;
        self.productView.slideTypeHeadView.selectedIndex = x/kDeviceWidth;
    }
}

#pragma mark - setter & getter
- (void)setUI {
    [self.view addSubview:self.productView];
}

- (SJProductView *)productView {
    if (_productView == nil) {
        _productView = [[SJProductView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, KDeviceHeight - KTabBarHeight)];
        _productView.slideTypeHeadView.delegate = self;
        _productView.slideScrollView.delegate = self;
        
        [_productView.LcbScrollView.lcbView.topUserTouch addTarget:self action:@selector(topIconTouch) forControlEvents:UIControlEventTouchUpInside];
        [_productView.LcbScrollView.lcbView.middleUserTouch addTarget:self action:@selector(productTouch) forControlEvents:UIControlEventTouchUpInside];
        
        [_productView.LcbScrollView.lcbView.joinButton addTarget:self action:@selector(joinBtnTouch) forControlEvents:UIControlEventTouchUpInside];
    }
    return _productView;
}

@end
