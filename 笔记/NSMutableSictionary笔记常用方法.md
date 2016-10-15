第三弹 NSDictionary字典类型 发射
***

###NSDictionary字典类型可以将数据以键值对的形式储存起来，取值的时候通过key就可以直接拿到对应的值，非常方便,在同一个词典对象中可以保存多个不同类型的数据.

>
###创建NSDictionary 与 取元素
```
// key 与 value  一一对应
    NSDictionary *dict1 = [NSDictionary dictionary];
    NSDictionary *dict2 = [NSDictionary dictionaryWithObject:@"zs" forKey:@"name"];
    NSDictionary *dict3 = [NSDictionary dictionaryWithObjects:@[@"zs",@"22",@"183"] forKeys:@[@"name",@"age",@"height"]];
    NSDictionary *dict4 = @{@"zs" : @"name", @"22" : @"age", @"183" : @"height"};
    NSLog(@"name=%@ age=%@ height=%@", dict3[@"name"], dict3[@"age"], dict3[@"height"]);
    NSLog(@"name=%@ age=%@ height=%@", [dict3 objectForKey:@"name"], [dict3 objectForKey:@"age"], [dict3 objectForKey:@"height"]);
```

***
>
###遍历字典元素
```
NSUInteger count = [dict3 count]; //取字典数量
//for循环取元素
for (int i = 0; i < count; ++i) {
    // 获取字典中所有的key
    NSArray *keys = [dict3 allKeys];
    // 取出当前位置对应的key
    NSString *key = keys[i];
    NSString *value = dict3[key];
    NSLog(@"key = %@, value = %@", key, value);
}
// 如何通过forin遍历字典
for (NSString *key in dict3) {
    NSString *value = dict3[key];
    NSLog(@"key = %@, value = %@", key, value);
}  
/**
 *  使用OC字典的迭代器来遍历  官方推荐使用
 *
 *  @param key  键
 *  @param obj  value 值
 *  @param stop 控制停止
 */
[dict3 enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
    NSLog(@"key = %@, value = %@", key, obj);
}];
```

***
>
###字典和文件
```
//将字典写入文件
[dict3 writeToFile:@"/Users/xxx/Desktop/dict.plist" atomically:YES];
//从文件中读取字典
NSDictionary *dictFile = [NSDictionary dictionaryWithContentsOfFile:@"/Users/xxx/Desktop/dict.plist"];
```

***
>
###可变字典 NSMutableDictionary
```
//创建可变字典
NSMutableDictionary *mDict = [NSMutableDictionary dictionary];
[mDict setObject:@"zs" forKey:@"name"]; //同名的key赋值, 那么新值会覆盖旧值
[mDict setValuesForKeysWithDictionary:@{@"age":@"22",@"height":@"183"}];
NSMutableDictionary *mdict = [NSMutableDictionary dictionaryWithObjects:@[@"zs", @"ls"] forKeys:@[@"name", @"name"]];
NSLog(@"mdit = %@",mdict); //ls
//取数据
[mDict valueForKey:@"name"];
NSLog(@"age = %@", mDict[@"age"]);
//删除数据
[mDict removeObjectForKey:@"name"];
[mDict removeAllObjects];
//不可变字典出现了同名的key, 那么后面的key对应的值不会被保存
NSDictionary *dictM = @{@"name":@"zs", @"name":@"ls"};
NSLog(@"dictM = %@", dictM); // name = zs
```

***