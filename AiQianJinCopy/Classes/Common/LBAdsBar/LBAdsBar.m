//
//  LBAdsBar.m
//  LBAdsBar
//
//  Created by luobbe on 16/7/25.
//  Copyright © 2016年 luobbe. All rights reserved.
//

#import "LBAdsBar.h"
#import "HWWeakTimer.h"

@interface LBAdsBar ()
{
    CGFloat width;          //LBScrollLabel width
    CGFloat height;
    NSTimer *timer;
}

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *aLabel;
@property (nonatomic, strong) UILabel *bLabel;

@end

@implementation LBAdsBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //
        self.layer.masksToBounds = YES;
        width = CGRectGetWidth(self.frame);
        height= CGRectGetHeight(self.frame);
        [self addSubview:self.imageView];
        [self addSubview:self.aLabel];
        [self addSubview:self.bLabel];
        _direction = LBAdsDirection_Top;
        _animateTime = 0.3;
        _stayTime = 3;
        _imageView.center = CGPointMake(10 + _imageView.width / 2.0, self.height / 2.0);
        _aLabel.frame = CGRectMake(_imageView.maxX + 10, 0, width - (_imageView.maxX + 10), height );
        _bLabel.frame = CGRectMake(_imageView.maxX + 10, height, _aLabel.width, height);
        // 点击事件
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)]];
    }
    return self;
}

#pragma mark - getters

- (UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_icon_notice"]];
    }
    return _imageView;
}

- (UILabel *)aLabel {
    if (_aLabel == nil) {
        _aLabel = [[UILabel alloc] init];
        _aLabel.backgroundColor = [UIColor clearColor];
    }
    return _aLabel;
}

- (UILabel *)bLabel {
    if (_bLabel == nil) {
        _bLabel = [[UILabel alloc] init];
        _bLabel.backgroundColor = [UIColor clearColor];
    }
    return _bLabel;
}

#pragma mark - setters

- (void)setTextColor:(UIColor *)textColor
{
    _textColor = textColor;
    _aLabel.textColor = _bLabel.textColor = _textColor;
}

- (void)setFont:(UIFont *)font
{
    _font = font;
    _aLabel.font = _bLabel.font = font;
}

- (void)setDisplayTexts:(NSArray *)displayTexts
{
    NSAssert([displayTexts isKindOfClass:[NSArray class]], @"displayTexts must be an array");
    _displayTexts = displayTexts;
    // 初始值
    if (_displayTexts.count == 1) {
        _currentIndex = 0;
        _currentText = _displayTexts[_currentIndex];
        _aLabel.attributedText = _currentText;
        _aLabel.attributedText = nil;
        [self stop];
    } else if (_displayTexts.count > 2) {
        _currentIndex = 0;
        _currentText = _displayTexts[_currentIndex];
        _aLabel.attributedText = _currentText;
        _bLabel.attributedText = _displayTexts[_currentIndex + 1];
    }
}

#pragma mark - custom mothods

- (void)startAnimation
{
    if (_displayTexts.count <= 1) {
        _aLabel.attributedText = nil;
        _bLabel.attributedText = nil;
        [self stop];
        return;
    }
    if (_direction == LBAdsDirection_Top) {
        _bLabel.frame = CGRectMake(_imageView.maxX + 10, height, _bLabel.width, height);
    }else if (_direction == LBAdsDirection_Left) {
        _bLabel.frame = CGRectMake(CGRectGetMaxX(_aLabel.frame), 0, _bLabel.width, height);
    }
    if (timer != nil) {
        [timer invalidate];
        timer = nil;
    }
    timer = [HWWeakTimer scheduledTimerWithTimeInterval:_stayTime target:self selector:@selector(animationLabel) userInfo:nil repeats:YES];
}

- (void)animationLabel {
    
    switch (_direction) {
        case LBAdsDirection_Top:
        {
            [UIView animateWithDuration:_animateTime
                                  delay:0
                                options:UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                //
                CGRect aRect = _aLabel.frame;
                CGRect bRect = _bLabel.frame;
                aRect.origin.y = - aRect.size.height;
                bRect.origin.y = 0;
                _aLabel.frame = aRect;
                _bLabel.frame = bRect;
            } completion:^(BOOL finished) {
                //
                CGRect aRect = _aLabel.frame;
                CGRect bRect = _bLabel.frame;
                aRect.origin.y = 0;
                bRect.origin.y = bRect.size.height;
                _aLabel.frame = aRect;
                _bLabel.frame = bRect;
                _currentIndex ++;
                [self setABLabelText];
            }];
        }
            break;
        case LBAdsDirection_Left:
        {
            [UIView animateWithDuration:_animateTime
                                  delay:0
                                options:UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                                 //
                                 CGRect aRect = _aLabel.frame;
                                 CGRect bRect = _bLabel.frame;
                                 aRect.origin.x = - aRect.size.width;
                                 bRect.origin.x = 0;
                                 _aLabel.frame = aRect;
                                 _bLabel.frame = bRect;
                             } completion:^(BOOL finished) {
                                 //
                                 CGRect aRect = _aLabel.frame;
                                 CGRect bRect = _bLabel.frame;
                                 aRect.origin.x = 0;
                                 bRect.origin.x = bRect.size.width;
                                 _aLabel.frame = aRect;
                                 _bLabel.frame = bRect;
                                 _currentIndex ++;
                                 [self setABLabelText];
                             }];
        }
            break;
    }
}

- (void)setABLabelText
{
    if (_currentIndex >= _displayTexts.count) {
        _currentIndex = 0;
    }
    _currentText = _displayTexts[_currentIndex];
    _aLabel.attributedText = _currentText;
    if (_currentIndex + 1 >= _displayTexts.count) {
        _bLabel.attributedText = _displayTexts[0];
    } else {
        _bLabel.attributedText = _displayTexts[_currentIndex + 1];
    }
}

- (void)stop
{
    [timer invalidate];
    timer = nil;
}

#pragma mark - 点击事件

- (void)tapAction
{
    if (_displayTexts.count == 0) {
        return;
    }
    if ([self.delegate respondsToSelector:@selector(selectedIndex:)]) {
        [self.delegate selectedIndex:_currentIndex];
    }
}

@end
