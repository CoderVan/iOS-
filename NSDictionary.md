## NSDictionary
###* 1.如何创建
```
NSDictionary *dict = [NSDictionary dictionaryWithObject:@"lnj" forKey:@"name"];
NSString *name = [dict objectForKey:@"name"];
    
// 注意: key和value 是一一对应
NSDictionary *dict = [NSDictionary dictionaryWithObjects:@[@"lnj", @"30", @"1.75"] forKeys:@[@"name", @"age", @"height"]];
NSLog(@"%@ %@ %@", [dict objectForKey:@"name"], [dict objectForKey:@"age"], [dict objectForKey:@"height"]);
    
NSDictionary *dict = @{key:value};
NSDictionary *dict = @{@"name": @"lnj"};
NSLog(@"%@", dict[@"name"]);
    
NSDictionary *dict = @{@"name":@"lnj", @"age":@"30", @"height":@"1.75"};
NSLog(@"%@ %@ %@", dict[@"name"], dict[@"age"], dict[@"height"]);

 ``` 
###* 2.字典的遍历
 ``` 
 NSDictionary *dict = @{@"name":@"lnj", @"age":@"30", @"height":@"1.75"};
// 2.1如何获取字典中key和value的个数, 在字典中key称之为键, value称之为值
 NSLog(@"count = %lu", [dict count]);
 
for (int i = 0; i < dict.count; ++i) {
// 获取字典中所有的key
NSArray *keys = [dict allKeys];
// 取出当前位置对应的key
NSString *key = keys[i];
NSString *value = dict[key];
NSLog(@"key = %@, value = %@", key, value);
}

// 如何通过forin遍历字典, 会将所有的key赋值给前面的obj
for (NSString *key in dict) {
NSString *value = dict[key];
NSLog(@"key = %@, value = %@", key, value);
}
    
[dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    NSLog(@"key = %@, value = %@", key, obj);
}];

``` 
###* 3.字典文件读写
 ``` 
NSDictionary *dict = @{@"name":@"lnj", @"age":@"30", @"height":@"1.75"};
// XML 扩展名plist
[dict writeToFile:@"/Users/xiaomage/Desktop/info.plist" atomically:YES];
  
// 注意: 字典和数组不同, 字典中保存的数据是无序的
NSDictionary *newDict = [NSDictionary dictionaryWithContentsOfFile:@"/Users/xiaomage/Desktop/info.plist"];
NSLog(@"%@", newDict)

 ``` 
###* 4. NSMutableDictionary

 ``` 
// 1.创建一个空的字典
NSMutableDictionary *dictM = [NSMutableDictionary  dictionary];
NSLog(@"%@", dictM);
// 2.如何添加
[dictM setObject:@"lnj" forKey:@"name"];
NSLog(@"%@", dictM);
// 会将传入字典中所有的键值对取出来添加到dictM中
[dictM setValuesForKeysWithDictionary:@{@"age":@"30", @"height":@"1.75"}];
NSLog(@"%@", dictM);
// 3.如何获取
NSLog(@"name = %@", dictM[@"name"]);
    
// 4.如何删除
[dictM removeObjectForKey:@"name"];
[dictM removeObjectsForKeys:@[@"age", @"height"]];
// 5.如何修改
// 如果利用setObject方法给同名的key赋值, 那么新值会覆盖旧值
[dictM setObject:@"88" forKey:@"age"];
dictM[@"age"] = @"88";
    
// 1.不能使用@{}来创建一个可变的字典
NSMutableDictionary *dictM = @{@"name":@"lnj"};
[dictM setObject:@"30" forKey:@"age"];
    
// 2.如果是不可变数组, 那么key不能相同
// 如果是不可变字典出现了同名的key, 那么后面的key对应的值不会被保存
// 如果是在可变数组中, 后面的会覆盖前面的
NSDictionary *dict = @{@"name":@"lmj", @"name":@"lnj"};
NSLog(@"dict = %@", dict);
    
NSMutableDictionary *dictM = [NSMutableDictionary dictionaryWithObjects:@[@"lmj", @"lnj"] forKeys:@[@"name", @"name"]];
NSLog(@"dict = %@", dictM);
 ``` 