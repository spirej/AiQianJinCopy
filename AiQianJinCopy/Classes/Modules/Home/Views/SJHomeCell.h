//
//  SJHomeCell.h
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/8/29.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SJHomeCellModel.h"

@interface SJHomeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *lineVer;
@property (weak, nonatomic) IBOutlet UILabel *titleLB;
@property (weak, nonatomic) IBOutlet UIImageView *iconMarkImg;
@property (weak, nonatomic) IBOutlet UILabel *insterestExplainLB;
@property (weak, nonatomic) IBOutlet UILabel *insterestLB;
@property (weak, nonatomic) IBOutlet UILabel *limitAmountLB;
@property (weak, nonatomic) IBOutlet UILabel *productStatusLB;
@property (weak, nonatomic) IBOutlet UIImageView *iconTitle;
@property (weak, nonatomic) IBOutlet UIImageView *iconLimitAmount;
@property (weak, nonatomic) IBOutlet UIImageView *iconStatus;

@property (nonatomic, strong) SJHomeCellModel *model;

@end
