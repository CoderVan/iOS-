##协议

```
@protocol SomeProtocol <NSObject>
// 1.协议只能声明方法, 不能声明属性
//{
//    int  _age;
//}

// 方法声明列表
// 注意: 如果没有使用任何关键字修饰协议中的方法, 那么该方法默认就是required的
@required
// 如果协议中的方法是@required的, 而遵守协议的类又没有实现该方法, 那么会报一个警告
- (void)playFootball;
@optional // 可选
// 如果协议中的方法是@optional的, 而遵守协议的类又没有实现该方法, 那么不会报警告
- (void)playBasketball;
- (void)playBaseball;
// 注意:@required和@optional仅仅使用程序员之间交流, 并不能严格的控制某一个遵守该协议的类必须要实现该方法, 因为即便不是实现也不会报错, 只会报一个警告
@end
4.OC中的协议又可以遵守其它协议, 只要一个协议遵守了其它协议, 那么这个协议中就会自动包含其它协议的声明
3.在OC中一个类可以遵守1个或多个协议
注意: OC中的类只能有一个父类, 也就是说OC只有单继承
2.父类遵守了某个协议, 那么子类也会自动遵守这个协议

```

##代理模式设计
```
协议的编写规范:
 1.一般情况下, 当前协议属于谁, 我们就将协议定义到谁的头文件中
 2.协议的名称一般以它属于的那个类的类名开头, 后面跟上protocol或者delegate
 3.协议中的方法名称一般以协议的名称protocol之前的作为开头
 4.一般情况下协议中的方法会将触发该协议的对象传递出去
 
 5.一般情况下一个类中的代理属于的名称叫做 delegate
 
 6.当某一个类要成为另外一个类的代理的时候, 
   一般情况下在.h中用@protocol 协议名称;告诉当前类 这是一个协议.
    在.m中用#import真正的导入一个协议的声明
```
```
1、定义协议
@protocol InitProtocol <NSObject>
- (void)personFindHourse:(Person *)person;
@end
2、用id类型存储改协议，明名为delegate
@property (nonatomic, strong) id<PersonProtocol> delegate;
3、方法内部
// 通知代理帮他找房子
 if ([self.delegate respondsToSelector:@selector(personFindHourse:)]) {
        [self.delegate personFindHourse:self];
    }
4、在相应类继承该协议，并实现该代理
```
































