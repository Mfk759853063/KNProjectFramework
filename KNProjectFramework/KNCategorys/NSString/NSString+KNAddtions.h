//
//  NSString+Addtions.h
//  KNProjectFramework
//
//  Created by vbn on 2018/1/2.
//  Copyright © 2018年 vbn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NSData+KNAddtions.h"

@interface NSString (KNAddtions)

+ (NSMutableAttributedString *)KN_renderString:(NSString *)renderString withColor:(UIColor *)renderColor font:(UIFont *)font;

+ (NSMutableAttributedString *)KN_renderString:(NSString *)renderString withColor:(UIColor *)renderColor;

+ (BOOL)KN_isNullOrEmpty:(NSString *)string;

+ (NSString *)KN_timeStringFromInterval:(long)interval;

+ (BOOL)KN_isPhone:(NSString *)phone;

+ (BOOL)KN_isIDCardNumber:(NSString *)text;

+ (NSString *)KN_stringByRemovingControlCharacters: (NSString *)inputString;

+(NSString*)KN_md5Str:(NSString*)str;

- (NSString *)KN_md5;

- (NSString *)KN_trim;

- (NSString *)KN_URLEncodedString;

- (BOOL)KN_isValidMoney;

- (NSMutableAttributedString *)KN_renderString:(NSString *)renderString withColor:(UIColor *)renderColor;

- (NSMutableAttributedString *)KN_renderString:(NSString *)renderString withColor:(UIColor *)renderColor font:(UIFont *)font;

- (NSString *)KN_safeSubstringWithRange:(NSRange)range;

- (NSString *)deleteAllSpicalChar:(NSString *)spicalChar;

- (NSString *)KN_formatPhoneNum:(NSString *)phone;

- (NSString *)KN_getLastStrByLengh:(NSUInteger)len;

-(NSString *)KN_aes256_encrypt:(NSString *)key iv:(NSString *)iv;

-(NSString *)KN_aes256_decrypt:(NSString *)key iv:(NSString *)iv;




@end
