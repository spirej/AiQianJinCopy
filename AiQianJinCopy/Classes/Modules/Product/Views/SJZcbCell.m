//
//  SJZcbCell.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/13.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJZcbCell.h"

@implementation SJZcbCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(SJZcbCellModel *)model {
    _interestLB.text = [NSString stringWithFormat:@"%.2f",[model.maxInsterest floatValue]];
    _lockedLB.text = [NSString stringWithFormat:@"%@个月",model.period];
    
    if (model.nowDateTime/1000 >= model.openDateTime/1000) {
        [_joinBtn setTitle:@"立即加入" forState:UIControlStateNormal];
    }else {
        [_joinBtn setTitle:@"立即预约" forState:UIControlStateNormal];
    }
}

@end
