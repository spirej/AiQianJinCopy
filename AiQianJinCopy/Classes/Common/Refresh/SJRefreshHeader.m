//
//  SJRefreshHeader.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/1.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJRefreshHeader.h"

@implementation SJRefreshHeader

- (void)prepare
{
    [super prepare];
    
    self.lastUpdatedTimeLabel.hidden = YES;
    self.stateLabel.hidden = YES;
    
    // 设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<2; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loadingNew_%zd", i]];
        [idleImages addObject:image];
    }
    [self setImages:idleImages forState:MJRefreshStateIdle];
    
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态） 
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=12; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loadingNew_%zd", i]];
        [refreshingImages addObject:image];
    }
    [self setImages:idleImages forState:MJRefreshStatePulling];
    
    // 设置正在刷新状态的动画图片
    [self setImages:refreshingImages forState:MJRefreshStateRefreshing];
}

@end
