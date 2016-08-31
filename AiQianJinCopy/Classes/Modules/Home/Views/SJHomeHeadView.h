//
//  SJHomeHeadView.h
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/8/29.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KDCycleBannerView.h"
#import "LBAdsBar.h"
#import "SJMenuItem.h"

@protocol SJHomeHeaderViewDelegate <NSObject>

//banner的点击事件
- (void)bannerDidSelectedAtIndex:(NSUInteger)index;
//ads的点击事件
- (void)adsBarDidSelectedAtIndex:(NSUInteger)index;
//items的点击事件
- (void)itemsDidSelectedAtIndex:(NSUInteger)index;

@end

@interface SJHomeHeadView : UIView

@property (nonatomic, strong) KDCycleBannerView *bannerView;
@property (nonatomic, strong) LBAdsBar *adsBar;

@property (nonatomic, copy) NSArray *bannerArr;
@property (nonatomic, copy) NSArray *adsBarArr;

@property (nonatomic, copy) NSArray *menuItemIconArr;
@property (nonatomic, copy) NSArray *menuItemTitleArr;

@property (nonatomic, assign) id <SJHomeHeaderViewDelegate> delegate;
@end
