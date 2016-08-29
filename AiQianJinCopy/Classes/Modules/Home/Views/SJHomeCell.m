//
//  SJHomeCell.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/8/29.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJHomeCell.h"

@implementation SJHomeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.lineVer.x = kDeviceWidth/2 + 20;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
