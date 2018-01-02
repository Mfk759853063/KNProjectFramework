//
//  UIViewController+Addtions.m
//  HuiXianxia
//
//  Created by hzdlapple2 on 15/11/12.
//  Copyright © 2015年 何霄云. All rights reserved.
//

#import "UIViewController+KNAddtions.h"


@implementation UIViewController (KNAddtions)

- (void)KN_removeSelfFromStackAndPushViewController:(UIViewController *)vc {
    if (!self.navigationController) {
        return;
    }
    NSMutableArray *tempArray = @[].mutableCopy;
    tempArray = self.navigationController.viewControllers.mutableCopy;
    [tempArray removeObject:self];
    [tempArray addObject:vc];
    [self.navigationController setViewControllers:tempArray animated:YES];
}

- (void)KN_removeSelfFromStackAndPushViewControllers:(NSArray *)vcs {
    if (!self.navigationController) {
        return;
    }
    NSMutableArray *tempArray = @[].mutableCopy;
    tempArray = self.navigationController.viewControllers.mutableCopy;
    [tempArray removeObject:self];
    [tempArray addObjectsFromArray:vcs];
    [self.navigationController setViewControllers:tempArray animated:YES];
}

- (void)KN_removeViewControllerFromStack:(UIViewController *)removeVC {
    if (!self.navigationController) {
        return;
    }
    NSMutableArray *tempArray = @[].mutableCopy;
    tempArray = self.navigationController.viewControllers.mutableCopy;
    [tempArray removeObject:removeVC];
    [self.navigationController setViewControllers:tempArray animated:YES];
}

- (void)KN_removeViewControllerFromStack:(UIViewController *)removeVC andPushViewController:(UIViewController *)toVc {
    if (!self.navigationController) {
        return;
    }
    NSMutableArray *tempArray = @[].mutableCopy;
    tempArray = self.navigationController.viewControllers.mutableCopy;
    [tempArray removeObject:removeVC];
    [tempArray addObject:toVc];
    [self.navigationController setViewControllers:tempArray animated:YES];
}

- (void)KN_removeFromStack {
    if (!self.navigationController) {
        return;
    }
    NSMutableArray *tempArray = @[].mutableCopy;
    tempArray = self.navigationController.viewControllers.mutableCopy;
    [tempArray removeObject:self];
    [self.navigationController setViewControllers:tempArray animated:YES];
}

+ (UIViewController *)KN_getCurrentViewController {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    UIViewController *rootViewController = keyWindow.rootViewController;
    return [UIViewController KN_getVisibleViewControllerFrom:rootViewController];
}

+ (UIViewController *)KN_getVisibleViewControllerFrom:(UIViewController *) vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [UIViewController KN_getVisibleViewControllerFrom:[((UINavigationController *) vc) visibleViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [UIViewController KN_getVisibleViewControllerFrom:[((UITabBarController *) vc) selectedViewController]];
    } else {
        if (vc.presentedViewController) {
            return [UIViewController KN_getVisibleViewControllerFrom:vc.presentedViewController];
        } else {
            return vc;
        }
    }
}

- (UIViewController *)KN_getPresentedViewController
{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    if (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    
    return topVC;
}

- (void)KN_showPromptWithTitle:(NSString *)title
                    message:(NSString *)message
                     cancel:(NSString *)cancel
                      other:(NSString *)other
            completionBlock:(void(^)(BOOL result))block
{
    CYAlertView *alert = [[CYAlertView alloc] initWithTitle:title message:message
                                               clickedBlock:^(CYAlertView *alertView, BOOL cancelled, NSInteger buttonIndex) {
                                                   if (block) {
                                                       block(!cancelled);
                                                   }
                                               }
                                          cancelButtonTitle:cancel
                                          otherButtonTitles:other,nil];
    [alert show];
}

- (void)KN_showNormalWithTitle:(NSString *)title
                    message:(NSString *)message
             comletionBlock:(void(^)(BOOL save))block
{
    CYAlertView *alert = [[CYAlertView alloc] initWithTitle:title message:message
                                               clickedBlock:^(CYAlertView *alertView, BOOL cancelled, NSInteger buttonIndex) {
                                                   if (block) {
                                                       block(!cancelled);
                                                   }
                                               }
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
}


@end
