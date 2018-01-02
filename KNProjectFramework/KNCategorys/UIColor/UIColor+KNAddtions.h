//
//  UIColor+KNAddtions.h
//  KNProjectFramework
//
//  Created by kwep_vbn on 2017/7/24.
//  Copyright © 2017年 vbn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (KNAddtions)

+(UIColor*)KN_colorWithHex:(long)hexColor alpha:(float)opacity;

+(UIColor*)KN_colorWithHex:(long)hexColor;

+ (UIColor *)KN_colorWithHexRGB:(NSInteger)RGB;

+ (UIColor *)KN_colorWithHexRGBA:(NSInteger)RGBA;

+ (UIColor *)KN_r_int:(NSInteger)r g_int:(NSInteger)g b_int:(NSInteger)b a_f:(CGFloat)a;

- (UIImage *)KN_image;

@end
