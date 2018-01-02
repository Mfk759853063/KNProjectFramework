//
//  UIButton+KNAddtions.m
//  KNProjectFramework
//
//  Created by vbn on 2018/1/2.
//  Copyright © 2018年 vbn. All rights reserved.
//

#import "UIButton+KNAddtions.h"
#import "UIImage+KNAddtions.h"
#import <objc/runtime.h>

#define IndicatorMargin 5
#define IndicatorTag 1000

@implementation UIButton (KNAddtions)

static char topNameKey;
static char rightNameKey;
static char bottomNameKey;
static char leftNameKey;

- (void)KN_setEnlargeEdge:(CGFloat)size
{
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)KN_setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left
{
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)enlargedRect
{
    NSNumber* topEdge = objc_getAssociatedObject(self, &topNameKey);
    NSNumber* rightEdge = objc_getAssociatedObject(self, &rightNameKey);
    NSNumber* bottomEdge = objc_getAssociatedObject(self, &bottomNameKey);
    NSNumber* leftEdge = objc_getAssociatedObject(self, &leftNameKey);
    if (topEdge && rightEdge && bottomEdge && leftEdge)
    {
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                          self.bounds.origin.y - topEdge.floatValue,
                          self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    }
    else
    {
        return self.bounds;
    }
}

- (UIView*) hitTest:(CGPoint) point withEvent:(UIEvent*) event
{
    CGRect rect = [self enlargedRect];
    if (CGRectEqualToRect(rect, self.bounds))
    {
        return [super hitTest:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? self : nil;
}

- (void)setUnreadView:(UIView *)unreadView {
    objc_setAssociatedObject(self, @selector(unreadView), unreadView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)unreadView {
    return objc_getAssociatedObject(self, @selector(unreadView));
}

- (void)KN_setUnread:(BOOL)unread {
    if (!self.unreadView) {
        self.unreadView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.bounds) - 5, CGRectGetMinY(self.bounds) +3, 5, 5)];
        self.unreadView.backgroundColor = [UIColor redColor];
        self.unreadView.layer.masksToBounds = YES;
        self.unreadView.layer.cornerRadius = 2.5;
        self.unreadView.userInteractionEnabled = NO;
        [self addSubview:self.unreadView];
    }
    self.unreadView.hidden = !unread;
}

- (void)KN_setBackgroundColor:(UIColor *)backgroundColor highLightColor:(UIColor *)highLightColor {
    [self setBackgroundImage:[UIImage KN_imageWithColor:backgroundColor] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage KN_imageWithColor:highLightColor] forState:UIControlStateHighlighted];
}

- (void)KN_showIndicator {
    UIActivityIndicatorView *indicator=[[UIActivityIndicatorView alloc]init];
    indicator.color=self.titleLabel.textColor;
    CGRect buttonFrame=self.frame;
    float indicatorLength=buttonFrame.size.height-IndicatorMargin*2;
    CGRect indicatorFrame=CGRectMake(buttonFrame.size.width/2-indicatorLength/2, IndicatorMargin, indicatorLength, indicatorLength);
    indicator.frame=indicatorFrame;
    indicator.tag=IndicatorTag;
    [self setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    [self addSubview:indicator];
    [indicator startAnimating];
    self.userInteractionEnabled=NO;
}

- (void)KN_hideIndicator {
    UIActivityIndicatorView *indicator=(UIActivityIndicatorView *)[self viewWithTag:IndicatorTag];
    [indicator stopAnimating];
    [self setTitleColor:indicator.color forState:UIControlStateNormal];
    [indicator removeFromSuperview];
    self.titleLabel.hidden=NO;
    self.userInteractionEnabled=YES;
}

- (void)KN_layoutButtonWithEdgeInsetsStyle:(ButtonEdgeInsetsStyle)style imageTitlespace:(CGFloat)space
{
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    CGFloat imageViewWidth = CGRectGetWidth(self.imageView.frame);
    CGFloat labelWidth = CGRectGetWidth(self.titleLabel.frame);
    
    if (labelWidth == 0) {
        CGSize titleSize = [self.titleLabel.text
                            sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
        labelWidth  = titleSize.width;
    }
    
    CGFloat imageInsetsTop = 0.0f;
    CGFloat imageInsetsLeft = 0.0f;
    CGFloat imageInsetsBottom = 0.0f;
    CGFloat imageInsetsRight = 0.0f;
    
    CGFloat titleInsetsTop = 0.0f;
    CGFloat titleInsetsLeft = 0.0f;
    CGFloat titleInsetsBottom = 0.0f;
    CGFloat titleInsetsRight = 0.0f;
    
    switch (style) {
        case ButtonEdgeInsetsStyleImageRight:
        {
            space = space * 0.5;
            
            imageInsetsLeft = labelWidth + space;
            imageInsetsRight = -imageInsetsLeft;
            
            titleInsetsLeft = - (imageViewWidth + space);
            titleInsetsRight = -titleInsetsLeft;
        }
            break;
            
        case ButtonEdgeInsetsStyleImageLeft:
        {
            space = space * 0.5;
            
            imageInsetsLeft = -space;
            imageInsetsRight = -imageInsetsLeft;
            
            titleInsetsLeft = space;
            titleInsetsRight = -titleInsetsLeft;
        }
            break;
        case ButtonEdgeInsetsStyleImageBottom:
        {
            CGFloat imageHeight = CGRectGetHeight(self.imageView.frame);
            CGFloat labelHeight = CGRectGetHeight(self.titleLabel.frame);
            CGFloat buttonHeight = CGRectGetHeight(self.frame);
            CGFloat boundsCentery = (imageHeight + space + labelHeight) * 0.5;
            
            CGFloat centerX_button = CGRectGetMidX(self.bounds); // bounds
            CGFloat centerX_titleLabel = CGRectGetMidX(self.titleLabel.frame);
            CGFloat centerX_image = CGRectGetMidX(self.imageView.frame);
            
            CGFloat imageBottomY = CGRectGetMaxY(self.imageView.frame);
            CGFloat titleTopY = CGRectGetMinY(self.titleLabel.frame);
            
            imageInsetsTop = buttonHeight - (buttonHeight * 0.5 - boundsCentery) - imageBottomY;
            imageInsetsLeft = centerX_button - centerX_image;
            imageInsetsRight = - imageInsetsLeft;
            imageInsetsBottom = - imageInsetsTop;
            
            titleInsetsTop = (buttonHeight * 0.5 - boundsCentery) - titleTopY;
            titleInsetsLeft = -(centerX_titleLabel - centerX_button);
            titleInsetsRight = - titleInsetsLeft;
            titleInsetsBottom = - titleInsetsTop;
            
        }
            break;
        case ButtonEdgeInsetsStyleImageTop:
        {
            CGFloat imageHeight = CGRectGetHeight(self.imageView.frame);
            CGFloat labelHeight = CGRectGetHeight(self.titleLabel.frame);
            CGFloat buttonHeight = CGRectGetHeight(self.frame);
            CGFloat boundsCentery = (imageHeight + space + labelHeight) * 0.5;
            
            CGFloat centerX_button = CGRectGetMidX(self.bounds); // bounds
            CGFloat centerX_titleLabel = CGRectGetMidX(self.titleLabel.frame);
            CGFloat centerX_image = CGRectGetMidX(self.imageView.frame);
            
            CGFloat imageTopY = CGRectGetMinY(self.imageView.frame);
            CGFloat titleBottom = CGRectGetMaxY(self.titleLabel.frame);
            
            imageInsetsTop = (buttonHeight * 0.5 - boundsCentery) - imageTopY;
            imageInsetsLeft = centerX_button - centerX_image;
            imageInsetsRight = - imageInsetsLeft;
            imageInsetsBottom = - imageInsetsTop;
            
            titleInsetsTop = buttonHeight - (buttonHeight * 0.5 - boundsCentery) - titleBottom;
            titleInsetsLeft = -(centerX_titleLabel - centerX_button);
            titleInsetsRight = - titleInsetsLeft;
            titleInsetsBottom = - titleInsetsTop;
        }
            break;
            
        default:
            break;
    }
    
    self.imageEdgeInsets = UIEdgeInsetsMake(imageInsetsTop, imageInsetsLeft, imageInsetsBottom, imageInsetsRight);
    self.titleEdgeInsets = UIEdgeInsetsMake(titleInsetsTop, titleInsetsLeft, titleInsetsBottom, titleInsetsRight);
}


@end
