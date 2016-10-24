//
//  SJRegistView.h
//  AiQianJinCopy
//
//  Created by SPIREJ on 2016/10/20.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SJRegistView : UIView
@property (weak, nonatomic) IBOutlet UILabel *welcomeLB;
@property (weak, nonatomic) IBOutlet UITextField *mobileTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UILabel *agreementLB;
@property (weak, nonatomic) IBOutlet UIButton *registBT;
@property (weak, nonatomic) IBOutlet UIButton *gotoLoginBT;
@property (weak, nonatomic) IBOutlet UIView *lineOneV;
@property (weak, nonatomic) IBOutlet UIView *lineTwoV;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineOneV_H;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineTwoV_H;

@end
