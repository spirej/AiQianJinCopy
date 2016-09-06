//
//  SJInteractionHeadView.h
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/2.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SJInteractionModel.h"
#import "SJInteractionHeadModel.h"
#import "SJInteractionItemModel.h"

@interface SJInteractionHeadView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *topImgView;
@property (weak, nonatomic) IBOutlet UIView *itemsView;

@property (weak, nonatomic) IBOutlet UIView *vipView;
@property (weak, nonatomic) IBOutlet UIView *toFriendView;
@property (weak, nonatomic) IBOutlet UIView *statementView;
@property (weak, nonatomic) IBOutlet UIView *unityView;

@property (weak, nonatomic) IBOutlet UIImageView *iconVip;
@property (weak, nonatomic) IBOutlet UIImageView *iconFriend;
@property (weak, nonatomic) IBOutlet UIImageView *iconStatement;
@property (weak, nonatomic) IBOutlet UIImageView *iconUnity;

@property (weak, nonatomic) IBOutlet UILabel *vipLB;
@property (weak, nonatomic) IBOutlet UILabel *friendLB;
@property (weak, nonatomic) IBOutlet UILabel *statementLB;
@property (weak, nonatomic) IBOutlet UILabel *unityLB;

@property (weak, nonatomic) IBOutlet UIImageView *iconImgView;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLB;
@property (weak, nonatomic) IBOutlet UILabel *mobileLB;
@property (weak, nonatomic) IBOutlet UIImageView *levelIcon;

@property (weak, nonatomic) IBOutlet UIButton *settingBtn;
@property (weak, nonatomic) IBOutlet UIButton *levelBtn;

@property (weak, nonatomic) IBOutlet UIView *informView;
@property (weak, nonatomic) IBOutlet UIView *settingView;


@property (nonatomic, copy) NSArray *itemIcons;
@property (nonatomic, copy) NSArray *itemtitles;


@property (nonatomic, strong) SJInteractionModel     *model;
@property (nonatomic, strong) SJInteractionHeadModel *headModel;
@property (nonatomic, strong) SJInteractionItemModel *itemModel;



- (instancetype)initWithFrame:(CGRect)frame;

@end
