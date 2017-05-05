//
//  DBPreDicateTool.m
//  NSPredicate
// http://blog.csdn.net/chaoyuan899/article/details/38583759
//  Created by dengbin on 15/1/5.
//  Copyright (c) 2015年 IUAIJIA. All rights reserved.
//

#import "DBPreDicateTool.h"

@implementation DBPreDicateTool

// /**
//      * 判断身份证中出生日期是否正确。
//      *
//      * @return
//      */
//     private boolean isDateCorrect() {

//         /*非闰年天数*/
//         int[] monthDayN = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
//         /*闰年天数*/
//         int[] monthDayL = {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

//         int month;

//         int day;
//         try {//是否15位
//             if (this.is15()) {
//                 month = Integer.parseInt(this.idCardNum.substring(8, 10));
//             }
//             else {／／字符串转int
//                 month = Integer.parseInt(this.idCardNum.substring(10, 12));
//             }

//             if (this.is15()) {
//                 day = Integer.parseInt(this.idCardNum.substring(10, 12));
//             }
//             else {
//                 day = Integer.parseInt(this.idCardNum.substring(12, 14));
//             }
//             if (month > 12 || month <= 0) {
//                 return false;
//             }

//             if (this.isLeapyear()) {
//                 if (day > monthDayL[month - 1] || day <= 0)
//                     return false;
//             }
//             else {
//                 if (day > monthDayN[month - 1] || day <= 0)
//                     return false;
//             }
//         } catch (NumberFormatException e) {
//             return false;
//         }
//         return true;
//     }
// 肾得朕心  11:52:55
// isLeapyear
// 吴景  11:53:35
//  /**
//      * 判断身份证的出生年份是否未闰年。
//      *
//      * @return true ：闰年  false 平年
//      */
//     private boolean isLeapyear() {
//         String temp;

//         if (this.is15()) {／／取子字符串
//             temp = "19" + this.idCardNum.substring(6, 8);
//         }
//         else {
//             temp = this.idCardNum.substring(6, 10);
//         }

//         int year = Integer.parseInt(temp);

//         if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0)
//             return true;
//         else
//             return false;
//     }
    
    
    
+(BOOL)isEmail:(NSString *)email
{
    //   // NSString *emailRegex = @"^([a-zA-Z0-9]*[-_]?[a-zA-Z0-9]+)*@([a-zA-Z0-9]*[-_]?[a-zA-Z0-9]+)+[\\.][A-Za-z]{2,3}([\\.][A-Za-z]{2})?$";

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
