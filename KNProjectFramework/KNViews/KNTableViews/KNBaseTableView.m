//
//  HZBaseTableView.m
//  HZDLHuiXianXia
//
//  Created by hzdlapple2 on 15/4/6.
//  Copyright (c) 2015年 hzdlapple2. All rights reserved.
//

#import "KNBaseTableView.h"

@implementation KNBaseTableView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setShowsHorizontalScrollIndicator:NO];
    [self setShowsVerticalScrollIndicator:NO];
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{

    self = [super initWithFrame:frame style:style];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self setShowsHorizontalScrollIndicator:NO];
        [self setShowsVerticalScrollIndicator:NO];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}
@end
