//
//  KNNavigationController.m
//  KNNavigationController
//
//  Created by kwep_vbn on 15/11/23.
//  Copyright © 2015年 vbn. All rights reserved.
//

#import "KNNavigationController.h"
#import "UIViewController+KNNavigation.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
#import "KNBaseViewController.h"
#import "Masonry.h"

@interface KNNavigationController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, getter = isDuringPushAnimation) BOOL duringPushAnimation;

@property (weak, nonatomic) id<UINavigationControllerDelegate> realDelegate;

@end

@implementation KNNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController{
    
    self = [super initWithRootViewController:rootViewController];
    
    if (self) {
        
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.hidden = YES;
    NSDictionary *attributes=[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,nil];
    [self.navigationController.navigationBar setTitleTextAttributes:attributes];

    
    [self.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = [[UIImage alloc] init];
    if (!self.delegate) {
        self.delegate = self;
    }
    
    self.interactivePopGestureRecognizer.delegate = self;
    self.fd_viewControllerBasedNavigationBarAppearanceEnabled = NO;
}


- (BOOL)needPopGesture {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    self.delegate = nil;
    self.interactivePopGestureRecognizer.delegate = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - UINavigationController

- (void)setDelegate:(id<UINavigationControllerDelegate>)delegate
{
    [super setDelegate:delegate ? self : nil];
    self.realDelegate = delegate != self ? delegate : nil;
}

- (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated
{
    self.duringPushAnimation = YES;
    if ([viewController isKindOfClass:[KNBaseViewController class]]) {
        [self congigureNavigationBarForViewController:viewController];
    }
    [super pushViewController:viewController animated:animated];
}

#pragma mark UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
}


- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated
{
    NSCAssert(self.interactivePopGestureRecognizer.delegate == self, @"AHKNavigationController won't work correctly if you change interactivePopGestureRecognizer's delegate.");
    
    self.duringPushAnimation = NO;
    
    if ([self.realDelegate respondsToSelector:_cmd]) {
        [self.realDelegate navigationController:navigationController didShowViewController:viewController animated:animated];
    }
    
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {

        return [self.viewControllers count] > 1 && !self.isDuringPushAnimation;
    } else {

        return YES;
    }
}

#pragma mark - 支持旋转屏幕
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.topViewController supportedInterfaceOrientations];
}


#pragma mark - Delegate Forwarder

// Thanks for the idea goes to: https://github.com/steipete/PSPDFTextView/blob/ee9ce04ad04217efe0bc84d67f3895a34252d37c/PSPDFTextView/PSPDFTextView.m#L148-164

- (BOOL)respondsToSelector:(SEL)s
{
    return [super respondsToSelector:s] || [self.realDelegate respondsToSelector:s];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)s
{
    return [super methodSignatureForSelector:s] ?: [(id)self.realDelegate methodSignatureForSelector:s];
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    id delegate = self.realDelegate;
    if ([delegate respondsToSelector:invocation.selector]) {
        [invocation invokeWithTarget:delegate];
    }
}

- (void)congigureNavigationBarForViewController:(UIViewController *)viewcontroller {
    if (!viewcontroller.kn_navigationBar) {
        KNNavigationBar *navigationBar = [[KNNavigationBar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 64)];
        viewcontroller.kn_navigationBar = navigationBar;
        [viewcontroller.view addSubview:viewcontroller.kn_navigationBar];
        // // support auto rotate
        [navigationBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.left.and.right.equalTo(viewcontroller.view);
            make.height.equalTo(@(64));
            
        }];
    }
}
@end
