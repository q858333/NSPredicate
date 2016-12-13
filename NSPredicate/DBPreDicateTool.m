//
//  DBPreDicateTool.m
//  NSPredicate
//
//  Created by dengbin on 15/1/5.
//  Copyright (c) 2015年 IUAIJIA. All rights reserved.
//

#import "DBPreDicateTool.h"

@implementation DBPreDicateTool

+(BOOL)isEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+(BOOL)isName:(NSString *)name
{//[a-zA-Z0-9\u4e00-\u9fa5]
    NSString *regex = @"[a-zA-Z0-9\u4e00-\u9fa5]+"; //数字字母汉字
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject: name];
}
//包括小数点
+(BOOL)isNumber:(NSString *)number
{
    NSString *numberRegex = @"(^-?\\d\\d*\\.\\d*$)|(^-?\\d\\d*$)|(^-?\\.\\d\\d*$)";
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
    return [numberTest evaluateWithObject:number];
}

+(BOOL)isMobile:(NSString *)mobile
{

    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}
//判断电话最新
+ (BOOL)isValidateMobile:(NSString *)mobile
{
  NSString *CM = @"(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
  NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
  return [regextestcm evaluateWithObject:mobile];
}
//判断qq
+ (BOOL)isValidateQQ:(NSString *)qq
{
  NSString *regex =@"[1-9][0-9]{4,}";
  NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
  
  return [pred evaluateWithObject:qq];
  
}
@end
