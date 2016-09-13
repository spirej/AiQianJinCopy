//
//  SJSlideTypeHeadView.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/9/7.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJSlideTypeHeadView.h"

#define kButtonTag  9100
static const CGFloat SlideBgNormalAlpha    = 1;

@interface SJSlideTypeHeadView ()
{
    NSArray *itemArray;
    NSMutableArray *buttonArray;
    CGFloat itemWidth, selfWidth, selfHeight;
    NSInteger currentIndex;
    BOOL isHasSelectedState;
}
@end

@implementation SJSlideTypeHeadView


- (instancetype)initWithFrame:(CGRect)frame data:(NSArray *)data {
    self = [super initWithFrame:frame];
    if (self) {
        //
        itemArray = [NSArray arrayWithArray:data];
        selfWidth = frame.size.width;
        selfHeight = frame.size.height;
        currentIndex = 0;
        isHasSelectedState = NO;
        
        [self setUI];
    }
    return self;
}

- (void)setUI {
    [self addSubview:self.slideBgView];
    
    buttonArray = [NSMutableArray array];
    
    itemWidth = kDeviceWidth/itemArray.count;
    
    [itemArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //
        UIButton *button = [SJHelper buildButtonWithFrame:CGRectMake(itemWidth * idx, 10, itemWidth, selfHeight) backColor:kClearColor title:obj textColor:isHasSelectedState?(idx==0?kDetailBlackColor:kDetailGrayColor):kDetailGrayColor font:isHasSelectedState?(idx==0?kBFont15:kFont15):kFont15];
        button.tag = kButtonTag + idx;
        [button addTarget:self action:@selector(selectType:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [buttonArray addObject:button];
    }];
}

- (void)selectType:(UIButton *)sender {
    NSInteger index = sender.tag - kButtonTag;
    self.selectedIndex = index;
    
    if ([self.delegate respondsToSelector:@selector(selectItemIndex:)]) {
        [self.delegate selectItemIndex:index];
    }
}

#pragma mark - setter & getter

- (UIView *)slideBgView {
    if (_slideBgView == nil) {
        _slideBgView = [SJHelper buildViewWithFrame:CGRectMake(0, 0, selfWidth, selfHeight) backColor:SlideBgNomalColor];
    }
    return _slideBgView;
}

- (void)setSlideBgColor:(UIColor *)slideBgColor {
    if (slideBgColor) {
        _slideBgView.backgroundColor = slideBgColor;
    }else {
        _slideBgView.backgroundColor = SlideBgNomalColor;
    }
}

- (void)setSlideBgAlpha:(CGFloat)slideBgAlpha {
    if (slideBgAlpha>=0 && slideBgAlpha<=1) {
        _slideBgView.alpha = slideBgAlpha;
    }else {
        _slideBgView.alpha = SlideBgNormalAlpha;
    }
}

- (void)setHasSelectedState:(BOOL)hasSelectedState {
    isHasSelectedState = hasSelectedState;
    [buttonArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //
        UIButton *button = (UIButton *)obj;
        [button setTitleColor:isHasSelectedState?(idx==currentIndex?[UIColor redColor]:kDetailGrayColor):kDetailGrayColor forState:UIControlStateNormal];
        [button.titleLabel setFont:isHasSelectedState?(idx==currentIndex?kBFont15:kFont15):kFont15];
    }];
    
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    currentIndex = selectedIndex;
    
    [buttonArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //
        UIButton *button = (UIButton *)obj;
        if (isHasSelectedState) {
            if (button.tag - kButtonTag == selectedIndex) {
                [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                button.titleLabel.font = kBFont15;
            }else {
                [button setTitleColor:kDetailGrayColor forState:UIControlStateNormal];
                button.titleLabel.font = kFont15;
            }
        }else {
            [button setTitleColor:kDetailGrayColor forState:UIControlStateNormal];
            button.titleLabel.font = kFont15;
        }
    }];
}


@end
