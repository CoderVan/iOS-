##Objective-C............................ Day1
###1、类方法和对象方法的区别
    0. 对象方法以-开头
    类方法以+开头
    
    1. 对象方法必须用对象调用
    类方法必须类来调用
    
    2. 对象方法中可以直接访问属性(成员变量)
    类方法中不可以直接访问属性(成员变量)
    
    3. 类方法和对象方法可以进行相互调用
    4. 
    4.1对象方法中可以直接调用类方法
    4.2类方法中间接调用对象方法  (注意: 不建议这样使用)
    4.3类方法中可以直接调用其它类方法
    4.4对象方法中可以直接调用对象方法
 
    类方法的应用场景
    如果方法中没有使用到属性(成员变量), 那么能用类方法就用类方法
    类方法的执行效率比对象方法高
 
    类方法一般用于定义工具方法    ·字符串查找    ·文件操作    ·数据库操作  
    
####2、修改项目模板以及main函数中的内容
     
     /Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/Project Templates/Mac/Application/Command Line Tool.xctemplate/
     
     修改OC文件头部的描述信息
     /Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/File Templates/Source/Cocoa Class.xctemplate
     
     Xcode文档安装的位置1:
     /Applications/Xcode.app/Contents/Developer/Documentation/DocSets
     注意: 拷贝之前最好将默认的文档删除, 因为如果同时存在高版本和低版本的文档, 那么低版本的不会显示
     Xcode文档安装的位置2:
     /Users/你的用户名/Library/Developer/Shared/Documentation/DocSets
     如果没有该文件夹可以自己创建一个
     
     
###3、
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
  