//
//  KNNetBaseRequest.m
//  KNNetFramework
//
//  Created by kwep_vbn on 2017/6/23.
//  Copyright © 2017年 vbn. All rights reserved.
//

#import "KNNetBaseRequest.h"
#import "AFNetworking.h"

@interface KNNetBaseRequest ()

@property (strong, nonatomic) AFHTTPSessionManager *manager;

@property (strong, nonatomic) NSURLSessionTask *task;

@end

@implementation KNNetBaseRequest

@synthesize executing = _executing;
@synthesize finished  = _finished;
@synthesize cancelled = _cancelled;

- (BOOL)isConcurrent{
    return self.canConcurrent;
}

- (BOOL)isAsynchronous {
    return self.canConcurrent;
}

- (instancetype)initWithUrl:(NSString *)url method:(KNNetRequestMethod)method progressCallback:(KNNetProgressChanged)progress success:(KNNetSuccessBlock)success faild:(KNNetFaildBlock)faild {
    self = [super init];
    if (self) {
        [self setDefault];
        self.requestUrl = url;
        self.method = method;
        self.progressCallback = [progress copy];
        self.successBlock = [success copy];
        self.faildBlock = [faild copy];
    }
    return self;
}

- (void)setDefault {
    self.timeOut = 60;
    self.canConcurrent = YES;
    self.method = KNNetRequestPOST;
    self.requestSerializerType = KNNetRequestSerializerTypePlainText;
    self.responseSerializerType = KNNetResponseSerializerTypeJSON;
}

- (void)start {
    if (self.isCancelled) {
        [self finish];
        return;
    }
    self.manager = [AFHTTPSessionManager manager];
    [self setRequestSerializer];
    [self setResponseSerializer];
    NSMutableDictionary *headers = self.headers;
    
    for (NSString *key in headers.allKeys) {
        [self.manager.requestSerializer setValue:headers[key] forHTTPHeaderField:key];
    }
    self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json",
                                                                              @"text/html",
                                                                              @"text/json",
                                                                              @"text/plain",
                                                                              @"text/javascript",
                                                                              @"text/xml",
                                                                              @"image/*"]];
    
    self.manager.requestSerializer.timeoutInterval = self.timeOut;
    NSMutableDictionary *comP = self.comonParms;
    NSDictionary *requestParms = self.requestParms;
    if (comP) {
        NSMutableDictionary *tempP = @{}.mutableCopy;
        [requestParms enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            [tempP setObject:obj forKey:key];
        }];
        [comP enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            [tempP setObject:obj forKey:key];
        }];
        requestParms = tempP;
    }
    
    
    if (self.method == KNNetRequestPOST) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        self.task = [self.manager POST:self.requestUrl parameters:requestParms progress:^(NSProgress * _Nonnull uploadProgress) {
            if (self.isCancelled) {
                [self finish];
                return ;
            }
            self.progressCallback?self.progressCallback(uploadProgress):nil;
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            [self processResult:responseObject response:task successBlock:self.successBlock faild:self.faildBlock];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            [self processError:error response:task faild:self.faildBlock];
        }];
    } else if (self.method == KNNetRequestGET) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        self.task = [self.manager GET:self.requestUrl parameters:requestParms progress:^(NSProgress * _Nonnull uploadProgress) {
            if (self.isCancelled) {
                [self finish];
                return ;
            }
            self.progressCallback?self.progressCallback(uploadProgress):nil;
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            [self processResult:responseObject response:task successBlock:self.successBlock faild:self.faildBlock];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            [self processError:error response:task faild:self.faildBlock];
        }];
    }
    
}

- (NSError *)haveError:(id)response {
    NSDictionary *result=(id)response;
    NSInteger state=[[result objectForKey:@"result"] integerValue];
    if (state == 0) {
        return nil;
    } else {
        NSString *msg = @"";
        if ([result objectForKey:@"msg"]) {
            msg = [result objectForKey:@"msg"];
        }
        NSDictionary *userInfo = @{@"message":msg,
                                   @"code":@(state)};
        
        NSLog(@"%@",userInfo);
        return [NSError errorWithDomain:@"KNNetworkingDomain" code:state userInfo:userInfo];
    }
}

- (void)finish {
    if (self.isExecuting) {
        [self KVONotificationWithNotiKey:@"isExecuting" state:&_executing stateValue:NO];
    }
    [self KVONotificationWithNotiKey:@"isFinished" state:&_finished stateValue:YES];
}

- (void)cancel {
    if (!self.isCancelled && !self.isFinished) {
        [super cancel];
        [self KVONotificationWithNotiKey:@"isCancelled" state:&_cancelled stateValue:YES];
        [self.task cancel];
        self.successBlock = nil;
        self.faildBlock = nil;
    }
}

#pragma mark - private

- (void)setRequestSerializer {
    switch (self.requestSerializerType) {
        case KNNetRequestSerializerTypeJSON:
            self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
            break;
        case KNNetRequestSerializerTypePlainText:
            self.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
            break;
        default:
            self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
            break;
    }
}

- (void)setResponseSerializer {
    switch (self.responseSerializerType) {
        case KNNetResponseSerializerTypeXML:
            self.manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
        case KNNetResponseSerializerTypeData:
            self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        case KNNetResponseSerializerTypeJSON:
            self.manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        default:
            self.manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
    }
}

- (void)processResult:(id)result response:(NSURLSessionTask *)response successBlock:(KNNetSuccessBlock)success faild:(KNNetFaildBlock)faild {
    if (self.isCancelled) {
        [self finish];
        return ;
    }
    NSError *error = [self haveError:result];
    if (error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            faild?faild(response,error):nil;
        });
        
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            success?success(response,result):nil;
        });
    }
    [self finish];
}

- (void)processError:(NSError *)error response:(NSURLSessionTask *)response faild:(KNNetFaildBlock)faild {
    if (self.isCancelled) {
        [self finish];
        return ;
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        faild?faild(response,error):nil;
    });
    [self finish];
}

- (void)KVONotificationWithNotiKey:(NSString *)key state:(BOOL *)state stateValue:(BOOL)stateValue {
    [self willChangeValueForKey:key];
    *state = stateValue;
    [self didChangeValueForKey:key];
}

@end
