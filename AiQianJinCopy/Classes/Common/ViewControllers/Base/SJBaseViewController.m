//
//  SJBaseViewController.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/8/18.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJBaseViewController.h"
#import "JZNavigationExtension.h"

@interface SJBaseViewController ()
@property (nonatomic, strong) UIButton *backButton;
@end

@implementation SJBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //控制器默认背景色
    self.view.backgroundColor = kVCBackGroundColor;
    //全屏手势返回
    self.navigationController.jz_fullScreenInteractivePopGestureEnabled = YES;
    //默认无返回按钮
    self.showBack = NO;
    //默认导航栏白色风格
    self.navBarStyle = SJNavBarStyle_White;
}

#pragma mark - 基类公共方法
- (void)baseBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)finishPress {
    [self.view endEditing:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self finishPress];
}

#pragma mark - setter & getter
- (void)setShowBack:(BOOL)showBack {
    if (showBack) {
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:self.backButton];
        backItem.style = UIBarButtonItemStylePlain;
        self.navigationItem.leftBarButtonItem = backItem;
    }else {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[UIView new]];
    }
}

- (void)setShowRedBack:(BOOL)show
{
    NSAssert(self.showBack == NO, @"showBack，setShowRedBack，设置其中一个即可");
    [self setShowBack:show];
    [_backButton setImage:[UIImage imageNamed:@"nav_back_white"] forState:UIControlStateNormal];
}


- (void)setNavTitle:(NSString *)navTitle {
    self.navigationItem.title = navTitle;
}

- (void)setNavBarStyle:(SJNavBarStyle)navBarStyle
{
    _navBarStyle = navBarStyle;
    
    NSDictionary *navTextColorDic;
    if (SJNavBarStyle_White == navBarStyle) {
        navTextColorDic = @{NSForegroundColorAttributeName:kBlackColor, NSFontAttributeName:SJFont(18)};
        self.navigationController.navigationBar.barTintColor = kWhiteColor;
        self.navigationController.navigationBar.translucent = NO;
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
        
    }else if (SJNavBarStyle_Red == navBarStyle){
        navTextColorDic = @{NSForegroundColorAttributeName:kWhiteColor, NSFontAttributeName:SJFont(18)};
        self.navigationController.navigationBar.barTintColor = ColorWithHex(0xee5e5e, 1);
        self.navigationController.navigationBar.translucent = NO;
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    }
    
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    [navigationBar setBackgroundImage:[UIImage imageNamed:navBarStyle == SJNavBarStyle_White? @"nav_bg_white":@"nav_bg_red"]
                       forBarPosition:UIBarPositionAny
                           barMetrics:UIBarMetricsDefault];
    [navigationBar setShadowImage:[UIImage new]];
    
    [navigationBar setTitleTextAttributes:navTextColorDic];
}


- (UIButton *)backButton {
    if (_backButton == nil) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _backButton.frame = CGRectMake(0, 0, 20, 44);
        [_backButton setImage:[UIImage imageNamed:@"nav_back_black"] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(baseBack) forControlEvents:UIControlEventTouchUpInside];
        _backButton.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);
    }
    return _backButton;

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
