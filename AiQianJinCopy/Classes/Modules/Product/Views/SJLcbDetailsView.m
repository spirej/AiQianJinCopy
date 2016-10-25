//
//  SJLcbDetailsView.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/21.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJLcbDetailsView.h"

#define kTimeCornR  15

@implementation SJLcbDetailsView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)awakeFromNib {
    [super awakeFromNib];
    _timeOneV.layer.cornerRadius = kTimeCornR;
    _timeTwoV.layer.cornerRadius = kTimeCornR;
    _timeThreeV.layer.cornerRadius = kTimeCornR;
    
    _xulineOneH.constant = 1;
    _xuLineTwoH.constant = 1;
    
    _calculViewH.constant = 100;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([SJLcbDetailsView class]) owner:nil options:nil] lastObject];
        self.frame = frame;
    }
    return self;
}

//零存宝详情
- (void)setModel:(SJLcbDetailsModel *)model {
    
    _interestTipLB.text = model.insterestExplain;
    
    if ([model.awardInsterest doubleValue] > 0) {
        _interestLB.attributedText = [SJHelper changeInvestText:[NSString stringWithFormat:@"%.2f+%.2f",[model.insterest floatValue], [model.awardInsterest floatValue]] withUnitFont:kFont18];
    }else {
        _interestLB.text = [NSString stringWithFormat:@"%.2f",[model.insterest floatValue]];
    }
    
    if ([SJHelper stringValid:model.iconUrl]) {
        _vipIconView.hidden = NO;
        [_vipIconView sd_setImageWithURL:[NSURL URLWithString:model.iconUrl]];
    }else {
        _vipIconView.hidden = YES;
    }

    _nowTimeLB.text = [SJHelper dateFormatter:@"yyyy-MM-dd" andLongDate:model.nowTime];
    _canIncomeTimeLB.text = [SJHelper dateFormatter:@"yyyy-MM-dd" andLongDate:model.interestTime];
    _arrivaTimeLB.text = [SJHelper dateFormatter:@"yyyy-MM-dd" andLongDate:model.arrivalTime];
    
}

//整存宝详情
- (void)setZcbModel:(SJZcbDetailsModel *)zcbModel {
    _interestTipLB.text = [NSString stringWithFormat:@"%@%@", zcbModel.period, zcbModel.insterestExplain];
    
    if ([zcbModel.awardInsterest doubleValue] > 0) {
        _interestLB.attributedText = [SJHelper changeInvestText:[NSString stringWithFormat:@"%.2f+%.2f",[zcbModel.insterest floatValue], [zcbModel.awardInsterest floatValue]] withUnitFont:kFont18];
    }else {
        _interestLB.text = [NSString stringWithFormat:@"%.2f",[zcbModel.insterest floatValue]];
    }
    
    if ([SJHelper stringValid:zcbModel.iconUrl]) {
        _vipIconView.hidden = NO;
        [_vipIconView sd_setImageWithURL:[NSURL URLWithString:zcbModel.iconUrl]];
    }else {
        _vipIconView.hidden = YES;
    }

    
    
    _nowTimeLB.text = [SJHelper dateFormatter:@"yyyy-MM-dd" andLongDate:zcbModel.nowTime];
    _canIncomeTimeLB.text = [SJHelper dateFormatter:@"yyyy-MM-dd" andLongDate:zcbModel.lockStartTime];
    _arrivaTimeLB.text = [SJHelper dateFormatter:@"yyyy-MM-dd" andLongDate:zcbModel.lockEndTime];
}

@end
