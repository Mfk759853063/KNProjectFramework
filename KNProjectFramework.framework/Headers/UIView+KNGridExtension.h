//
//  UIView+ICGridExtension.h
//  Clip-Pro
//
//  Created by vbn on 2016/12/29.
//  Copyright © 2016年 cqhxz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (KNGridExtension)

+ (UIView *)KN_createGridViewsWithLineNumber:(NSInteger)lineNumber itemSize:(CGSize)itemSize numberOfItems:(NSInteger)numberOfItems;


+ (UIView *)KN_createGridViewsWithLineNumber:(NSInteger)lineNumber itemSize:(CGSize)itemSize numberOfItems:(NSInteger)numberOfItems lineColor:(UIColor *)lineColor;

@end
