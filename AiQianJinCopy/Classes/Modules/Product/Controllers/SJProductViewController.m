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
#import "SJZcbModel.h"
#import "SJAytModel.h"
#import "SJZcbCellModel.h"
#import "SJZcbCell.h"
#import "SJZcbHeadView.h"

#define kLcbJoinBtnTag          2345
#define kLcbTopTouchBtnTag      9100
#define kLcbProductDetailBtnTag 10100

#define kZcbJoinBtnTag          2346
#define kZcbTopTouchBtnTag      9101
#define kZcbProductDetailBtnTag 10101

#define kAytJoinBtnTag          2347
#define kAytTopTouchBtnTag      9102
#define kAytProductDetailBtnTag 10102

static NSString * const identify = @"ZCBCELLIDENTIFY";

@interface SJProductViewController ()<SJSlideTypeDelegate, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) SJProductView     *productView;
@property (nonatomic, strong) SJZcbHeadView     *zcbHeadView;

@property (nonatomic, strong) SJLcbModel        *lcbModel;
@property (nonatomic, strong) SJZcbModel        *zcbModel;
@property (nonatomic, strong) SJZcbCellModel    *zcbCellModel;
@property (nonatomic, strong) SJAytModel        *aytModel;

@property (nonatomic, copy) NSMutableArray      *cellArray;
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
    NSDictionary *lcbDic = [SJHelper readLocalFileResource:@"fakeData_Lcb" type:@"json"];
    NSDictionary *zcbDic = [SJHelper readLocalFileResource:@"fakeData_Zcb" type:@"json"];
    NSDictionary *aytDic = [SJHelper readLocalFileResource:@"fakeData_Ayt" type:@"json"];
    
    _lcbModel = [SJLcbModel mj_objectWithKeyValues:lcbDic];
    _zcbModel = [SJZcbModel mj_objectWithKeyValues:zcbDic];
    _aytModel = [SJAytModel mj_objectWithKeyValues:aytDic];
    
    //1.
    self.productView.LcbScrollView.lcbView.lcbModel = _lcbModel;
    
    //2.
    [_zcbModel.list enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //
        _zcbCellModel = [SJZcbCellModel mj_objectWithKeyValues:obj];
        [self.cellArray addObject:_zcbCellModel];
    }];
    //数组的第一项是headerView的数据源
    self.zcbHeadView.zcbModel = _zcbModel;
    self.zcbHeadView.cellModel = self.cellArray[0];
    //
    [self.productView.ZcbTableView reloadData];
    
    //3.
    self.productView.AytView.model = _aytModel;
}

#pragma mark - Action
- (void)topIconTouch:(UIButton *)button {
    if (button.tag == kLcbTopTouchBtnTag) {
        Print(@"点击了Lcb顶部图片");
    }else if (button.tag == kZcbTopTouchBtnTag) {
        Print(@"点击了Zcb顶部图片");
    }else if (button.tag == kAytTopTouchBtnTag) {
        Print(@"点击了Ayt顶部图片");
    }
}

- (void)productTouch:(UIButton *)button {
    if (button.tag == kLcbProductDetailBtnTag) {
        Print(@"跳转Lcb详情");
    }else if (button.tag == kZcbProductDetailBtnTag) {
        Print(@"跳转Zcb详情");
    }else if (button.tag == kAytProductDetailBtnTag) {
        Print(@"跳转Ayt详情");
    }
}

- (void)joinBtnTouch:(UIButton *)button {
    if (button.tag == kLcbJoinBtnTag) {
        Print(@"Lcb立即加入");
    }else if (button.tag == kZcbJoinBtnTag) {
        Print(@"Zcb立即加入");
    }else if (button.tag == kAytJoinBtnTag) {
        Print(@"Ayt立即加入");
    }
    
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

#pragma mark - UITableView Delegate & DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.cellArray.count - 1 <= 0) {
        return 0;
    }
    return self.cellArray.count - 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //
    SJZcbCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([SJZcbCell class]) owner:nil options:nil] lastObject];
    }
    cell.model = self.cellArray[indexPath.row + 1];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
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
        
        _productView.ZcbTableView.delegate = self;
        _productView.ZcbTableView.dataSource = self;
        _productView.ZcbTableView.tableHeaderView = self.zcbHeadView;
        
        _productView.LcbScrollView.lcbView.topUserTouch.tag = kLcbTopTouchBtnTag;
        [_productView.LcbScrollView.lcbView.topUserTouch addTarget:self action:@selector(topIconTouch:) forControlEvents:UIControlEventTouchUpInside];
        
        _productView.LcbScrollView.lcbView.middleUserTouch.tag = kLcbProductDetailBtnTag;
        [_productView.LcbScrollView.lcbView.middleUserTouch addTarget:self action:@selector(productTouch:) forControlEvents:UIControlEventTouchUpInside];
        
        _productView.LcbScrollView.lcbView.joinButton.tag = kLcbJoinBtnTag;
        [_productView.LcbScrollView.lcbView.joinButton addTarget:self action:@selector(joinBtnTouch:) forControlEvents:UIControlEventTouchUpInside];
        
        _productView.AytView.safetyBtn.tag = kAytTopTouchBtnTag;
        [_productView.AytView.safetyBtn addTarget:self action:@selector(topIconTouch:) forControlEvents:UIControlEventTouchUpInside];
        
        _productView.AytView.productDetailBtn.tag = kAytProductDetailBtnTag;
        [_productView.AytView.productDetailBtn addTarget:self action:@selector(productTouch:) forControlEvents:UIControlEventTouchUpInside];
        
        _productView.AytView.joinBtn.tag = kAytJoinBtnTag;
        [_productView.AytView.joinBtn addTarget:self action:@selector(joinBtnTouch:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _productView;
}

- (SJZcbHeadView *)zcbHeadView {
    if (_zcbHeadView == nil) {
        _zcbHeadView = [[SJZcbHeadView alloc] init];
        
        _zcbHeadView.joinBtn.tag = kZcbJoinBtnTag;
        [_zcbHeadView.joinBtn addTarget:self action:@selector(joinBtnTouch:) forControlEvents:UIControlEventTouchUpInside];
        
        _zcbHeadView.userTopTouch.tag = kZcbTopTouchBtnTag;
        [_zcbHeadView.userTopTouch addTarget:self action:@selector(topIconTouch:) forControlEvents:UIControlEventTouchUpInside];
        
        _zcbHeadView.userProductDetailTouch.tag = kZcbProductDetailBtnTag;
        [_zcbHeadView.userProductDetailTouch addTarget:self action:@selector(productTouch:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _zcbHeadView;
}

- (NSMutableArray *)cellArray {
    if (_cellArray == nil) {
        _cellArray = [NSMutableArray array];
    }
    return _cellArray;
}

@end
