//
//  SecViewController.m
//  OC练习
//
//  Created by CosyVan on 16/10/16.
//  Copyright © 2016年 CosyVan. All rights reserved.
//

#import "SecViewController.h"

@interface SecViewController ()

@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"第二页";
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(50, 80, 60, 30);
    back.titleLabel.text = @"返回";
    back.backgroundColor = [UIColor brownColor];
    [back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:back];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ChangeBack" object:@"参数"];
    
}

- (void)back{
    [self.delegate changeBackViewColor:[UIColor orangeColor]];
    [self.delegate hadText:@"text-----text"];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)change {
    
}



@end
