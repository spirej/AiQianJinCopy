//
//  SJHomeCellModel.h
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/8/31.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJHomeCellModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *insterestExplain;
@property (nonatomic, copy) NSString *insterest;
@property (nonatomic, copy) NSString *awardInsterest;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *productAmount;
@property (nonatomic, copy) NSString *amountUnit;
@property (nonatomic, copy) NSString *productExplain1;
@property (nonatomic, copy) NSString *productExplain2;
@property (nonatomic, copy) NSString *sid;
@property (nonatomic, copy) NSString *detailUrl;
@property (nonatomic, copy) NSString *iconUrl;

@property (nonatomic, assign) NSInteger period;
@property (nonatomic, assign) NSInteger type;

@end
