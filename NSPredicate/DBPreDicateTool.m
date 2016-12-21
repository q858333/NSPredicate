//
//  DBPreDicateTool.m
//  NSPredicate
// http://blog.csdn.net/chaoyuan899/article/details/38583759
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
//匹配身份证：\d{15}|\d{18}
//评注：中国的身份证为15位或18位



+(BOOL)isName:(NSString *)name
{//[a-zA-Z0-9\u4e00-\u9fa5]    匹配帐号是否合法(字母开头，允许5-16字节，允许字母数字下划线)：^[a-zA-Z][a-zA-Z0-9_]{4,15}$

    NSString *regex = @"[a-zA-Z0-9\u4e00-\u9fa5]+"; //数字字母汉字
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject: name];
}
//包括小数点
+(BOOL)isNumber:(NSString *)number
{//^[1-9]\d*|0$　 //匹配非负整数（正整数 + 0）

    NSString *numberRegex = @"(^-?\\d\\d*\\.\\d*$)|(^-?\\d\\d*$)|(^-?\\.\\d\\d*$)";
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
    return [numberTest evaluateWithObject:number];
}
//名字包括少数民族  类似：时代·撒旦 
+ (BOOL)isValidateName:(NSString *)name
{
  
  NSString *regex =@"[\u4E00-\u9FA5]{2,8}(?:·[\u4E00-\u9FA5]{2,8})*";
  NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
  
  return [pred evaluateWithObject:name];
  
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
