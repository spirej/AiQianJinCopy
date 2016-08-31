//
//  SJHomeModel.h
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/8/30.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJHomeModel : NSObject

@property (nonatomic, copy) NSArray *bannerList;
@property (nonatomic, copy) NSArray *columnList;
@property (nonatomic, copy) NSArray *ggList;
@property (nonatomic, copy) NSArray *safety;

//新手专想标题
@property (nonatomic, copy) NSString *columnTitle;

@property (nonatomic, copy) NSString *imgUrl;

@property (nonatomic, copy) NSString *inviteUrl;

@property (nonatomic, assign) BOOL newInvestor;

@property (nonatomic, copy) NSString *redBagImgUrl;


@property (nonatomic, copy) NSString *safelyExplain;


@property (nonatomic, copy) NSString *safelyTitle;

@property (nonatomic, copy) NSString *safelyUrl;

@property (nonatomic, copy) NSString *safetyBackImg;

@property (nonatomic, copy) NSString *topImg;

@property (nonatomic, copy) NSString *topPage;

@property (nonatomic, copy) NSString *topTitle;

@property (nonatomic, copy) NSString *topUrl;

@end
