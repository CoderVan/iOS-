//
//  TestCell.h
//  bbb
//
//  Created by JefferyWan on 2017/5/2.
//  Copyright © 2017年 pansheng. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^btnClicked)(UIButton *btn);

typedef void(^aaa)();

@interface TestCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *sda;

@property(nonatomic,copy) btnClicked btnClicked;

@property(nonatomic,strong) void(^test)();
- (void)testBlock:(void(^)(void))test;

@property(nonatomic,strong) aaa aaa;


- (void)btnClicked:(btnClicked) btnClicked;


@end
