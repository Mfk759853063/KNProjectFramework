//
//  KNBaseTableViewController.h
//  KNProjectTemplete
//
//  Created by kwep_vbn on 16/2/20.
//  Copyright © 2016年 vbn. All rights reserved.
//

#import "KNBaseViewController.h"
#import "KNBaseTableView.h"

@interface KNBaseTableViewController : KNBaseViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) KNBaseTableView *tableView;

- (UITableViewStyle)tableViewStyle;

@end
