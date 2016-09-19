//
//  SJZcbModel.h
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/14.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJZcbModel : NSObject

@property (nonatomic, copy)NSArray *list;
@property (nonatomic, copy)NSDictionary *safety;

@property (nonatomic, copy) NSString *explainUrl;
@property (nonatomic, copy) NSString *planIcon;
@property (nonatomic, copy) NSString *planMsg;
@property (nonatomic, copy) NSString *safelyExplain;
@property (nonatomic, copy) NSString *safelyTitle;

@end
