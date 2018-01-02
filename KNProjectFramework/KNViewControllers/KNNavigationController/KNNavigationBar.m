//
//  KNNavigationBar.m
//  KNNavigationController
//
//  Created by kwep_vbn on 15/11/23.
//  Copyright © 2015年 vbn. All rights reserved.
//

#import "KNNavigationBar.h"
#import "Masonry.h"
#import "KNMacroDefines.h"
#import "UIButton+KNConvenient.h"
#import "UIColor+KNAddtions.h"

@interface KNNavigationBar()

@end


@implementation KNNavigationBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.shadowView.backgroundColor = KNCOLOR(224, 241, 238, 1);
        self.backGoundView.barTintColor = [UIColor KN_colorWithHex:0xf9f9f9];
    }
    return self;
}

- (void)setBackGoundViewBlur:(BOOL)blur {
    self.backGoundView.translucent = blur;
}

- (UIButton *)addRightButtonWithTarget:(id)target action:(SEL)action {
    UIButton *button = [UIButton KN_buttonWithText:@"" font:16 titleColor:[UIColor whiteColor]];
    [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-20));
        make.width.equalTo(@100);
        make.height.equalTo(@33);
        make.centerY.equalTo(self).offset(10);
    }];
    return button;
}

- (UIButton *)addLeftButtonWithTarget:(id)target action:(SEL)action {
    UIButton *button =[[UIButton alloc] initWithFrame:CGRectMake(0, 20, 64, 44)];
    button.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    return button;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - getter && setter

- (void)setTitle:(NSString *)title {
    self.titleLabel.text = title;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:18];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _titleLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.centerY.equalTo(self).offset(10);
            make.left.greaterThanOrEqualTo(self).offset(60);
            make.right.lessThanOrEqualTo(self).offset(-60);
        }];
    }
    return _titleLabel;
}

- (UIToolbar *)backGoundView
{
    if (!_backGoundView) {
        _backGoundView = [[UIToolbar alloc] init];
        [self insertSubview:_backGoundView atIndex:0];
        [_backGoundView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return _backGoundView;
}

- (UIView *)shadowView
{
    if (!_shadowView) {
        _shadowView = [UIView new];
        [self addSubview:_shadowView];
        [_shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self);
            make.left.and.right.equalTo(self);
            make.height.equalTo(@(KNSINGLE_LINE_WIDTH));
        }];
    }
    return _shadowView;
}

@end
