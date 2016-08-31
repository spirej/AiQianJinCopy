//
//  LBAdsBar.h
//  LBAdsBar
//
//  Created by luobbe on 16/7/25.
//  Copyright © 2016年 luobbe. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,LBAdsDirection) {
    LBAdsDirection_Top,         // from bottom to top
    LBAdsDirection_Left         // from right to left
};

@protocol LBAdsBarDelegate <NSObject>

- (void)selectedIndex:(NSInteger)index;

@end

@interface LBAdsBar : UIView

@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic) NSTextAlignment textAlignment;
@property (nonatomic, assign) LBAdsDirection direction;  // 默认 LBAdsDirection_Top
@property (nonatomic, assign) id<LBAdsBarDelegate> delegate;
/**
 *  @brief 需要展示的数组
 */
@property (nonatomic, copy) NSArray *displayTexts;
/**
 *  @brief 当前显示的string
 */
@property (nonatomic, copy) NSMutableAttributedString *currentText;
/**
 *  @brief 当前展示string的index
 */
@property (nonatomic, assign) NSInteger currentIndex;
/**
 *  @brief 动画时间，默认 0.3s
 */
@property (nonatomic, assign) NSTimeInterval animateTime;
/**
 *  @brief 停留时间，默认 3s
 */
@property (nonatomic, assign) NSTimeInterval stayTime;

- (void)startAnimation;

- (void)stop;

@end
