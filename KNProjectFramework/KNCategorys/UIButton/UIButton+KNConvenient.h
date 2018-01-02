//
//  UIButton+Convenient.h
//  Backhome
//
//  Created by vbn on 2017/3/8.
//  Copyright © 2017年 LeiXiao CQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (KNConvenient)


/**
 便捷初始化

 @param text 文字
 @param fontSize 大小 default 15
 
 */
+ (UIButton *)KN_buttonWithText:(NSString *)text
                        font:(CGFloat)fontSize;

/**
 便捷初始化
 
 @param text 文字
 @param image 图片 default nil
 @param fontSize 大小 default 15
 
 */

+ (UIButton *)KN_buttonWithText:(NSString *)text
                       image:(UIImage *)image
                        font:(CGFloat)fontSize;


/**
 便捷初始化

 @param text 文字
 @param fontSize 大小 default 15
 @param titleColor 文字颜色 default black
 */
+ (UIButton *)KN_buttonWithText:(NSString *)text
                        font:(CGFloat)fontSize
                  titleColor:(UIColor *)titleColor;

/**
 便捷初始化
 
 @param text 文字
 @param fontSize 大小 default 15
 @param titleColor 文字颜色 default black
 @param image 图片 default nil
 */
+ (UIButton *)KN_buttonWithText:(NSString *)text
                       image:(UIImage *)image
                        font:(CGFloat)fontSize
                  titleColor:(UIColor *)titleColor;


/**
 便捷初始化
 
 @param text 文字
 @param fontSize 大小 default 15
 @param titleColor 文字颜色 default black
 @param image 图片 default nil
 @param highLightImage 按下状态
 @param highLightTitleColor 按下状态
 
 */
+ (UIButton *)KN_buttonWithText:(NSString *)text
                       image:(UIImage *)image
              highLightImage:(UIImage *)highLightImage
                        font:(CGFloat)fontSize
                  titleColor:(UIColor *)titleColor
         highLightTitleColor:(UIColor *)highLightTitleColor;

+ (UIButton *)KN_buttonWithText:(NSString *)text
                       image:(UIImage *)image
                 selectImage:(UIImage *)selectImage
                        font:(CGFloat)fontSize
                  titleColor:(UIColor *)titleColor
                 selectColor:(UIColor *)selectColor;

@end
