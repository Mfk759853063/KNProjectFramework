//
//  NSData+KNAddtions.h
//  KNProjectFramework
//
//  Created by vbn on 2018/1/2.
//  Copyright © 2018年 vbn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (KNAddtions)

- (NSData *)KN_aes256_encrypt:(NSString *)key iv:(NSString *)iv;

- (NSData *)KN_aes256_decrypt:(NSString *)key iv:(NSString *)iv;

@end
