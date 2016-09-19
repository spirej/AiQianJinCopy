//
//  SJZcbCellModel.h
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/14.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJZcbCellModel : NSObject

@property (nonatomic, copy) NSString *awardInsterest;
@property (nonatomic, copy) NSString *awardInsterestDesc;
@property (nonatomic, copy) NSString *insterest;
@property (nonatomic, copy) NSString *buttonType;
@property (nonatomic, copy) NSString *insurance;
@property (nonatomic, copy) NSString *issue;
@property (nonatomic, copy) NSString *maxInsterest;
@property (nonatomic, copy) NSString *minAmount;
@property (nonatomic, copy) NSString *minInsterest;
@property (nonatomic, copy) NSString *overAmount;
@property (nonatomic, copy) NSString *period;
@property (nonatomic, copy) NSString *planId;
@property (nonatomic, copy) NSString *progressDesc;
@property (nonatomic, copy) NSString *recommend;
@property (nonatomic, copy) NSString *sid;
@property (nonatomic, copy) NSString *status;

@property (nonatomic, assign) NSUInteger newInvestor;
@property (nonatomic, assign) NSUInteger nowDateTime;
@property (nonatomic, assign) NSUInteger openDateTime;

@property (nonatomic, copy)NSArray *iconList;

@end
