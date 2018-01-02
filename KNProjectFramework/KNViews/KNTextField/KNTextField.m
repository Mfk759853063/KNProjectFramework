//
//  ICTextField.m
//  CommonFrame_Pro
//
//  Created by vbn on 16/3/9.
//  Copyright © 2016年 ionitech. All rights reserved.
//

#import "KNTextField.h"

@implementation KNTextField

- (void)awakeFromNib {
    [super awakeFromNib];
    self.textRectMinx = 5;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.textRectMinx = 5;
    }
    return self;
}


- (CGRect)leftViewRectForBounds:(CGRect)bounds {
    CGRect textRect = [super leftViewRectForBounds:bounds];
    textRect.origin.x += self.textRectMinx;
    return textRect;
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds
{
    if (self.leftView) {
        return CGRectMake(bounds.origin.x + (self.textRectMinx+4) + CGRectGetWidth(self.leftView.bounds), 0, CGRectGetWidth(bounds) - (self.textRectMinx+4) - CGRectGetWidth(self.leftView.bounds), CGRectGetHeight(bounds));
    }
    return CGRectMake(bounds.origin.x + self.textRectMinx, 0, CGRectGetWidth(bounds)-self.textRectMinx, CGRectGetHeight(bounds));
}
// text position
- (CGRect)textRectForBounds:(CGRect)bounds {
    if (self.leftView) {
        return CGRectMake(bounds.origin.x + (self.textRectMinx+4) + CGRectGetWidth(self.leftView.bounds), 0, CGRectGetWidth(bounds) - (self.textRectMinx+4) - CGRectGetWidth(self.leftView.bounds), CGRectGetHeight(bounds));
    }
    return CGRectMake(bounds.origin.x + self.textRectMinx, 0, CGRectGetWidth(bounds)-self.textRectMinx, CGRectGetHeight(bounds));
}

// text position while editing
- (CGRect)editingRectForBounds:(CGRect)bounds {
    if (self.leftView) {
        return CGRectMake(bounds.origin.x + (self.textRectMinx+4) + CGRectGetWidth(self.leftView.bounds), 0, CGRectGetWidth(bounds) - (self.textRectMinx+4) - CGRectGetWidth(self.leftView.bounds), CGRectGetHeight(bounds));
    }
    return CGRectMake(bounds.origin.x + self.textRectMinx, 0, CGRectGetWidth(bounds)-self.textRectMinx, CGRectGetHeight(bounds));
}

- (void)setEditTextFieldPlaceholder:(NSString *)placeholder color:(UIColor *)color {
    if ([self respondsToSelector:@selector(setAttributedPlaceholder:)]) {
        self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:@{NSForegroundColorAttributeName: color}];
    }
}

@end
