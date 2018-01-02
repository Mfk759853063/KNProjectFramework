//
//  KNHelperFunctions.h
//  KNProjectFramework
//
//  Created by kwep_vbn on 2017/7/24.
//  Copyright © 2017年 vbn. All rights reserved.
//

#ifndef KNHelperFunctions_h
#define KNHelperFunctions_h

#import <Foundation/Foundation.h>

static inline NSBundle *KN_frameworkBundle() {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"KNProjectFramework.bundle" ofType:nil];
    NSBundle *bundle = [NSBundle bundleWithPath:path];
    return bundle;
}

#endif /* KNHelperFunctions_h */
