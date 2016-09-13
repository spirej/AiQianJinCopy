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
    //列表的圈圈
    _listLoopOne.layer.cornerRadius = _listLoopOne.width/2.0;
    _listLoopOne.layer.borderColor = ColorWithHex(0xff3936, 1).CGColor;
    _listLoopOne.layer.borderWidth = 2.0;
    
    _listLoopTwo.layer.cornerRadius = _listLoopOne.width/2.0;
    _listLoopTwo.layer.borderColor = ColorWithHex(0x7dc731, 1).CGColor;
    _listLoopTwo.layer.borderWidth = 2.0;
    
    _listLoopThree.layer.cornerRadius = _listLoopOne.width/2.0;
    _listLoopThree.layer.borderColor = ColorWithHex(0x4bb0d4, 1).CGColor;
    _listLoopThree.layer.borderWidth = 2.0;
    
    //按钮圆角
    _joinButton.layer.cornerRadius = cornerR;
}

- (void)setLcbModel:(SJLcbModel *)lcbModel {
    [_iconTop sd_setImageWithURL:[NSURL URLWithString:[lcbModel.safety objectForKey:@"imgUrl"]]];
    
    [_iconMark sd_setImageWithURL:[NSURL URLWithString:lcbModel.iconUrl]];
    
    _titleLB.text = lcbModel.title;
    
    _interestTipLB.text = lcbModel.insterestExplain;
    
    _interestLB.text = lcbModel.insterest;
    
    _minAmountLB.text = [NSString stringWithFormat:@"起投金额%@元", lcbModel.singleMin];
    
    _lockedLB.text = [NSString stringWithFormat:@"每人限购%@元",lcbModel.perBuyLimitAmount];
    
    //list
    _listLbOne.text = lcbModel.labelList[0];
    _listLbTwo.text = lcbModel.labelList[1];
    _listLbThree.text = lcbModel.labelList[2];

    _surplusLB.text = [NSString stringWithFormat:@"剩余金额%@元",lcbModel.overAmount];
}



@end
