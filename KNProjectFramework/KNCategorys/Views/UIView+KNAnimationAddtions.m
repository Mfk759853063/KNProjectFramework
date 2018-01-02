//
//  UIView+AnimationAddtions.m
//  Backhome
//
//  Created by kwep_vbn on 2017/6/24.
//  Copyright © 2017年 SmartHome. All rights reserved.
//

#import "UIView+KNAnimationAddtions.h"

@implementation UIView (AnimationAddtions)

- (CABasicAnimation * )KN_startTransformZAnimationWithAngle:(double)toAngle duration:(CGFloat)duration repeatCount:(int)repeatCount delegate:(id)delegate {
    CABasicAnimation *animation2 =  [self KN_transformZAnimationWithAngle:toAngle duration:duration repeatCount:repeatCount];
    animation2.delegate = delegate;
    [self.layer addAnimation:animation2 forKey:@"animatationZ"];
    return animation2;
}

- (CABasicAnimation *)KN_transformZAnimationWithAngle:(double)toAngle duration:(CGFloat)duration repeatCount:(int)repeatCount {
    CABasicAnimation *animatation2 = [CABasicAnimation
                                      animationWithKeyPath: @"transform" ];
    animatation2.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    animatation2.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(toAngle, 0, 0, 1)];
    animatation2.duration = duration;
    animatation2.cumulative = YES;
    
    animatation2.repeatCount = repeatCount;
    return animatation2;
}

- (void)KN_removeAllAnimations {
    [self.layer removeAllAnimations];
}

- (void)KN_pauseAnimation {
    CALayer *layer = self.layer;
    layer.transform = layer.presentationLayer.transform;
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
}

- (void)KN_resumeAnimation {
    CALayer *layer = self.layer;
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;
}
@end
