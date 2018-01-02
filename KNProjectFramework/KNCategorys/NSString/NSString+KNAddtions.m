//
//  NSString+Addtions.m
//  KNProjectFramework
//
//  Created by vbn on 2018/1/2.
//  Copyright © 2018年 vbn. All rights reserved.
//

#import "NSString+KNAddtions.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@implementation NSString (KNAddtions)

+ (NSMutableAttributedString *)KN_renderString:(NSString *)renderString withColor:(UIColor *)renderColor font:(UIFont *)font
{
    NSMutableAttributedString *mStr = [NSString KN_renderString:renderString withColor:renderColor];
    [mStr addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, renderString.length)];
    return mStr;
}

+ (NSMutableAttributedString *)KN_renderString:(NSString *)renderString withColor:(UIColor *)renderColor
{
    NSMutableAttributedString *mStr = [[NSMutableAttributedString alloc] initWithString:renderString];
    [mStr addAttribute:NSForegroundColorAttributeName value:renderColor range:NSMakeRange(0, renderString.length)];
    return mStr;
}

+ (BOOL)KN_isNullOrEmpty:(NSString *)string {
    if (string) {
        if ([string isKindOfClass: [NSString class]]) {
            if (string.length == 0) {
                return YES;
            } else {
                
                if ([string isEqualToString:@"(null)"]){
                    return YES;
                }
                
                if ([string KN_trim].length == 0) {
                    return YES;
                } else {
                    return NO;
                }
                
                
            }
        } else {
            return YES;
        }
    } else {
        return YES;
    }
}

+ (NSString *)KN_timeStringFromInterval:(long)interval {
    NSMutableString *timeString=[[NSMutableString alloc]init];
    if (interval/86400>0) {
        [timeString appendString:[NSString stringWithFormat:@"%ld天",interval/86400]];
    }
    interval=interval%86400;
    if (interval/3600>0) {
        [timeString appendString:[NSString stringWithFormat:@"%ld小时",interval/3600]];
    }
    interval=interval%3600;
    if (interval/60>0) {
        [timeString appendString:[NSString stringWithFormat:@"%ld分",interval/60]];
    }
    interval=interval%60;
    [timeString appendString:[NSString stringWithFormat:@"%ld秒",interval]];
    return timeString;
}

+ (BOOL)KN_isPhone:(NSString *)phone
{
    NSString *regex = @"^(1)\\d{10}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:phone];
}

+ (BOOL)KN_isIDCardNumber:(NSString *)text {
    NSString *pattern = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    BOOL isMatch = [pred evaluateWithObject:text];
    return isMatch;
}

+ (NSString *)KN_stringByRemovingControlCharacters: (NSString *)inputString {
    NSCharacterSet *controlChars = [NSCharacterSet controlCharacterSet];
    NSRange range = [inputString rangeOfCharacterFromSet:controlChars];
    if (range.location != NSNotFound) {
        NSMutableString *mutable = [NSMutableString stringWithString:inputString];
        while (range.location != NSNotFound) {
            [mutable deleteCharactersInRange:range];
            range = [mutable rangeOfCharacterFromSet:controlChars];
        }
        return mutable;
    }
    return inputString;
}

//MD5 加密
+(NSString*)KN_md5Str:(NSString*)str {
    NSString *md5str;
    const char *cStr = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (unsigned int)strlen(cStr), result);
    
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
    {
        [hash appendFormat:@"%02X", result[i]];
    }
    md5str =  [hash lowercaseString];
    return md5str;
}

- (NSString *)KN_md5 {
    return [[self class] KN_md5Str:self];
}

- (NSString *)KN_trim {
    return [self stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
}

- (BOOL)KN_isValidMoney {
    if ([self floatValue]-0<0.0001) {
        return NO;
    }
    //最多两位小数
    NSString *regex1 = @"^\\d+(\\.{1}\\d{0,2})?$";
    NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex1];
    if([pred1 evaluateWithObject: self]){
        //排除以0d开头的情况
        NSString *regex2 = @"^0\\d+(\\.{1}\\d{0,2})?$";
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex2];
        if ([pred2 evaluateWithObject:self]) {
            return NO;
        }else{
            return YES;
        }
    }else {
        return NO;
    }
}

- (NSString *)KN_URLEncodedString
{
    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)self,
                                                              (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                                              NULL,
                                                              kCFStringEncodingUTF8));
    return encodedString;
}


- (NSMutableAttributedString *)KN_renderString:(NSString *)renderString withColor:(UIColor *)renderColor
{
    NSMutableAttributedString *mStr = [[NSMutableAttributedString alloc] initWithString:self];
    [mStr addAttribute:NSForegroundColorAttributeName value:renderColor range:[self rangeOfString:renderString]];
    return mStr;
}

- (NSMutableAttributedString *)KN_renderString:(NSString *)renderString withColor:(UIColor *)renderColor font:(UIFont *)font
{
    NSMutableAttributedString *mStr = [self KN_renderString:renderString withColor:renderColor];
    [mStr addAttribute:NSFontAttributeName value:font range:[self rangeOfString:renderString]];
    return mStr;
}

- (NSString *)KN_safeSubstringWithRange:(NSRange)range {
    if (range.location != NSNotFound && range.location + range.length <= self.length) {
        return [self substringWithRange:range];
    }
    return @"";
}

- (NSString *)deleteAllSpicalChar:(NSString *)spicalChar {
    return [self stringByReplacingOccurrencesOfString:spicalChar withString:@""];
}

- (NSString *)KN_formatPhoneNum:(NSString *)phone
{
    if ([phone hasPrefix:@"86"]) {
        NSString *formatStr = [phone substringWithRange:NSMakeRange(2, [phone length]-2)];
        return formatStr.KN_trim;
    }
    else if ([phone hasPrefix:@"+86"])
    {
        if ([phone hasPrefix:@"+86·"]) {
            NSString *formatStr = [phone substringWithRange:NSMakeRange(4, [phone length]-4)];
            return formatStr.KN_trim;
        }
        else
        {
            NSString *formatStr = [phone substringWithRange:NSMakeRange(3, [phone length]-3)];
            return formatStr.KN_trim;
        }
    }
    return phone;
}

- (NSString *)KN_getLastStrByLengh:(NSUInteger)len {
    if (len > self.length) {
        return @"";
    } else {
        return [self substringWithRange:NSMakeRange(self.length - len, len)];
    }
    return @"";
}

-(NSString *)KN_aes256_encrypt:(NSString *)key iv:(NSString *)iv {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    //对数据进行加密
    NSData *result = [data KN_aes256_encrypt:key iv:iv];
    
    //转换为2进制字符串
    if (result && result.length > 0) {
        
        //        Byte *datas = (Byte*)[result bytes];
        //        NSMutableString *output = [NSMutableString stringWithCapacity:result.length * 2];
        //        for(int i = 0; i < result.length; i++){
        //            [output appendFormat:@"%02x", datas[i]];
        //        }
        //        return output;
        return [[NSString alloc]initWithData:[result base64EncodedDataWithOptions:0] encoding:NSUTF8StringEncoding];
    }
    return nil;
}

-(NSString *)KN_aes256_decrypt:(NSString *)key iv:(NSString *)iv {
    //转换为2进制Data
    //    NSMutableData *data = [NSMutableData dataWithCapacity:self.length / 2];
    //    unsigned char whole_byte;
    //    char byte_chars[3] = {'\0','\0','\0'};
    //    int i;
    //    for (i=0; i < [self length] / 2; i++) {
    //        byte_chars[0] = [self characterAtIndex:i*2];
    //        byte_chars[1] = [self characterAtIndex:i*2+1];
    //        whole_byte = strtol(byte_chars, NULL, 16);
    //        [data appendBytes:&whole_byte length:1];
    //    }
    NSData *base64DecodeData=[[NSData alloc]initWithBase64EncodedString:self options:NSDataBase64DecodingIgnoreUnknownCharacters];
    //对数据进行解密
    NSData* result = [base64DecodeData KN_aes256_decrypt:key iv:iv];
    if (result && result.length > 0) {
        return [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
    }
    return nil;
}


@end
