//
//  UIImage+KNAddtions.h
//  KNProjectFramework
//
//  Created by vbn on 2018/1/2.
//  Copyright © 2018年 vbn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (KNAddtions)

+ (UIImage *)KN_imageWithColor:(UIColor *)color;

+ (UIImage *)KN_imageWithColor:(UIColor *)color rect:(CGRect)rect;

+ (UIImage *)KN_firtFrameImageFromVideoUrl:(NSURL *)videoUrl;

+ (UIImage *)KN_scaleToSize:(UIImage *)img size:(CGSize)size;

+ (UIImage *)KN_compressImage:(UIImage *)image toMaxFileSize:(NSInteger)maxFileSize;

- (UIImage *)KN_applyLightEffect;

- (UIImage *)KN_applyExtraLightEffect;

- (UIImage *)KN_applyDarkEffect;

- (UIImage *)KN_applyTintEffectWithColor:(UIColor *)tintColor;

- (UIImage *)KN_applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;

- (UIImage*)KN_imageByScalingAndCroppingForSize:(CGSize)targetSize;

- (UIImage *)KN_imageByScalingProportionallyToSize:(CGSize)targetSize;

@end
