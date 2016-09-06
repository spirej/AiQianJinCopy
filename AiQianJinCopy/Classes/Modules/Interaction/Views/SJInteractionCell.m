//
//  SJInteractionCell.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/3.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJInteractionCell.h"

@implementation SJInteractionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [SJHelper setCornerRadius:cornerR forView:self.iconImgView];
    self.lineH.constant = kLineH;
}


- (void)setModel:(SJInteractionCellModel *)model {
    _titleLB.text = model.title;
    _explainLB.text = model.explain;
    [_iconImgView sd_setImageWithURL:[NSURL URLWithString:model.iconUrl] placeholderImage:[UIImage imageNamed:@"banner_defaut_icon"]];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
