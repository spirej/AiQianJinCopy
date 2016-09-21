//
//  SJProductDetailViewController.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/20.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJProductDetailViewController.h"
#import "SJJoinView.h"
#import "SJLcbDetailsView.h"
#import "SJLcbDetailsModel.h"
#import "SJLcbCalculView.h"
#import "SJZcbCalculView.h"
#import "SJZcbDetailsModel.h"

#define kJoinViewHeight         100
#define kDetailsViewH           485

@interface SJProductDetailViewController ()
{
    DetailType currentType;
}
@property (nonatomic, strong) SJJoinView *joinView;
@property (nonatomic, strong) SJLcbDetailsView *lcbDetailsView;
@property (nonatomic, strong) SJLcbCalculView *lcbCalculView;
@property (nonatomic, strong) SJZcbCalculView *zcbCalculView;

@property (nonatomic, strong) SJLcbDetailsModel *lcbModel;
@property (nonatomic, strong) SJZcbDetailsModel *zcbModel;
@end

@implementation SJProductDetailViewController

- (instancetype)initWithType:(DetailType)type {
    if (self = [super init]) {
        currentType = type;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle = @"零存宝";
    self.showBack = YES;
    
    [self setUI];
    [self getNetWorkData];
}

- (void)viewDidLayoutSubviews {
    if (KDeviceHeight-kJoinViewHeight-KNavigationBarHeight > kDetailsViewH) {
        self.lcbDetailsView.bgScrollView.contentSize = CGSizeMake(0, KDeviceHeight-kJoinViewHeight - KNavigationBarHeight + 1);
    }else {
        self.lcbDetailsView.bgScrollView.contentSize = CGSizeMake(0, kDetailsViewH);
    }
}


#pragma mark - Net Work Data
- (void)getNetWorkData {
    NSDictionary *lcbDict = [SJHelper readLocalFileResource:@"product_lcbDetails" type:@"json"];
    NSDictionary *zcbDict = [SJHelper readLocalFileResource:@"product_zcbDetails" type:@"json"];
    _lcbModel = [SJLcbDetailsModel mj_objectWithKeyValues:lcbDict];
    _zcbModel = [SJZcbDetailsModel mj_objectWithKeyValues:zcbDict];
    
    if (currentType == DetailType_Lcb) {
        _lcbDetailsView.model = _lcbModel;
        _lcbCalculView.model = _lcbModel;
    }else if (currentType == DetailType_Zcb) {
        _lcbDetailsView.zcbModel = _zcbModel;
        _zcbCalculView.model = _zcbModel;
    }
}

#pragma mark - Action
- (void)lcbCalcul:(UIButton *)button {
    Print(@"计算");
}

#pragma mark - setter & getter
- (void)setUI {
    [self.view addSubview:self.lcbDetailsView];
    [self.view addSubview:self.joinView];
}

- (SJJoinView *)joinView {
    if (_joinView == nil) {
        _joinView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([SJJoinView class]) owner:nil options:nil] lastObject];
        _joinView.backgroundColor = kWhiteColor;
        _joinView.frame = CGRectMake(0, KDeviceHeight-kJoinViewHeight-KNavigationBarHeight, kDeviceWidth, kJoinViewHeight);
    }
    return _joinView;
}

- (SJLcbDetailsView *)lcbDetailsView {
    if (_lcbDetailsView == nil) {
        _lcbDetailsView = [[SJLcbDetailsView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, KDeviceHeight - kJoinViewHeight)];
        if (currentType == DetailType_Lcb) {
            [_lcbDetailsView.calculView addSubview:self.lcbCalculView];
        }else if (currentType == DetailType_Zcb) {
            [_lcbDetailsView.calculView addSubview:self.zcbCalculView];
        }
    }
    return _lcbDetailsView;
}

- (SJLcbCalculView *)lcbCalculView {
    if (_lcbCalculView == nil) {
        _lcbCalculView = [[SJLcbCalculView alloc] init];
        [_lcbCalculView.calculBtn addTarget:self action:@selector(lcbCalcul:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _lcbCalculView;
}

- (SJZcbCalculView *)zcbCalculView {
    if (_zcbCalculView == nil) {
        _zcbCalculView = [[SJZcbCalculView alloc] init];
        [_zcbCalculView.calculBtn addTarget:self action:@selector(lcbCalcul:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _zcbCalculView;
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
