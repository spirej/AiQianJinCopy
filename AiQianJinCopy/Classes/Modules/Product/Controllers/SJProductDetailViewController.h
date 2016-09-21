//
//  SJProductDetailViewController.h
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/20.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJBaseViewController.h"

typedef enum : NSUInteger {
    DetailType_Lcb,
    DetailType_Zcb
} DetailType;

@interface SJProductDetailViewController : SJBaseViewController

- (instancetype)initWithType:(DetailType)type;

@end
