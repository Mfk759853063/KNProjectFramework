//
//  UIApplication+Addtions.h
//  HZDLHuiXianXia
//
//  Created by hzdlapple2 on 15/11/7.
//  Copyright © 2015年 hzdlapple2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (KNAddtions)

+ (NSString *)KN_appVersion;

+ (NSString *)KN_build;

+ (NSString *)KN_versionBuild;

+ (float)KN_getIOSVersion;

+ (NSString *)KN_platform;

@end
