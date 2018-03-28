//
//  UIView+Addtions.h
//  KNProjectFramework
//
//  Created by vbn on 2018/1/2.
//  Copyright © 2018年 vbn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSInteger, UIViewBorder)
{
    UIViewBorderLeft = 1 << 0,
    UIViewBorderRight = 1 << 1,
    UIViewBorderTop = 1 << 2,
    UIViewBorderBottom = 1 << 3,
    UIViewBorderNone = 1 << 4
};

@interface UIView (KNAddtions)

@property(nonatomic) UIViewBorder border;

@property (nonatomic) UIColor *borderColor;

@property (nonatomic) NSNumber *borderWidth;

- (void)KN_setBorderRaidus;

- (void)KN_setBorderRaidus:(CGFloat)radius borderwidth:(CGFloat)borderwidth bordercolor:(UIColor *)bordercolor;

- (CALayer *)KN_drawALine:(CGRect)frame color:(CGColorRef)color;

- (UIView *)KN_drawTopLine:(CGFloat)left right:(CGFloat)right;

- (UIView *)KN_drawBottomLine:(CGFloat)left right:(CGFloat)right;

- (UIView *)KN_drawTopLine:(CGFloat)left width:(CGFloat)width;

- (UIView *)KN_drawTopLine:(CGFloat)left width:(CGFloat)width lineHeight:(CGFloat)lineHeight;

- (UIView *)KN_drawBottomLine:(CGFloat)left width:(CGFloat)width lineHeight:(CGFloat)lineHeight;

- (UIView *)KN_drawBottomLine:(CGFloat)left width:(CGFloat)width;

/*
 如果有一组连续cell，
 总数为N个 (N >= 1)
 如果你采用以下方法来处理分割线：
 
 第 n = (0)    cell 顶部分割线显示（left = 0 ； right = 0），底部显示（left = X ；right = 0）
 第 n = (N-2)  cell 顶部分割线隐藏，底部显示（left = X ；right = 0）
 第 n = (N-1)  cell 顶部分割线隐藏，底部显示（left = 0 ；right = 0）
 
 那么你可以用一个较为便捷的方式
 
 index            ：对应上述规律表达式中的  n (0 <= n <= N -1)
 totalRows        ：对应上述规律表达式中的  N (N >= 1)
 bottomLeftMargin ：对应上述规律表达式中的  X (X >= 0)
 */

- (void)KN_drawSeparateLinesWithSelfIndex:(NSInteger)index
                                totalRows:(NSInteger)totalRows
                         bottomLeftMargin:(CGFloat)bottomLeftMargin;

/*
 出于一些需求，你需要控制分割线的长度，这个时候可以使用下面这个API，实现方式和上面类似
 */
- (void)KN_drawSeparateLinesWithSelfIndex:(NSInteger)index
                                totalRows:(NSInteger)totalRows
                         bottomLeftMargin:(CGFloat)bottomLeftMargin
                                    width:(CGFloat)fullWidth;

- (void)KN_topLineHidden:(BOOL)hidden;

- (void)KN_bottomLineHidden:(BOOL)hidden;

- (void)KN_setBorderRaidus:(CGFloat)radius borderwidth:(CGFloat)borderwidth bordercolor:(UIColor *)bordercolor shadowColor:(UIColor *)shadowColor shadowOpacity:(CGFloat)opacity offSet:(CGSize)offset shaowRadius:(CGFloat)shadowRadius;

- (UIVisualEffectView *)KN_blurWithType:(UIBlurEffectStyle)type;

@end
