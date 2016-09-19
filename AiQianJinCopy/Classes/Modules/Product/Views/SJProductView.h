//
//  SJProductView.h
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/8.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SJSlideTypeHeadView.h"
#import "SJLcbScrollView.h"
#import "SJAytView.h"

@interface SJProductView : UIView

@property (nonatomic, strong) SJSlideTypeHeadView   *slideTypeHeadView;
@property (nonatomic, strong) UIScrollView          *slideScrollView;

@property (nonatomic, strong) SJLcbScrollView       *LcbScrollView;
@property (nonatomic, strong) UITableView           *ZcbTableView;
@property (nonatomic, strong) SJAytView             *AytView;

@end
