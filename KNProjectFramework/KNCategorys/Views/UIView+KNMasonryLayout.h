//
//  UIView+MasonryLayout.h
//  LayoutDemo
//
//  Created by huayu on 15/5/11.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (KNMasonryLayout)

- (void)KN_layoutHorizontalWithViews:(NSArray *)views;

- (void)KN_layoutVerticalWithViews:(NSArray *)views;

@end
