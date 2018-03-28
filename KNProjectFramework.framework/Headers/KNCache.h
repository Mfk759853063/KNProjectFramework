//
//  KNCache.h
//  KNDataCacheSimple
//
//  Created by hzdlapple2 on 16/1/8.
//  Copyright © 2016年 hzdlapple2. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^KNCacheCompletionVoidBlock)(void);
typedef void(^KNCacheCompletionDataBlock)(id data);

@interface KNCache : NSObject

+ (void)clearSystemCookieAndCache;

+ (instancetype)shareCacheWithNameSpace:(NSString *)nameSpace;

- (instancetype)initWithNameSpace:(NSString *)nameSpace;

- (void)getSizeWithCompletionBlock:(KNCacheCompletionDataBlock)completion;

#pragma mark - delete

- (void)deleteAllDataWithCompletionBlock:(KNCacheCompletionVoidBlock)completion;

- (void)deleteDataForKey:(NSString *)key;

- (void)deleteDataForKey:(NSString *)key block:(KNCacheCompletionVoidBlock)completion;

#pragma mark - store

- (void)saveData:(id)data forKey:(NSString *)key;
- (void)saveData:(id)data forKey:(NSString *)key withBlock:(KNCacheCompletionVoidBlock)completion;

#pragma mark - getData

- (id)dataForKey:(NSString *)key;

- (void)dataForKey:(NSString *)key withBlock:(KNCacheCompletionDataBlock)completion;
@end
