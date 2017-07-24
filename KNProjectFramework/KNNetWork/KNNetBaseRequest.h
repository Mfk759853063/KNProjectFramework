//
//  KNNetBaseRequest.h
//  KNNetFramework
//
//  Created by kwep_vbn on 2017/6/23.
//  Copyright © 2017年 vbn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef enum : NSUInteger {
    KNNetRequestGET = 1,
    KNNetRequestPOST,
} KNNetRequestMethod;


typedef enum : NSUInteger {
    KNNetResponseSerializerTypeJSON = 1,
    KNNetResponseSerializerTypeXML,
    KNNetResponseSerializerTypeData,
} KNNetResponseSerializerType;

typedef enum : NSUInteger {
    KNNetRequestSerializerTypeJSON = 1,
    KNNetRequestSerializerTypePlainText,
} KNNetRequestSerializerType;


typedef void(^KNNetProgressChanged)(NSProgress *progress);

typedef void(^KNNetSuccessBlock)(NSURLSessionTask *task, id response);

typedef void(^KNNetFaildBlock)(NSURLSessionTask *task, NSError * error);


@interface KNNetBaseRequest : NSOperation

@property (strong, nonatomic) NSMutableDictionary *comonParms;

@property (strong, nonatomic) NSMutableDictionary *headers;

@property (strong, nonatomic) NSDictionary *requestParms;

@property (assign, nonatomic) KNNetRequestMethod method; // default is POST;

@property (assign, nonatomic) KNNetResponseSerializerType responseSerializerType; // default is JSON;

@property (assign, nonatomic) KNNetRequestSerializerType requestSerializerType; //default is PlaintText;

@property (copy, nonatomic) NSString *requestUrl;

@property (assign, nonatomic) NSTimeInterval timeOut; // default is 60;

// callback
@property (copy, nonatomic) KNNetProgressChanged progressCallback;

@property (copy, nonatomic) KNNetSuccessBlock successBlock;

@property (copy, nonatomic) KNNetFaildBlock faildBlock;

//operation support

@property (assign, nonatomic) BOOL canConcurrent; // default is YES;

- (instancetype)initWithUrl:(NSString *)url method:(KNNetRequestMethod)method progressCallback:(KNNetProgressChanged)progress success:(KNNetSuccessBlock)success faild:(KNNetFaildBlock)faild;


// 判断是否请求错误// overiwrite
- (NSError *)haveError:(id)response;


@end
