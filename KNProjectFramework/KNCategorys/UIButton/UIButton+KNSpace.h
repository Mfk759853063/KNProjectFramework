//
//  UIButton+Space.h
//  Backhome
//
//  Created by vbn on 2017/3/8.
//  Copyright © 2017年 LeiXiao CQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (KNSpace)

// 左右
-(void)KN_centerButtonAndImageWithSpacing:(CGFloat)spacing;
// 上下
- (void)KN_centerImageAndTitle:(float)space;

- (void)KN_imageLeftToRight;

@end
