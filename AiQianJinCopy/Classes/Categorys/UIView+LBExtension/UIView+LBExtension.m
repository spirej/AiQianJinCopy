//
//  UIView+LBExtension.m
//  XiangshangClub
//
//  Created by luohuichao on 15/11/3.
//  Copyright © 2015年 zendaiUp. All rights reserved.
//

#import "UIView+LBExtension.h"

@implementation UIView (LBExtension)
@dynamic x, y, width, height, origin, size;

// Setters
-(void)setX:(CGFloat)x{
    CGRect r        = self.frame;
    r.origin.x      = x;
    self.frame      = r;
}

-(void)setY:(CGFloat)y{
    CGRect r        = self.frame;
    r.origin.y      = y;
    self.frame      = r;
}

/*view 的宽度，X坐标不变，Y坐标实现*/
-(void)setWidth:(CGFloat)width{
    CGRect r        = self.frame;
    r.size.width    = width;
    self.frame      = r;
}


-(void)setHeight:(CGFloat)height{
    CGRect r        = self.frame;
    r.size.height   = height;
    self.frame      = r;
}

-(void)setOrigin:(CGPoint)origin{
    self.x          = origin.x;
    self.y          = origin.y;
}

-(void)setSize:(CGSize)size{
    self.width      = size.width;
    self.height     = size.height;
}

-(void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

-(void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

-(void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

-(void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

/*view 的X坐标，返回值为float类型,直接调view.x*/
-(CGFloat)x{
    return self.frame.origin.x;
}

/*view 的Y坐标，返回值为float类型,直接调view.y*/
-(CGFloat)y{
    return self.frame.origin.y;
}

-(CGFloat)maxX
{
    return CGRectGetMaxX(self.frame);
}

-(CGFloat)maxY
{
    return CGRectGetMaxY(self.frame);
}

/*view 的width，返回值为float类型,直接调view.width*/
-(CGFloat)width{
    return self.frame.size.width;
}

/*view 的height，返回值为float类型,直接调view.height*/
-(CGFloat)height{
    return self.frame.size.height;
}

/*view 的origin，,直接调view.origin 获取*/
-(CGPoint)origin{
    return CGPointMake(self.x, self.y);
}

/*view 的size,直接调view.size 获取*/
-(CGSize)size{
    return CGSizeMake(self.width, self.height);
}

/*view 最右边距X=0 的距离*/
-(CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

/*view 最下边距Y=0 的距离,包含最上免得20像素*/
-(CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

-(CGFloat)centerX {
    return self.center.x;
}

-(CGFloat)centerY {
    return self.center.y;
}

-(UIView *)lastSubviewOnX{
    if(self.subviews.count > 0){
        UIView *outView = self.subviews[0];
        
        for(UIView *v in self.subviews)
            if(v.x > outView.x)
                outView = v;
        
        return outView;
    }
    
    return nil;
}

-(UIView *)lastSubviewOnY{
    if(self.subviews.count > 0){
        UIView *outView = self.subviews[0];
        
        for(UIView *v in self.subviews)
            if(v.y > outView.y)
                outView = v;
        
        return outView;
    }
    
    return nil;
}

@end
