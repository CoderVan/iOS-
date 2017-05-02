//
//  PicMarkViewController.m
//  iOS常用功能
//
//  Created by CosyVan on 2016/11/12.
//  Copyright © 2016年 Aimmy. All rights reserved.
//

#import "PicMarkViewController.h"
#import "UIImage+AIImage.h"

@interface PicMarkViewController ()
@property (nonatomic, assign) CGPoint startP;
@property (nonatomic, weak) UIView *clipView;
@property (nonatomic, weak) UIImageView *imgView ;
@end


@implementation PicMarkViewController

- (UIView *)clipView
{
    if (_clipView == nil) {
        UIView *view = [[UIView alloc] init];
        _clipView = view;
        view.backgroundColor = [UIColor blackColor];
        view.alpha = 0.5;
        
        [self.view addSubview:view];
        
    }
    return _clipView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    _imgView = imgView;
    [self.view addSubview:imgView];
    imgView.image = [UIImage imageNamed:@"3.jpg"];
    
//    UIImage *screenImage = [UIImage imageWithCaptureView:self.view];
    UIImage *screenImage = [UIImage imageWithResizedImage:@"3.jpg"];
    NSData *imgData = UIImagePNGRepresentation(screenImage);
    
    [imgData writeToFile:@"/Users/CosyVan/Desktop/screenImage.png" atomically:YES];
    
//
//    
//    //给控制器创建view添加手势
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
//    [self.view addGestureRecognizer:pan];
    
    
//    imgView.image = [UIImage imageWithCaptureView:self.view];
    
//   UIImage *img =  [self screenClip];
}

- (void)pan:(UIPanGestureRecognizer *)pan
{
    CGPoint endA = CGPointZero;
    if (pan.state == UIGestureRecognizerStateBegan) {
        
        _startP = [pan locationInView:self.view];
    } else if (pan.state == UIGestureRecognizerStateChanged){
         endA = [pan locationInView:self.view];
        CGFloat w = endA.x -  _startP.x;
        CGFloat h = endA.y - _startP.y;
        
        CGRect clipRect = CGRectMake(_startP.x, _startP.y, w, h);
        self.clipView.frame = clipRect;
        
    } else if (pan.state == UIGestureRecognizerStateEnded) {
        
        
        UIGraphicsBeginImageContextWithOptions(_imgView.bounds.size, NO, 0);
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:_clipView.frame];
        [path addClip];
        
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        [_imgView.layer renderInContext:ctx];
        
        _imgView.image = UIGraphicsGetImageFromCurrentImageContext();
        
        
        UIGraphicsEndImageContext();
        
        [self.clipView removeFromSuperview];
        self.clipView = nil;
    }
}

//- (UIImage *)imageCapture
//{
//}

- (void)screenClip
{
    //开启位图上下文
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
    //获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //把控件上的图层渲染到上下文
    [self.view.layer renderInContext:ctx];
    
    UIImage *screenImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
    NSData *imgData = UIImagePNGRepresentation(screenImage);
    
    [imgData writeToFile:@"/Users/CosyVan/Desktop/screenImage.png" atomically:YES];
    

}

- (void)picClip
{
    UIImage *image = [UIImage imageNamed:@"zrx7.jpg"];
    
    CGFloat imageWH = image.size.height;
    
    // 设置圆环
    CGFloat border = 2;
    CGFloat ovalW = imageWH + 2 * border;
    
    
    
    //开启位图上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(ovalW, ovalW), NO, 0);
    //设置图形的裁剪区域 正切与图片
    // 创建一个圆形的路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, ovalW, ovalW)];
    
    [[UIColor redColor] set];
    [path fill];
    
     UIBezierPath *path1 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(border, border, image.size.width, image.size.height)];
    //把路径设置为裁剪区域
    [path1 addClip];
    
    //绘制图片
    [image drawAtPoint:CGPointZero];
    
    // 从上下文获取图片
    UIImage *imgClip = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
    NSData *imgData = UIImagePNGRepresentation(imgClip);
    
    [imgData writeToFile:@"/Users/CosyVan/Desktop/imgClip1.png" atomically:YES];
    
    

}

// 图片裁剪
- (void)picCut
{
    UIImage *image = [UIImage imageNamed:@"zrx7.jpg"];
    
    
    
    
    //开启位图上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    //设置图形的裁剪区域 正切与图片
    // 创建一个圆形的路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    //把路径设置为裁剪区域
    [path addClip];
    
    //绘制图片
    [image drawAtPoint:CGPointZero];
    
    // 从上下文获取图片
    UIImage *imgClip = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
    NSData *imgData = UIImagePNGRepresentation(imgClip);
    
    [imgData writeToFile:@"/Users/CosyVan/Desktop/imgClip.png" atomically:YES];
    

    
}

// 图片水印
- (void)picWaterMark
{
    UIImage *image = [UIImage imageNamed:@"3.jpg"];
    //位图上下文 跟view无关，不需要再drawRect上
    //size:位图上下文的尺寸
    //opaque: 不透明度 YES 表示不透明  通常用NO
    // scale: 同场不需要缩放上下文 取值为0 表示不缩放
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    //把图片画上去
    [image drawAtPoint:CGPointZero];
    
    //绘制文字到图片
    NSString *str = @"Jeffery";
    NSMutableDictionary *arrt = [NSMutableDictionary dictionary];
    arrt[NSFontAttributeName] = [UIFont systemFontOfSize:20.0];
    [str drawInRect:CGRectMake(150, 70, 50, 30) withAttributes:arrt];
    
    // 从上下文获取图片
    UIImage *imageWater = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
    NSData *imgData = UIImagePNGRepresentation(imageWater);
    
    [imgData writeToFile:@"/Users/CosyVan/Desktop/imgWater.png" atomically:YES];

}
@end
