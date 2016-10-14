//
//  main.m
//  NSArray练习
//
//  Created by CosyVan on 16/10/14.
//  Copyright © 2016年 CosyVan. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSArray
        
#pragma mark -  创建数组
        NSArray *array = @[@"Tom",@"jarry"];
        NSArray *array1 = [[NSArray alloc] init];
        NSArray *array2 = [NSArray array];
        NSArray *array3 = [NSArray arrayWithObjects:@"zs",@"ls",@"ww",nil];
        
#pragma mark -  获取数组元素
        //获取数组个数
        NSUInteger count = [array3 count];
        NSLog(@"count = %lu", count);
        //获取数组最后一个元素
        NSString *lastObject = [array3 lastObject];
        NSLog(@"last = %@", lastObject);
        //获取数组第一个元素
        NSString *firstObject = [array3 firstObject];
        NSLog(@"first = %@", firstObject);
        //获取指定Index位置的元素
        NSString *indexObject = [array3 objectAtIndex:2];
        NSLog(@"arr[1] = %@", indexObject);
        
#pragma mark -  数组的遍历
        //通过for虚幻来遍历
        for (int i = 0; i < array3.count; i++) {
            NSLog(@"object = %@",array3[i]);
        }
        
        /**
         *  使用OC数组的迭代器来遍历  官方推荐使用
         *
         *  @param obj  当前取出的元素
         *  @param idx  当前元素对应的索引
         *  @param stop 控制停止遍历
         *
         */
        [array3 enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if (idx == 2) {
                *stop = YES;
            }
            NSLog(@"obj = %@, idx = %lu", obj, idx);
        }];
        //以下方法 :  可以调用OC数组的方法让数组中所有的元素都执行指定的方法
//- (void)makeObjectsPerformSelector:(SEL)aSelector NS_SWIFT_UNAVAILABLE("Use enumerateObjectsUsingBlock: or a for loop instead");
//- (void)makeObjectsPerformSelector:(SEL)aSelector withObject:(nullable id)argument NS_SWIFT_UNAVAILABLE("Use enumerateObjectsUsingBlock: or a for loop instead");
        
        //数组排序
        NSArray *sortArray = @[@5,@12,@1,@8,@20,@6,@15];
        //可以调用系统的compare方法 ，这里只能调用Foundation框架中的方法,但不能调用自定义方法，
        NSArray *arr1 = [sortArray sortedArrayUsingSelector:@selector(compare:)];
        //下面方法默认升序排列
        NSArray *arr2 = [sortArray sortedArrayWithOptions:NSSortStable usingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            if (obj1 > obj2) {
                return NSOrderedDescending;
            }else if(obj1 < obj2)
            {
                return NSOrderedAscending;
            }else
            {
                return NSOrderedSame;
            }
        }];
//        NSLog(@"排序后: %@", arr2);
       
        
#pragma mark -  NSArray 与 NSString
        // 用-将所有的姓名连接起来生成一个字符串
        // 1.定义一个可变字符串保存拼接之后的结果
        NSMutableString *strM = [NSMutableString string];
        // 2.遍历数组, 取出数组中的每一个元素, 将元素添加到可变字符串中
        for (NSString *str in array3) {
            [strM appendString:str];
            // 3.每次添加完毕之后再添加一个 -
            [strM appendString:@"-"];
        }
        //3.删除最后一个 -
        [strM deleteCharactersInRange:NSMakeRange(strM.length - 1, 1)];
        NSLog(@"strM = %@", strM); //strM = zs-ls-ww
        //直接转成字符串中间拼接**
        NSString *str = [array3 componentsJoinedByString:@"**"];
        NSLog(@"str = %@", str); // str = zs**ls**ww

        // 字符串切割生成一个数组
        NSString *str1 = @"a**b**c";
        NSArray *arr = [str1 componentsSeparatedByString:@"**"];
        NSLog(@"arr = %@", arr);
        
        
#pragma mark -  NSArray 与 文件
        // 将数组写入到文件中
        BOOL flag = [arr writeToFile:@"/Users/xxx/Desktop/abc.plist" atomically:YES];
        // writeToFile只能写入数组中保存的元素都是Foundation框架中的类创建的对象, 不能写入自定义对象
        
        // 从文件中读取一个数组
        NSArray *newArray = [NSArray arrayWithContentsOfFile:@"/Users/xxx/Desktop/abc.plist"];
    
        
        
        
        
#pragma mark -  可变数组
        // 创建一个空的数组
        NSMutableArray *arrM = [NSMutableArray array];
        // 如何添加
        [arrM addObject:@"zs"];
        // 将指定数组中的元素都, 放到arrM中
        [arrM addObjectsFromArray:@[@"ls", @"ww"]];
        // 将整个数组作为一个元素添加
        [arrM addObject:@[@"aa", @"bb"]];
        // 插入元素
        [arrM insertObject:@"qwer" atIndex:1];
        
        NSRange range = NSMakeRange(2, 2);
        NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:range];
        // 插入一组数据, 指定数组需要插入的位置, 和插入多少个
        [arrM insertObjects:@[@"a", @"b"] atIndexes:set];
        // 如何删除
        [arrM removeObjectAtIndex:0];
        [arrM removeLastObject];
        [arrM removeObject:@"a"];
        // 替换元素
        [arrM replaceObjectAtIndex:1 withObject:@"c"];
        // 获取元素
        NSLog(@"%@", [arrM objectAtIndex:0]);
        // 替换
        arrM[0] = @"ZS";
        
        //不能通过@[]来创建一个可变数组, 因为@[]创建出来的是一个不可变的数组
//        NSMutableArray *arrM = @[@"qw", @"er"];
//        [arrM addObject:@"as"];
        
        
        
        
        
        
    }
    return 0;
}


















