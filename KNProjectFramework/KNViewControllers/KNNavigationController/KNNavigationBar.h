//
//  KNNavigationBar.h
//  KNNavigationController
//
//  Created by kwep_vbn on 15/11/23.
//  Copyright © 2015年 vbn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KNNavigationBar : UIView

@property (copy, nonatomic) NSString *title;

@property (strong, nonatomic) UILabel *titleLabel;

@property (strong, nonatomic) UIView *shadowView;

@property (strong, nonatomic) UIToolbar *backGoundView;

- (void)setBackGoundViewBlur:(BOOL)blur;

- (UIButton *)addRightButtonWithTarget:(id)target action:(SEL)action;

- (UIButton *)addLeftButtonWithTarget:(id)target action:(SEL)action;

@end
