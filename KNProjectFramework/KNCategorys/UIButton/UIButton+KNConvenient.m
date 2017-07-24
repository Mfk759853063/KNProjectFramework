//
//  UIButton+Convenient.m
//  Backhome
//
//  Created by vbn on 2017/3/8.
//  Copyright © 2017年 LeiXiao CQ. All rights reserved.
//

#import "UIButton+KNConvenient.h"

@implementation UIButton (KNConvenient)

/**
 便捷初始化
 
 @param text 文字
 @param fontSize 大小 default 15
 
 */
+ (UIButton *)KN_buttonWithText:(NSString *)text
                        font:(CGFloat)fontSize {
    return [self KN_buttonWithText:text image:nil highLightImage:nil font:fontSize titleColor:[UIColor blackColor] highLightTitleColor:nil];
}


+ (UIButton *)KN_buttonWithText:(NSString *)text
                       image:(UIImage *)image
                        font:(CGFloat)fontSize {
    return [self KN_buttonWithText:text image:image highLightImage:nil font:fontSize titleColor:[UIColor blackColor] highLightTitleColor:nil];
}

+ (UIButton *)KN_buttonWithText:(NSString *)text
                        font:(CGFloat)fontSize
                  titleColor:(UIColor *)titleColor {
    return [self KN_buttonWithText:text image:nil highLightImage:nil font:fontSize titleColor:titleColor highLightTitleColor:nil];
}

+ (UIButton *)KN_buttonWithText:(NSString *)text
                       image:(UIImage *)image
                        font:(CGFloat)fontSize
                  titleColor:(UIColor *)titleColor {
    return [self KN_buttonWithText:text image:image highLightImage:nil font:fontSize titleColor:titleColor highLightTitleColor:nil];
}

+ (UIButton *)KN_buttonWithText:(NSString *)text
                       image:(UIImage *)image
              highLightImage:(UIImage *)highLightImage
                        font:(CGFloat)fontSize
                  titleColor:(UIColor *)titleColor
         highLightTitleColor:(UIColor *)highLightTitleColor {
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:text forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn setTitleColor:highLightTitleColor forState:UIControlStateHighlighted];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highLightImage forState:UIControlStateHighlighted];
    btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    return btn;
}

+ (UIButton *)KN_buttonWithText:(NSString *)text
                       image:(UIImage *)image
              selectImage:(UIImage *)selectImage
                        font:(CGFloat)fontSize
                  titleColor:(UIColor *)titleColor
         selectColor:(UIColor *)selectColor{
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:text forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn setTitleColor:selectColor forState:UIControlStateSelected];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:selectImage forState:UIControlStateSelected];
    btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    return btn;
}

@end
