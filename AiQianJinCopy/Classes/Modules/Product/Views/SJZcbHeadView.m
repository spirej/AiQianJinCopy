//
//  SJZcbHeadView.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/14.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJZcbHeadView.h"

@implementation SJZcbHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init {
    self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([SJZcbHeadView class]) owner:nil options:nil] lastObject];
    if (self) {
        //
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.joinBtn.layer.cornerRadius = cornerR;
    self.joinBtn.layer.masksToBounds = YES;
}

- (void)setZcbModel:(SJZcbModel *)zcbModel {
    //安全保障图
    [_topIconView sd_setImageWithURL:[NSURL URLWithString:[zcbModel.safety objectForKey:@"imgUrl"]] placeholderImage:[UIImage imageNamed:@"banner_defaut_icon"]];
    //标题
    _titleLB.text = zcbModel.planMsg;
    [_titleLB sizeToFit];
    _titleLbH.constant = 30;
    _titleLbW.constant = _titleLB.width + 30;
    _titleLB.layer.cornerRadius = 15;
    _titleLB.layer.masksToBounds = YES;
    _titleLB.layer.borderColor = ColorWithHex(0x86FF42, 1).CGColor;
    _titleLB.layer.borderWidth = 0.5;
    _titleLB.width = _titleLbW.constant;
    _titleLB.height = _titleLbH.constant;
}


- (void)setCellModel:(SJZcbCellModel *)cellModel {
    //新手标签图
    if (cellModel.iconList.count > 0) {
        [_vip1IconView sd_setImageWithURL:[NSURL URLWithString:cellModel.iconList[0]]];
    }
    //收益
    if ([cellModel.awardInsterest integerValue] > 0) {
        _interestLB.attributedText = [SJHelper changeInvestText:[NSString stringWithFormat:@"%.2f+%.2f",[cellModel.maxInsterest floatValue], [cellModel.awardInsterest floatValue]] withUnitFont:kFont18];
    }else {
        _interestLB.text = [NSString stringWithFormat:@"%.2f",[cellModel.maxInsterest floatValue]];
    }
    //起投
    NSString *str = [SJHelper numberFormatter:cellModel.minAmount];
    _minAmountLB.attributedText = [SJHelper changeNumberText:[NSString stringWithFormat:@"起投金额%@元",str]];
    //锁定期
    _periodLB.attributedText = [SJHelper changeLockedText:[NSString stringWithFormat:@"锁定期%@个月",cellModel.period] color:ColorWithHex(0xfc5455, 1)];
}
@end
