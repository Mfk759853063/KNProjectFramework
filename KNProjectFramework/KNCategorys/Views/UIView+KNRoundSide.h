//
//  UIView+RoundSide.h
//  Backhome
//
//  Created by kwep_vbn on 2017/3/10.
//  Copyright © 2017年 SmartHome. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    RoundSideNone,
    RoundSideLeft,
    RoundSideRight,
    RoundSideUp,
    RoundSideAll
} RoundSide;

@interface UIView (KNRoundSide)

- (void)KN_roundSide:(RoundSide)side cornerRadii:(CGSize)cornerRadii;

- (void)KN_roundSide:(RoundSide)side;

@end
