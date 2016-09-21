//
//  SJZcbCalculView.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/21.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJZcbCalculView.h"

@implementation SJZcbCalculView

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
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([SJZcbCalculView class]) owner:nil options:nil]lastObject];
    }
    return self;
}

- (void)setModel:(SJZcbDetailsModel *)model {
    [_iconView sd_setImageWithURL:[NSURL URLWithString:model.calculationImgUrl]];
    _calculExplainLB.text = model.calculationExplain1;
    _calculExplainDescLB.text = model.calculationExplain2;
    
    _incomeLB.text = [NSString stringWithFormat:@"%@元", model.minProfit];
    [_incomeLB sizeToFit];
    
    _interestLB.text = model.minInsterest;
    [_interestLB sizeToFit];

}

@end
