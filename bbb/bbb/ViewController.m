//
//  ViewController.m
//  bbb
//
//  Created by JefferyWan on 2017/5/2.
//  Copyright © 2017年 pansheng. All rights reserved.
//

#import "ViewController.h"
#import "TestCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *table  = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    
    [table registerNib:[UINib nibWithNibName:NSStringFromClass([TestCell class]) bundle:nil] forCellReuseIdentifier:@"TestCell"];
}


#pragma mark - TableView 代理和数据源方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *const cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    if (indexPath.row == 2) {
        TestCell *cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([TestCell class]) owner:nil options:nil].lastObject;
//        [cell btnClicked:^(UIButton *btn) {
//            NSLog(@"************");
//        }];
        
//        [cell testBlock:^{
//            NSLog(@"************");
//        }];
        
        cell.aaa = ^(){
            NSLog(@"************");
        };
        return cell;
    }
    cell.textLabel.text = [NSString stringWithFormat:@"--->%ld行",(long)indexPath.row];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2) {
        return 100;
    }
    return 44;
}



@end
