//
//  SJMenuItemModel.h
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/8/31.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJMenuItemModel : NSObject

@property (nonatomic, copy) NSString *detailUrl;
@property (nonatomic, copy) NSString *imgUrl;
@property (nonatomic, copy) NSString *shareContent;
@property (nonatomic, copy) NSString *shareIcon;
@property (nonatomic, copy) NSString *shareTitle;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger type;

@end
