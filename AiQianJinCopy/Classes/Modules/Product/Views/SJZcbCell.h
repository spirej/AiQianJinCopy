//
//  SJZcbCell.h
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/13.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SJZcbCellModel.h"

@interface SJZcbCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *interestLB;
@property (weak, nonatomic) IBOutlet UILabel *lockedLB;

@property (weak, nonatomic) IBOutlet UIButton *joinBtn;

@property (nonatomic, strong) SJZcbCellModel *model;

@end
