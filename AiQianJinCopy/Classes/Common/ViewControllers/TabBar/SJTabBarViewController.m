//
//  SJTabBarViewController.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/8/18.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJTabBarViewController.h"
#import "SJHomeViewController.h"
#import "SJProductViewController.h"
#import "SJPropertyViewController.h"
#import "SJInteractionViewController.h"
#import "SJNavigationController.h"

static NSInteger const kTabBarButtonTag = 1024;

@interface SJTabBarViewController ()
@property (nonatomic, strong) UIButton *currentSelectBtn;
@end

@implementation SJTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.hidden = YES;
    self.viewControllers = [NSMutableArray arrayWithCapacity:kTabbarNumberOfItems];
    [self setUpControllers];
    [self creatTabbar:self.viewControllers.count];
}

- (void)setUpControllers {
    SJHomeViewController        *homeVC         = [[SJHomeViewController alloc] init];
    SJProductViewController     *productVC      = [[SJProductViewController alloc] init];
    SJPropertyViewController    *propertyVC     = [[SJPropertyViewController alloc] init];
    SJInteractionViewController *interactionVC  = [[SJInteractionViewController alloc] init];
    
    /*
     解决自定义tabbar 在push时不隐藏tabbar的问题：
     把自定义tabbar类里面的viewcontroller 的导航都去掉，在appdelegate里面不用自定义的tabbar当根了，用navigationcontroller 当根，这样当我想push 的时候，就会隐藏掉tabbar了
     */
    NSArray *arr = [NSArray arrayWithObjects:homeVC, productVC, propertyVC, interactionVC, nil];
    self.viewControllers = arr;
}

- (void)creatTabbar:(NSInteger)ControllersNum
{
    //  只需要该图片名字就行
    NSArray * normImage = @[@"tab_normal_1",@"tab_normal_2",@"tab_normal_3",@"tab_normal_4"];
    //  只需修改选中图片的名字
    NSArray * selectImage = @[@"tab_selected_1",@"tab_selected_2",@"tab_selected_3",@"tab_selected_4"];
    UIImageView *tabbar = [[UIImageView alloc]initWithFrame:self.tabBar.frame];
    tabbar.backgroundColor =  kVCBackGroundColor;
    tabbar.userInteractionEnabled = YES;
    
    UIImageView *tabbarLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kLineH)];
    tabbarLine.image = [UIImage imageNamed:@"tabBarLineBG"];
    [tabbar addSubview:tabbarLine];
    
    [self.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(idx * kDeviceWidth / kTabbarNumberOfItems, 0, kDeviceWidth / kTabbarNumberOfItems, KTabBarHeight);
        
        UIImage *nor= [UIImage imageNamed:normImage[idx]];
        nor = [nor imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [btn setImage:nor forState:UIControlStateNormal];
        
        UIImage *sel = [UIImage imageNamed:selectImage[idx]];
        sel = [sel imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [btn setImage:sel forState:UIControlStateSelected];
        
        btn.tag = kTabBarButtonTag+idx;
        [tabbar addSubview:btn];
        //设置刚进入时，第一个按钮为点击状态
        if(btn.tag==kTabBarButtonTag)
        {
            btn.selected = YES;
            self.currentSelectBtn = btn;
        }
        [btn addTarget:self action:@selector(btnSelect:) forControlEvents:UIControlEventTouchUpInside];
    }];
    [self.view addSubview:tabbar];
}


- (void)btnSelect:(UIButton *)sender
{
    if (self.currentSelectBtn.tag == sender.tag) {
        //
    }else {
        self.currentSelectBtn.selected = NO;
        sender.selected = YES;
        self.currentSelectBtn = sender;
    }
    self.selectedIndex = sender.tag-1024;
}



@end
