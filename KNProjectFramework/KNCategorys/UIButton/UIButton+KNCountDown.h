//
//  UIButton+CountDown.h
//  Backhome
//
//  Created by kwep_vbn on 2017/5/4.
//  Copyright © 2017年 SmartHome. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (KNCountDown)

- (void)KN_startCountDown:(NSInteger)time
      durationCallback:(void(^)(NSInteger offsetTime))durationCallback
          doneCallback:(void(^)(void))doneCallback;

@end
