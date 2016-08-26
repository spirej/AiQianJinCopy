//
//  SJBaseViewController.h
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/8/18.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    SJNavBarStyle_White,
    SJNavBarStyle_Red
} SJNavBarStyle;

@interface SJBaseViewController : UIViewController

@property (nonatomic, assign) BOOL showBack;

@property (nonatomic, assign) BOOL showRedBack;

@property (nonatomic, assign) SJNavBarStyle navBarStyle;

@property (nonatomic, copy)   NSString *navTitle;

- (void)finishPress;
- (void)baseBack;
@end
