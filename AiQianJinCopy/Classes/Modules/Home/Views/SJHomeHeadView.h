//
//  SJHomeHeadView.h
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/8/29.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KDCycleBannerView.h"

@protocol SJHomeHeaderViewDelegate <NSObject>

//banner的点击事件
- (void)bannerDidSelectedAtIndex:(NSUInteger)index;

@end

@interface SJHomeHeadView : UIView

@property (nonatomic, strong) KDCycleBannerView *bannerView;
@property (nonatomic, copy) NSArray *bannerArr;
@property (nonatomic, assign) id <SJHomeHeaderViewDelegate> delegate;
@end
