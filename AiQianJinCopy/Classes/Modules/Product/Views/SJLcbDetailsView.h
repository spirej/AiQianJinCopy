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

@property (weak, nonatomic) IBOutlet UIView *listOneV;
@property (weak, nonatomic) IBOutlet UIView *listTwoV;
@property (weak, nonatomic) IBOutlet UIView *listThreeV;
@property (weak, nonatomic) IBOutlet UIView *listFourV;

@property (weak, nonatomic) IBOutlet UIView *calculView;

@property (nonatomic, strong) SJLcbDetailsModel *model;
@property (nonatomic, strong) SJZcbDetailsModel *zcbModel;

@end
