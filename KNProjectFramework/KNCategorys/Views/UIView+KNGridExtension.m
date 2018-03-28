//
//  UIView+ICGridExtension.m
//  Clip-Pro
//
//  Created by vbn on 2016/12/29.
//  Copyright © 2016年 cqhxz. All rights reserved.
//

#import "UIView+KNGridExtension.h"
#import "UIView+KNAddtion.h"
#import "KNMacroDefines.h"
#import "UIColor+KNAddtions.h"

@implementation UIView (KNGridExtension)

+ (UIView *)KN_createGridViewsWithLineNumber:(NSInteger)lineNumber itemSize:(CGSize)itemSize numberOfItems:(NSInteger)numberOfItems {
    return [self KN_createGridViewsWithLineNumber:lineNumber itemSize:itemSize numberOfItems:numberOfItems lineColor:[[UIColor KN_colorWithHex:0x888888] colorWithAlphaComponent:0.5]];
}

+ (UIView *)KN_createGridViewsWithLineNumber:(NSInteger)lineNumber itemSize:(CGSize)itemSize numberOfItems:(NSInteger)numberOfItems lineColor:(UIColor *)lineColor {
    CGFloat rowCount = ceilf((float)numberOfItems/lineNumber);
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, lineNumber *itemSize.width, rowCount *itemSize.height)];
    for (int i = 0; i< numberOfItems; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i%lineNumber * itemSize.width, i/lineNumber *itemSize.height, itemSize.width, itemSize.height)];
        button.borderColor =  lineColor;
        button.borderWidth = @(KNSINGLE_LINE_WIDTH);
        if (i % lineNumber == (lineNumber - 1)) {
            button.border = UIViewBorderTop;
        } else {
            button.border = UIViewBorderTop|UIViewBorderRight;
        }
        
        if (i+lineNumber>=numberOfItems) {
            button.border = UIViewBorderBottom;
        }
        
        [container addSubview:button];
    }
    return container;
}

+ (CALayer *)createLineView {
    CALayer *line = [[CALayer alloc] init];
    line.backgroundColor = [UIColor KN_colorWithHex:0x888888].CGColor;
    return line;
}

@end
