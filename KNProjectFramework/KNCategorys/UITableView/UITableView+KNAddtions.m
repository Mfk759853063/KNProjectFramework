//
//  UITableView+Addtions.m
//  HZDLHuiXianXia
//
//  Created by hzdlapple2 on 16/1/28.
//  Copyright © 2016年 hzdlapple2. All rights reserved.
//

#import "UITableView+KNAddtions.h"
#import "objc/runtime.h"

@implementation UITableView (KNAddtions)

- (NSMutableArray *)reuseCalcHeightCells {
    return objc_getAssociatedObject(self, @selector(reuseCalcHeightCells));
}

- (void)setReuseCalcHeightCells:(NSMutableArray *)reuseCalcHeightCells {
    objc_setAssociatedObject(self, @selector(reuseCalcHeightCells), reuseCalcHeightCells, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)KN_getClacCellWithCellIdentifier:(NSString *)cellIdentifier {
    if (!self.reuseCalcHeightCells) {
        self.reuseCalcHeightCells = @[].mutableCopy;
    }
    if (!cellIdentifier) {
        return nil;
    }
    UITableViewCell *cell = [self.reuseCalcHeightCells filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF.reuseIdentifier == %@",cellIdentifier]].firstObject;
    if (!cell) {
        cell = [self dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            NSAssert(0, @"请先注册CellReuseIdentifier:%@",cellIdentifier);
        }
        [self.reuseCalcHeightCells addObject:cell];
    }
    return cell;
}

- (void)KN_scrollToBottomAnimated:(BOOL)animated {
    NSInteger s = [self numberOfSections];
    if (s<1) return;
    NSInteger r = [self numberOfRowsInSection:s-1];
    if (r<1) return;
    
    NSIndexPath *ip = [NSIndexPath indexPathForRow:r-1 inSection:s-1];
    
    [self scrollToRowAtIndexPath:ip atScrollPosition:UITableViewScrollPositionBottom animated:animated];
}

- (void)KN_registerCellClass:(Class)cellClass {
    [self registerClass:cellClass forCellReuseIdentifier:NSStringFromClass(cellClass)];
}

- (void)KN_registerCellWithNibName:(NSString *)cellNibName {
    [self registerNib:[UINib nibWithNibName:cellNibName bundle:nil] forCellReuseIdentifier:cellNibName];
}

@end
