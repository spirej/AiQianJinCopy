//
//  SJLcbCalculView.h
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/21.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SJLcbDetailsModel.h"

@interface SJLcbCalculView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *calculExplainLB;
@property (weak, nonatomic) IBOutlet UILabel *incomeLB;
@property (weak, nonatomic) IBOutlet UIImageView *iconTipView;
@property (weak, nonatomic) IBOutlet UIButton *calculBtn;
@property (weak, nonatomic) IBOutlet UIButton *upInComeBtn;

@property (nonatomic, strong) SJLcbDetailsModel *model;

@end
