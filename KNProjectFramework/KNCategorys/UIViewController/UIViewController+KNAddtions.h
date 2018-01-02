//
//  UIViewController+Addtions.h
//  HuiXianxia
//
//  Created by hzdlapple2 on 15/11/12.
//  Copyright © 2015年 何霄云. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYAlertView.h"

@interface UIViewController (KNAddtions)

+ (UIViewController *)KN_getCurrentViewController;

- (void)KN_removeFromStack;

- (void)KN_removeSelfFromStackAndPushViewController:(UIViewController *)vc;

- (void)KN_removeViewControllerFromStack:(UIViewController *)removeVC;

- (void)KN_removeViewControllerFromStack:(UIViewController *)removeVC andPushViewController:(UIViewController *)toVc;

- (void)KN_removeSelfFromStackAndPushViewControllers:(NSArray *)vcs;

- (UIViewController *)KN_getPresentedViewController;

- (void)KN_showPromptWithTitle:(NSString *)title
                    message:(NSString *)message
                     cancel:(NSString *)cancel
                      other:(NSString *)other
            completionBlock:(void(^)(BOOL result))block;

- (void)KN_showNormalWithTitle:(NSString *)title
                    message:(NSString *)message
             comletionBlock:(void(^)(BOOL save))block;

@end
