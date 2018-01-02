//
//  UIViewController+KNNavigation.m
//  KNNavigationController
//
//  Created by kwep_vbn on 15/11/23.
//  Copyright © 2015年 vbn. All rights reserved.
//

#import "UIViewController+KNNavigation.h"
#import <objc/runtime.h>
#import "UIView+KNExtension.h"

@implementation UIViewController (KNNavigation)
@dynamic kn_navigationBar;

- (void)KN_navigationBarHidden:(BOOL)hidden animated:(BOOL)animated {
    if (hidden) {
        if (animated) {
            [UIView animateWithDuration:0.35 animations:^{
                self.kn_navigationBar.KN_top = -64;
                self.kn_navigationBar.alpha = 0;
            } completion:^(BOOL finished) {
            
            }];
        } else {
            self.kn_navigationBar.KN_top = -64;
            self.kn_navigationBar.alpha = 0;
            
        }
        
    } else if(animated) {
        [UIView animateWithDuration:0.35 animations:^{
            self.kn_navigationBar.alpha = 1;
            self.kn_navigationBar.KN_top = 0;
            for (UIView *view in self.kn_navigationBar.subviews) {
                view.alpha = 1.0;
            }
        } completion:^(BOOL finished) {
            
        }];
    } else {
        self.kn_navigationBar.alpha = 1;
        self.kn_navigationBar.KN_top = 0;
        for (UIView *view in self.kn_navigationBar.subviews) {
            view.alpha = 1.0;
        }
    }
}

- (KNNavigationBar *)kn_navigationBar {
    return objc_getAssociatedObject(self, @selector(kn_navigationBar));
}

- (void)setKn_navigationBar:(KNNavigationBar *)kn_navigationBar {
    objc_setAssociatedObject(self, @selector(kn_navigationBar), kn_navigationBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
