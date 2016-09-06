//
//  SJInteractionCell.h
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/3.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SJInteractionCellModel.h"

@interface SJInteractionCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLB;
@property (weak, nonatomic) IBOutlet UILabel *explainLB;
@property (weak, nonatomic) IBOutlet UILabel *lookLB;
@property (weak, nonatomic) IBOutlet UIImageView *iconImgView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineH;
@property (weak, nonatomic) IBOutlet UIView *lineView;

@property (nonatomic, strong) SJInteractionCellModel *model;

@end
