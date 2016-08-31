//
//  SJMenuItem.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/8/31.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJMenuItem.h"

@implementation SJMenuItem

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    self.iconView.layer.cornerRadius = self.iconView.width/2.0;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"SJMenuItem" owner:nil options:nil].lastObject;
        self.frame = frame;
    }
    return self;
}

- (instancetype)initMenuItemTitle:(NSString *)title url:(NSString *)url {
    self = [[NSBundle mainBundle] loadNibNamed:@"SJMenuItem" owner:nil options:nil].lastObject;
    if (self) {
        [self.iconView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:nil options:SDWebImageCacheMemoryOnly];
        self.titleLB.text = title;
        self.titleLB.adjustsFontSizeToFitWidth = YES;
    }
    return self;
}

- (instancetype)initMenuItemTitle:(NSString *)title icon:(UIImage *)image {
    self = [[NSBundle mainBundle] loadNibNamed:@"SJMenuItem" owner:nil options:nil].lastObject;
    if (self) {
        self.iconView.image = image;
        self.titleLB.text = title;
        self.titleLB.adjustsFontSizeToFitWidth = YES;
    }
    return self;

}

@end
