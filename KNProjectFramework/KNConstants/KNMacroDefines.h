//
//  KNMacroDefines.h
//  KNProjectFramework
//
//  Created by kwep_vbn on 2017/7/24.
//  Copyright © 2017年 vbn. All rights reserved.
//

#ifndef KNMacroDefines_h
#define KNMacroDefines_h

#define KNSCREENWIDTH ([UIScreen mainScreen].bounds.size.width)
#define KNSCREENHEIGHT ([UIScreen mainScreen].bounds.size.height)
#define KNCOLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define KNSINGLE_LINE_WIDTH           (1.0f / [UIScreen mainScreen].scale)
#define KNFONT(_size_)                                     [UIFont systemFontOfSize:_size_]
#define KNBFONT(_size_)                                     [UIFont boldSystemFontOfSize:_size_]
#define KNdegreesToRadians(x) (M_PI*(x)/180.0) //把角度转换成PI的方式
#define KNradiansToDegrees(radians) ((radians) * (180.0 / M_PI))

// notificaitoon
#define KNPostNotification(name,obj) [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj]

#define KNAddNotification(id,s,n,o)              [[NSNotificationCenter defaultCenter] addObserver:id selector:s name:n object:o]
#define KNRemoveNotification(id,n,o)             [[NSNotificationCenter defaultCenter] removeObserver:id name:n object:o]
#define KNRemoveNotifications                     [[NSNotificationCenter defaultCenter] removeObserver:self]

#define KNAPP_VERSION                             [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]
#define KNcurrenVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#define KNSET_DEFAULT(_obj_,_key_) [[NSUserDefaults standardUserDefaults] setObject:_obj_ forKey:_key_]
#define KNSYNC_DEFAULT [[NSUserDefaults standardUserDefaults] synchronize]
#define KNGET_DEFOULT(_key_) [[NSUserDefaults standardUserDefaults] objectForKey:_key_]

#define KNsafeSetObject(obj,key,value) if (value) [obj setObject:value forKey:key]

#define KNGetVCWithSB(sbName,vcName) [[UIStoryboard storyboardWithName:sbName bundle:nil] instantiateViewControllerWithIdentifier:vcName]
#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

#endif /* KNMacroDefines_h */
