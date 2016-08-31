//
//  NetServiceManager.m
//  xiangshangV3
//
//  Created by luohuichao on 16/2/23.
//  Copyright © 2016年 xiangshang360. All rights reserved.
//

#import "NetServiceManager.h"
#import "XSSystemMaintenanceView.h"
#import "AppDelegate.h"

@implementation NetServiceManager

+ (instancetype)shareInstance
{
    static NetServiceManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    //HTTPS  ----   只用HHTPS请求，不做证书校验
    //    [instance configHTTPS:instance.manager];
    //请求头
    [instance addHttpHeader];
    return instance;
}


/**
 *  添加请求头
 *
 */
- (void)addHttpHeader
{
    //request headers
    [self.manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [self.manager.requestSerializer setValue:[SJHelper obtainDeviceIDFA] forHTTPHeaderField:@"idfa"];
    [self.manager.requestSerializer setValue:AppVersionCode forHTTPHeaderField:@"app_version"];
    [self.manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"app_type"];
    [self.manager.requestSerializer setValue:[SJHelper obtainDeviceIDFV] forHTTPHeaderField:@"device_id"];
    [self.manager.requestSerializer setValue:[SJHelper obtainDeviceType] forHTTPHeaderField:@"mobileType"];//设备类型 iphone 4 5 6
//    [self.manager.requestSerializer setValue:[SJHelper currentArchiveUserInfo].token forHTTPHeaderField:@"access_token"];
    //    DLog(@"======请求头=====%@",self.manager.requestSerializer.HTTPRequestHeaders);
}

- (AFHTTPSessionManager *)manager
{
    if (_manager == nil) {
        _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return _manager;
}

/**
 *  GET 请求
 *
 *  @param path     url
 *  @param params   params
 *  @param delegate delegate
 *  @param alert    alert
 *  @param success  success
 *  @param failure  failure
 */
- (void)jyGetPath:(NSString *)path
           params:(id)params
         delegate:(id)delegate
     waitingAlert:(NSString *)alert
          success:(void(^)(id responseObject)) success
          failure:(void(^)(NSError* error)) failure
{
    
    Print(@"请求的Url:%@%@",self.manager.baseURL,path);
    if (params) {
        Print(@"========请求的参数========%@",params);
    }
    //网络加载窗
    [self showWaitingContent:alert inView:delegate];
    //
    [self.manager GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //
        //隐藏网络加载窗
        [self hideWaitingInView:delegate];
        [self catchNetResWithResInfo:responseObject path:path delegate:delegate success:success error:failure];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //
        //隐藏网络加载窗
        [self hideWaitingInView:delegate];
        //网络请求错误处理
        NSDictionary *userInfo = error.userInfo;
        if ([userInfo isKindOfClass:[NSDictionary class]]) {
            //
            NSString *description = [userInfo objectForKey:@"NSLocalizedDescription"];
            if ([SJHelper stringValid:description]) {
//                [JYMSGManager showTextInWindow:description];
            }
        } else{
//            [JYMSGManager showTextInWindow:@"请求失败，请稍后重试"];
        }
        failure(error);
    }];
}

/**
 *  POST 请求
 *
 *  @param path     url
 *  @param params   params
 *  @param delegate delegate
 *  @param alert    alert
 *  @param success  success
 *  @param failure  failure
 */
- (void)jyPostPath:(NSString *)path
            params:(id)params
          delegate:(id)delegate
      waitingAlert:(NSString *)alert
           success:(void(^)(id responseObject)) success
           failure:(void(^)(NSError* error)) failure
{
    Print(@"请求的Url:%@%@",self.manager.baseURL,path);
    if (params) {
        Print(@"========请求的参数========%@",params);
    }
    //网络加载窗
    [self showWaitingContent:alert inView:delegate];
    //
    
    [self.manager POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //
        //隐藏网络加载窗
        [self hideWaitingInView:delegate];
        //
        [self catchNetResWithResInfo:responseObject path:path delegate:delegate success:success error:failure];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //
        [self hideWaitingInView:delegate];
        //网络请求错误处理
        NSDictionary *userInfo = error.userInfo;
        if ([userInfo isKindOfClass:[NSDictionary class]]) {
            //
            NSString *description = [userInfo objectForKey:@"NSLocalizedDescription"];
            if ([SJHelper stringValid:description]) {
//                [JYMSGManager showTextInWindow:description];
            }
        } else{
//            [JYMSGManager showTextInWindow:@"请求失败，请稍后重试"];
        }
        failure(error);
    }];
}

/**
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
            failure:(void(^)(NSError* error)) failure
{
    //判断网络状态
//    if (![SJHelper isNetWorkReachility]) {
//        [JYMSGManager showTextInWindow:@"似乎已断开与互联网的连接。"];
//        return;
//    }
    Print(@"请求的Url:%@%@",self.manager.baseURL,path);
    if (params) {
        Print(@"========请求的参数========%@",params);
    }
    //网络加载窗
    [self showWaitingContent:alert inView:delegate];
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@",BASE_URL,path];
    [self.manager POST:urlString parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSData *imageData = UIImageJPEGRepresentation(image, 0.3);
        [formData appendPartWithFileData:imageData name:name fileName:@"1.png" mimeType:@"img/png"];
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self hideWaitingInView:delegate];
        [self catchNetResWithResInfo:responseObject path:nil delegate:delegate success:success error:failure];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self hideWaitingInView:delegate];
    }];
}



/**
 *  网络请求成功后，统一处理方法
 *
 *  @param info     请求返回来的数据
 *  @param success  成功的回调
 *  @param failure  失败的回调
 *  @param delegate 代理
 *  @param path     nil
 */
-(void)catchNetResWithResInfo:(id )info
                         path:(NSString *)path
                     delegate:(id) delegate
                      success:(void(^)(id resBody)) success
                        error:(void(^)(NSError* error)) failure

{
    /*
     200 成功
     800 未登录
     */
    //网络请求成功
    NSDictionary * dic = (NSDictionary *)info;
    Print(@"网络请求返回来的数据***********************\n%@\n*******************",info);
    NSNumber *resCode = [dic objectForKey:@"code"];
    //隐藏
//    if ([XSConfigs sharedInstance].isSHowMaintenance) {
//        [[XSSystemMaintenanceView shareInstance] hide];
//    }
    switch (resCode.integerValue) {
        case 200: //请求成功
        {
            id data = [dic objectForKey:@"data"];
            success(data);
        }
            break;
        case 401: //401 用户未登录
        {
            //修改本地用户信息
//            [JYHelper clearUserInfo];
            NSString *msg = [dic objectForKey:@"message"];
            if (delegate && [delegate isKindOfClass:[UIViewController class]]) {
//                [JYMSGManager showTextInWindow:msg];
//                [JYTools showLoginInViewController:delegate];
            }
            AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
            if ([delegate.window.rootViewController isKindOfClass:[UITabBarController class]]) {
                UITabBarController *tabbarVC = (UITabBarController *)delegate.window.rootViewController;
                tabbarVC.selectedIndex = 0;
            }
            NSNumber *code = [dic objectForKey:@"code"];
//            NSError *error = [NSError errorWithDomain:kNetWorkErrorDomain code:code.integerValue userInfo:[NSDictionary dictionaryWithObject:msg forKey:@"message"]];
//            failure(error);
        }
            break;
        case 503:// 系统维护
        {
            [[XSSystemMaintenanceView shareInstance] show];
            NSString *msg = [dic objectForKey:@"message"];
//            [JYMSGManager showTextInWindow:msg];
        }
            break;
        default: //请求处理失败
        {
            NSNumber *code = [dic objectForKey:@"code"];
            NSString *msg = [dic objectForKey:@"message"];
            NSError *error = [NSError errorWithDomain:kNetWorkErrorDomain code:code.integerValue userInfo:[NSDictionary dictionaryWithObject:msg forKey:@"message"]];
            UIView *view = nil;
            if ([delegate isKindOfClass:[UIView class]]) {
                view = delegate;
            }else if ([delegate isKindOfClass:[UIViewController class]]){
                view = ((UIViewController *)delegate).view;
            }
//            if (view && [view isKindOfClass:[UIView class]] && [JYHelper stringValid:msg] && ![msg isEqualToString:@"支付密码不正确"]) {
//                [JYMSGManager showText:msg inView:view];
//            }
            failure(error);
        }
            break;
    }
}

- (void)showWaitingContent:(NSString *)alert inView:(id)delegate
{
    if (![alert isEqualToString:@"NOLOADING"]) {
        if ([delegate isKindOfClass:[UIView class]]) {
//            [JYTools showLoadingContent:alert inView:delegate];
        }else if ([delegate isKindOfClass:[UIViewController class]]){
            UIViewController *vc = (UIViewController *)delegate;
//            [JYTools showLoadingContent:alert inView:vc.view];
        }
    }
}

- (void)hideWaitingInView:(id)delegate
{
    if ([delegate isKindOfClass:[UIView class]]) {
//        [JYTools hideLoadingInView:delegate];
    }else if ([delegate isKindOfClass:[UIViewController class]]){
        UIViewController *vc = (UIViewController *)delegate;
//        [JYTools hideLoadingInView:vc.view];
    }
}


#pragma mark - APPInit
- (void)jyGetPath:(NSString *)path params:(id)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    [self.manager GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self catchNetResWithResInfo:responseObject path:path delegate:nil success:success error:failure];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
}

/**
 *  @author luohuichao, 16-03-28 15:03:41
 *
 *  @brief 刷新用户信息接口
 */
//- (void)refreshUserModelInfo
//{
//    [[NetServiceManager shareInstance] jyPostPath:kNetWorkUserRefresh params:nil delegate:self waitingAlert:nil success:^(id responseObject) {
//        [self handleLoginUserInfo:responseObject];
//    } failure:^(NSError *error) {
//        DLog(@"用户数据刷新失败");
//    }];
//}
//
//- (void)handleLoginUserInfo:(NSDictionary *)userInfo
//{
//    //更新当前的用户信息
//    JYUserModel *archivehmodle = [JYHelper currentArchiveUserInfo];
//    JYUserModel *model = [[JYUserModel alloc] initWithDic:userInfo];
//    //更新用户信息
//    archivehmodle.realName       = model.realName;
//    archivehmodle.help           = model.help;
//    archivehmodle.insurance      = model.insurance;
//    archivehmodle.mobile         = model.mobile;
//    archivehmodle.token          = model.token;
//    archivehmodle.email          = model.email;
//    archivehmodle.hasPayPassword = model.hasPayPassword;
//    archivehmodle.bindMobile     = model.bindMobile;
//    archivehmodle.isRealAuth     = model.isRealAuth;
//    archivehmodle.idCard         = model.idCard;
//    archivehmodle.device         = model.device;
//    archivehmodle.pushTag        = model.pushTag;
//    archivehmodle.hasBindBank    = model.hasBindBank;
//    archivehmodle.isLogin        = YES;
//    archivehmodle.hasBroker      = model.hasBroker;
//    archivehmodle.brokerUrl      = model.brokerUrl;
//    [JYHelper archiveUserInfo:archivehmodle]; //归档保存
//}

@end
