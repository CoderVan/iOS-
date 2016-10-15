//
//  ViewController.m
//  Block的简单使用
//
//  Created by CosyVan on 16/10/15.
//  Copyright © 2016年 CosyVan. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@property (nonatomic, weak) UILabel *label;

@property (nonatomic, strong) SecondViewController *svc;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**对于非ARC下, 为了防止循环引用, 我们使用__block来修饰在Block中使用的对象:
     对于ARC下, 为了防止循环引用, 我们使用__weak来修饰在Block中使用的对象。原理就是:ARC中，Block中如果引用了__strong修饰符的自动变量，则相当于Block对该变量的引用计数+1。
     这一点其实是在第一点的一个小的衍生。当在block内部使用成员变量的时候，比如*/
    
//Block的定义格式
//返回值类型(^block变量名)(形参列表) = ^(形参列表) {
//};
//调用Block保存的代码
//block变量名(实参);
    
    //无返回值，无参数的Block
    void(^log)() = ^(){
      NSLog(@"无返回值，无参数的Block");
    };
    
    log();
    
    //无返回值，有参数的Block
    void(^sum)(int , int ) = ^(int a, int b){
       NSLog(@"sum = %d",a + b);
    };
    sum(1,2);
    
    //有返回值，有参数的Block
    NSString* (^logString)(NSString *, NSString *) =  ^(NSString * str1,NSString *str2){
        return [NSString stringWithFormat:@"%@%@",str1,str2];
    };
    NSLog(@"%@", logString(@"我是有返回值",@"并且带参数的Block"));
    
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 80, 200, 30)];
    label.text = @"注意看我的显示的文字";
    label.backgroundColor = [UIColor lightGrayColor];
    label.textColor = [UIColor whiteColor];
    self.label = label;
    [self.view addSubview:label];
    
    
    
    
}
- (IBAction)aaa:(id)sender {
    
    _svc = [[SecondViewController alloc] init];
    //防止循环引用
    __weak ViewController *vc = self;
    _svc.textChangeBlock = ^(NSString *str){
         vc.label.text = str;
    };
    
    [_svc testBlock:^{
        NSLog(@"*******");
    }];
    
    [self.navigationController pushViewController:_svc animated:YES];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
