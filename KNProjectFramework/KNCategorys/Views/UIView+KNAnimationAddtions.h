//
//  UIView+AnimationAddtions.h
//  Backhome
//
//  Created by kwep_vbn on 2017/6/24.
//  Copyright © 2017年 SmartHome. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (KNAnimationAddtions)


/**
 Z轴旋转开始动画
 */
- (CABasicAnimation * )KN_startTransformZAnimationWithAngle:(double)toAngle duration:(CGFloat)duration repeatCount:(int)repeatCount delegate:(id)delegate;
/**
 Z轴旋转
 */
- (CABasicAnimation *)KN_transformZAnimationWithAngle:(double)toAngle duration:(CGFloat)duration repeatCount:(int)repeatCount;

- (void)KN_removeAllAnimations;

- (void)KN_pauseAnimation;

- (void)KN_resumeAnimation;

@end
