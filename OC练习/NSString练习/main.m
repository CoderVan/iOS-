//
//  main.m
//  NSString练习
//
//  Created by CosyVan on 16/10/14.
//  Copyright © 2016年 CosyVan. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        //字符串初始化
        NSString *str = @"我是字符串";
        NSString *str1 = [NSString stringWithFormat:@"我是字符串1"];
        NSString *tempStr = @"我是字符串3";
        NSString *str2 = [NSString stringWithString:tempStr];
        
        NSLog(@"str=%@ \n str1=%@ \n str2=%@",str,str1,str2);
        
        //1字符串比较
        //1.1 比较两个字符串内容是否相同 //返回布尔值，0表示不相同，1表示相同
        BOOL flag = [str isEqualToString:str1];
        NSLog(@"flag======%i",flag);
        
        //1.2 比较两个字符串你的地址是否相同
        BOOL flag1 = (str == str1);
        NSLog(@"flag1======%i",flag1);
        
        //1.3 比较字符串的大小 compare //NSOrderedAscending  前面的小于后面的; NSOrderedSame,  两个字符串相等;NSOrderedDescending  前面的大于后面的
        [str1 compare:str1];
        //忽略大小写比较
        [str1 caseInsensitiveCompare:str2];
        
#pragma mark *** Substrings ***
//        - (NSString *)substringFromIndex:(NSUInteger)from;
//        - (NSString *)substringToIndex:(NSUInteger)to;
//        - (NSString *)substringWithRange:(NSRange)range;
        //从Index位置开始截取字符串，返回该位置后面的字符串
        NSString * sfi = [str1 substringFromIndex:1];
        NSLog(@"sfi = %@",sfi); //是字符串1
        
        //截取到Index位置的字符串，返回从0-Index位置的字符串
        NSString *sti = [str1 substringToIndex:2];
        NSLog(@"sti = %@",sti); //我是
        
        //从某个位置 截取到 某个长度的字符串 ，Range(loc , len)
        NSRange range = {1, 3};
        range.location = 1;
        range.length = 3;
        NSString *swr = [str1 substringWithRange:range];
        NSLog(@"sti = %@",swr); //是字符
        
#pragma mark *** String searching ***
//        - (BOOL)hasPrefix:(NSString *)str;
//        - (BOOL)hasSuffix:(NSString *)str;
        NSString *searchStr = @"我是字符串搜索的方法";
        
        // 判断是否以什么开头 hasPrefix
        BOOL hp = [searchStr hasPrefix:@"字符串"];
        NSLog(@"hp = %i",hp); //0
        
        // 判断是否以什么结尾
        BOOL hs = [searchStr hasSuffix:@"方法"];
        NSLog(@"hs = %i",hs); //1
        
        
//        - (BOOL)containsString:(NSString *)str NS_AVAILABLE(10_10, 8_0);
        //字符串中是否包含某个字符串
        BOOL cs = [searchStr containsString:@"字符串搜索"];
        NSLog(@"cs = %i",cs); //1
        
        
        
    }
    return 0;
}
