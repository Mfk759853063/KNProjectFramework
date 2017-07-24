//
//  KNBaseViewController.h
//  KNProjectTemplete
//
//  Created by kwep_vbn on 15/12/3.
//  Copyright © 2015年 vbn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+KNNavigation.h"

@interface KNBaseViewController : UIViewController

/**
 返回按钮
 */
@property(nonatomic,strong) UIButton *leftButton;

/**
 右侧按钮,默认没有
 */
@property(nonatomic,strong) UIButton *rightButton;


- (BOOL)needBackItem;

-(BOOL)needShowNavLine;

- (BOOL)hideNavBar;

- (void)popBack;

@end
