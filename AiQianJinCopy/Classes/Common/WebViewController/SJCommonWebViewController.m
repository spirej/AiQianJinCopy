//
//  SJCommonWebViewController.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/7.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJCommonWebViewController.h"
#import "NJKWebViewProgress.h"
#import "NJKWebViewProgressView.h"

@interface SJCommonWebViewController ()<NJKWebViewProgressDelegate>
{
    BOOL isHtml;
    
    NJKWebViewProgressView *_progressView;
    NJKWebViewProgress *_progressProxy;
}
@end

@implementation SJCommonWebViewController
@synthesize isPuch, autoFit, webView, urlStr, titleStr;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.showBack = YES;
    self.navTitle = titleStr;
    
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, KDeviceHeight - KNavigationBarHeight)];
    webView.delegate = self;
    webView.scalesPageToFit = autoFit;
    webView.backgroundColor = kClearColor;
    [self.view addSubview:webView];
    
    //创建进度条
    [self creatWebViewProgress];
    
    //加载页面
    [self loadWebPage:self.urlStr];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar addSubview:_progressView];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [_progressView removeFromSuperview];
}

- (instancetype)initWithUrl:(NSString *)url title:(NSString *)title autoFit:(BOOL)isAutoFit {
    if (self = [super init]) {
        urlStr   = url;
        titleStr = title;
        autoFit  = isAutoFit;
        isHtml   = NO;
    }
    return self;
}

- (id)initWithHtml:(NSString *)html title:(NSString *)title autoFit:(BOOL)isAutoFit {
    if (self = [super init]) {
        urlStr   = html;
        titleStr = title;
        autoFit  = isAutoFit;
        isHtml   = YES;
    }
    return self;
}

//加载web页面
- (void)loadWebPage:(NSString *)url {
    if (isHtml) {
        [webView loadHTMLString:url baseURL:nil];
    }else {
        NSURL *URL = [NSURL URLWithString:url];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:URL];
        [webView loadRequest:request];
    }
}

//创建进度条
- (void)creatWebViewProgress {
    _progressProxy = [[NJKWebViewProgress alloc] init];
    webView.delegate = _progressProxy;
    _progressProxy.webViewProxyDelegate = self;
    _progressProxy.progressDelegate = self;
    
    CGFloat progressBarHeight = 2.0f;
    CGRect navigationBarBounds = self.navigationController.navigationBar.bounds;
    CGRect progressBarFrame = CGRectMake(0, navigationBarBounds.size.height - progressBarHeight, navigationBarBounds.size.width, progressBarHeight);
    _progressView = [[NJKWebViewProgressView alloc] initWithFrame:progressBarFrame];
    _progressView.progressBarView.backgroundColor = kBlackColor;
    _progressView.progress = 0;
}

#pragma mark - NJKWebViewProgressDelegate
-(void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress
{
    [_progressView setProgress:progress animated:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
