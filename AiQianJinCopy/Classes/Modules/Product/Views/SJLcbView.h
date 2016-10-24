//
//  SJLcbView.h
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/8.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SJLcbModel.h"

@interface SJLcbView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *iconTop;
@property (weak, nonatomic) IBOutlet UIImageView *iconMark;

@property (weak, nonatomic) IBOutlet UIButton *topUserTouch;
@property (weak, nonatomic) IBOutlet UIButton *middleUserTouch;

@property (weak, nonatomic) IBOutlet UILabel *titleLB;
@property (weak, nonatomic) IBOutlet UILabel *interestTipLB;
@property (weak, nonatomic) IBOutlet UILabel *interestLB;
@property (weak, nonatomic) IBOutlet UILabel *minAmountLB;
@property (weak, nonatomic) IBOutlet UILabel *lockedLB;

@property (weak, nonatomic) IBOutlet UILabel *listLbOne;
@property (weak, nonatomic) IBOutlet UILabel *listLbTwo;
@property (weak, nonatomic) IBOutlet UILabel *listLbThree;

@property (weak, nonatomic) IBOutlet UILabel *surplusLB;
@property (weak, nonatomic) IBOutlet UIButton *joinButton;

@property (weak, nonatomic) IBOutlet UIView *listLoopOne;
@property (weak, nonatomic) IBOutlet UIView *listLoopTwo;
@property (weak, nonatomic) IBOutlet UIView *listLoopThree;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLbH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLbW;

@property (nonatomic, strong) SJLcbModel *lcbModel;

@end
