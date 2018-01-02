//
//  HZKNTableViewCell.h
//  HuiXianxia
//
//  Created by hzdlapple2 on 15/11/19.
//  Copyright © 2015年 com.huixianxia.c. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KNBaseTableViewCell : UITableViewCell

@property (strong, nonatomic) UIView *bottomLineView;

- (void)showTopline:(BOOL)show;


- (void)showToplineLeftOffset:(CGFloat)leftOffset;

- (void)showTopLineRightOffSet:(CGFloat)rightOffset;

- (void)showBottomLine:(BOOL)show;

- (void)showBottomLineLeftOffset:(CGFloat)leftOffset;

- (void)showBottomLineRightOffSet:(CGFloat)rightOffset;

- (UITableView *)getTableView;

@end
