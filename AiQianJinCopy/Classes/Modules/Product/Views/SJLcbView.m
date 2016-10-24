//
//  SJLcbView.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/8.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJLcbView.h"

@implementation SJLcbView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([SJLcbView class]) owner:nil options:nil] lastObject];
        self.frame = frame;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    //列表的圈圈
    _listLoopOne.layer.cornerRadius = 25;
    _listLoopOne.layer.borderColor = ColorWithHex(0xff3936, 1).CGColor;
    _listLoopOne.layer.borderWidth = 2.0;
    
    _listLoopTwo.layer.cornerRadius = 25;
    _listLoopTwo.layer.borderColor = ColorWithHex(0x7dc731, 1).CGColor;
    _listLoopTwo.layer.borderWidth = 2.0;
    
    _listLoopThree.layer.cornerRadius = 25;
    _listLoopThree.layer.borderColor = ColorWithHex(0x4bb0d4, 1).CGColor;
    _listLoopThree.layer.borderWidth = 2.0;
    
    //按钮圆角
    _joinButton.layer.cornerRadius = cornerR;
}

- (void)setLcbModel:(SJLcbModel *)lcbModel {
    //标题
    _titleLB.text = lcbModel.title;
    [_titleLB sizeToFit];
    _titleLbH.constant = 30;
    _titleLbW.constant = _titleLB.width + 30;
    _titleLB.layer.cornerRadius = 15;
    _titleLB.layer.masksToBounds = YES;
    _titleLB.layer.borderColor = ColorWithHex(0xFC5455, 1).CGColor;
    _titleLB.layer.borderWidth = 0.5;
    _titleLB.width = _titleLbW.constant;
    _titleLB.height = _titleLbH.constant;

    [_iconTop sd_setImageWithURL:[NSURL URLWithString:[lcbModel.safety objectForKey:@"imgUrl"]]];
    
    [_iconMark sd_setImageWithURL:[NSURL URLWithString:lcbModel.iconUrl]];
    
    _interestTipLB.text = lcbModel.insterestExplain;
    
    _interestLB.attributedText = [SJHelper changeInvestText:[NSString stringWithFormat:@"%.2f",[lcbModel.insterest doubleValue]] withUnitFont:kFont18];
    
    NSString *strOne = [NSString stringWithFormat:@"起投金额%@元", lcbModel.singleMin];
    _minAmountLB.attributedText = [SJHelper changeNumberText:strOne];
    
    NSString *s = [SJHelper numberFormatter:lcbModel.perBuyLimitAmount];
    NSString *strTwo = [NSString stringWithFormat:@"每人限购%@元",s];
    _lockedLB.attributedText = [SJHelper changeNumberText:strTwo];
    
    //list
    _listLbOne.text = lcbModel.labelList[0];
    _listLbTwo.text = lcbModel.labelList[1];
    _listLbThree.text = lcbModel.labelList[2];

    NSString *str = [SJHelper numberFormatter:lcbModel.overAmount];
    NSString *strThree = [NSString stringWithFormat:@"当前剩余金额%@元",str];
    _surplusLB.attributedText = [SJHelper changeNumberText:strThree];
}



@end
