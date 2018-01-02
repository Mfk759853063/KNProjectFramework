//
//  ICBaseRefreshViewController.m
//  HXZoffice
//
//  Created by vbn on 16/4/19.
//  Copyright © 2016年 cqhxz. All rights reserved.
//

#import "KNBaseRefreshViewController.h"
#import "MJRefresh.h"

@interface KNBaseRefreshViewController ()

@end

@implementation KNBaseRefreshViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)headerRefreshWithCompletionBlock:(void (^)(void))completionBlock
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        if (completionBlock) {
            completionBlock();
        }
    }];
}

- (void)headerBeginRefresh
{
    [self.tableView.mj_header beginRefreshing];
}

- (void)headerEndRefresh
{
    [self.tableView.mj_header endRefreshing];
}

- (void)footerRefreshWithCompletionBlock:(void (^)(void))completionBlock
{
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        if (completionBlock) {
            completionBlock();
        }
    }];
}

- (void)footerBeginRefresh
{
    [self.tableView.mj_footer beginRefreshing];
}

- (void)footerEndRefresh
{
    [self.tableView.mj_footer endRefreshing];
}

- (void)footerEndRefreshWithNoMoreData {
    [self.tableView.mj_footer endRefreshingWithNoMoreData];
}

- (void)hideFooter {
    [self.tableView.mj_footer setHidden:YES];
}

- (void)showFooter {
    [self.tableView.mj_footer setHidden:NO];
}

@end
