//
//  SJHomeViewController.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/8/18.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJHomeViewController.h"
#import "SJHomeHeadView.h"
#import "SJHomeCell.h"
#import "SJHomeFooterView.h"

#define kHomeHeadViewH      200
#define kHomeFooterViewH    60
#define kHomeCellH          170

@interface SJHomeViewController ()<SJHomeHeaderViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView       *homeTableView;
@property (nonatomic, strong) SJHomeHeadView    *homeHeadView;
@property (nonatomic, strong) SJHomeFooterView  *homeFooterView;
@end

@implementation SJHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
    [self netWorkData];
    
    Print(@"%f, %f",kDeviceWidth, KDeviceHeight);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


#pragma mark - NetWorkData
- (void)netWorkData {
    self.homeHeadView.bannerArr = @[@"https://news.iqianjin.com/news/u/cms/www/201608/22183231mkw3.png",
                                    @"https://news.iqianjin.com/news/u/cms/www/201608/08184227chi5.png",
                                    @"https://news.iqianjin.com/news/u/cms/www/201608/11194909z5f3.jpg",
                                    @"https://news.iqianjin.com/news/u/cms/www/201606/07115826l7a2.png",
                                    @"https://news.iqianjin.com/news/u/cms/www/201607/01102600pa80.png"];
}

#pragma mark - Action
//banner点击代理方法
- (void)bannerDidSelectedAtIndex:(NSUInteger)index {
    Print(@"index - %ld", index);
}

- (void)safeExplain {
    Print(@"安全机制说明");
}


#pragma mark - UITableView Delegate & DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identify = @"HOMECELLIDENT";
    SJHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([SJHomeCell class]) owner:nil options:nil].lastObject;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kHomeCellH;
}


#pragma mark - setter & getter
- (void)setUI {
    [self.view addSubview:self.homeTableView];
    self.homeTableView.tableHeaderView = self.homeHeadView;
    self.homeTableView.tableFooterView = self.homeFooterView;
}

- (UITableView *)homeTableView {
    if (_homeTableView == nil) {
        _homeTableView = [SJHelper buildTableViewWithFrame:CGRectMake(0, -kStatusBarHeight, kDeviceWidth, KDeviceHeight + kStatusBarHeight - KTabBarHeight) style:UITableViewStylePlain backColor:kVCBackGroundColor target:self];
    }
    return _homeTableView;
}

- (SJHomeHeadView *)homeHeadView {
    if (_homeHeadView == nil) {
        _homeHeadView = [[SJHomeHeadView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kHomeHeadViewH)];
        _homeHeadView.delegate = self;
    }
    return _homeHeadView;
}

- (SJHomeFooterView *)homeFooterView {
    if (_homeFooterView == nil) {
        _homeFooterView = [[SJHomeFooterView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kHomeFooterViewH) text:@"本息保护机制"];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(safeExplain)];
        [_homeFooterView addGestureRecognizer:tapGesture];
    }
    return _homeFooterView;
}

@end
