//
//  HZLimitTextView.m
//  HuiXianxia
//
//  Created by zhou Can on 15/9/25.
//  Copyright (c) 2015年 vbn. All rights reserved.
//

#import "KNLimitTextView.h"

@implementation KNLimitTextView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]){
    }
    return self;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]){
    }
    return self;
}


- (void)textChangedNotification:(NSNotification *)notification {
    KNLimitTextView *sender = notification.object;
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
