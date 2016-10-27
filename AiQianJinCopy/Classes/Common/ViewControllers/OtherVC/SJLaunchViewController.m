//
//  SJLaunchViewController.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 2016/10/25.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJLaunchViewController.h"

@interface SJLaunchViewController ()
@property (nonatomic, strong) UIImageView *logoImageView;
@end

@implementation SJLaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.logoImageView];
    [self showAds];
}

- (void)showAds {
    [self performSelector:@selector(finishLaunch) withObject:nil afterDelay:3.0];
}

- (void)finishLaunch {
    self.FinishLaunch();
}

- (UIImageView *)logoImageView {
    if (_logoImageView == nil) {
        _logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, KDeviceHeight)];
        _logoImageView.image = [UIImage imageNamed:@"Default-667h@2x.png"];
    }
    return _logoImageView;
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
