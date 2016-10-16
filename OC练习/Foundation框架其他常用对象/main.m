//
//  main.m
//  Foundation框架其他常用对象
//
//  Created by CosyVan on 16/10/16.
//  Copyright © 2016年 CosyVan. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

#pragma mark -  常用结构体
        //1.保存坐标的 CoreFoundation下CGPoint  Foundation下NSPoint
//        NSPoint nspoint = NSMakePoint(15, 15);
        CGPoint point = CGPointMake(20, 20);
        NSLog(@"%@",NSStringFromPoint(point));
        
        //2.保存尺寸的 CoreFoundation下CGSize  Foundation下NSSize
//        NSSize nssize = NSMakePoint(200, 100);
        CGSize size = CGSizeMake(100, 50);
        NSLog(@"%@",NSStringFromSize(size));
    
        //保存坐标和尺 CoreFoundation下CGRect  Foundation下NSRect
        CGRect rect = CGRectMake(0, 0, 100, 50);
        NSLog(@"%@",NSStringFromRect(rect));
        
        //Vectors 向量
        
#pragma mark - NSNumber 继承自NSValue
        double number= 5.1;
        int age = 22;
        int value =  6;
        // 1.将基本数据类型转换为对象类型
        NSNumber *ageN = [NSNumber numberWithInt:age];
        NSNumber *numberN = [NSNumber numberWithDouble:number];
        NSNumber *valueN = [NSNumber numberWithInt:value];
    
        
        // 2.将对象类型转换为基本数据类型
        int temp = [ageN intValue];
        double temp1 = [numberN doubleValue];
        
        // 3.基本数据类型转换对象类型简写
        // 注意: 如果传入的是变量那么必须在@后面写上(), 如果传入的常量, 那么@后面的()可以省略
        NSNumber *temp3 = @(number);
        NSNumber *temp4  =@10.10;
        
#pragma mark - NSDate
        // 通过date方法创建的时间对象
        NSDate *nowDate = [NSDate date];
        NSLog(@"%@",nowDate); //2016-10-16 02:14:02 +0000
        //在当前时间加上多少秒
        NSDate *date = [nowDate dateByAddingTimeInterval:3600];
        NSLog(@"date = %@",date);
        
        //获取当前所在时区
        NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
        NSLog(@"tiemZone = %@",timeZone);  //tiemZone = Asia/Shanghai (GMT+8) offset 28800
        // 获取当前时区和指定时区的时间差
        NSInteger seconds = [timeZone secondsFromGMTForDate:nowDate];
        NSLog(@"seconds = %lu", seconds);
        //从格林乔治时间加上时间差就是本地时间
        NSDate *newDate = [nowDate dateByAddingTimeInterval:seconds];
        NSLog(@"newDate = %@", newDate);
        
        //时间格式化
        // yyyy 年
        // MM 月
        // dd 日
        // HH 24小时  hh 12小时
        // mm 分钟
        // ss 秒钟
        // Z 时区
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy-MM-dd : HH:mm:ss Z";
        // 利用时间格式化对象对时间进行格式化
//        NSString *res = [formatter stringFromDate:nowDate];
//        NSLog(@"res = %@", res);
        //字符串时间转NSDate
        // NSString --> NSDate
        NSString *str = @"2016-10-16 12:13:42 +0000";
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        // 如果是从NSString格式化为NSDate, 那么dateFormat的格式, 必须和字符串中的时间格式一致, 否则可能转换失败
        format.dateFormat = @"yyyy-MM-dd HH:mm:ss Z";
        NSDate *sdate = [format dateFromString:str];
        NSLog(@"%@", sdate);
        
#pragma mark -  NSCalendar
        // 1.获取当前时间的年月日时分秒
        // 获取当前时间
        NSDate *now = [NSDate date];
        //获取日历
        NSCalendar *calendar = [NSCalendar currentCalendar];
        // 利用日历类从当前时间对象中获取 年月日时分秒
        // components: 参数的含义是, 问你需要获取什么?
        // 一般情况下如果一个方法接收一个参数, 这个参数是是一个枚举 , 那么可以通过|符号, 连接多个枚举值
        NSCalendarUnit type = NSCalendarUnitYear |NSCalendarUnitMonth |NSCalendarUnitDay |NSCalendarUnitHour |NSCalendarUnitMinute |NSCalendarUnitSecond;
        NSDateComponents *cmps = [calendar components:type fromDate:now];
        NSLog(@"year = %ld", cmps.year);
        NSLog(@"month = %ld", cmps.month);
        NSLog(@"day = %ld", cmps.day);
        NSLog(@"hour = %ld", cmps.hour);
        NSLog(@"minute = %ld", cmps.minute);
        NSLog(@"second = %ld", cmps.second);
        
#pragma mark - 文件操作 NSFileManager
        //创建文件管理者（单利模式）
        NSFileManager *fmgr = [NSFileManager defaultManager];
        // 判断一个文件是否存在, 并且判断它是否是一个文件夹
        // 该方法的返回值是说明传入的路径对应的文件或文件夹是否存在
        // 第二个参数是用于保存判断结果的, 如果是一个目录, 那么就会赋值为YES, 如果不是就赋值为NO
        BOOL is = YES;
        BOOL flag = [fmgr fileExistsAtPath:@"/Users/xxx/Desktop/xxx.avi" isDirectory:&is];
        NSLog(@"flag = %i, dir = %i", flag, is);
        //获取文件或者文件夹的属性
        NSDictionary *info = [fmgr attributesOfFileSystemForPath:@"/Users/xxx/Desktop/xxx.avi" error:nil];
        NSLog(@"info = %@",info);
        // 获取文件夹中所有的文件
        // contentsOfDirectoryAtPath方法有一个弊端, 只能获取当前文件夹下所有的文件, 不能获取子文件夹下面的文件
        NSArray *res = [fmgr contentsOfDirectoryAtPath:@"/Users/xxx/Desktop/xxx" error:nil];
        NSLog(@"res = %@", res);
        NSArray *res1 = [fmgr subpathsAtPath:@"/Users/xxx/Desktop/xxx"];
        
        /** 创建文件夹
         * createDirectoryAtPath: 告诉系统文件夹需要创建到什么位置
         * withIntermediateDirectories: 如果指定的文件中有一些文件夹不存在, 是否自动创建不存在的文件夹
         * attributes: 指定创建出来的文件夹的属性
         * error: 是否创建成功, 如果失败会给传入的参数赋值
         * 注意: 该方法只能用于创建文件夹, 不能用于创建文件
         */
        BOOL flag1 = [fmgr createDirectoryAtPath:@"/Users/xxx/Desktop/xxx" withIntermediateDirectories:YES attributes:nil error:nil];
        NSLog(@"%i", flag1);
        /**  创建文件
         * createFileAtPath: 指定文件创建出来的位置
         * contents : 文件中的内容
         * attributes: 创建出来的文件的属性
         * NSData : 二进制数据
         */
        NSString *str1 = @"***************";
        NSData *data = [str1 dataUsingEncoding:NSUTF8StringEncoding];
        [fmgr createFileAtPath:@"/Users/xxx/Desktop/xxx/abc.txt" contents:data attributes:nil];
    }
    return 0;
}
