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
#import "SJHomeJson.h"
#import "SJHomeModel.h"
#import "SJBannerModel.h"
#import "SJHomeAdsModel.h"
#import "SJMenuItemModel.h"

#import "SJProductDetailViewController.h"

#define kHomeHeadViewH      355
#define kHomeFooterViewH    60
#define kHomeCellH          170

@interface SJHomeViewController ()<SJHomeHeaderViewDelegate, UITableViewDelegate, UITableViewDataSource>
{
    DetailType productType;
}
@property (nonatomic, strong) UITableView       *homeTableView;
@property (nonatomic, strong) SJHomeHeadView    *homeHeadView;
@property (nonatomic, strong) SJHomeFooterView  *homeFooterView;

@property (nonatomic, strong) SJHomeJson        *homeJson;
@property (nonatomic, strong) SJHomeModel       *homeModel;
@property (nonatomic, strong) SJBannerModel     *bannerModel;
@property (nonatomic, strong) SJHomeAdsModel    *adsModel;
@property (nonatomic, strong) SJMenuItemModel   *menuItemModel;


@property (nonatomic, copy) NSMutableArray      *bannerImgArr;
@property (nonatomic, copy) NSMutableArray      *tableViewListArr;
@property (nonatomic, copy) NSMutableArray      *adsArr;

@property (nonatomic, copy) NSMutableArray      *safetyArr;
@property (nonatomic, copy) NSMutableArray      *menuItemIconArr;
@property (nonatomic, copy) NSMutableArray      *menuItemTitleArr;
@end

@implementation SJHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    productType = DetailType_Zcb;
    
    [self setUI];
    [self netWorkData];    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


#pragma mark - NetWorkData
- (void)netWorkData {
    if (_bannerImgArr && _bannerImgArr.count > 0) {
        [_bannerImgArr removeAllObjects];
    }
    if (_adsArr && _adsArr.count > 0) {
        [_adsArr removeAllObjects];
    }
    if (_menuItemIconArr && _menuItemIconArr.count > 0) {
        [_menuItemIconArr removeAllObjects];
    }
    if (_menuItemTitleArr && _menuItemTitleArr.count > 0) {
        [_menuItemTitleArr removeAllObjects];
    }
    if (_tableViewListArr && _tableViewListArr.count > 0) {
        [_tableViewListArr removeAllObjects];
    }
    
    //整个json数据
    _homeJson = [SJHomeJson mj_objectWithKeyValues:[SJHelper readLocalFileResource:@"fakeData_Home" type:@"json"]];
    
    //首页home数据
    _homeModel = [SJHomeModel mj_objectWithKeyValues:_homeJson.body];
    
    //home的bannerList
    [_homeModel.bannerList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //
        _bannerModel = [SJBannerModel mj_objectWithKeyValues:obj];
        [self.bannerImgArr addObject:_bannerModel.imgUrl];
    }];
    self.homeHeadView.bannerArr = self.bannerImgArr;
    
    //ads
    [_homeModel.ggList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //
        _adsModel = [SJHomeAdsModel mj_objectWithKeyValues:obj];
        [self.adsArr addObject:_adsModel.title];
    }];
//    _homeHeadView.adsBarArr = self.adsArr;
    
    //MenuItem
    [_homeModel.safety enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //
        _menuItemModel = [SJMenuItemModel mj_objectWithKeyValues:obj];
        [self.safetyArr addObject:_menuItemModel];
        [self.menuItemIconArr addObject:_menuItemModel.imgUrl];
        [self.menuItemTitleArr addObject:_menuItemModel.title];
    }];
    _homeHeadView.menuItemTitleArr = self.menuItemTitleArr;
    _homeHeadView.menuItemIconArr = self.menuItemIconArr;
    
    //TableView Cell
    [_homeModel.columnList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //
        SJHomeCellModel *homeCellModel = [SJHomeCellModel mj_objectWithKeyValues:obj];
        [self.tableViewListArr addObject:homeCellModel];
    }];
    [self.homeTableView reloadData];
    
    //模拟网路数据延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //
        [self.homeTableView.mj_header endRefreshing];
    });
}

#pragma mark - Action
//banner点击代理方法
- (void)bannerDidSelectedAtIndex:(NSUInteger)index {
    Print(@"index - %ld", index);
    
    [[NetServiceManager shareInstance] jyPostPath:@"" params:nil delegate:self waitingAlert:nil success:^(id responseObject) {
        //
    } failure:^(NSError *error) {
        //
    }];
}

- (void)itemsDidSelectedAtIndex:(NSUInteger)index {
    Print(@"item --- %ld", index);
    
    SJMenuItemModel *mModel = [SJMenuItemModel mj_objectWithKeyValues:self.safetyArr[index]];
    
    SJCommonWebViewController *web = [[SJCommonWebViewController alloc] initWithUrl:mModel.detailUrl title:mModel.title autoFit:YES];
    [self.navigationController pushViewController:web animated:YES];
}

- (void)adsBarDidSelectedAtIndex:(NSUInteger)index {
    Print(@"广告条点击");
}

- (void)safeExplain {
    Print(@"安全机制说明");
}

- (void)refresh {
    [self netWorkData];
}


#pragma mark - UITableView Delegate & DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableViewListArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identify = @"HOMECELLIDENT";
    SJHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([SJHomeCell class]) owner:nil options:nil].lastObject;
    }
    cell.model = self.tableViewListArr[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kHomeCellH;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SJHomeCellModel *model = [SJHomeCellModel mj_objectWithKeyValues:self.tableViewListArr[indexPath.row]];
    if (model.type == 2) {
        productType = DetailType_Zcb;
    }else if (model.type == 4) {
        productType = DetailType_Lcb;
    }
    
    SJProductDetailViewController *productDetailsVC = [[SJProductDetailViewController alloc] initWithType:productType];
    [self.navigationController pushViewController:productDetailsVC animated:YES];
}


#pragma mark - setter & getter
- (void)setUI {
    [self.view addSubview:self.homeTableView];
    self.homeTableView.tableHeaderView = self.homeHeadView;
    self.homeTableView.tableFooterView = self.homeFooterView;
    
    self.homeTableView.mj_header = [SJRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];
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

- (NSMutableArray *)bannerImgArr {
    if (_bannerImgArr == nil) {
        _bannerImgArr = [NSMutableArray array];
    }
    return _bannerImgArr;
}

- (NSMutableArray *)tableViewListArr {
    if (_tableViewListArr == nil) {
        _tableViewListArr = [NSMutableArray array];
    }
    return _tableViewListArr;
}

- (NSMutableArray *)adsArr {
    if (_adsArr == nil) {
        _adsArr = [NSMutableArray array];
    }
    return _adsArr;
}

- (NSMutableArray *)safetyArr {
    if (_safetyArr == nil) {
        _safetyArr = [NSMutableArray array];
    }
    return _safetyArr;
}

- (NSMutableArray *)menuItemIconArr {
    if (_menuItemIconArr == nil) {
        _menuItemIconArr = [NSMutableArray array];
    }
    return _menuItemIconArr;
}

- (NSMutableArray *)menuItemTitleArr {
    if (_menuItemTitleArr == nil) {
        _menuItemTitleArr = [NSMutableArray array];
    }
    return _menuItemTitleArr;
}

@end
