//
//  UIButton+CountDown.m
//  Backhome
//
//  Created by kwep_vbn on 2017/5/4.
//  Copyright © 2017年 SmartHome. All rights reserved.
//

#import "UIButton+KNCountDown.h"

@implementation UIButton (KNCountDown)

- (void)KN_startCountDown:(NSInteger)time
      durationCallback:(void (^)(NSInteger))durationCallback
          doneCallback:(void (^)(void))doneCallback {
    //倒计时时间
    __block NSInteger timeOut = time;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //每秒执行一次
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        //倒计时结束，关闭
        if (timeOut <= 0) {
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                doneCallback?doneCallback():nil;
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                timeOut--;
                durationCallback?durationCallback(timeOut):nil;
            });
            
        }
    });
    dispatch_resume(_timer);
}

@end
