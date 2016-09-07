//
//  SJCommonWebViewController.h
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/7.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJBaseViewController.h"

@interface SJCommonWebViewController : SJBaseViewController<UIWebViewDelegate>

@property (nonatomic, assign) BOOL isPuch;
@property (nonatomic, assign) BOOL autoFit;
@property (nonatomic, retain) UIWebView *webView;
@property (nonatomic, retain) NSString *urlStr;
@property (nonatomic, retain) NSString *titleStr;

- (instancetype)initWithUrl:(NSString *)url title:(NSString *)title autoFit:(BOOL)isAutoFit;
- (id)initWithHtml:(NSString *)html title:(NSString *)title autoFit:(BOOL)isAutoFit;

@end
