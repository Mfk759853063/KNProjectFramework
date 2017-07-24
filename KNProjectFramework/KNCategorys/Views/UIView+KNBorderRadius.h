//
//  UIView+MyViewCategory.h
//  JHLNHV2
//
//  Created by macbook-air on 15/5/7.
//  Copyright (c) 2015年 macbook-air. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (KNBorderRadius)

- (void)setBorderRaidus;

- (void)setBorderRaidus:(CGFloat)radius borderwidth:(CGFloat)borderwidth bordercolor:(UIColor *)bordercolor;

- (CALayer *)drawALine:(CGRect)frame color:(CGColorRef)color;

- (void)setBorderRaidus:(CGFloat)radius borderwidth:(CGFloat)borderwidth bordercolor:(UIColor *)bordercolor shadowColor:(UIColor *)shadowColor shadowOpacity:(CGFloat)opacity offSet:(CGSize)offset shaowRadius:(CGFloat)shadowRadius;

@end
