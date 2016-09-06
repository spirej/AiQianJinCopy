//
//  SJInteractionViewController.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/8/18.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJInteractionViewController.h"
#import "SJCustomNavBarView.h"
#import "SJInteractionHeadView.h"
#import "SJInteractionCell.h"

#import "SJInteractionModel.h"
#import "SJInteractionCellModel.h"

#define kHeadViewH          235
#define kInteractionCellH   176
#define kCellImageH         100

static NSString *const identify = @"INTERACTIONCELL";

@interface SJInteractionViewController ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
@property (nonatomic, strong) SJCustomNavBarView    *customNavBarView;
@property (nonatomic, strong) UITableView           *tableView;
@property (nonatomic, strong) SJInteractionHeadView *headView;

@property (nonatomic, strong) SJInteractionModel    *model;
@property (nonatomic, strong) SJInteractionCellModel *cellModel;
@property (nonatomic, strong) SJInteractionItemModel *itemModel;

@property (nonatomic, copy) NSMutableArray *cellArr;
@property (nonatomic, copy) NSMutableArray *itemIconArr;
@property (nonatomic, copy) NSMutableArray *itemTitleArr;

@end

@implementation SJInteractionViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self getNetWorkData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    
    self.customNavBarView.navTitleLB.hidden = NO;
    self.customNavBarView.navTitleLB.textColor = kDetailBlackColor;
}

#pragma mark - NetWorkData
- (void)getNetWorkData {
    
    //1.总的json数据
    id json = [SJHelper readLocalFileResource:@"fakeData_Interaction" type:@"json"];
    _model = [SJInteractionModel mj_objectWithKeyValues:json];
    
    _headView.model = _model;
    
    //2.HeaderView
    
    
    //3.Items
    [_model.operateInfo enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //
        _itemModel = [SJInteractionItemModel mj_objectWithKeyValues:obj];
        
        [self.itemIconArr addObject:_itemModel.imgUrl];
        [self.itemTitleArr addObject:_itemModel.title];
    }];
    
    _headView.itemIcons = self.itemIconArr;
    _headView.itemtitles = self.itemTitleArr;
    
    //4.Cell
    [_model.interactionList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //
        _cellModel = [SJInteractionCellModel mj_objectWithKeyValues:obj];
        [self.cellArr addObject:_cellModel];
    }];
    [_tableView reloadData];
    
}

#pragma mark - Action
- (void)information:(UITapGestureRecognizer *)tap {
    Print(@"个人信息");
}

- (void)setting {
    Print(@"设置");
}

- (void)level {
    Print(@"会员");
}

- (void)vip:(UITapGestureRecognizer *)tap {
    Print(@"vip");
}

- (void)friend:(UITapGestureRecognizer *)tap {
    Print(@"friend");
}

- (void)statement:(UITapGestureRecognizer *)tap {
    Print(@"statement");
}

- (void)unity:(UITapGestureRecognizer *)tap {
    Print(@"unity");
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat y = scrollView.contentOffset.y;
    if (scrollView == self.tableView) {
        if (y >= - 200) {
            _customNavBarView.hidden = NO;
            _customNavBarView.navTitleLB.text = _model.nickname;
            _customNavBarView.navTitleLB.textColor = kWhiteColor;
            _customNavBarView.navBarView.backgroundColor = ColorWithHex(0xFF5B53, 1);
        }else {
            _customNavBarView.hidden = YES;
            _customNavBarView.navBarView.backgroundColor = kClearColor;
            if (y < -(kHeadViewH + kStatusBarHeight)) {
                CGRect frame = _headView.frame;
                frame.size.height = -y;
                frame.origin.y = y;
                _headView.frame = frame;
            }
        }        
    }
}

#pragma mark - UITableView Delegate & DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SJInteractionCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([SJInteractionCell class]) owner:nil options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (indexPath.row == 0) {
        cell.iconImgView.hidden = NO;
        cell.lookLB.hidden = YES;
    }else {
        cell.iconImgView.hidden = YES;
        cell.lookLB.hidden = NO;
    }
    
    if (indexPath.row == 5-1) {
        cell.lineView.hidden = YES;
    }else {
        cell.lineView.hidden = NO;
    }
    
    cell.model = self.cellArr[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return kInteractionCellH;
    }
    return kInteractionCellH - kCellImageH - 5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //
}

#pragma mark - setter & getter
- (void)setUI {
    
    [self.view addSubview:self.tableView];
    [self.tableView addSubview:self.headView];
    [self.view addSubview:self.customNavBarView];
}

- (SJCustomNavBarView *)customNavBarView {
    if (_customNavBarView == nil) {
        _customNavBarView = [[SJCustomNavBarView alloc] init];
        _customNavBarView.navBarView.backgroundColor = kClearColor;
        _customNavBarView.hidden = YES;
    }
    return _customNavBarView;
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [SJHelper buildTableViewWithFrame:CGRectMake(0, - kStatusBarHeight, kDeviceWidth, KDeviceHeight - kStatusBarHeight - 10) style:UITableViewStylePlain backColor:kVCBackGroundColor target:self];
        _tableView.contentInset = UIEdgeInsetsMake(kHeadViewH, 0, 0, 0);
    }
    return _tableView;
}

- (SJInteractionHeadView *)headView {
    if (_headView == nil) {
        _headView = [[SJInteractionHeadView alloc] initWithFrame:CGRectMake(0, -kHeadViewH, kDeviceWidth, kHeadViewH)];
        
        [_headView.informView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(information:)]];
        
        [_headView.settingBtn addTarget:self action:@selector(setting) forControlEvents:UIControlEventTouchUpInside];
        
        [_headView.levelBtn addTarget:self action:@selector(level) forControlEvents:UIControlEventTouchUpInside];
        
        [_headView.vipView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(vip:)]];
        
        [_headView.toFriendView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(friend:)]];
        
        [_headView.statementView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(statement:)]];
        
        [_headView.unityView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(unity:)]];
    }
    return _headView;
}

- (NSMutableArray *)cellArr {
    if (_cellArr == nil) {
        _cellArr = [NSMutableArray array];
    }
    return _cellArr;
}

- (NSMutableArray *)itemIconArr {
    if (_itemIconArr == nil) {
        _itemIconArr = [NSMutableArray array];
    }
    return _itemIconArr;
}

- (NSMutableArray *)itemTitleArr {
    if (_itemTitleArr == nil) {
        _itemTitleArr = [NSMutableArray array];
    }
    return _itemTitleArr;
}


@end
