//
//  Person.m
//  OC练习
//
//  Created by CosyVan on 2016/11/10.
//  Copyright © 2016年 CosyVan. All rights reserved.
//

#import "Person.h"

@implementation Person

//@synthesize 会自动生成getter 和setter 方法 的实现

//@synthesize 默认会去访问跟 变量名 相同名字的变量
// 如果找不到同名的变量，会动生成一个私有的同名变量

@synthesize age;

// 代表get set 回去访问_age
@synthesize age = _age;

@end
