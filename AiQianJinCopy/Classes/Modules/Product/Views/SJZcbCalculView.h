//
//  SJZcbCalculView.h
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/21.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SJZcbDetailsModel.h"

@interface SJZcbCalculView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *calculExplainLB;
@property (weak, nonatomic) IBOutlet UILabel *calculExplainDescLB;

@property (weak, nonatomic) IBOutlet UILabel *incomeLB;
@property (weak, nonatomic) IBOutlet UILabel *interestLB;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *incomeIconW;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *interestIconW;
@property (weak, nonatomic) IBOutlet UIButton *calculBtn;

@property (nonatomic, strong) SJZcbDetailsModel *model;

@end
