//
//  UIView+ModalAddtion.m
//  Backhome
//
//  Created by kwep_vbn on 2017/8/9.
//  Copyright © 2017年 SmartHome. All rights reserved.
//

#import "UIView+KNModalAddtion.h"
#import "Masonry.h"
#import "objc/runtime.h"

@implementation UIView (ModalAddtion)

- (UIView *)knMaskView {
    return objc_getAssociatedObject(self, @selector(setKnMaskView:));
}

- (void)setKnMaskView:(UIView *)knMaskView {
    objc_setAssociatedObject(self, @selector(setKnMaskView:), knMaskView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)KN_showOnView:(UIView *)view
          maskType:(KNModalMaskType)modalMaskType
     directionType:(KNModalDirectionType)directionType
          duration:(NSTimeInterval)duration
          animated:(BOOL)animated {
    if (!self.knMaskView) {
        self.knMaskView = [self generateMaskView:modalMaskType];
    }
    if (modalMaskType != KNModalMaskTypeNormal) {
        UIBlurEffectStyle style = UIBlurEffectStyleDark;
        if (modalMaskType == KNModalMaskTypeBlurLight) {
            style = UIBlurEffectStyleLight;
        }
        UIBlurEffect * blur = [UIBlurEffect effectWithStyle:style];
        UIVisualEffectView * blurView = [[UIVisualEffectView alloc] initWithEffect:blur];
        blurView.frame = view.bounds;
        [blurView.contentView addSubview:self.knMaskView];
        [view addSubview:blurView];
        self.knMaskView = blurView;
    } else {
        self.knMaskView.frame = view.bounds;
        [view addSubview:self.knMaskView];
    }
    
    [self.knMaskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view);
    }];
    
    [view addSubview:self];
    [self layoutIfNeeded];
    CGSize size = self.bounds.size;
    
    if (directionType == KNModalDirectionTypeCenter) {
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(view);
            make.width.equalTo(@(size.width));
            make.height.equalTo(@(size.height));
        }];
    } else if (directionType == KNModalDirectionTypeBottom){
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(view).offset((size.height));
            make.height.equalTo(@(size.height));
            make.left.and.right.equalTo(view);
        }];
    }
    
    if (animated) {
        if (directionType == KNModalDirectionTypeCenter) {
            [self layoutIfNeeded];
            self.transform = CGAffineTransformMakeScale(0.1, 0.1);
            self.userInteractionEnabled = NO;
            [UIView animateWithDuration:duration animations:^{
                self.transform = CGAffineTransformIdentity;
                self.alpha = 1;
                self.knMaskView.alpha = 1;
            }completion:^(BOOL finished) {
                self.userInteractionEnabled = YES;
            }];
        } else if (directionType == KNModalDirectionTypeBottom){
            
            self.userInteractionEnabled = NO;
            [self mas_updateConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(@0);
                make.width.equalTo(@(size.width));
                make.height.equalTo(@(size.height));
            }];
            [UIView animateWithDuration:duration animations:^{
                [self layoutIfNeeded];
                self.alpha = 1;
            }completion:^(BOOL finished) {
                self.userInteractionEnabled = YES;
            }];
        }
        
    }
}

- (void)KN_showOnView:(UIView *)view
          maskType:(KNModalMaskType)modalMaskType
          duration:(NSTimeInterval)duration
          animated:(BOOL)animated {
    [self KN_showOnView:view maskType:modalMaskType directionType:KNModalDirectionTypeCenter duration:duration animated:animated];
}

- (void)KN_hideWithAnimated:(BOOL)animated {
    if (animated) {
        [UIView animateWithDuration:0.25 animations:^{
            self.alpha = 0;
            self.knMaskView.alpha = 0;
        }completion:^(BOOL finished) {
            [self removeFromSuperview];
            [self.knMaskView removeFromSuperview];
        }];
    } else {
        [self removeFromSuperview];
        [self.knMaskView removeFromSuperview];
    }
    
}

- (UIView *)generateMaskView:(KNModalMaskType)maskType {
    UIView *mask = [[UIView alloc] init];
    [mask setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.6]];
    return mask;
    
}

@end
