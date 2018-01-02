//
//  UIApplication+Addtions.m
//  HZDLHuiXianXia
//
//  Created by hzdlapple2 on 15/11/7.
//  Copyright © 2015年 hzdlapple2. All rights reserved.
//

#import "UIApplication+KNAddtions.h"
#import "sys/utsname.h"
#include <sys/types.h>
#include <sys/sysctl.h>

@implementation UIApplication (KNAddtions)

+ (NSString *)KN_appVersion
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"];
}

+ (NSString *)KN_build
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey: (NSString *)kCFBundleVersionKey];
}

+ (NSString *)KN_versionBuild
{
    NSString * version = [self KN_appVersion];
    NSString * build = [self KN_build];
    
    NSString * versionBuild = [NSString stringWithFormat: @"v%@", version];
    
    if (![version isEqualToString: build]) {
        versionBuild = [NSString stringWithFormat: @"%@(%@)", versionBuild, build];
    }
    
    return versionBuild;
}

+ (float)KN_getIOSVersion
{
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

+ (NSString *)KN_platform{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    free(machine);
    return platform;
}

@end
