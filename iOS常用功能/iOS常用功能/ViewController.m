//
//  ViewController.m
//  iOS常用功能
//
//  Created by CosyVan on 2016/11/11.
//  Copyright © 2016年 Aimmy. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"
#import "ProgressView.h"

@interface ViewController ()
@property (nonatomic, strong) CustomView *customView;
@property (weak, nonatomic) IBOutlet ProgressView *ProgressView;

//@property (nonatomic, weak) UISlider *slider;

@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *progress;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.customView = [[CustomView alloc] initWithFrame:CGRectMake(20, 100, 300, 300)];
//    self.customView.backgroundColor = [UIColor grayColor];
//    [self.view addSubview:self.customView];
//    
//    UISlider *slider = [[UISlider alloc] init];
//    slider.frame = CGRectMake(20, 460, 300, 30);
//    slider.minimumValue = 0.0;
//    slider.maximumValue = 100.0;
//    [slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
//    self.slider = slider;
//    [self.view addSubview:slider];
    
    
    
    
}

- (IBAction)sliderChange:(UISlider *)sender {
    self.progress.text = [NSString stringWithFormat:@"%.2f%%",sender.value];
    _ProgressView.progress = sender.value;
}


- (void)sliderValueChanged:(UISlider*)slider
{
    NSLog(@"%.2f",slider.value);
}

//CABasicAnimation
/**
 CABasicAnimation基础动画，通过设定起始点，终点，时间，动画会沿着你这设定点进行移动。可以看做特殊的CAKeyFrameAnimation
 CAKeyframeAnimation关键帧动画，可定制度比CABasicAnimation高，也是本系列的接下来的内容
 CAAnimationGroup组动画，支持多个CABasicAnimation或者CAKeyframeAnimation动画同时执行
 */
/** 设定动画属性
 *  duration 动画的时长
 *  repeatCount 重复的次数 不停重复设置 HUGE_VALF  
 *  repeatDuration 设置动画的时间，在改时间内动画一直重复执行
 *  beginTime 动画开始的时间
 *  timimgFunction 设置动画的速度变化
 * autoreverses 动画结束是否执行逆动画
 *  fromeValue 改变属性的起始值
 *  toValue 改变动画的结束的值
 * byValue 改变属性相同起始值的该变量
 */
- (void)caBasicAnimation
{
    UIView *tview = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 100, 100)];
    tview.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:tview];
    
    CABasicAnimation *transformAnima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    transformAnima.fromValue = @(M_PI_2);
    transformAnima.toValue = @(M_PI);
    transformAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transformAnima.autoreverses = YES;
    transformAnima.repeatCount = HUGE_VALF;
    transformAnima.beginTime = CACurrentMediaTime() + 2;
    //防止动画结束后回到初始状态只需设置removedOnCompletion、fillMode两个属性就可以了
    transformAnima.removedOnCompletion = NO;
    transformAnima.fillMode = kCAFillModeForwards;
    [tview.layer addAnimation:transformAnima forKey:@"A"];
}


/**
 *  UIBezierPath可以创建基于矢量的路径，此类是Core Graphics框架关于路径的封装。使用此类可以定义简单的形状，如椭圆、矩形或者有多个直线和曲线段组成的形状等。
 */
- (void)bezierpath
{
    
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(100, 50)];
    [path addLineToPoint:CGPointMake(20, 70)];
    [path addLineToPoint:CGPointMake(180, 70)];
    [path closePath];
    
    path.lineWidth = 1.5;
    UIColor *fillColor = [UIColor yellowColor];
    [fillColor set];
    [path fill];
    
    // 设置画笔颜色
    UIColor *strokeColor = [UIColor blueColor];
    [strokeColor set];
    // 根据我们设置的各个点连线
    [path stroke];
}

// 图形上下文
/**
 *  保存绘图信息 绘图的状态
 * 决定绘制的输出的目标（画到那个地方）
 *
 */
- (void)contexRef
{
   
}






















@end
