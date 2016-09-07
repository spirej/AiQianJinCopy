//
//  SJMineMoreViewController.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/7.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJMineMoreViewController.h"

@interface SJMineMoreViewController ()

@end

@implementation SJMineMoreViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navTitle = @"更多";
    self.showBack = YES;
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
