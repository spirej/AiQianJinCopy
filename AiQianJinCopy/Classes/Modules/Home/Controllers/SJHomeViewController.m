//
//  SJHomeViewController.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/8/18.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJHomeViewController.h"
#import "SJCustomNavBarView.h"

@interface SJHomeViewController ()
@property (nonatomic, strong) SJCustomNavBarView    *customNavBarView;
@end

@implementation SJHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
    self.customNavBarView.navTitleLB.text = @"首页";
    self.customNavBarView.navTitleLB.hidden = NO;
    self.customNavBarView.navTitleLB.textColor = kDetailBlackColor;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

#pragma mark - Action


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
