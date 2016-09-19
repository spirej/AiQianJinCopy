//
//  SJAytModel.h
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/19.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJAytModel : NSObject

@property (nonatomic, copy) NSString *awardInsterest;
@property (nonatomic, copy) NSString *explainUrl;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *idVerified;
@property (nonatomic, copy) NSString *investPermission;
@property (nonatomic, copy) NSString *nowDateTime;
@property (nonatomic, copy) NSString *openDateTime;
@property (nonatomic, copy) NSString *overAmount;
@property (nonatomic, copy) NSString *period;
@property (nonatomic, copy) NSString *prompt1;
@property (nonatomic, copy) NSString *prompt2;
@property (nonatomic, copy) NSString *safelyExplain;
@property (nonatomic, copy) NSString *safelyTitle;
@property (nonatomic, copy) NSString *sid;
@property (nonatomic, copy) NSString *singleMin;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger newInvestor;

@property (nonatomic, strong) NSDictionary *safety;
@property (nonatomic, strong) NSDictionary *insterestList;

@end
