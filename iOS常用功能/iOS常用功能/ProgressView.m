//
//  ProgressView.m
//  iOS常用功能
//
//  Created by CosyVan on 2016/11/11.
//  Copyright © 2016年 Aimmy. All rights reserved.
//

#import "ProgressView.h"

@implementation ProgressView

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    
    //    [self drawRect:self.bounds];
    //重绘
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGPoint center =  CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
    CGFloat radius = rect.size.width * 0.3;
    
    CGFloat endA = -M_PI_2 + _progress/100 * M_PI * 2;
     NSLog(@"%.2f",endA);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:-M_PI_2 endAngle:endA clockwise:YES];
    
    [path stroke];
}

@end
