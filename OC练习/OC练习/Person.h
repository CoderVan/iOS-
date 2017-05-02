//
//  Person.h
//  OC练习
//
//  Created by CosyVan on 2016/11/10.
//  Copyright © 2016年 CosyVan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
// 当编译器遇到@property的时候，会自动展开成个getter  setter的生成

@property int age;

@property int no;

@end
