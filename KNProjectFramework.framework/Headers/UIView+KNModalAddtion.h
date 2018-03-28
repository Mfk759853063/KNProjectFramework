//
//  UIView+ModalAddtion.h
//  Backhome
//
//  Created by kwep_vbn on 2017/8/9.
//  Copyright © 2017年 SmartHome. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    KNModalMaskTypeBlurLight,
    KNModalMaskTypeBlurDefault,
    KNModalMaskTypeNormal,
} KNModalMaskType;

typedef enum : NSUInteger {
    KNModalDirectionTypeCenter,
    KNModalDirectionTypeBottom,
} KNModalDirectionType;


@interface UIView (KNModalAddtion)

@property (strong, nonatomic) UIView *knMaskView;

- (void)KN_showOnView:(UIView *)view
          maskType:(KNModalMaskType)modalMaskType
          duration:(NSTimeInterval)duration
          animated:(BOOL)animated;

- (void)KN_showOnView:(UIView *)view
          maskType:(KNModalMaskType)modalMaskType
     directionType:(KNModalDirectionType)directionType
          duration:(NSTimeInterval)duration
          animated:(BOOL)animated;

- (void)KN_hideWithAnimated:(BOOL)animated;

@end
