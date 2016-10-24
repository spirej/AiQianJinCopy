//
//  SJAytView.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/19.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJAytView.h"

@implementation SJAytView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.joinBtn.layer.cornerRadius = cornerR;
    self.joinBtn.layer.masksToBounds = YES;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([SJAytView class]) owner:nil options:nil] lastObject];
        self.frame = frame;
        self.bgScrollView.contentSize = CGSizeMake(0, 800);
    }
    return self;
}


- (void)setModel:(SJAytModel *)model {
    [_safetyIconView sd_setImageWithURL:[NSURL URLWithString:[model.safety objectForKey:@"imgUrl"]] placeholderImage:[UIImage imageNamed:@"banner_defaut_icon"]];
    
    _titleLB.text = model.title;
    [_titleLB sizeToFit];
    _titleLbW.constant = _titleLB.width + 30;
    _titleLB.layer.cornerRadius = 15;
    _titleLB.layer.masksToBounds = YES;
    _titleLB.layer.borderColor = ColorWithHex(0x5CE8FF, 1).CGColor;
    _titleLB.layer.borderWidth = 0.5;
    _titleLB.width = _titleLbW.constant;
    _titleLB.height = _titleLbH.constant;

    
    _interestLB.attributedText = [SJHelper changeInvestText:[NSString stringWithFormat:@"%.2f+%.2f", [[model.insterestList objectForKey:@"12"] floatValue],[model.awardInsterest floatValue]] withUnitFont:kFont18];
    
    
    NSString *str = [SJHelper numberFormatter:model.singleMin];
    _minAmountLB.attributedText = [SJHelper changeNumberText:[NSString stringWithFormat:@"起投金额%@元", str]];
    
    _periodLB.text = [NSString stringWithFormat:@"锁定期限%@", model.period];
    
    _loopOneV.layer.cornerRadius = 25;
    _loopOneV.layer.borderColor = ColorWithHex(0xff3936, 1).CGColor;
    _loopOneV.layer.borderWidth = 2.0;
    
    _loopTwoV.layer.cornerRadius = 25;
    _loopTwoV.layer.borderColor = ColorWithHex(0x7dc731, 1).CGColor;
    _loopTwoV.layer.borderWidth = 2.0;
    
    _loopTitleLbOne.text = model.prompt1;
    _loopTitleLbTwo.text = model.prompt2;
    
    _overAmountLB.text = [NSString stringWithFormat:@"剩余金额%@元", model.overAmount];
    if ([model.openDateTime doubleValue]/1000 > [model.nowDateTime doubleValue]/1000) {
        [_joinBtn setBackgroundColor:[UIColor colorWithRed:0.657 green:0.644 blue:0.632 alpha:1.000]];
        [_joinBtn setTitle:@"即将开售" forState:UIControlStateNormal];
    }else {
        if ([model.overAmount integerValue] == 0) {
            [_joinBtn setBackgroundColor:[UIColor colorWithRed:0.657 green:0.644 blue:0.632 alpha:1.000]];
            [_joinBtn setTitle:@"已售罄" forState:UIControlStateNormal];
        }else {
            [_joinBtn setBackgroundColor:ColorWithHex(0xf05d5b, 1)];
            [_joinBtn setTitle:@"立即加入" forState:UIControlStateNormal];
        }
    }
}

@end
