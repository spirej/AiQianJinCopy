//
//  SJRegistView.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 2016/10/20.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJRegistView.h"
#import "SJRegistModel.h"

@interface SJRegistView ()
{
    BOOL isRegistPage; //标记当前是注册页还是登录页
}
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) SJRegistModel *rModel;
@end

@implementation SJRegistView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.lineOneV_H.constant = 0.6;
    self.lineTwoV_H.constant = 0.6;
    
    self.registBT.layer.cornerRadius = 22.5;
    self.registBT.layer.masksToBounds = YES;
}

- (instancetype)init {
    if (self = [super init]) {
        
        self = [[NSBundle mainBundle] loadNibNamed:@"SJRegistView" owner:nil options:nil].lastObject;
        
        self.frame = CGRectMake(kDeviceWidth, 0, kDeviceWidth, KDeviceHeight);
        self.backgroundColor = kWhiteColor;
        
        isRegistPage = YES;
        
        [self addSubview:self.backButton];
        [self getNetWorkData];
        
        [self.registBT addTarget:self action:@selector(regist) forControlEvents:UIControlEventTouchUpInside];
        [self.gotoLoginBT addTarget:self action:@selector(gotoLogin) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)getNetWorkData {
    NSDictionary *jsonDic = [SJHelper readLocalFileResource:@"RegistOrLogin" type:@"json"];
    _rModel = [SJRegistModel mj_objectWithKeyValues:jsonDic];
    self.welcomeLB.text = _rModel.contentOne;
}

- (void)regist {
    //
    if (isRegistPage) {
        //注册请求
    }else {
        //登录请求
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self baseBack];
        });
    }
}

- (void)gotoLogin {
    //
    if (isRegistPage) {
        self.welcomeLB.text = _rModel.contentOne;
        self.mobileTF.placeholder = @"手机号码/用户名/邮箱";
        self.passwordTF.placeholder = @"登录密码";
        self.agreementLB.text = @"忘记密码?";
        [self.registBT setTitle:@"登录" forState:UIControlStateNormal];
        [self.gotoLoginBT setTitle:@"注册" forState:UIControlStateNormal];
        isRegistPage = NO;
    }else {
        self.welcomeLB.text = _rModel.contentTwo;
        self.mobileTF.placeholder = @"手机号码";
        self.passwordTF.placeholder = @"6-20位不能全数字，不含特殊字符";
        self.agreementLB.text = @"注册账户表示您同意《爱钱进注册协议》";
        [self.registBT setTitle:@"注册" forState:UIControlStateNormal];
        [self.gotoLoginBT setTitle:@"已有账号？请登录" forState:UIControlStateNormal];
        isRegistPage = YES;
    }
}


- (void)baseBack {
    
    [UIView animateWithDuration:0.2 animations:^{
        self.frame = CGRectMake(kDeviceWidth, 0, kDeviceWidth, KDeviceHeight);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (UIButton *)backButton {
    if (_backButton == nil) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _backButton.frame = CGRectMake(20, 30, 20, 44);
        [_backButton setImage:[UIImage imageNamed:@"nav_back_black"] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(baseBack) forControlEvents:UIControlEventTouchUpInside];
        _backButton.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);
    }
    return _backButton;
    
}


@end
