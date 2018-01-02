//
//  UITableView+Addtions.h
//  HZDLHuiXianXia
//
//  Created by hzdlapple2 on 16/1/28.
//  Copyright © 2016年 hzdlapple2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (KNAddtions)

@property (strong, nonatomic) NSMutableArray *reuseCalcHeightCells;

- (id)KN_getClacCellWithCellIdentifier:(NSString *)cellIdentifier;

- (void)KN_scrollToBottomAnimated:(BOOL)animated;

- (void)KN_registerCellClass:(Class)cellClass;

- (void)KN_registerCellWithNibName:(NSString *)cellNibName;

@end
