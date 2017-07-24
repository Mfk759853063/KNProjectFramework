//
//  ICTextField.h
//  CommonFrame_Pro
//
//  Created by vbn on 16/3/9.
//  Copyright © 2016年 ionitech. All rights reserved.
//

#import "KNLimitTextField.h"

@interface KNTextField : KNLimitTextField

// default is 5
@property (assign, nonatomic) CGFloat textRectMinx;

- (void)setEditTextFieldPlaceholder:(NSString *)placeholder color:(UIColor *)color;

@end
