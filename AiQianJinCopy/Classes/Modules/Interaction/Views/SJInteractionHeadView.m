//
//  SJInteractionHeadView.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/2.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJInteractionHeadView.h"

@interface SJInteractionHeadView ()
@property (nonatomic, copy) NSMutableArray *itemsIconArr;
@property (nonatomic, copy) NSMutableArray *itemsTitleArr;
@end

@implementation SJInteractionHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([SJInteractionHeadView class]) owner:nil options:nil].lastObject;
        self.frame = frame;
    }
    return self;
}


- (void)awakeFromNib {
    _iconImgView.layer.cornerRadius = _iconImgView.width/2.0;
    _iconImgView.layer.masksToBounds = YES;
    
    [self.itemsIconArr addObject:_iconVip];
    [self.itemsIconArr addObject:_iconFriend];
    [self.itemsIconArr addObject:_iconStatement];
    [self.itemsIconArr addObject:_iconUnity];
    
    
    [self.itemsTitleArr addObject:_vipLB];
    [self.itemsTitleArr addObject:_friendLB];
    [self.itemsTitleArr addObject:_statementLB];
    [self.itemsTitleArr addObject:_unityLB];
    
}

- (void)setModel:(SJInteractionModel *)model {
    [_levelIcon sd_setImageWithURL:[NSURL URLWithString:[model.member objectForKey:@"levelImg"]]];
    
    _nickNameLB.text = model.nickname;
    
    _mobileLB.text = model.mobile;
}

- (void)setHeadModel:(SJInteractionHeadModel *)headModel {
    
}


- (void)setItemModel:(SJInteractionItemModel *)itemModel {
    [self.iconVip sd_setImageWithURL:[NSURL URLWithString:@"https://news.iqianjin.com/news/u/cms/www/201605/2411083218fq.png"]];
    self.vipLB.text = itemModel.title;
    
}


//设置 items icon数据
- (void)setItemIcons:(NSArray *)itemIcons {

    [_itemsIconArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //
        [obj sd_setImageWithURL:[NSURL URLWithString:itemIcons[idx]]];
    }];
}

//设置 items title 数据
- (void)setItemtitles:(NSArray *)itemtitles {
    
    [_itemsTitleArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //
        UILabel *lb = (UILabel *)obj;
        lb.text = itemtitles[idx];
    }];
}




//存放items icon 的数组
- (NSMutableArray *)itemsIconArr {
    if (_itemsIconArr == nil) {
        _itemsIconArr = [NSMutableArray array];
    }
    return _itemsIconArr;
}

//存放items title 的数组
- (NSMutableArray *)itemsTitleArr {
    if (_itemsTitleArr == nil) {
        _itemsTitleArr = [NSMutableArray array];
    }
    return _itemsTitleArr;
}


@end
