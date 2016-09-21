//
//  SJLcbCalculView.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/21.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJLcbCalculView.h"

@implementation SJLcbCalculView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init {
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([SJLcbCalculView class]) owner:nil options:nil]lastObject];
    }
    return self;
}

- (void)setModel:(SJLcbDetailsModel *)model {
    [_iconView sd_setImageWithURL:[NSURL URLWithString:model.calculationImgUrl]];
    _calculExplainLB.text = model.calculationExplain;
    _incomeLB.text = model.calculationProfit;
    [_iconTipView sd_setImageWithURL:[NSURL URLWithString:model.interestImgUrl]];
}

@end
