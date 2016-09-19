//
//  SJZcbHeadView.h
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/14.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SJZcbCellModel.h"
#import "SJZcbModel.h"

@interface SJZcbHeadView : UIView
@property (weak, nonatomic) IBOutlet UIButton *joinBtn;
@property (weak, nonatomic) IBOutlet UIButton *userTopTouch;
@property (weak, nonatomic) IBOutlet UIButton *userProductDetailTouch;

@property (weak, nonatomic) IBOutlet UIImageView *topIconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLB;
@property (weak, nonatomic) IBOutlet UILabel *interestTipLB;
@property (weak, nonatomic) IBOutlet UILabel *minAmountLB;
@property (weak, nonatomic) IBOutlet UILabel *periodLB;
@property (weak, nonatomic) IBOutlet UIImageView *vip1IconView;
@property (weak, nonatomic) IBOutlet UILabel *interestLB;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLbH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLbW;


@property (nonatomic, strong) SJZcbModel     *zcbModel;
@property (nonatomic, strong) SJZcbCellModel *cellModel;

@end
