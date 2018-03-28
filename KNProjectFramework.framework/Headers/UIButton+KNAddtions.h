//
//  UIButton+KNAddtions.h
//  KNProjectFramework
//
//  Created by vbn on 2018/1/2.
//  Copyright © 2018年 vbn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ButtonEdgeInsetsStyle) {
    ButtonEdgeInsetsStyleImageLeft,
    ButtonEdgeInsetsStyleImageRight,
    ButtonEdgeInsetsStyleImageTop,
    ButtonEdgeInsetsStyleImageBottom
};

@interface UIButton (KNAddtions)

@property (strong, nonatomic) UIView *unreadView;

- (void)KN_setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;

- (void)KN_setEnlargeEdge:(CGFloat)size;

// 是否显示红点
- (void)KN_setUnread:(BOOL)unread;

- (void)KN_setBackgroundColor:(UIColor *)backgroundColor highLightColor:(UIColor *)highLightColor;

- (void)KN_showIndicator;

- (void)KN_hideIndicator;

- (void)KN_layoutButtonWithEdgeInsetsStyle:(ButtonEdgeInsetsStyle)style
                        imageTitlespace:(CGFloat)space;

@end
