//
//  SJMenuItem.h
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/8/31.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SJMenuItem : UIControl
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLB;


- (instancetype)initMenuItemTitle:(NSString *)title icon:(UIImage *)image;
- (instancetype)initMenuItemTitle:(NSString *)title url:(NSString *)url;

@end
