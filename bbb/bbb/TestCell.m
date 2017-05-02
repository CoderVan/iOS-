//
//  TestCell.m
//  bbb
//
//  Created by JefferyWan on 2017/5/2.
//  Copyright © 2017年 pansheng. All rights reserved.
//

#import "TestCell.h"

@implementation TestCell


- (IBAction)btnclick:(id)sender {
    
//    if (self.btnClicked != nil) {
//        self.btnClicked(sender);
//    }
//    if (self.test != nil) {
//        self.test();
//    }
    
    if (self.aaa != nil) {
        self.aaa();
    }
}

- (void)btnClicked:(btnClicked)btnClicked
{
    self.btnClicked = btnClicked;
}


- (void)testBlock:(void (^)(void))test
{
    self.test = test;
}

@end
