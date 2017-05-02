//
//  DrawView.m
//  iOS常用功能
//
//  Created by CosyVan on 2016/11/11.
//  Copyright © 2016年 Aimmy. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

- (void)drawRect:(CGRect)rect
{
    //绘制文字
    
    NSString *str = @"qewrwersf";
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSForegroundColorAttributeName] = [UIColor orangeColor];
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    // 不会换行
    [str drawAtPoint:CGPointZero withAttributes:attr];
    // 可以换行
    [str drawInRect:rect withAttributes:nil];
}

@end
