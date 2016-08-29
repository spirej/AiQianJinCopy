//
//  UIView+LBExtension.h
//  XiangshangClub
//
//  Created by luohuichao on 15/11/3.
//  Copyright © 2015年 zendaiUp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LBExtension)

/** view 的X */
@property (nonatomic, assign) CGFloat   x;


/** View.Y*/
@property (nonatomic, assign) CGFloat   y;

/** view.maxX */
@property (nonatomic, assign,readonly) CGFloat   maxX;

/** View.maxY*/
@property (nonatomic, assign,readonly) CGFloat   maxY;

/** View.width */
@property (nonatomic, assign) CGFloat   width;

/** View.height */
@property (nonatomic, assign) CGFloat   height;

/** View's origin - Sets X and Y Positions */
@property (nonatomic, assign) CGPoint   origin;

/** View's size - Sets Width and Height */
@property (nonatomic, assign) CGSize    size;

/** view最下边到Y==0的距离 ，包含最上边的20像素 **/
@property (nonatomic, assign) CGFloat   bottom;

/** view最右边到X==0的距离 **/
@property (nonatomic, assign) CGFloat   right;

/** View.centerX **/
@property (nonatomic, assign) CGFloat   centerX;

/** view.centerY **/
@property (nonatomic, assign) CGFloat   centerY;

/** 子视图在父视图中X的相对位置 **/
@property (nonatomic, strong, readonly) UIView *lastSubviewOnX;

/** 子视图在父视图中Y的相对位置 **/
@property (nonatomic, strong, readonly) UIView *lastSubviewOnY;

@end
