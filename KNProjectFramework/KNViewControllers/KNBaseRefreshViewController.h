//
//  ICBaseRefreshViewController.h
//  HXZoffice
//
//  Created by vbn on 16/4/19.
//  Copyright © 2016年 cqhxz. All rights reserved.
//

#import "KNBaseTableViewController.h"

@interface KNBaseRefreshViewController : KNBaseTableViewController

- (void)headerRefreshWithCompletionBlock:(void(^)(void))completionBlock;

- (void)headerBeginRefresh;

- (void)headerEndRefresh;

- (void)footerRefreshWithCompletionBlock:(void(^)(void))completionBlock;

- (void)footerBeginRefresh;

- (void)footerEndRefresh;

- (void)footerEndRefreshWithNoMoreData;

- (void)hideFooter;

- (void)showFooter;



@end
