//
//  ViewController.m
//  代理和通知
//
//  Created by CosyVan on 16/10/16.
//  Copyright © 2016年 CosyVan. All rights reserved.
//

#import "ViewController.h"
#import "SecViewController.h"

@interface ViewController () <SecViewControllerDelegate>
@property (nonatomic, strong) SecViewController *svc ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"第一页";
    UIBarButtonItem *barBtn1=[[UIBarButtonItem alloc] initWithTitle:@"下一页" style:UIBarButtonItemStylePlain target:self action:@selector(next)];
    self.navigationItem.rightBarButtonItem=barBtn1;
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(change:) name:@"ChangeBack"  object:nil];
    
}

- (void)change:(NSNotification *)notification {
    NSLog(@"%@",notification.object);
}


- (void)changeBackViewColor:(UIColor *)color
{
    self.view.backgroundColor = color;
}

- (void)hadText:(NSString *)text
{
    NSLog(@"%@",text);
}

- (void)next
{
    SecViewController *svc = [[SecViewController alloc] init];
    svc.delegate = self;
    [self.navigationController pushViewController:svc animated:true];
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:@"ChangeBack" ];
    
}
@end
