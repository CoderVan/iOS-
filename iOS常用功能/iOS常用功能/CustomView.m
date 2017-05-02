//
//  CustomView.m
//  iOS常用功能
//
//  Created by CosyVan on 2016/11/11.
//  Copyright © 2016年 Aimmy. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (void)drawRect:(CGRect)rect
{

}

- (void)drawYuan
{
    //    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, 100, 80) cornerRadius:5.0];
    
    /**
     *  // 画圆弧
     *  ArcCenter 圆心
     *  radius 半径
     *  startAngle 弧度
     * clockwise 方向  YES 表示顺时针
     */
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(80, 80) radius:80 startAngle:0 endAngle:M_PI /2 clockwise:YES];
    [path addLineToPoint:CGPointMake(80, 80)];
    // 关闭路径
    //    [path addLineToPoint:CGPointMake(160, 80)];
    [path closePath];
    //    [path stroke];
    //fill 只能填充封闭的空间，默认会关闭路径
    [path fill];
}

- (void)drawQuad
{
    // 绘制曲线
    
    //获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 画曲线 描述路径
    //设置起点
    CGContextMoveToPoint(ctx, 30, 250);
    
    //cpx 控制曲线点的Y值
    CGContextAddQuadCurveToPoint(ctx, 60, 60, 250, 250);
    //
    
    //渲染
    CGContextStrokePath(ctx);
}

- (void)drawBezierLine
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(200, 200)];
    path.lineWidth = 5.0;
    [[UIColor redColor] set];
    [path stroke];
    
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(0, 200)];
    [path1 addLineToPoint:CGPointMake(250, 10)];
    path1.lineWidth = 5.0;
    [[UIColor orangeColor] set];
    [path1 stroke];
}

- (void)drawLineD
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctx, 50, 100);
    // 添加线到某个点
    CGContextAddLineToPoint(ctx, 100, 100);
    //默认下一条线的起点就是上一条线的 终点
    CGContextAddLineToPoint(ctx, 100, 200);
    //设置  描边颜色
    [[UIColor orangeColor] setStroke];
    // 设置线宽
    CGContextSetLineWidth(ctx, 10.0);
    //设置连接样式
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    //设置顶角样式
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
    CGContextStrokePath(ctx);
}

- (void)drawLineC
{
    //1. 获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //2. 描述路径 直接给上下文添加路径
    // 设置起点
    CGContextMoveToPoint(ctx, 50, 50);
    // 添加线到某个点
    CGContextAddLineToPoint(ctx, 100, 100);
    
    //3. 渲染
    CGContextStrokePath(ctx);
}

- (void)drawLine
{
    //1. 获取图形上下文
    // ,目前所用的上下文UIGraphics
    // CGContextRef Ref: 引用作用
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //2. 描述路径
    // 创建路径
    CGMutablePathRef path = CGPathCreateMutable();
    // 设置起点
    /**
     *  path: 哪个路径设置起点
     */
    CGPathMoveToPoint(path, NULL, 50, 50);
    //添加一条线到某个点
    CGPathAddLineToPoint(path, NULL, 200, 200);
    
    //3. 吧枯井添加到上下文
    CGContextAddPath(ctx, path);
    
    //4. 渲染上下文到View上
    CGContextStrokePath(ctx);
}
@end
