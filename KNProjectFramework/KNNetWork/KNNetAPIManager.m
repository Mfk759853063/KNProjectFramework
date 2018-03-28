//
//  KNNetAPIManager.m
//  KNNetFramework
//
//  Created by kwep_vbn on 2017/6/25.
//  Copyright © 2017年 vbn. All rights reserved.
//

#import "KNNetAPIManager.h"
#import <UIKit/UIKit.h>
@interface KNNetAPIManager ()

@property (strong, nonatomic) NSOperationQueue *queue;

@end

@implementation KNNetAPIManager

+ (instancetype)manager {
    static KNNetAPIManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[KNNetAPIManager alloc] init];
    });
    return manager;
}

+ (KNNetworkStatus)getNetWorkStates {
    KNNetworkStatus status = KNNetworkStatusNone;
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *children  = [[[app valueForKeyPath:@"statusBar"]valueForKeyPath:@"foregroundView"]subviews];
    int netType = 0;
    //获取到网络返回码
    for (id child in children) {
        if ([child isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
            //获取到状态栏
            netType = [[child valueForKeyPath:@"dataNetworkType"]intValue];
            
            switch (netType) {
                case 0:
                    //无网模式
                    status = KNNetworkStatusNone;
                    break;
                case 1:
                    //2G
                    status = KNNetworkStatus2G;
                    break;
                case 2:
                    //3G
                    status = KNNetworkStatus3G;
                    break;
                case 3:
                    //4G
                    status = KNNetworkStatus4G;
                    break;
                case 5:
                    //Wi-Fi
                    status = KNNetworkStatusWIFI;
                    break;
                default:
                    break;
            }
        }
    }
    return status;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.debugEnabled = YES;
        self.queue = [[NSOperationQueue alloc] init];
        self.queue.name = @"KNNetAPIQueue";
        self.maxConcurrentCount = 3;
        self.queue.maxConcurrentOperationCount = self.maxConcurrentCount;
    }
    return self;
    
}

- (KNNetBaseRequest *)addOperation:(KNNetBaseRequest *)operation {
    [self.queue addOperation:operation];
    if (self.debugEnabled) {
        NSLog(@"新加入队列成功，当前队列有%ld个任务",self.queue.operationCount);
    }
    return operation;
}

- (void)cancelOperation:(KNNetBaseRequest *)operation {
    [operation cancel];
}

- (void)cancelAllOperation {
    [self.queue cancelAllOperations];
}

- (void)setMaxConcurrentCount:(NSInteger)maxConcurrentCount {
    _maxConcurrentCount = maxConcurrentCount;
    self.queue.maxConcurrentOperationCount = maxConcurrentCount;
}


@end
