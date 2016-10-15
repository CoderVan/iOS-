>Block 翻译过来就是“块”的意思，即用来保存一段代码块，在需要的时候调用，类似抽取方法一样。苹果官方文档说Block是Objc对象。Block第一次接触感觉有点怪怪的，也难以理解，但当你掌握之后，你就会它有多奇妙，慢慢的你就会深深爱上它，这就是大神们为什么偏爱使用Block的原因。


##第四弹 Block的简单使用 点火-发射
***
>      
###Block 的定义
```
返回值类型(^block变量名)(形参列表数据类型) = ^(形参列表) {
};
调用Block保存的代码
block变量名(实参);
***************************************
//无返回值，无参数的Block
void(^log)() = ^(){
  NSLog(@"无返回值，无参数的Block");
};
log();
***************************************
//无返回值，有参数的Block
void(^sum)(int , int ) = ^(int a, int b){
   NSLog(@"sum = %d",a + b);
};
sum(1,2);
***************************************
//有返回值，有参数的Block
NSString* (^logString)(NSString *, NSString *) =  ^(NSString * str1,NSString *str2){
    return [NSString stringWithFormat:@"%@%@",str1,str2];
};
NSLog(@"%@", logString(@"我是有返回值",@"并且带参数的Block"));
```

***
> ###把Block保存成对象中的属性,在恰当的时刻调用(反向传值)
>> 1.在VC2.h文件中
 >> 
```
@interface SecondViewController : UIViewController
1.定义一个Block 
typedef void (^textChangeBlock)(NSString *text);
2. 定义一个属性保存这个Block
@property (nonatomic, copy) textChangeBlock textChangeBlock;
3. 定义一个方法触发Block
- (void)textChangeFunction:(textChangeBlock)textChangeBlock;
@end
```
>> 2.在VC2.m文件中
>> 
```
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
```
>> 3.在VC1.m文件中
>> 
```
- (IBAction)aaa:(id)sender {
_svc = [[SecondViewController alloc] init];
//防止循环引用
__weak ViewController *vc = self;
_svc.textChangeBlock = ^(NSString *str){
     vc.label.text = str;
};
[self.navigationController pushViewController:_svc animated:YES];
}
```

>    ##运行效果如下:              
![传值前](http://upload-images.jianshu.io/upload_images/651869-b1f6fd859bd14bbb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![传值后](http://upload-images.jianshu.io/upload_images/651869-663292b4c73094c2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
 


***
> ###把Block当成方法的参数使用,Block的调用在是在方法内部,在外界写block的实现(最常用)
```
- (void)testBlock:(void (^)())block
{
    block();
}
//调用
[_svc testBlock:^{
    NSLog(@"*******");
}];
```

***
> 把block当成方法的返回值(比较少用),就不举例子了

***
####Block语法就是这么神奇，多多练习吧


