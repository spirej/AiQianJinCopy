//
//  SJLcbDetailsView.h
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/21.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SJLcbDetailsModel.h"
#import "SJZcbDetailsModel.h"

@interface SJLcbDetailsView : UIView
@property (weak, nonatomic) IBOutlet UIScrollView *bgScrollView;

@property (weak, nonatomic) IBOutlet UILabel *interestTipLB;
@property (weak, nonatomic) IBOutlet UILabel *interestLB;
@property (weak, nonatomic) IBOutlet UIImageView *vipIconView;

@property (weak, nonatomic) IBOutlet UIView *timeOneV;
@property (weak, nonatomic) IBOutlet UIView *timeTwoV;
@property (weak, nonatomic) IBOutlet UIView *timeThreeV;

@property (weak, nonatomic) IBOutlet UILabel *nowTimeLB;
@property (weak, nonatomic) IBOutlet UILabel *canIncomeTimeLB;
@property (weak, nonatomic) IBOutlet UILabel *arrivaTimeLB;
@property (weak, nonatomic) IBOutlet UIView *calculView;

@property (nonatomic, strong) SJLcbDetailsModel *model;
@property (nonatomic, strong) SJZcbDetailsModel *zcbModel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *xulineOneH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *xuLineTwoH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *calculViewH;

@property (weak, nonatomic) IBOutlet UIView *listViewA;
@property (weak, nonatomic) IBOutlet UIView *listViewB;
@property (weak, nonatomic) IBOutlet UIView *listViewC;
@property (weak, nonatomic) IBOutlet UIView *listViewD;


@end
