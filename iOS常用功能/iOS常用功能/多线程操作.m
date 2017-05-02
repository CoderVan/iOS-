//
//  多线程操作.m
//  iOS常用功能
//
//  Created by CosyVan on 2016/11/11.
//  Copyright © 2016年 Aimmy. All rights reserved.
//

#import <Foundation/Foundation.h>


//    NSOperation和NSOperationQueue是苹果公司对 GCD 的封装，完全面向对象
/**
 *NSOperation 只是一个抽象类，所以不能封装任务。但它有 2 个子类用于封装任务。分别是：NSInvocationOperation 和 NSBlockOperation
 */
//- (void)nsoperation
//{
//    NSInvocationOperation
//        NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(run) object:nil];
//        [operation start];
//    
//    NSBlockOperation
//        NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
//             NSLog(@"%@", [NSThread currentThread]);
//        }];
//        //添加多个Block
//        for (NSInteger i = 0; i < 5; i++) {
//            [operation addExecutionBlock:^{
//                NSLog(@"第%ld次：%@", i, [NSThread currentThread]);
//            }];
//        }
//    
//        //2.开始任务
//        [operation start];
//    
//        NSOperationQueue
////    主队列
//        NSOperationQueue *queue = [NSOperationQueue mainQueue];
//    
////    1.创建一个其他队列
//        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
////    队列添加任务
//        [queue addOperation:operation];
//}

//队列组可以将很多队列添加到一个组里，这样做的好处是，当这个组里所有的任务都执行完了，队列组会通过一个方法通知我们
//- (void)queueGroup
//{
//    //1. 创建队列组
//    dispatch_group_t group = dispatch_group_create();
//    //2. 创建队列
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//    
//    //3.多次使用队列组的方法执行任务, 只有异步方法
//    //3.1.执行3次循环
//    dispatch_group_async(group, queue, ^{
//        for (NSInteger i = 0; i < 3; i++) {
//            NSLog(@"group-01 - %@", [NSThread currentThread]);
//        }
//    });
//
//    //3.2.主队列执行8次循环
//    dispatch_group_async(group, dispatch_get_main_queue(), ^{
//        for (NSInteger i = 0; i < 8; i++) {
//            NSLog(@"group-02 - %@", [NSThread currentThread]);
//        }
//    });
//    
//    //3.3.执行5次循环
//    dispatch_group_async(group, queue, ^{
//        for (NSInteger i = 0; i < 5; i++) {
//            NSLog(@"group-03 - %@", [NSThread currentThread]);
//        }
//    });
//    
//    //4.都完成后会自动通知
//    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
//        NSLog(@"完成 - %@", [NSThread currentThread]);
//    });
//}
//
//
//
//- (void)GCDFunction
//{
//    //获取主线程队列 dispatch_get_main_queue()
//        //dispatch_queue_t queue =  dispatch_get_main_queue();
//    //获取全局子线程队列
//    dispatch_queue_t queue =  dispatch_get_global_queue(0, 0);
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)),queue, ^{
//        NSLog(@"---%@",[NSThread currentThread]);
//    });
//    
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        
//    });
//}

//- (void)queue
//{
//    /**
//     *  创建队列
//     *  @param "abc" 队列标记
//     *  @param 0     DISPATCH_QUEUE_CONCURRENT 并行 DISPATCH_QUEUE_SERIAL 串行
//     */
//    dispatch_queue_t queue =  dispatch_queue_create("abc", DISPATCH_QUEUE_CONCURRENT);
//    //异步执行，创建队列
//    dispatch_async(queue, ^{
//        NSLog(@"---%@",[NSThread currentThread]);
//    });
//}
//
//- (void)nstheard
//{
//    // 手动启动
//    NSThread *theard = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
//    [theard start];
//    //创建并自动启动
//    [NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:nil];
//}
//
//- (void)run
//{
//    NSLog(@"run--");
//}

/**
 *  互斥锁 ：给需要同步的代码块加一个互斥锁，就可以保证每次只有一个线程访问此代码块。
 @synchronized(self) {
 //需要执行的代码块
 }
 */
