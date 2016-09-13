//
//  SJSlideTypeHeadView.h
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/7.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SlideBgNomalColor     kWhiteColor
#define SlideLineNormalColor  kDetailLightBlackColor

@protocol SJSlideTypeDelegate <NSObject>

/**
 *
 *  当前选中的选项的编号 从0开始
 *
 *  @param index <#index description#>
 */
- (void)selectItemIndex:(NSInteger)index;

@end

@interface SJSlideTypeHeadView : UIView

@property (nonatomic, strong) id<SJSlideTypeDelegate>delegate;

/**
 *
 *  背景图
 */
@property (nonatomic, strong) UIView *slideBgView;

/**
 *
 *  背景图的背景色
 */
@property (nonatomic, strong) UIColor *slideBgColor;

/**
 *
 *  背景图的透明度
 */
@property (nonatomic, assign) CGFloat slideBgAlpha;

/**
 *
 *  标签是否有选中状态
 */
@property (nonatomic, assign) BOOL hasSelectedState;
/**
 *
 *  标签选中时文字颜色
 */
@property (nonatomic, strong) UIColor *selectedColor;
/**
 *
 *  当前选中标签的下标
 */
@property (nonatomic, assign) NSInteger selectedIndex;



/**
 *
 *  初始化
 *
 *  @param frame frame
 *  @param data  标题内容
 *
 *  @return <#return value description#>
 */
- (instancetype)initWithFrame:(CGRect)frame data:(NSArray *)data;

@end
