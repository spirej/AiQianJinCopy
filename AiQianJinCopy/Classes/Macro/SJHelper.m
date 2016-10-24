//
//  SJHelper.m
//  AiQianJinCopy
//
//  Created by SPIREJ on 16/8/27.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJHelper.h"
#import <SSKeychain/SSKeychain.h>
#import <AdSupport/AdSupport.h>
#import <sys/utsname.h>

@implementation SJHelper

//------------------------------------------------------------------------------------------------//

+ (UIView *)buildViewWithFrame:(CGRect)frame {
    UIView *newView         = [[UIView alloc] initWithFrame:frame];
    newView.backgroundColor = kWhiteColor;
    
    return newView;
}

+ (UIView *)buildViewWithFrame:(CGRect)frame backColor:(UIColor *)color {
    UIView *newView         = [[UIView alloc] initWithFrame:frame];
    newView.backgroundColor = color==nil?kWhiteColor:color;
    
    return newView;
}

+ (UIView *)buildViewWithFrame:(CGRect)frame backColor:(UIColor *)color cornerRadius:(CGFloat)radius {
    UIView *newView            = [self buildViewWithFrame:frame backColor:color];
    [self setCornerRadius:radius forView:newView];
    
    return newView;
}

+ (UIView *)buildViewWithFrame:(CGRect)frame backColor:(UIColor *)color borderWidth:(CGFloat)bWidth borderColor:(UIColor *)bColor {
    UIView *newView           = [self buildViewWithFrame:frame backColor:color];
    [self setBorderWidth:bWidth borderColor:bColor forView:newView];
    
    return newView;
}

+ (UIView *)buildViewWithFrame:(CGRect)frame backColor:(UIColor *)color borderWidth:(CGFloat)bWidth borderColor:(UIColor *)bColor cornerRadius:(CGFloat)radius {
    UIView *newView           = [self buildViewWithFrame:frame backColor:color cornerRadius:radius];
    [self setBorderWidth:bWidth borderColor:bColor forView:newView];
    
    return newView;
}

//------------------------------------------------------------------------------------------------//

+ (void)setCornerRadius:(CGFloat)radius forView:(UIView *)view {
    view.clipsToBounds = YES;
    view.layer.cornerRadius = radius==0?cornerR:radius;
}

+ (void)setBorderWidth:(CGFloat)bWidth borderColor:(UIColor *)bColor forView:(UIView *)view {
    view.layer.borderWidth = bWidth==0?kLineH:bWidth;
    view.layer.borderColor = bColor==nil?kWhiteColor.CGColor:bColor.CGColor;
}


//------------------------------------------------------------------------------------------------//

+ (UILabel *)buildLabelWithFrame:(CGRect)frame backColor:(UIColor *)color content:(NSString *)text textColor:(UIColor *)tColor {
    UILabel *newLabel        = [[UILabel alloc] initWithFrame:frame];
    newLabel.backgroundColor = color==nil?kClearColor:color;
    newLabel.text            = text;
    newLabel.textColor       = tColor;
    
    return newLabel;
}

+ (UILabel *)buildLabelWithFrame:(CGRect)frame backColor:(UIColor *)color content:(NSString *)text textColor:(UIColor *)tColor font:(UIFont *)font {
    UILabel *newLabel = [self buildLabelWithFrame:frame backColor:color content:text textColor:tColor];
    newLabel.font     = font==nil?kFont15:font;
    
    return newLabel;
}

+ (UILabel *)buildLabelWithFrame:(CGRect)frame backColor:(UIColor *)color content:(NSString *)text textColor:(UIColor *)tColor font:(UIFont *)font textAlignment:(NSTextAlignment)alignment {
    UILabel *newLabel      = [self buildLabelWithFrame:frame backColor:color content:text textColor:tColor font:font];
    newLabel.textAlignment = alignment;
    
    return newLabel;
}

+ (UILabel *)buildLabelWithFrame:(CGRect)frame backColor:(UIColor *)color content:(NSString *)text textColor:(UIColor *)tColor font:(UIFont *)font textAlignment:(NSTextAlignment)alignment lines:(NSInteger)line {
    UILabel *newLabel      = [self buildLabelWithFrame:frame backColor:color content:text textColor:tColor font:font textAlignment:alignment];
    newLabel.numberOfLines = line;
    
    return newLabel;
}


//------------------------------------------------------------------------------------------------//

+ (UIButton *)buildButtonWithFrame:(CGRect)frame {
    UIButton *newButton       = [UIButton buttonWithType:UIButtonTypeCustom];
    newButton.backgroundColor = kClearColor;
    newButton.frame           = frame;
    
    return newButton;
}

+ (UIButton *)buildButtonWithFrame:(CGRect)frame backColor:(UIColor *)color title:(NSString *)title textColor:(UIColor *)tColor font:(UIFont *)font {
    UIButton *newButton       = [self buildButtonWithFrame:frame];
    newButton.backgroundColor = color==nil?kClearColor:color;
    newButton.titleLabel.font = font==nil?kFont15:font;
    [newButton setTitle:title forState:UIControlStateNormal];
    [newButton setTitleColor:tColor==nil?kDetailBlackColor:tColor forState:UIControlStateNormal];
    
    return newButton;
}

+ (UIButton *)buildButtonWithFrame:(CGRect)frame image:(NSString *)image {
    UIButton *newButton = [self buildButtonWithFrame:frame];
    [newButton setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    
    return newButton;
}

//------------------------------------------------------------------------------------------------//

+ (UITableView *)buildTableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style backColor:(UIColor *)color target:(id)target {
    UITableView *newTableView    = [[UITableView alloc] initWithFrame:frame style:style];
    newTableView.delegate        = target;
    newTableView.dataSource      = target;
    newTableView.backgroundColor = color==nil?kWhiteColor:color;
    newTableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    newTableView.showsVerticalScrollIndicator   = NO;
    newTableView.showsHorizontalScrollIndicator = NO;
    
    return newTableView;
}


//------------------------------------------------------------------------------------------------//
+ (UIScrollView *)buildScrollViewWithFrame:(CGRect)frame backColor:(UIColor *)color target:(id)target {
    UIScrollView *newScrollView   = [[UIScrollView alloc] initWithFrame:frame];
    newScrollView.backgroundColor = color==nil?kWhiteColor:color;
    newScrollView.delegate        = target;
    newScrollView.showsHorizontalScrollIndicator = YES;
    newScrollView.showsVerticalScrollIndicator   = YES;
    
    return newScrollView;
}


//------------------------------------------------------------------------------------------------//

+ (BOOL)stringValid:(NSString *)str {
    if (![str isKindOfClass:[NSString class]]) {
        return NO;
    }
    if ([[str lowercaseString] isEqualToString:@"(null)"]) {
        return NO;
    }
    if ([[str lowercaseString] isEqualToString:@"<null>"]) {
        return NO;
    }
    if ([[str lowercaseString] isEqualToString:@"null"]) {
        return NO;
    }
    if (str != nil && [str length] >0 && ![@"" isEqualToString:str]) {
        return YES;
    }else {
        return NO;
    }
}


+ (id)readLocalFileResource:(NSString *)resource type:(NSString *)type
{
    //读取本地plist文件
    NSError *error;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:resource ofType:type];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:filePath];
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    return jsonObject;
}

+ (NSString *)dateFormatter:(NSString *)format andLongDate:(NSString *)longDate {
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:format];
    NSDate *nowDate = [NSDate dateWithTimeIntervalSince1970:longDate.longLongValue/1000];
    //用[NSDate date]可以获取系统当前时间
    NSString *currentDateStr = [dateFormatter stringFromDate:nowDate];
    return currentDateStr;
}

//富文本
+(NSMutableAttributedString*)changeInvestText:(NSString*)text withUnitFont:(UIFont*)font
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text];
    if ([text rangeOfString:@"+"].location !=NSNotFound) {
        NSRange range = [text rangeOfString:@"+"];
        NSRange subRange = NSMakeRange(range.location, text.length-range.location);
        [str addAttribute:NSFontAttributeName value:font range:subRange];
    }
    return str;
}

+ (NSMutableAttributedString *)changeNumberText:(NSString *)text {
    NSMutableArray *arrayA = [NSMutableArray array];
    NSMutableArray *arrayB = [NSMutableArray array];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text];
    //遍历找出所有的数字的位置
    unichar c = 0;
    for (int i=0; i<text.length; i++) {
        c=[text characterAtIndex:i];
        if (isdigit(c)) {
            [arrayA addObject:[NSNumber numberWithInt:i]];
        }
    }
    
    [arrayA enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSRange tempRange = NSMakeRange([obj integerValue], 1);
        [str addAttribute:NSForegroundColorAttributeName value:ColorWithHex(0xfc5455, 1) range:tempRange];
    }];
    
    //遍历找出所有逗号的位置
    if ([text rangeOfString:@","].location != NSNotFound) {
        unichar b;
        for (int i = 0; i < text.length; i++) {
            b = [text characterAtIndex:i];
            if (b == ',') {
                [arrayB addObject:[NSNumber numberWithChar:i]];
            }
        }
    }
    [arrayB enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSRange tempRange = NSMakeRange([obj integerValue], 1);
        [str addAttribute:NSForegroundColorAttributeName value:ColorWithHex(0xfc5455, 1) range:tempRange];
    }];
    
    if ([text rangeOfString:@"元"].location != NSNotFound) {
        NSRange range = [text rangeOfString:@"元"];
        [str addAttribute:NSForegroundColorAttributeName value:ColorWithHex(0xfc5455, 1) range:range];
    }
    return str;
}

+ (NSMutableAttributedString *)changeLockedText:(NSString *)text {
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text];
    if ([text rangeOfString:@"个月"].location != NSNotFound) {
        NSRange range = [text rangeOfString:@"个月"];
        [str addAttribute:NSFontAttributeName value:kFont15 range:range];
        [str addAttribute:NSForegroundColorAttributeName value:kDetailGrayColor range:range];
    }
    return str;
}

+ (NSMutableAttributedString *)changeLockedText:(NSString *)text color:(UIColor *)color {
    NSMutableArray *arrayA = [NSMutableArray array];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text];
    //遍历找出所有的数字的位置
    unichar c = 0;
    for (int i=0; i<text.length; i++) {
        c=[text characterAtIndex:i];
        if (isdigit(c)) {
            [arrayA addObject:[NSNumber numberWithInt:i]];
        }
    }
    
    [arrayA enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSRange tempRange = NSMakeRange([obj integerValue], 1);
        [str addAttribute:NSForegroundColorAttributeName value:ColorWithHex(0xfc5455, 1) range:tempRange];
    }];
    
    if ([text rangeOfString:@"个月"].location != NSNotFound) {
        NSRange range = [text rangeOfString:@"个月"];
        [str addAttribute:NSFontAttributeName value:kFont15 range:range];
        [str addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
    return str;
}

+ (NSString *)numberFormatter:(id)number {
    NSString *numString;
    if ([number isKindOfClass:[NSNumber class]]) {
        numString = [NSString stringWithFormat:@"%lf",[number doubleValue]];
    }else{
        numString = (NSString *)number;
    }
    
    numString = [NSString stringWithFormat:@"%lf",[numString doubleValue]];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
//    [formatter setMaximumFractionDigits:2];
//    [formatter setMinimumFractionDigits:2];
    
    NSNumber *num = [NSNumber numberWithDouble:[numString doubleValue]];
    NSString *result = [NSString stringWithFormat:@"%@",[formatter stringFromNumber:num]];
    
    return  result;
}



//------------------------------------------------------------------------------------------------//

+ (NSString *)obtainDeviceIDFA
{
    NSString *IDFA = [SSKeychain passwordForService:@"com.iqianjin.app.service" account:@"com.iqianjin.app.idfa"];
    if (![SJHelper stringValid:IDFA]) {
        //keychain中没有，从系统api中获取
        IDFA = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
        [SSKeychain setPassword:IDFA forService:@"com.iqianjin.app.service" account:@"com.iqianjin.app.idfa"];
    }
    Print(@"IDFA ---------- %@",IDFA);
    return IDFA;
}

+ (NSString *)obtainDeviceIDFV
{
    NSString *IDFV = [SSKeychain passwordForService:@"com.iqianjin.app.service" account:@"com.iqianjin.app.idfv"];
    if (![SJHelper stringValid:IDFV]) {
        //keychain中没有，从系统api中获取
        IDFV = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        [SSKeychain setPassword:IDFV forService:@"com.iqianjin.app.service" account:@"com.iqianjin.app.idfv"];
    }
    Print(@"IDFV ---------- %@",IDFV);
    return IDFV;
}

+ (NSString *)obtainDeviceType
{
    if (CurrentIPhone4) return @"iphone4";
    if (CurrentIPhone5) return @"iphone5";
    if (CurrentIPhone6) return @"iphone6";
    if(CurrentIPhone6Plus) return @"iphone6plus";
    //针对其他设备处理
    return @"iphone4";
}

+ (NSString*) deviceString

{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4";//@"iPhone 4S"这里用于区分设备尺寸 对于尺寸相同设备统一返回同一结果
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5";//@"iPhone 5C"
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5";//@"iPhone 5C"
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5";//@"iPhone 5S"
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6P";
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceString isEqualToString:@"iPad2,5"])      return @"iPad mini";
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    return deviceString;
}
/**
 *  @author fushengjun, 16-03-25 12:03:54
 *
 *  获取当前APP的版本号
 *
 *  @return string
 */
+ (NSString *)currentAppVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}


//------------------------------------------------------------------------------------------------//

+ (void)normalPushWithPage:(NSString *)page target:(UIViewController *)target {
    UIViewController * myObj = [[NSClassFromString(page) alloc] init];
    [target.navigationController pushViewController:myObj animated:YES];
}

+ (void)hidesBottomBarPushPage:(NSString *)page target:(UIViewController *)target {
    UIViewController * myObj = [[NSClassFromString(page) alloc] init];
    myObj.hidesBottomBarWhenPushed  = YES;
    [target.navigationController pushViewController:myObj animated:YES];
}



@end
