//
//  XSSystemMaintenanceView.h
//  xiangshangV3
//
//  Created by luohuichao on 16/3/31.
//  Copyright © 2016年 xiangshang360. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XSSystemMaintenanceView : UIView

/**
 *  @author luohuichao, 16-03-31 18:03:41
 *
 *  @brief 系统维护的单例
 */
+ (instancetype)shareInstance;

- (void)show;

- (void)hide;

@end
