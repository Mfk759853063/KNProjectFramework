//
//  UIView+HZExtension.m
//  HuiXianxia
//
//  Created by jsfu on 15/6/24.
//  Copyright (c) 2015年 何霄云. All rights reserved.
//

#import "UIView+KNExtension.h"

@implementation UIView (KNExtension)

// Retrieve and set height, width, top, bottom, left, right
- (CGFloat)KN_height {
    return self.frame.size.height;
}

- (void)setKN_height:(CGFloat)newheight
{
    CGRect newframe = self.frame;
    newframe.size.height = newheight;
    self.frame = newframe;
}

- (CGFloat)KN_width
{
    return self.frame.size.width;
}

- (void) setKN_width: (CGFloat) newwidth
{
    CGRect newframe = self.frame;
    newframe.size.width = newwidth;
    self.frame = newframe;
}

- (CGFloat)KN_top
{
    return self.frame.origin.y;
}

- (void) setKN_top: (CGFloat) newtop
{
    CGRect newframe = self.frame;
    newframe.origin.y = newtop;
    self.frame = newframe;
}

- (CGFloat)KN_left
{
    return self.frame.origin.x;
}

- (void) setKN_left: (CGFloat) newleft
{
    CGRect newframe = self.frame;
    newframe.origin.x = newleft;
    self.frame = newframe;
}

- (CGFloat)KN_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void) setKN_bottom: (CGFloat) newbottom
{
    CGRect newframe = self.frame;
    newframe.origin.y = newbottom - self.frame.size.height;
    self.frame = newframe;
}

- (CGFloat)KN_right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void) setKN_right: (CGFloat) newright
{
    CGFloat delta = newright - (self.frame.origin.x + self.frame.size.width);
    CGRect newframe = self.frame;
    newframe.origin.x += delta ;
    self.frame = newframe;
}

- (void)setKN_centerY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (void)setKN_centerX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

-(CGFloat)KN_centerY {
    return self.center.y;
}

- (CGFloat)KN_centerX {
    return self.center.x;
}

//获取view的controller
- (UINavigationController *)KN_navigationController
{
    for (UIView * next = [self superview]; next; next = next.superview)
    {
        UIResponder * nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UINavigationController class]])
        {
            return (UINavigationController *)nextResponder;
        }
    }
    return nil;
}

-(UIViewController *)KN_viewController
{
    for (UIView * next = [self superview]; next; next = next.superview)
    {
        UIResponder * nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

-(void)KN_roundedWithNum:(int)num
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = num;
}

-(void)KN_removeAllSubViews
{
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}

- (UIView*)KN_findFirstResponderBeneathView:(UIView*)view
{
    // Search recursively for first responder
    for ( UIView *childView in view.subviews ) {
        if ( [childView respondsToSelector:@selector(isFirstResponder)] && [childView isFirstResponder] )
            return childView;
        UIView *result = [self KN_findFirstResponderBeneathView:childView];
        if ( result )
            return result;
    }
    return nil;
}

+ (UIViewController *)KN_findViewController:(UIView *)sourceView
{
    id target=sourceView;
    while (target) {
        target = ((UIResponder *)target).nextResponder;
        if ([target isKindOfClass:[UIViewController class]]) {
            break;
        }
    }
    return target;
}

- (void)KN_showDebug {
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = [[UIColor redColor] CGColor];
}

- (void)KN_showDebugWithColor:(UIColor *)color {
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = [color CGColor];
}

- (CGFloat)KN_radioHeightWithBaseWidth:(CGFloat)width height:(CGFloat)height
{
    CGFloat radio = (CGRectGetWidth(self.bounds) - width) / CGRectGetWidth(self.bounds);
    CGFloat radioHeight = radio * height + height;
    return radioHeight;
}

- (UITapGestureRecognizer *)KN_addTapGesTureRecognizerWithTarget:(id)target action:(SEL)selector
{
    [self setUserInteractionEnabled:YES];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:selector];
    [self addGestureRecognizer:tap];
    return tap;
}

- (UILongPressGestureRecognizer *)KN_addLongPressGestureRecognizerWithTarget:(id)target action:(SEL)selector
{
    [self setUserInteractionEnabled:YES];
    UILongPressGestureRecognizer *tap = [[UILongPressGestureRecognizer alloc] initWithTarget:target action:selector];
    [self addGestureRecognizer:tap];
    return tap;
}

- (UIPanGestureRecognizer *)KN_addPanGesTureRecognizerWithTarget:(id)target action:(SEL)selector {
    [self setUserInteractionEnabled:YES];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:selector];
    [self addGestureRecognizer:pan];
    return pan;
}

- (UISwipeGestureRecognizer *)KN_addSwipeGesTureRecognizerWithTarget:(id)target action:(SEL)selector {
    [self setUserInteractionEnabled:YES];
    UISwipeGestureRecognizer *pan = [[UISwipeGestureRecognizer alloc] initWithTarget:target action:selector];
    [pan setDirection:UISwipeGestureRecognizerDirectionLeft|UISwipeGestureRecognizerDirectionRight];
    [self addGestureRecognizer:pan];
    return pan;
}

//获得屏幕图像
- (UIImage *)KN_imageFromView
{
    
    UIGraphicsBeginImageContext(self.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

- (UIImage *)KN_getNormalImage{

    //支持retina高分的关键
    if(UIGraphicsBeginImageContextWithOptions != NULL) {
        //UIImage
        UIGraphicsBeginImageContextWithOptions(self.frame.size, true, 0.0);
    } else {
        
        UIGraphicsBeginImageContext(self.frame.size);
        
    }
    
    //获取图像
    
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();

    return image;
}

@end
