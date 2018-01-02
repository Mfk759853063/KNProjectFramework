//
//  UIView+HZExtension.h
//  HuiXianxia
//
//  Created by jsfu on 15/6/24.
//  Copyright (c) 2015年 何霄云. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (KNExtension)

@property CGFloat KN_height;
@property CGFloat KN_width;

@property CGFloat KN_top;
@property CGFloat KN_left;

@property CGFloat KN_bottom;
@property CGFloat KN_right;
@property CGFloat KN_centerY;
@property CGFloat KN_centerX;

- (UIImage *)KN_imageFromView;
- (UIImage *)KN_getNormalImage;

- (UINavigationController *)KN_navigationController;

- (UIViewController *)KN_viewController;

- (void)KN_roundedWithNum:(int)num;

-(void)KN_removeAllSubViews;

- (void)KN_showDebug;

- (void)KN_showDebugWithColor:(UIColor *)color;

- (UIView*)KN_findFirstResponderBeneathView:(UIView*)view;

+ (UIViewController *)KN_findViewController:(UIView *)sourceView;

- (CGFloat)KN_radioHeightWithBaseWidth:(CGFloat)width height:(CGFloat)height;

- (UITapGestureRecognizer *)KN_addTapGesTureRecognizerWithTarget:(id)target action:(SEL)selector;

- (UILongPressGestureRecognizer *)KN_addLongPressGestureRecognizerWithTarget:(id)target action:(SEL)selector;

- (UIPanGestureRecognizer *)KN_addPanGesTureRecognizerWithTarget:(id)target action:(SEL)selector;

- (UISwipeGestureRecognizer *)KN_addSwipeGesTureRecognizerWithTarget:(id)target action:(SEL)selector;

@end
