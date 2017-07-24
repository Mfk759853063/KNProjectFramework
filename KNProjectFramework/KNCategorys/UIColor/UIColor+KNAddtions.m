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

@end
