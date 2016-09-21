//
//  SJLcbDetailsView.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/21.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJLcbDetailsView.h"

@implementation SJLcbDetailsView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)awakeFromNib {
    _timeOneV.layer.cornerRadius = _timeOneV.width/2.0;
    _timeTwoV.layer.cornerRadius = _timeTwoV.width/2.0;
    _timeThreeV.layer.cornerRadius = _timeThreeV.width/2.0;
    
    _listOneV.layer.cornerRadius = _listOneV.width/2.0;
    _listTwoV.layer.cornerRadius = _listTwoV.width/2.0;
    _listThreeV.layer.cornerRadius = _listThreeV.width/2.0;
    _listFourV.layer.cornerRadius = _listFourV.width/2.0;
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
        _interestLB.text = [NSString stringWithFormat:@"%@+%@",model.insterest, model.awardInsterest];
    }else {
        _interestLB.text = model.insterest;
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
        _interestLB.text = [NSString stringWithFormat:@"%@+%@",zcbModel.insterest, zcbModel.awardInsterest];
    }else {
        _interestLB.text = zcbModel.insterest;
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
