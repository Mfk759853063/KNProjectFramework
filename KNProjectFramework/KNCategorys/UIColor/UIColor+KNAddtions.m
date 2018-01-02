//
//  UIColor+KNAddtions.m
//  KNProjectFramework
//
//  Created by kwep_vbn on 2017/7/24.
//  Copyright © 2017年 vbn. All rights reserved.
//

#import "UIColor+KNAddtions.h"

@implementation UIColor (KNAddtions)

+(UIColor*)KN_colorWithHex:(long)hexColor alpha:(float)opacity
{
    float red = ((float)((hexColor & 0xFF0000) >> 16))/255.0;
    float green = ((float)((hexColor & 0xFF00) >> 8))/255.0;
    float blue = ((float)(hexColor & 0xFF))/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:opacity];
}

+(UIColor*)KN_colorWithHex:(long)hexColor
{
    return [UIColor KN_colorWithHex:hexColor alpha:1];
}

+ (UIColor *)KN_colorWithHexRGB:(NSInteger)RGB {
    CGFloat r = ((RGB >> 16) & 0x00ff) / 255.0f;
    CGFloat g = ((RGB >> 8) & 0x0000ff) / 255.0f;
    CGFloat b = (RGB & 0xff) / 255.0f;
    return [UIColor colorWithRed: r green: g blue: b alpha: 1.0];
}

+ (UIColor *)KN_colorWithHexRGBA:(NSInteger)RGBA {
    CGFloat r = ((RGBA >> 24) & 0xff) / 255.0f;
    CGFloat g = ((RGBA >> 16) & 0x00ff) / 255.0f;
    CGFloat b = ((RGBA >> 8) & 0x0000ff) / 255.0f;
    CGFloat a = (RGBA & 0xff) / 255.0f;
    return [UIColor colorWithRed: r green: g blue: b alpha: a];
}

+ (UIColor *)KN_r_int:(NSInteger)r g_int:(NSInteger)g b_int:(NSInteger)b a_f:(CGFloat)a
{
    CGFloat r_f = (CGFloat)r / 255.0f;
    CGFloat g_f = (CGFloat)g / 255.0f;
    CGFloat b_f = (CGFloat)b / 255.0f;
    return [UIColor colorWithRed:r_f green:g_f blue:b_f alpha:a];
}

- (UIImage *)KN_image
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f); //宽高 1.0只要有值就够了
    UIGraphicsBeginImageContext(rect.size); //在这个范围内开启一段上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [self CGColor]);//在这段上下文中获取到颜色UIColor
    CGContextFillRect(context, rect);//用这个颜色填充这个上下文
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();//从这段上下文中获取Image属性,,,结束
    UIGraphicsEndImageContext();
    
    return image;
}

@end
