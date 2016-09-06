//
//  SJInteractionModel.h
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/6.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJInteractionModel : NSObject

@property (nonatomic, copy) NSArray *interactionList;
@property (nonatomic, copy) NSArray *operateInfo;

@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *idNo;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *mobile;

@property (nonatomic, assign) BOOL cashPassword;
@property (nonatomic, assign) BOOL emailVerified;
@property (nonatomic, assign) BOOL idVerified;
@property (nonatomic, assign) BOOL integral;
@property (nonatomic, assign) BOOL investPermission;
@property (nonatomic, assign) BOOL inviteStatus;
@property (nonatomic, assign) BOOL isBuyPlan;

@property (nonatomic, copy) NSDictionary *member;

@end
