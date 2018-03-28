//
//  KNCache.m
//  KNDataCacheSimple
//
//  Created by hzdlapple2 on 16/1/8.
//  Copyright © 2016年 hzdlapple2. All rights reserved.
//

#import "KNCache.h"
#import "UIKit/UIKit.h"
#import "YYCache.h"

@interface KNCache ()

@property (strong, nonatomic) YYCache *cache;

@end

@implementation KNCache

static NSMutableDictionary *instances;

+ (void)clearSystemCookieAndCache {
    //清除cookies
    NSHTTPCookie *cookie;
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (cookie in [storage cookies]){
        [storage deleteCookie:cookie];
    }
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}

+ (instancetype)shareCacheWithNameSpace:(NSString *)nameSpace {
    
    if (!instances) {
        instances = @{}.mutableCopy;
    }
    if ([instances valueForKey:nameSpace]) {
        return [instances valueForKey:nameSpace];
    }
    KNCache *instance = [[KNCache alloc] initWithNameSpace:nameSpace];
    [instances setObject:instance forKey:nameSpace];
    
    return instance;
}

- (instancetype)initWithNameSpace:(NSString *)nameSpace {
    self = [super init];
    if (self) {
        // init path
        self.cache = [YYCache cacheWithName:nameSpace];
    }
    return self;
}


- (void)getSizeWithCompletionBlock:(KNCacheCompletionDataBlock)completion {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSUInteger size = self.cache.diskCache.totalCost;
        completion?completion(@(size)):nil;
    });
}

- (void)deleteAllDataWithCompletionBlock:(KNCacheCompletionVoidBlock)completion {
    [self.cache removeAllObjectsWithBlock:^{
        completion?completion():nil;
    }];
}

#pragma mark - delete

- (void)deleteDataForKey:(NSString *)key {
    if (key) {
        [self.cache removeObjectForKey:key];
    }
}

- (void)deleteDataForKey:(NSString *)key block:(KNCacheCompletionVoidBlock)completion {
    if (key) {
        [self.cache removeObjectForKey:key withBlock:^(NSString * _Nonnull key) {
            completion?completion():nil;
        }];
    }
}

#pragma mark - store

- (void)saveData:(id)data forKey:(NSString *)key {
    [self.cache setObject:data forKey:key];
}

- (void)saveData:(id)data forKey:(NSString *)key withBlock:(KNCacheCompletionVoidBlock)completion {
    [self.cache setObject:data forKey:key withBlock:^{
        completion?completion():nil;
    }];
}

#pragma mark - getData

- (id)dataForKey:(NSString *)key {
    
    id data = [self.cache objectForKey:key];
    return data;
}

- (void)dataForKey:(NSString *)key withBlock:(KNCacheCompletionDataBlock)completion {
    [self.cache objectForKey:key withBlock:^(NSString * _Nonnull key, id<NSCoding>  _Nonnull object) {
        dispatch_async(dispatch_get_main_queue(), ^{
            completion?completion(object):nil;
        });
        
    }];
}
@end
