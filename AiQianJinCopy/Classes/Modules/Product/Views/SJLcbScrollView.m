//
//  SJLcbScrollView.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/8.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJLcbScrollView.h"

@implementation SJLcbScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        
        self.lcbView = [[SJLcbView alloc] initWithFrame:frame];
        [self addSubview:self.lcbView];
    }
    return self;
}

@end
