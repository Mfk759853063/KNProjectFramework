//
//  HZLimitTextView.h
//  HuiXianxia
//
//  Created by zhou Can on 15/9/25.
//  Copyright (c) 2015年 vbn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KNLimitTextView : UITextView

@property (strong, nonatomic) NSNumber *max;

@property (strong, nonatomic) NSNumber *min;

- (void)textChangedNotification:(NSNotification *)notification;

@end
