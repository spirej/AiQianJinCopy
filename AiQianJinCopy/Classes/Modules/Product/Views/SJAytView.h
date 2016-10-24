//
//  SJAytView.h
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/19.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SJAytModel.h"

@interface SJAytView : UIView
@property (weak, nonatomic) IBOutlet UIScrollView *bgScrollView;

@property (weak, nonatomic) IBOutlet UIImageView *safetyIconView;
@property (weak, nonatomic) IBOutlet UIImageView *vipIconView;

@property (weak, nonatomic) IBOutlet UILabel *titleLB;
@property (weak, nonatomic) IBOutlet UILabel *interestLB;
@property (weak, nonatomic) IBOutlet UILabel *minAmountLB;
@property (weak, nonatomic) IBOutlet UILabel *periodLB;

@property (weak, nonatomic) IBOutlet UIView *interestSelectV;

@property (weak, nonatomic) IBOutlet UIView *loopOneV;
@property (weak, nonatomic) IBOutlet UILabel *loopTitleLbOne;
@property (weak, nonatomic) IBOutlet UIView *loopTwoV;
@property (weak, nonatomic) IBOutlet UILabel *loopTitleLbTwo;
@property (weak, nonatomic) IBOutlet UILabel *overAmountLB;

@property (weak, nonatomic) IBOutlet UIButton *joinBtn;

@property (weak, nonatomic) IBOutlet UIButton *productDetailBtn;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLbH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLbW;
@property (weak, nonatomic) IBOutlet UIButton *safetyBtn;


@property (nonatomic, strong) SJAytModel * model;

@end
