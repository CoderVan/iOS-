//
//  SecondViewController.m
//  OC练习
//
//  Created by CosyVan on 16/10/15.
//  Copyright © 2016年 CosyVan. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
}

- (void)textChangeFunction:(textChangeBlock)textChangeBlock
{
    self.textChangeBlock = textChangeBlock;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.textChangeBlock != nil) {
        self.textChangeBlock(@"我是第二个界面的字符串");
    }
}

- (void)testBlock:(void (^)())block
{
    block();
}


@end
