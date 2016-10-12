##NSArray数组
###* NSArray常用方法
```
//创建数组
NSArray *arr = [[NSArray alloc] init];
NSArray *arr = [NSArray arrayWithObject:@"lnj"];
// 数组中的nil是结束符
NSArray *arr = [NSArray arrayWithObjects:@"lnj", @"lmj" ,@"jjj", @"cp", nil];
NSLog(@"count = %lu", [arr count]);
NSLog(@"last = %@", [arr lastObject]);
NSLog(@"first = %@", [arr firstObject]);
NSLog(@"arr[1] = %@", [arr objectAtIndex:1]);

// 创建数组简写
NSString *str = @"lnj";
NSArray *arr = [NSArray arrayWithObjects:@"lnj", @"lmj", @"jjj", nil];
NSArray *arr = @[@"lnj", @"lmj", @"jjj"];
// 获取数组元素的简写
NSLog(@"%@", [arr objectAtIndex:0]);
NSLog(@"%@", arr[0]);

```

###* 数组的遍历
```
// 常规遍历
for (int i = 0; i < arr.count; ++i) {
    NSLog(@"arr[%i] = %@", i, arr[i]);
}
// 如果是OC数组可以使用OC中的增强for循环来遍历
// 逐个取出arr中的元素, 将取出的元素赋值给obj
// 注意: obj的类型可以根据数组中元素的类型来写, 不一定要写NSObject
for (NSString *obj in arr) {
    NSLog(@"obj = %@", obj);
}
    
// 使用OC数组的迭代器来遍历
// 每取出一个元素就会调用一次block
// 每次调用block都会将当前取出的元素和元素对应的索引传递给我们
// obj就是当前取出的元素, idx就是当前元素对应的索引
// stop用于控制什么时候停止遍历
[arr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    if (idx == 1) {
        *stop = YES;
    }
    NSLog(@"obj = %@, idx = %lu", obj, idx);
}];
    
[arr enumerateObjectsUsingBlock:^(Person *obj, NSUInteger idx, BOOL *stop) {
    [obj say];
}];
    
// 如果使用OC数组存储对象, 可以调用OC数组的方法让数组中所有的元素都执行指定的方法
// 注意点: 如果数组中保存的不是相同类型的数据, 并且没有相同的方法, 那么会报错
// [arr makeObjectsPerformSelector:@selector(say)];
    
// withObject: 需要传递给调用方法的参数
[arr makeObjectsPerformSelector:@selector(sayWithName:) withObject:@"lnj"];
return 0;
    
```

###* 数组的排序
```
NSArray *arr = @[@10, @20, @5, @7, @15];
NSLog(@"排序前: %@", arr);
// 注意: 想使用compare方法对数组中的元素进行排序, 那么数组中的元素必须是Foundation框架中的对象, 也就是说不能是自定义对象
NSArray *newArr = [arr sortedArrayUsingSelector:@selector(compare:)];
NSLog(@"排序后: %@", newArr);
    
Person *p1 = [Person new];
NSArray *arr = @[p1, p2, p3, p4];
NSLog(@"排序前: %@", arr);
// 按照人的年龄进行排序
// 不能使用compare:方法对自定义对象进行排序
NSArray *newArr = [arr sortedArrayUsingSelector:@selector(compare:)];
    
// 该方法默认会按照升序排序
NSArray *newArr = [arr sortedArrayWithOptions:NSSortStable usingComparator:^NSComparisonResult(Person *obj1, Person *obj2) {
// 每次调用该block都会取出数组中的两个元素给我们
// 二分
NSLog(@"obj1 = %@, obj2 = %@", obj1, obj2);
return obj1.age > obj2.age;
return obj1.age < obj2.age;

if (obj1.age > obj2.age) {
    // 5 4
    return NSOrderedDescending;
}else if(obj1.age < obj2.age)
{
    // 4 5
    return NSOrderedAscending;
}else
{
    return NSOrderedSame;
    }
}];
```


###* NSArray与NSString
```
NSArray *arr = @[@"lnj", @"lmj", @"jjj"];
// 需求: 用-将所有的姓名连接起来生成一个字符串
    
// 1.定义一个可变字符串保存拼接之后的结果
NSMutableString *strM = [NSMutableString string];
// 2.遍历数组, 取出数组中的每一个元素, 将元素添加到可变字符串中
for (NSString *str in arr) {
[strM appendString:str];
// 3.每次添加完毕之后再添加一个-
[strM appendString:@"-"];
}
[strM deleteCharactersInRange:NSMakeRange(strM.length - 1, 1)];
NSLog(@"strM = %@", strM);
    
NSString *str = [arr componentsJoinedByString:@"**"];
NSLog(@"str = %@", str);
    
// 通过一个字符串生成一个数组
// 也叫做字符串切割
NSString *str = @"lnj**lmj**jjj";
NSArray *arr = [str componentsSeparatedByString:@"**"];
NSLog(@"arr = %@", arr);

```

###*  NSArray与文件

```
// 1.将数组写入到文件中
NSArray *arr = @[@"lnj", @"lmj", @"jjj"];
// 其实如果将一个数组写入到文件中之后, 本质是写入了一个XML文件
// 在iOS开发中一般情况下我们会将XML文件的扩展名保存为plist
BOOL flag = [arr writeToFile:@"/Users/xiaomage/Desktop/abc.plist" atomically:YES];
    
NSArray *arr = @[p1, p2, p3, p4];
//注意:writeToFile只能写入数组中保存的元素都是Foundation框架中的类创建的对象, 如果保存的是自定义对象那么不能写入
BOOL flag = [arr writeToFile:@"/Users/xiaomage/Desktop/person.plist" atomically:YES];

// 2.从文件中读取一个数组
NSArray *newArray = [NSArray arrayWithContentsOfFile:@"/Users/xiaomage/Desktop/abc.plist"];
NSLog(@"%@", newArray);
```

###*  NSMutableArray

```
// 创建一个空的数组
NSMutableArray *arrM = [NSMutableArray array];
// 如何添加
[arrM addObject:@"lnj"];
// 将指定数组中的元素都取出来, 放到arrM中
// 并不是将整个数组作为一个元素添加到arrM中
[arrM addObjectsFromArray:@[@"lmj", @"jjj"]];
// 注意: 以下是将整个数组作为一个元素添加
[arrM addObject:@[@"lmj", @"jjj"]];
// 如何插入
[arrM insertObject:@"xcq" atIndex:1];
    
NSRange range = NSMakeRange(2, 2);
NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:range];
// 插入一组数据, 指定数组需要插入的位置, 和插入多少个
[arrM insertObjects:@[@"A", @"B"] atIndexes:set];
// 如何删除
[arrM removeObjectAtIndex:0];
[arrM removeLastObject];
[arrM removeObject:@"A"];
// 如何替换
[arrM replaceObjectAtIndex:1 withObject:@"M"];
// 如何获取
NSLog(@"%@", [arrM objectAtIndex:0]);
// 替换
arrM[0] = @"ZS";
    
// 注意: 不能通过@[]来创建一个可变数组, 因为@[]创建出来的是一个不可变的数组
// 如果把一个不可变数组当做一个可变数组来使用, 会引发一个运行时的错误
NSMutableArray *arrM = @[@"lnj", @"lmj"];
[arrM addObject:@"JJJ"];

```

