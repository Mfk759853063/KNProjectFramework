//
//  UIView+MyViewCategory.m
//  JHLNHV2
//
//  Created by macbook-air on 15/5/7.
//  Copyright (c) 2015年 macbook-air. All rights reserved.
//

#import "UIView+KNBorderRadius.h"

@implementation UIView (KNBorderRadius)

- (void)setBorderRaidus {
    [self setBorderRaidus: self.frame.size.width / 2.0f borderwidth: 0.0f bordercolor: nil];
}

- (void)setBorderRaidus:(CGFloat)radius borderwidth:(CGFloat)borderwidth bordercolor:(UIColor *)bordercolor {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
    self.layer.borderColor = [bordercolor CGColor];
    self.layer.borderWidth = borderwidth;
}

- (void)setBorderRaidus:(CGFloat)radius borderwidth:(CGFloat)borderwidth bordercolor:(UIColor *)bordercolor shadowColor:(UIColor *)shadowColor shadowOpacity:(CGFloat)opacity offSet:(CGSize)offset shaowRadius:(CGFloat)shadowRadius {
    [self setBorderRaidus:radius borderwidth:borderwidth bordercolor:bordercolor];
    self.layer.masksToBounds = NO;
    self.layer.shadowColor=shadowColor.CGColor;
    self.layer.shadowOffset=offset;
    self.layer.shadowOpacity=opacity;
    self.layer.shadowRadius=shadowRadius;
}

- (CALayer *)drawALine:(CGRect)frame color:(CGColorRef)color {
    CALayer *line = [CALayer new];
    line.backgroundColor = color;
    line.frame = frame;
    [self.layer addSublayer: line];
    return line;
}

@end
