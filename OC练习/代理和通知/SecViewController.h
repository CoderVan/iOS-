//
//  SecViewController.h
//  OC练习
//
//  Created by CosyVan on 16/10/16.
//  Copyright © 2016年 CosyVan. All rights reserved.
//

#import <UIKit/UIKit.h>
//第一步：定义一个协议
@protocol SecViewControllerDelegate <NSObject>
// 第二部：声明需要做的事的方法
@required   //必须实现的方法
- (void)changeBackViewColor:(UIColor *)color;

@optional   //可选实现的方法
- (void)hadText:(NSString *)text;

@end


@interface SecViewController : UIViewController
// 第三步：用id类型存储改协议，命名为delegate（这里最好用weak类型）
@property (nonatomic, weak) id<SecViewControllerDelegate> delegate;
@end
