//
//  KNBaseViewController.m
//  KNProjectTemplete
//
//  Created by kwep_vbn on 15/12/3.
//  Copyright © 2015年 vbn. All rights reserved.
//

#import "KNBaseViewController.h"
#import "KNNavigationController.h"
#import "KNMacroDefines.h"
#import "KNConstants.h"
#import "KNHelperFunctions.h"

@implementation KNBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.bounds = CGRectMake(0, 0, KNSCREENWIDTH, KNSCREENHEIGHT);
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    if ([self needBackItem]) {
        self.leftButton = [self.kn_navigationBar addLeftButtonWithTarget:self action:@selector(popBack)];
        NSBundle *bundle = KN_frameworkBundle();
        [self.leftButton setImage:[UIImage imageNamed:@"nav_back" inBundle:bundle compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
    }
    
    [self.kn_navigationBar setBackGoundViewBlur:NO];
    
    if ([self needShowNavLine]) {
        [self.kn_navigationBar.shadowView setHidden:NO];
    }else
    {
        [self.kn_navigationBar.shadowView setHidden:YES];
    }
    
    if ([self hideNavBar]) {
        [self.kn_navigationBar setHidden:YES];
    }
    
    
    
    self.title = [self title];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}


#pragma mark - 屏幕旋转 默认竖屏
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)needBackItem {
    return YES;
}

- (void)popBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)hideNavBar {
    return NO;
}

-(BOOL)needShowNavLine
{
    return YES;
}

- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    self.kn_navigationBar.title = title;
}

- (void)dealloc {
    NSLog(@"%@--dealloc",[self class]);
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
