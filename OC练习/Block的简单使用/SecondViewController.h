//
//  SecondViewController.h
//  OC练习
//
//  Created by CosyVan on 16/10/15.
//  Copyright © 2016年 CosyVan. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SecondViewController : UIViewController



typedef void (^textChangeBlock)(NSString *text);


@property (nonatomic, copy) textChangeBlock textChangeBlock;

- (void)textChangeFunction:(textChangeBlock)textChangeBlock;

- (void)testBlock:(void(^)())block;

@end
