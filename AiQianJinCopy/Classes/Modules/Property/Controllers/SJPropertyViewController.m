//
//  SJPropertyViewController.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/8/18.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJPropertyViewController.h"
#import "SJZiChanCollectCell.h"
#import "SJCollectionHeadView.h"

#define kHeadViewItemTag        56732

#define kTopImgViewH            130
#define kCollectionHeadViewH    184
#define kCollectionItemIcons    @[@"icon_record_0",@"icon_record_0",@"icon_record_1",@"icon_record_2",@"icon_record_3",@"icon_record_4",@"icon_record_5",@"icon_record_6",@"icon_record_7"]
#define kCollectionItemTitles @[@"爱月投记录",@"整存宝+记录",@"零存宝记录",@"整存宝+预约",@"散标记录",@"认购债权",@"资金流水",@"债权转让"]

static NSString * const topText = @"START\nFINANCIAL TRIP\n开启理财之旅";
static NSString * const cellIdentify = @"COLLECTIONIDENTIFY";
static NSString * const headIdentify = @"HEADIDENTIFY";

@interface SJPropertyViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate>
@property (nonatomic, strong) UIImageView *topImgView;
@property (nonatomic, strong) UIView *topView; //为顶部增加点击事件而增加
@property (nonatomic, strong) UILabel *topLB;
@property (nonatomic, strong) UIImageView *topIcon;
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation SJPropertyViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.automaticallyAdjustsScrollViewInsets = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self netWorkData];
}

- (void)netWorkData {
    //
}

#pragma mark - Action
- (void)topTouch:(UITapGestureRecognizer *)touch {
    Print(@"点击了顶部");
}

- (void)rechargeAction:(UITapGestureRecognizer *)touch {
    UITapGestureRecognizer *tap = touch;
    NSInteger tag = tap.view.tag - kHeadViewItemTag;
    
    switch (tag) {
        case 0:
        {
            Print(@"去昨日收益");
        }
        break;
        case 1:
        {
            Print(@"去可用余额");
        }
        break;
        case 2:
        {
            Print(@"去充值");
        }
        break;
        case 3:
        {
            Print(@"去提现");
        }
        break;
        case 4:
        {
            Print(@"去红包");
        }
        break;
        case 5:
        {
            Print(@"去加息券");
        }
        break;
        
        default:
        break;
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat y = scrollView.contentOffset.y;
    if (scrollView == self.collectionView) {
        if (y < -20) {
            self.topImgView.height = kTopImgViewH - y;
        }
    }
}

#pragma mark - UICollectionView Delegate & DataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SJZiChanCollectCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentify forIndexPath:indexPath];
    if (indexPath.row == 4) {
        cell.iconTip.hidden = NO;
        cell.titleTipLB.hidden = NO;
        cell.titleTipLB.text = @"购买散标";
    }else {
        cell.iconTip.hidden = YES;
        cell.titleTipLB.hidden = YES;
    }
    cell.titleLB.text = kCollectionItemTitles[indexPath.row];
    cell.iconImgView.image = [UIImage imageNamed:kCollectionItemIcons[indexPath.row]];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    SJCollectionHeadView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headIdentify forIndexPath:indexPath];
    
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < 6; i++) {
        UITapGestureRecognizer *rechargeTouch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rechargeAction:)];
        [arr addObject:rechargeTouch];
    }
    
    [headView.rechargeView addGestureRecognizer:arr[0]];
    [headView.canUserFreeMoneyView addGestureRecognizer:arr[1]];
    [headView.yesterdayIncomView addGestureRecognizer:arr[2]];
    [headView.withdrawView addGestureRecognizer:arr[3]];
    [headView.hongbaoView addGestureRecognizer:arr[4]];
    [headView.jiaxiquanView addGestureRecognizer:arr[5]];
    
    headView.yesterdayIncomView.tag = kHeadViewItemTag + 0;
    headView.canUserFreeMoneyView.tag = kHeadViewItemTag + 1;
    headView.rechargeView.tag = kHeadViewItemTag + 2;
    headView.withdrawView.tag = kHeadViewItemTag + 3;
    headView.hongbaoView.tag = kHeadViewItemTag + 4;
    headView.jiaxiquanView.tag = kHeadViewItemTag + 5;
    
    return headView;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(0, kCollectionHeadViewH);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    Print(@"index.row --- %ld", indexPath.row);
}

#pragma mark - setter & getter
- (void)setUI {
    //
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.topImgView];
    [self.view addSubview:self.topView];
    [self.topView addSubview:self.topLB];
    [self.topView addSubview:self.topIcon];
}

- (UIImageView *)topImgView {
    if (_topImgView == nil) {
        _topImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kTopImgViewH + kStatusBarHeight)];
        _topImgView.image = [UIImage imageNamed:@"assets_top_pic2"];
    }
    return _topImgView;
}

- (UIView *)topView {
    if (_topView == nil) {
        _topView = [SJHelper buildViewWithFrame:CGRectMake(0, 0, kDeviceWidth, kTopImgViewH + kStatusBarHeight)];
        _topView.backgroundColor = kClearColor;
        UITapGestureRecognizer *topTouch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(topTouch:)];
        [_topView addGestureRecognizer:topTouch];
    }
    return _topView;
}

- (UILabel *)topLB {
    if (_topLB == nil) {
        _topLB = [SJHelper buildLabelWithFrame:CGRectMake(60, 20, kDeviceWidth - 110, kTopImgViewH-20) backColor:kClearColor content:topText textColor:kWhiteColor font:SJBlodFont(25) textAlignment:NSTextAlignmentLeft lines:0];
    }
    return _topLB;
}

- (UIImageView *)topIcon {
    if (_topIcon == nil) {
        _topIcon = [[UIImageView alloc] initWithFrame:CGRectMake(kDeviceWidth - 50, 0, 30, 30)];
        _topIcon.image = [UIImage imageNamed:@"assets_icon_enter"];
        _topIcon.centerY = self.topLB.centerY;
    }
    return _topIcon;
}

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake((kDeviceWidth-kDistanceToScreen*2 - 1)/2, 100);
        flowLayout.minimumInteritemSpacing = 1;
        flowLayout.minimumLineSpacing = 1;
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, kTopImgViewH, kDeviceWidth, KDeviceHeight - kTopImgViewH - KTabBarHeight) collectionViewLayout:flowLayout];
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SJZiChanCollectCell class]) bundle:nil] forCellWithReuseIdentifier:cellIdentify];
        
        //header view
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SJCollectionHeadView class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headIdentify];
        
        _collectionView.backgroundColor = kVCBackGroundColor;
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}


@end
