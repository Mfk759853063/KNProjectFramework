//
//  UIView+RoundSide.m
//  Backhome
//
//  Created by kwep_vbn on 2017/3/10.
//  Copyright © 2017年 SmartHome. All rights reserved.
//

#import "UIView+KNRoundSide.h"

@implementation UIView (KNRoundSide)

- (void)KN_roundSide:(RoundSide)side cornerRadii:(CGSize)cornerRadii {
    UIBezierPath *maskPath;
    
    if (side == RoundSideNone) {
        self.layer.mask = nil;
        return;
    }
    if (side == RoundSideLeft)
        maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                         byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerBottomLeft)
                                               cornerRadii:cornerRadii];
    else if (side == RoundSideRight)
        maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                         byRoundingCorners:(UIRectCornerTopRight|UIRectCornerBottomRight)
                                               cornerRadii:cornerRadii];
    else if (side == RoundSideUp)
        maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                         byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight)
                                               cornerRadii:cornerRadii];
    else if (side == RoundSideAll)
        maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                         byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight|UIRectCornerBottomLeft|UIRectCornerBottomRight)
                                               cornerRadii:cornerRadii];
    else
        maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                         byRoundingCorners:(UIRectCornerBottomLeft|UIRectCornerBottomRight)
                                               cornerRadii:cornerRadii];
    
    // Create the shape layer and set its path
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    
    // Set the newly created shape layer as the mask for the image view's layer
    self.layer.mask = maskLayer;
    
//    [self.layer setMasksToBounds:YES];
}

- (void)KN_roundSide:(RoundSide)side
{
    [self KN_roundSide:side cornerRadii:CGSizeMake(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))];
}

@end
