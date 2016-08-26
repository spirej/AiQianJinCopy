//
//  SJCustomNavBarView.h
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/8/27.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LeftBarButtonAction)();
typedef void(^RightBarButtonAction)();

@interface SJCustomNavBarView : UIView

@property (nonatomic, strong) UIView                *navBarView;
@property (nonatomic, strong) UILabel               *navTitleLB;
@property (nonatomic, strong) UIButton              *leftBarButton;
@property (nonatomic, strong) UIButton              *rightBarButton;
@property (nonatomic, copy)LeftBarButtonAction      leftAction;
@property (nonatomic, copy)RightBarButtonAction     rightAction;

- (instancetype)init;
- (instancetype)initWithLeftAction:(LeftBarButtonAction)leftAction rightAction:(RightBarButtonAction)rightAction;

@end
