//
//  KNBaseTableViewController.m
//  KNProjectTemplete
//
//  Created by kwep_vbn on 16/2/20.
//  Copyright © 2016年 vbn. All rights reserved.
//

#import "KNBaseTableViewController.h"
#import "Masonry.h"
#import "KNMacroDefines.h"

@implementation KNBaseTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.tableView = [[KNBaseTableView alloc] initWithFrame:CGRectMake(0, 64, KNSCREENWIDTH, KNSCREENHEIGHT - 64) style:[self tableViewStyle]];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@64);
        make.left.and.right.and.bottom.equalTo(self.view);
    }];
}

- (UITableViewStyle)tableViewStyle {
    
    return UITableViewStylePlain;
}

#pragma mark - TableViewDelegate && Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = @"imp in sub class";
    return cell;
}

@end
