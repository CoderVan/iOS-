##Foundation其他常用对象方法
###* 常用结构体
* 1.保存坐标的   

	 ```
	 NSPoint;    
	 CGPoint point = NSMakePoint(10, 20);
	 ```
	 
* 2.保存尺寸的  

```
	 NSSize;
	 CGSize size = NSMakeSize(100, 50);
```

* 3.保存坐标和尺

```
    NSRect;  
    CGRect rect = NSMakeRect(10, 20, 100, 50);
```

* 4.在开发中苹果推荐我们使用CG开头的结构体, 也就是说NS开头的结构体一般不用

***

###* NSNumber
```
double number= 5.1;
int value =  6;
NSArray *arr =  @[age, number, value];
// 1.将基本数据类型转换为对象类型
NSNumber *ageN = [NSNumber numberWithInt:age];
NSNumber *numberN = [NSNumber numberWithDouble:number];
NSNumber *valueN = [NSNumber numberWithInt:value];
    
NSArray *arr = @[ageN, numberN, valueN];
NSLog(@"arr = %@", arr);
    
// 2.将对象类型转换为基本数据类型
int temp = [ageN intValue];
double temp = [numberN doubleValue];
NSLog(@"%f", temp);
    
// 3.基本数据类型转换对象类型简写
// 注意: 如果传入的是变量那么必须在@后面写上(), 如果传入的常量, 那么@后面的()可以省略
NSNumber *temp = @(number);
NSNumber *temp  =@10.10;
NSLog(@"%@", temp);
```

***

###* NSValue
```
// 1.利用NSValue包装常用的结构体
CGPoint point = NSMakePoint(10, 20);
NSValue *value = [NSValue valueWithPoint:point];
NSArray *arr = @[value];
NSLog(@"%@", arr);
    
// 2.利用NSValue包装自定义的结构体
typedef struct{
int age;
char *name;
double height;
}Person;
   
Person p = {30, "lnj", 1.75};
// valueWithBytes: 接收一个指针, 需要传递需要包装的结构体的变量的地址
// objCType: 需要传递需要包装的数据类型
NSValue *pValue = [NSValue valueWithBytes:&p objCType:@encode(Person)];
NSArray *arr = @[pValue];
NSLog(@"%@", arr);
// 从NSValue中取出自定义的结构体变量
Person res;
[pValue getValue:&res];
NSLog(@"age = %i, name = %s, height = %f", res.age, res.name, res.height);

```

***

###* NSDate
```
// 1.NSDate创建和基本概念
// 只要是通过date方法创建的时间对象, 对象中就保存了当前的时间
NSDate *now = [NSDate date];
NSLog(@"now = %@", now);
// 在now的基础上追加多少秒
NSDate *date = [now dateByAddingTimeInterval:10];
NSLog(@"date = %@", date);
    
// 1.获取当前所处的时区
NSTimeZone *zone = [NSTimeZone systemTimeZone];
// 2.获取当前时区和指定时区的时间差
NSInteger seconds = [zone secondsFromGMTForDate:now];
NSLog(@"seconds = %lu", seconds);
    
NSDate *newDate = [now dateByAddingTimeInterval:seconds];
NSLog(@"newDate = %@", newDate);
    
// 2.时间格式化  NSDate --> NSString
// xxxx年xx月xx日 xx小时xx分钟xx秒
// xxxx/xx/xx  xx/xx/xx
// xx/xx/xxxx  xx/xx/xx
NSDate *now = [NSDate date];
    
// 创建一个时间格式化对象
NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
// 告诉时间格式化对象, 按照什么样的格式来格式化时间
// yyyy 年
// MM 月
// dd 日
// HH 24小时  hh 12小时
// mm 分钟
// ss 秒钟
// Z 时区
formatter.dateFormat = @"yyyy年MM月dd日 HH时mm分ss秒 Z";
formatter.dateFormat = @"MM-dd-yyyy HH-mm-ss";
    
// 利用时间格式化对象对时间进行格式化
NSString *res = [formatter stringFromDate:now];
NSLog(@"res = %@", res);
    
// NSString --> NSDate
NSString *str = @"2015-06-29 07:05:26 +0000";
NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
// 注意: 如果是从NSString格式化为NSDate, 那么dateFormat的格式, 必须和字符串中的时间格式一致, 否则可能转换失败
formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss Z";
NSDate *date = [formatter dateFromString:str];
NSLog(@"%@", date);
```

***

###* NSCalendar
```
// 1.获取当前时间的年月日时分秒
/*
// 获取当前时间
NSDate *now = [NSDate date];
// 日历
NSCalendar *calendar1 = [NSCalendar currentCalendar];
// 利用日历类从当前时间对象中获取 年月日时分秒(单独获取出来)
// components: 参数的含义是, 问你需要获取什么?
// 一般情况下如果一个方法接收一个参数, 这个参数是是一个枚举 , 那么可以通过|符号, 连接多个枚举值
NSCalendarUnit type = NSCalendarUnitYear |NSCalendarUnitMonth |NSCalendarUnitDay |NSCalendarUnitHour |NSCalendarUnitMinute |NSCalendarUnitSecond;
NSDateComponents *cmps = [calendar1 components:type fromDate:now];
NSLog(@"year = %ld", cmps.year);
NSLog(@"month = %ld", cmps.month);
NSLog(@"day = %ld", cmps.day);
NSLog(@"hour = %ld", cmps.hour);
NSLog(@"minute = %ld", cmps.minute);
NSLog(@"second = %ld", cmps.second);

// 2.比较两个时间之间的差值, 比较相差多少年多少月多少日多少小时多少分钟多少秒   
// 2.1过去的一个时间
NSString *str = @"2015-06-29 07:05:26 +0000";
NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss Z";
NSDate *date = [formatter dateFromString:str];
// 2.2当前的时间
NSDate *now = [NSDate date];
// 2.3比较两个时间
NSCalendar *calendar = [NSCalendar currentCalendar];
NSCalendarUnit type = NSCalendarUnitYear |NSCalendarUnitMonth |NSCalendarUnitDay |NSCalendarUnitHour |NSCalendarUnitMinute |NSCalendarUnitSecond;
NSDateComponents *cmps = [calendar components:type fromDate:date toDate:now options:0];
NSLog(@"%ld年%ld月%ld日%ld小时%ld分钟%ld秒钟", cmps.year, cmps.month, cmps.day, cmps.hour, cmps.minute, cmps.second);
```

***

###* NSFileManager
```
NSFileManager *manager = [NSFileManager defaultManager];
// 1.判断一个文件或者文件夹是否存在
BOOL flag = [manager fileExistsAtPath:@"/Users/xiaomage/Desktop/video/01-NSArray基本概念.mp4"];
    
// 2.判断一个文件是否存在, 并且判断它是否是一个文件夹
// 注意: 该方法的返回值是说明传入的路径对应的文件或文件夹是否存在
// 第二个参数是用于保存判断结果的, 如果是一个目录, 那么就会赋值为YES, 如果不是就赋值为NO
BOOL dir = NO;
BOOL flag = [manager fileExistsAtPath:@"/Users/xiaomage/Desktop/video/01-NSArray基本概念.mp4" isDirectory:&dir];
NSLog(@"flag = %i, dir = %i", flag, dir);
    
// 3.获取文件或文件夹的属性
NSDictionary *info = [manager attributesOfItemAtPath:@"/Users/xiaomage/Desktop/video/01-NSArray基本概念.mp4" error:nil];
NSLog(@"info = %@", info);
    
// 4.获取文件夹中所有的文件
// 注意:contentsOfDirectoryAtPath方法有一个弊端, 只能获取当前文件夹下所有的文件, 不能获取子文件夹下面的文件
NSArray *res = [manager contentsOfDirectoryAtPath:@"/Users/xiaomage/Desktop/video" error:nil];
NSLog(@"res = %@", res);

NSArray *res = [manager subpathsAtPath:@"/Users/xiaomage/Desktop/video"];
NSArray *res = [manager subpathsOfDirectoryAtPath:@"/Users/xiaomage/Desktop/video" error:nil];
NSLog(@"res = %@", res);
    
// 作业: 要求计算一个文件夹中所有文件的大小
// 注意: 如果通过attributesOfItemAtPath方法直接获取, 那么获取到的文件夹的大小不准确
// 要想实现计算一个文件夹中所有文件的大小必须先拿到所有的文件, 然后再获取所有文件的大小, 然后再相加
    
// 5.创建文件夹
// createDirectoryAtPath: 告诉系统文件夹需要创建到什么位置
// withIntermediateDirectories: 如果指定的文件中有一些文件夹不存在, 是否自动创建不存在的文件夹
// attributes: 指定创建出来的文件夹的属性
// error: 是否创建成功, 如果失败会给传入的参数赋值
// 注意: 该方法只能用于创建文件夹, 不能用于创建文件
BOOL flag = [manager createDirectoryAtPath:@"/Users/xiaomage/Desktop/abc/lnj" withIntermediateDirectories:YES attributes:nil error:nil];
NSLog(@"%i", flag);
    
// 6.创建文件
// createFileAtPath: 指定文件创建出来的位置
// contents : 文件中的内容
// attributes: 创建出来的文件的属性
    
// NSData : 二进制数据
// 注意: 该方法只能用于创建文件, 不能用于创建文件夹
NSString *str = @"江哥真帅";
NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
[manager createFileAtPath:@"/Users/xiaomage/Desktop/abc.txt" contents:data attributes:nil];
```