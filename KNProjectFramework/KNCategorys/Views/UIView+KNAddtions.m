//
//  UIView+Addtions.m
//  KNProjectFramework
//
//  Created by vbn on 2018/1/2.
//  Copyright © 2018年 vbn. All rights reserved.
//

#import "UIView+KNAddtions.h"
#import <objc/runtime.h>
#import "Masonry.h"
#import "UIColor+KNAddtions.h"

#define kTopLayer @"topLayer"
#define kBottomLayer @"bottomLayer"
#define kLeftLayer @"leftLayer"
#define kRightLayer @"rightLayer"

#define System_Cell_Divider_Height  (1.0f / [UIScreen mainScreen].scale)

@implementation UIView (KNAddtions)

@dynamic border;

static char ColorKey;
static char WidthKey;

-(void)setBorderColor:(UIColor *)borderColor
{
    objc_setAssociatedObject(self, &ColorKey, borderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(UIColor *)borderColor
{
    return objc_getAssociatedObject(self, &ColorKey);
}

-(void)setBorderWidth:(NSNumber *)borderWidth
{
    objc_setAssociatedObject(self, &WidthKey, borderWidth, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSNumber *)borderWidth
{
    return objc_getAssociatedObject(self, &WidthKey);
}

-(void)setBorder:(UIViewBorder)border
{
    
    if (border & UIViewBorderRight)
    {
        [self addRightBorderWithColor:self.borderColor andWidth:[self.borderWidth doubleValue]];
    }
    if (border & UIViewBorderBottom)
    {
        [self addBottomBorderWithColor:self.borderColor andWidth:[self.borderWidth doubleValue]];
    }
    if (border & UIViewBorderTop)
    {
        [self addTopBorderWithColor:self.borderColor andWidth:[self.borderWidth doubleValue]];
    }
    if (border & UIViewBorderLeft)
    {
        [self addLeftBorderWithColor:self.borderColor andWidth:[self.borderWidth doubleValue]];
    }
    if (border & UIViewBorderNone) {
        [self removeAllSubLayers];
    }
}

- (void)removeAllSubLayers {
    NSMutableArray *removeLayers = @[].mutableCopy;
    [self.layer.sublayers enumerateObjectsUsingBlock:^(CALayer *layer, NSUInteger idx, BOOL *stop) {
        if ([[layer name] isEqualToString:kTopLayer] ||
            [[layer name] isEqualToString:kBottomLayer] ||
            [[layer name] isEqualToString:kLeftLayer] ||
            [[layer name] isEqualToString:kRightLayer] )
        {
            [removeLayers addObject:layer];
        }
    }];
    
    [removeLayers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperlayer];
    }];
}

- (void)addTopBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    __block BOOL find = NO;
    [self.layer.sublayers enumerateObjectsUsingBlock:^(CALayer *layer, NSUInteger idx, BOOL *stop) {
        if ([[layer name] isEqualToString:kTopLayer]) {
            layer.backgroundColor = color.CGColor;
            layer.frame = CGRectMake(0, 0, self.frame.size.width, borderWidth);
            *stop = YES;
            find = YES;
            return ;
        }
        
    }];
    
    if (find) {
        return;
    }
    
    CALayer *border = [CALayer layer];
    border.name = kTopLayer;
    border.backgroundColor = color.CGColor;
    
    border.frame = CGRectMake(0, 0, self.frame.size.width, borderWidth);
    [self.layer addSublayer:border];
}

- (void)addBottomBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    __block BOOL find = NO;
    [self.layer.sublayers enumerateObjectsUsingBlock:^(CALayer *layer, NSUInteger idx, BOOL *stop) {
        if ([[layer name] isEqualToString:kBottomLayer]) {
            layer.backgroundColor = color.CGColor;
            layer.frame = CGRectMake(0, self.frame.size.height - borderWidth, self.frame.size.width, borderWidth);
            *stop = YES;
            find = YES;
            return ;
        }
        
    }];
    
    if (find) {
        return;
    }
    CALayer *border = [CALayer layer];
    border.name = kBottomLayer;
    border.backgroundColor = color.CGColor;
    
    border.frame = CGRectMake(0, self.frame.size.height - borderWidth, self.frame.size.width, borderWidth);
    [self.layer addSublayer:border];
}

- (void)addLeftBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    __block BOOL find = NO;
    [self.layer.sublayers enumerateObjectsUsingBlock:^(CALayer *layer, NSUInteger idx, BOOL *stop) {
        if ([[layer name] isEqualToString:kLeftLayer]) {
            layer.backgroundColor = color.CGColor;
            layer.frame = CGRectMake(0, 0, borderWidth, self.frame.size.height);
            *stop = YES;
            find = YES;
            return ;
        }
        
    }];
    
    if (find) {
        return;
    }
    
    CALayer *border = [CALayer layer];
    border.name = kLeftLayer;
    border.backgroundColor = color.CGColor;
    
    border.frame = CGRectMake(0, 0, borderWidth, self.frame.size.height);
    [self.layer addSublayer:border];
}

- (void)addRightBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    __block BOOL find = NO;
    [self.layer.sublayers enumerateObjectsUsingBlock:^(CALayer *layer, NSUInteger idx, BOOL *stop) {
        if ([[layer name] isEqualToString:kRightLayer]) {
            layer.backgroundColor = color.CGColor;
            layer.frame = CGRectMake(self.frame.size.width - borderWidth, 0, borderWidth, self.frame.size.height);
            *stop = YES;
            find = YES;
            return ;
        }
        
    }];
    
    if (find) {
        return;
    }
    
    CALayer *border = [CALayer layer];
    border.name = kRightLayer;
    border.backgroundColor = color.CGColor;
    
    border.frame = CGRectMake(self.frame.size.width - borderWidth, 0, borderWidth, self.frame.size.height);
    [self.layer addSublayer:border];
}

- (void)KN_setBorderRaidus {
    [self KN_setBorderRaidus: self.frame.size.width / 2.0f borderwidth: 0.0f bordercolor: nil];
}

- (void)KN_setBorderRaidus:(CGFloat)radius borderwidth:(CGFloat)borderwidth bordercolor:(UIColor *)bordercolor {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
    self.layer.borderColor = [bordercolor CGColor];
    self.layer.borderWidth = borderwidth;
}

- (void)KN_setBorderRaidus:(CGFloat)radius borderwidth:(CGFloat)borderwidth bordercolor:(UIColor *)bordercolor shadowColor:(UIColor *)shadowColor shadowOpacity:(CGFloat)opacity offSet:(CGSize)offset shaowRadius:(CGFloat)shadowRadius {
    [self KN_setBorderRaidus:radius borderwidth:borderwidth bordercolor:bordercolor];
    self.layer.masksToBounds = NO;
    self.layer.shadowColor=shadowColor.CGColor;
    self.layer.shadowOffset=offset;
    self.layer.shadowOpacity=opacity;
    self.layer.shadowRadius=shadowRadius;
}

- (CALayer *)KN_drawALine:(CGRect)frame color:(CGColorRef)color {
    CALayer *line = [CALayer new];
    line.backgroundColor = color;
    line.frame = frame;
    [self.layer addSublayer: line];
    return line;
}

- (UIView *)KN_drawTopLine:(CGFloat)left right:(CGFloat)right{
    
    [self KN_buildTopLine];
    
    UIView *topLine = [self sc_TopLine];
    [topLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(left);
        make.right.mas_equalTo(right * -1);
        make.height.mas_equalTo(System_Cell_Divider_Height);
        make.top.mas_equalTo(0);
    }];
    return topLine;
}

- (UIView *)KN_drawBottomLine:(CGFloat)left right:(CGFloat)right
{
    [self KN_buildBottomLine];
    
    UIView *bottomLine = [self sc_bottomLine];
    [bottomLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(left);
        make.right.mas_equalTo(right * -1);
        make.height.mas_equalTo(System_Cell_Divider_Height);
        make.bottom.mas_equalTo(0);
    }];
    return bottomLine;
}

- (UIView *)KN_drawTopLine:(CGFloat)left width:(CGFloat)width
{
    [self KN_buildTopLine];
    
    UIView *topLine = [self sc_TopLine];
    [topLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(left);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(System_Cell_Divider_Height);
        make.top.mas_equalTo(0);
    }];
    return topLine;
}

- (UIView *)KN_drawTopLine:(CGFloat)left width:(CGFloat)width lineHeight:(CGFloat)lineHeight {
    [self KN_buildTopLine];
    
    UIView *topLine = [self sc_TopLine];
    [topLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(left);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(lineHeight);
        make.top.mas_equalTo(0);
    }];
    return topLine;
}

- (UIView *)KN_drawBottomLine:(CGFloat)left width:(CGFloat)width
{
    [self KN_buildBottomLine];
    
    UIView *bottomLine = [self sc_bottomLine];
    [bottomLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(left);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(System_Cell_Divider_Height);
        make.bottom.mas_equalTo(0);
    }];
    return bottomLine;
}

- (UIView *)KN_drawBottomLine:(CGFloat)left width:(CGFloat)width lineHeight:(CGFloat)lineHeight {
    [self KN_buildBottomLine];
    
    UIView *bottomLine = [self sc_bottomLine];
    [bottomLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(left);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(lineHeight);
        make.bottom.mas_equalTo(0);
    }];
    return bottomLine;
}

- (void)KN_drawSeparateLinesWithSelfIndex:(NSInteger)index
                             totalRows:(NSInteger)totalRows
                      bottomLeftMargin:(CGFloat)bottomLeftMargin {
    if (index < 0 || totalRows < 1 || index > (totalRows - 1)) return;
    if (bottomLeftMargin < 0.0f) bottomLeftMargin = 0.0f;
    
    BOOL first = (index == 0);
    BOOL last = (index == totalRows - 1);
    [self KN_drawTopLine:0 right:0];
    [self KN_topLineHidden:!first];
    CGFloat left = last ? 0 : bottomLeftMargin;
    [self KN_drawBottomLine:left right:0];
    [self KN_bottomLineHidden:NO];
}

- (void)KN_drawSeparateLinesWithSelfIndex:(NSInteger)index
                             totalRows:(NSInteger)totalRows
                      bottomLeftMargin:(CGFloat)bottomLeftMargin
                                 width:(CGFloat)fullWidth {
    if (index < 0 || totalRows < 1 || index > (totalRows - 1)) return;
    if (bottomLeftMargin < 0.0f) bottomLeftMargin = 0.0f;
    if (fullWidth <= 0) fullWidth = 0.0f;
    
    BOOL first = (index == 0);
    BOOL last = (index == totalRows - 1);
    [self KN_drawTopLine:0 width:fullWidth];
    [self KN_topLineHidden:!first];
    CGFloat left = last ? 0 : bottomLeftMargin;
    [self KN_drawBottomLine:left width:fullWidth - left];
    [self KN_bottomLineHidden:NO];
}

- (void)KN_topLineHidden:(BOOL)hidden {
    if (![[self sc_TopLine] isKindOfClass:[UIView class]]) return;
    
    UIView *topLine = [self sc_TopLine];
    topLine.hidden = hidden;
    if (!hidden){
        [self bringSubviewToFront:topLine];
    }
}

- (void)KN_bottomLineHidden:(BOOL)hidden {
    if (![[self sc_bottomLine] isKindOfClass:[UIView class]]) return;
    UIView *bottomLine = [self sc_bottomLine];
    bottomLine.hidden = hidden;
    if (!hidden){
        [self bringSubviewToFront:bottomLine];
    }
}

- (void)KN_buildTopLine{
    
    if ([[self sc_TopLine] isKindOfClass:[UIView class]]) return;
    
    UIView *topLine = [[UIView alloc] init];
    topLine.backgroundColor = [UIColor KN_r_int:234 g_int:234 b_int:234 a_f:1];
    [self addSubview:topLine];
    [self setSc_TopLine:topLine];
}


- (void)KN_buildBottomLine{
    
    if ([[self sc_bottomLine] isKindOfClass:[UIView class]]) return;
    
    UIView *bottomLine = [[UIView alloc] init];
    bottomLine.backgroundColor = [UIColor KN_r_int:234 g_int:234 b_int:234 a_f:1];
    [self addSubview:bottomLine];
    [self setSc_bottomLine:bottomLine];
}


static char *const sc_topLineKey = "sc_topLineKey";

- (void)setSc_TopLine:(UIView *)sc_TopLine{
    [self willChangeValueForKey:@"sc_TopLine"];
    objc_setAssociatedObject(self,
                             &sc_topLineKey,
                             sc_TopLine,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"sc_TopLine"];
}

- (UIView *)sc_TopLine{
    return objc_getAssociatedObject(self, &sc_topLineKey);
}

/* bottomLine's setter and getter   */

static char *const sc_bottomLineKey = "sc_bottomLineKey";

- (void)setSc_bottomLine:(UIView *)sc_bottomLine{
    [self willChangeValueForKey:@"sc_bottomLine"];
    objc_setAssociatedObject(self,
                             &sc_bottomLineKey,
                             sc_bottomLine,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"sc_bottomLine"];
}

- (UIView *)sc_bottomLine{
    return objc_getAssociatedObject(self,
                                    &sc_bottomLineKey);
}

- (UIVisualEffectView *)KN_blurWithType:(UIBlurEffectStyle)type {
    UIBlurEffect * blur = [UIBlurEffect effectWithStyle:type];
    UIVisualEffectView * effe = [[UIVisualEffectView alloc] initWithEffect:blur];
    return effe;
}
@end
