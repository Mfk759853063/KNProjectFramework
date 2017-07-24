//
//  HZLimitTextField.m
//  HuiXianxia
//
//  Created by zhou Can on 15/9/25.
//  Copyright (c) 2015年 何霄云. All rights reserved.
//

#import "KNLimitTextField.h"

@implementation KNLimitTextField

- (void)awakeFromNib
{
    [self setup];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (CGRect)textRectForBounds:(CGRect)bounds{
    return CGRectMake(5, 0, CGRectGetWidth(bounds)-10, CGRectGetHeight(bounds));
}
- (CGRect)placeholderRectForBounds:(CGRect)bounds{
    return CGRectMake(5, 0, CGRectGetWidth(bounds)-10, CGRectGetHeight(bounds));
}
- (CGRect)editingRectForBounds:(CGRect)bounds{
    return  CGRectMake(5, 0, CGRectGetWidth(bounds)-10, CGRectGetHeight(bounds));
}
- (CGRect)clearButtonRectForBounds:(CGRect)bounds{
    return CGRectMake(CGRectGetWidth(bounds)-25, CGRectGetHeight(bounds)/2-10, 20, 20);
}


- (void)setup
{
    [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

-(void)textFieldDidChange:(KNLimitTextField *)sender{
    
    if (sender.max.integerValue != 0)
    {
        if ([sender.textInputMode.primaryLanguage isEqualToString:@"en-US"]) {
            
            if (sender.text.length > [sender.max integerValue]) {
                
                sender.text = [sender.text substringToIndex:[sender.max integerValue]];
            }
        }else{
            
            if (sender.markedTextRange == nil){
                
                if (sender.text.length > [sender.max integerValue]) {
                    
                    sender.text = [sender.text substringToIndex:[sender.max integerValue]];
                }
            }
        }
    }
}

@end
