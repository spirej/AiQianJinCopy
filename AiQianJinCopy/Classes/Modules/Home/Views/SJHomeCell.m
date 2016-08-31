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

- (void)setModel:(SJHomeCellModel *)model {
    //名称
    self.titleLB.text = model.title;
    //名称前的图标
    NSArray *iconArr = @[@"home_icon_zcb", @"home_icon_ihb"];
    self.iconTitle.image = [UIImage imageNamed:iconArr[model.type/2 - 1]];
    //产品图标
    [self.iconMarkImg sd_setImageWithURL:[NSURL URLWithString:model.iconUrl]];
    //收益率提示
    self.insterestExplainLB.text = model.insterestExplain;
    //收益率
    self.insterestLB.text = [NSString stringWithFormat:@"%.2f+%.2f",model.insterest.floatValue, model.awardInsterest.floatValue];
    //起投金额
    self.limitAmountLB.text = [NSString stringWithFormat:@"%@%@%@",model.productExplain1, model.productAmount, model.amountUnit];
    //存取方式
    self.productStatusLB.text = model.productExplain2;
}

@end
