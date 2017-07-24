//
//  KNNetAPIManager.h
//  KNNetFramework
//
//  Created by kwep_vbn on 2017/6/25.
//  Copyright © 2017年 vbn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KNNetBaseRequest.h"

typedef enum : NSUInteger {
    KNNetworkStatusNone = -1,
    KNNetworkStatus2G = 1,
    KNNetworkStatus3G,
    KNNetworkStatus4G,
    KNNetworkStatusWIFI,
} KNNetworkStatus;

@interface KNNetAPIManager : NSObject

@property (assign, nonatomic) BOOL debugEnabled;

@property (assign, nonatomic) NSInteger maxConcurrentCount; //default is 3

+ (instancetype)manager;

+ (KNNetworkStatus)getNetWorkStates;

- (KNNetBaseRequest *)addOperation:(KNNetBaseRequest *)operation;

- (void)cancelOperation:(KNNetBaseRequest *)operation;

- (void)cancelAllOperation;


@end
