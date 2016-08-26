//
//  SJProductViewController.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/8/18.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJProductViewController.h"
#import "SJCustomNavBarView.h"

@interface SJProductViewController ()
@property (nonatomic, strong) SJCustomNavBarView *customNavBarView;
@end

@implementation SJProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    self.customNavBarView.navTitleLB.text = @"产品";
    self.customNavBarView.navTitleLB.hidden = NO;
    self.customNavBarView.navTitleLB.textColor = kDetailBlackColor;
}

#pragma mark - setter & getter
- (void)setUI {
    [self.view addSubview:self.customNavBarView];
}

- (SJCustomNavBarView *)customNavBarView {
    if (_customNavBarView == nil) {
        _customNavBarView = [[SJCustomNavBarView alloc] init];
    }
    return _customNavBarView;
}

@end
