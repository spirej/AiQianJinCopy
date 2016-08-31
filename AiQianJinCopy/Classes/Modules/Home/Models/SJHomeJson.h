//
//  SJHomeJson.h
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/8/30.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJHomeJson : NSObject

@property (nonatomic, copy) NSDictionary *body;

//无关紧要的
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *token;

@end
