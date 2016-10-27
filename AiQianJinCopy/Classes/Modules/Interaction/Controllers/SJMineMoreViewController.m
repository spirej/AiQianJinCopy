//
//  SJMineMoreViewController.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/7.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJMineMoreViewController.h"

#define kTitlesArr  @[@[@"在线客服"], @[@"爱钱进名词解释", @"安全管理"], @[@"接收推送消息", @"关于爱钱进"]]

@interface SJMineMoreViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *headView;
@property (nonatomic, strong) UIView *footView;
@end

@implementation SJMineMoreViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navTitle = @"更多";
    self.showBack = YES;
    [self setUI];
}

- (void)callTelPhone {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"☎️" message:@"爱钱进客服：400-812-8808" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"呼叫", nil];
    [alertView show];
}

- (void)logOut {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"确定要退出爱钱进吗？" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"退出", nil];
    [alertView show];
}

#pragma mark - UITableViewDelegate & DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else if (section == 1 || section == 2) {
        return 2;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentfy = @"CELLIDENTIFY";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentfy];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentfy];
    }
    cell.textLabel.text = kTitlesArr[indexPath.section][indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - setter & getter
- (void)setUI {
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = self.headView;
    self.tableView.tableFooterView = self.footView;
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [SJHelper buildTableViewWithFrame:CGRectMake(0, 0, kDeviceWidth, KDeviceHeight-KNavigationBarHeight) style:UITableViewStyleGrouped backColor:kClearColor target:self];
    }
    return _tableView;
}

- (UIView *)headView {
    if (_headView == nil) {
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 80)];
        _headView.backgroundColor = kWhiteColor;
        
        UIImageView *telPhoneIcon = [[UIImageView alloc] initWithFrame:CGRectMake(kDeviceWidth/2.0-80, 0, 45, 45)];
        telPhoneIcon.centerY = _headView.height/2.0;
        [telPhoneIcon setImage:[UIImage imageNamed:@"telphone_icon"]];
        [_headView addSubview:telPhoneIcon];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(callTelPhone)];
        [_headView addGestureRecognizer:tapGesture];
        
        UILabel *telPhoneLB = [SJHelper buildLabelWithFrame:CGRectMake(telPhoneIcon.maxX + 5, 25, kDeviceWidth-telPhoneIcon.maxX - 5, 15) backColor:kClearColor content:@"400-812-8808" textColor:kDetailBlackColor font:kBFont15];
        [_headView addSubview:telPhoneLB];
        
        UILabel *telTimesLB = [SJHelper buildLabelWithFrame:CGRectMake(telPhoneLB.x, telPhoneLB.maxY + 5, telPhoneLB.width, 12) backColor:kClearColor content:@"服务时间:900~21:00" textColor:kDetailBlackColor font:kFont12];
        [_headView addSubview:telTimesLB];
    }
    return _headView;
}

- (UIView *)footView {
    if (_footView == nil) {
        _footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 60)];
        
        UIView *logOutView = [[UIView alloc] initWithFrame:CGRectMake(0, 15, kDeviceWidth, 45)];
        logOutView.backgroundColor = kWhiteColor;
        [_footView addSubview:logOutView];
        
        UILabel *logOutLB = [SJHelper buildLabelWithFrame:CGRectMake(0, 0, kDeviceWidth, 15) backColor:kClearColor content:@"退出登录" textColor:kDetailRedColor font:kFont15];
        logOutLB.centerY = logOutView.height/2.0;
        logOutLB.textAlignment = NSTextAlignmentCenter;
        [logOutView addSubview:logOutLB];
        
        UITapGestureRecognizer *tapGestureLogout = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(logOut)];
        [logOutView addGestureRecognizer:tapGestureLogout];
    }
    return _footView;
}
@end
