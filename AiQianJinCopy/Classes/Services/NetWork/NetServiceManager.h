//
//  NetServiceManager.h
//  xiangshangV3
//
//  Created by luohuichao on 16/2/23.
//  Copyright © 2016年 xiangshang360. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface NetServiceManager : NSObject

@property (nonatomic, strong) AFHTTPSessionManager *manager;

+ (instancetype)shareInstance;


/**
 *  @author luohuichao, 16-02-23 11:02:04
 *
 *  @brief get请求
 *
 *  @param path     url
 *  @param params   参数
 *  @param delegate delegate
 *  @param alert    加载窗内容
 *  @param success  success block
 *  @param failure  failure block
 */
- (void)jyGetPath:(NSString *)path
           params:(id)params
         delegate:(id)delegate
     waitingAlert:(NSString *)alert
          success:(void(^)(id responseObject))success
          failure:(void(^)(NSError* error)) failure;

/**
 *  @author luohuichao, 16-02-23 13:02:28
 *
 *  @brief POST 请求
 *
 *  @param path     url
 *  @param params   参数
 *  @param delegate delegate
 *  @param alert    加载窗内容
 *  @param success  success block
 *  @param failure  failure block
 */
- (void)jyPostPath:(NSString *)path
            params:(id)params
          delegate:(id)delegate
      waitingAlert:(NSString *)alert
           success:(void(^)(id responseObject))success
           failure:(void(^)(NSError* error)) failure;

/**
 *  @author fushengjun, 16-03-03 16:03:23
 *
 *  上传头像的网络请求
 *
 *  @param path     接口地址
 *  @param image    需要上传的image
 *  @param name     name
 *  @param delegate 代理
 *  @param alert    等待窗的内容，可以为空
 *  @param params   参数
 *  @param success  成功的回调
 *  @param failure  失败的回调
 */
-(void)jyUploadPath:(NSString *)path
              image:(UIImage *)image
           fileName:(NSString *)name
           delegate:(id)delegate
       wiatingAlert:(NSString *)alert
             params:(NSDictionary *)params
            success:(void(^)(id responseObject)) success
            failure:(void(^)(NSError* error)) failure;

/**
 *  @author luohuichao, 16-03-15 16:03:33
 *
 *  @brief app启动的接口信息,和用户获取信息接口
 *
 *  @param path    path
 *  @param params  参数
 *  @param success <#success description#>
 *  @param failure <#failure description#>
 */
- (void)jyGetPath:(NSString *)path
           params:(id)params
          success:(void(^)(id responseObject))success
          failure:(void(^)(NSError* error)) failure;


- (void)refreshUserModelInfo;

@end
