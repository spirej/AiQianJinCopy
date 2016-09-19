//
//  SJLcbModel.h
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/8.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJLcbModel : NSObject

@property (nonatomic, assign) NSUInteger awardInsterest;
@property (nonatomic, copy) NSString *insterest;
@property (nonatomic, assign) NSUInteger investPermission;
@property (nonatomic, assign) NSUInteger newInvestor;
@property (nonatomic, assign) NSUInteger nowDateTime;
@property (nonatomic, assign) NSUInteger openDateTime;
@property (nonatomic, assign) NSUInteger status;

@property (nonatomic, assign) BOOL idVerified;

@property (nonatomic, copy)NSArray *labelList;
@property (nonatomic, copy)NSDictionary *safety;

@property (nonatomic, copy) NSString *overAmount;
@property (nonatomic, copy) NSString *perBuyLimitAmount;
@property (nonatomic, copy) NSString *singleMin;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *explainUrl;
@property (nonatomic, copy) NSString *iconUrl;
@property (nonatomic, copy) NSString *insterestExplain;
@property (nonatomic, copy) NSString *interestImgUrl;
@property (nonatomic, copy) NSString *interestUrl;
@property (nonatomic, copy) NSString *safelyExplain;
@property (nonatomic, copy) NSString *safelyTitle;
@property (nonatomic, copy) NSString *sid;
@property (nonatomic, copy) NSString *title;


@end
