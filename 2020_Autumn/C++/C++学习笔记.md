 # C++学习笔记

## Objects,Type,and Values

### Type

变量的类型决定了：

（1）在内存中的存储大小

（2）合法操作

cin>>读取一个字符串，直到出现空白符，可以连续读取多个字符

输入值需要合法，与变量类型一致

操作符重载，可以让同一操作符表示不同含义

### Frequent Type

标准类型string，vector，complex

内建类型char，int

### 声明&&initialization

初始化从类型描述开始，赋值不是

### Object

对象是一块具有某种类型的内存空间

变量是命名的对象

声明用来命名一个对象

## Computation

### What is a Program look like?

Input+Computation+Output

**Expression**

###  Vector

define：Vector<T>定义序列

存储相同数据类型的数据

v.push_back():add an element with the value 

## Errors

### Error_type

Compile_time errors

Link_time errors

Run_time errors

logic errors

### Check the Input

match the number of parameter and Type

### Report the error

return an error code

return an error flag

定义异常类，try-catch语句，throw出错误

分离错误检查和错误处理

### 向量操作符，地址溢出

## 类及其基本概念

### 结构体与类

类=数据成员+函数成员

#### 构造函数

构造函数的名称和类同名

构造函数告诉我们某个类型的变量如何被初始化

没有返回值

### 文件包含include

双引号从当前目录开始寻找库

<>按照环境配置的路径

### 名字空间

可以使用相同的函数名以及标识符

### private && public

目的：控制对成员变量的访问

默认private

私有部分定义的函数不能直接调用

### 类成员函数

定义格式 返回值类型 类名：：函数名（parameter）

类方法可以访问private数据成员

如果涉及私有变量的非法访问，在编译时就会报错

#### 内联方法

定义处于类声明中的函数

在类定义之外定义函数，并设置为内联函数，方法是加上incline关键字

内联函数需要在每个使用它的文件中均加以定义

#### 方法使用哪个对象

#### 类的构造函数和析构函数

默认编译器生成的构造函数是一个空的函数，在未定义任何构造函数时自动生成

提供构造函数，但是类型不匹配，导致报错

析构函数没有参数

函数的参数表可以初始化

const关键字定义的类，它的内容不能修改

#### const成员函数

类方法不修改对象，则应该在函数定义后面加上关键字const，表示不会修改

### this指针

指向调用成员函数的对象

*this可以通过指针得到对象，修改this就是修改对象本身

### 对象数组

对象数组需要利用构造函数初始化，初始化和一般数组相同

### 类作用域

定义成员函数，需要用到作用域解析运算符

声明一个类只是描述了对象的形式，并未分配存储空间

定义常量：加上关键字static

或者采用枚举类型 enum

#### 作用域内枚举

新的枚举语法，作用域为类

作用域：全局作用域，类作用域，局部作用域，语句作用域

### 函数的传值和传引用

尽量少使用传引用参数

const引用，可以传递比较大的对象

#### 引用的概念

引用在某种意义上是对象的别名

对引用的操作其实就是对对象的操作

无法通过const引用修改一个对象，引用需要初始化

### 名字空间

名字空间：：引用

::用于指定使用的名字空间名称和对象名称

名字空间让编译器将对象编译为一个不同的id

#### using声明

using std::cout;  //when I say cout,I mean std::cout

直接使用using namespace

### 类的实现与接口

自定义类型

成员变量默认私有

#### 结构&&类

结构：成员可以任意取值的数据结构，但是对于结构成员变量修改不利，过于随意

事实上，结构体中仍然可以定义和使用private关键字定义的变量，唯一不同是默认不同，class默认private，但是struct默认public

构造函数不能返回值但是可以抛出异常

#### 枚举类型

指定一个值的集合

一个枚举量表示一个整数，但是合法的整数可能并不表示一个合法的枚举量

常量列表类型

##### 在类中的枚举类型

枚举类型存在定义域，它的定义域和枚举类型相同

在类中定义的枚举变量，需要注意的是，它的作用域仅仅集中在类中

#### const类型

const成员函数：不能在函数体中修改成员变量

用const在定义类时定义，则无论通过何种方式均无法修改任何类中的数据成员

#### 类的基本操作

空的构造函数

拷贝构造函数、拷贝复制函数需要拷贝每一个成员

析构函数，成员空间被回收时调用

#### 接口和辅助函数

##### 保持类接口函数public最小化

简化理解

简化调试

简化维护

##### 保持类接口简洁，增加额外的辅助函数

类外的非成员函数

运算符重载

#### 运算符重载

重载已经存在的运算符，不能定义新的运算符

定义的运算符和已有的C++语法保持一致（操作数个数）

运算符应该保持原有含义

## Input/output Streams

### 讨论C++ I/O读写流的基本机制，包括

* 基本的I/O概念

* 文件

  * 打开
  * 关闭

* I/O错误

* 读取单个整数

  

### 输入/出流模型

#### 输出流

* 将不同的类型转换为字符序列
* 将字符发送到某处（某个变量的存储空间）

#### 输入流

* 将字符序列转换为不同类型的值
* 从某处获得字符

#### 文件

永久存储设备上的字节序列

文件名+拓展名

I/O system负责将文件与内存之间数据移动

##### 读取一个文件

参数：文件名，打开模式

读出文件内容

关闭文件

##### 写一个文件

参数：文件名，打开模式

写入对象

关闭文件

eg：ifstream对象定义一个文件class，构造函数需要一个字符串

### 读写的方向

```C++
>>//从一个输入流中读(ist>>)，输入
<<//写入到一个输出流(ost<<)，输出
```

### I/O错误

#### 错误来源？

#### 四类错误状态

* good() //operation succeed
* eof() //hit the end of input
* fail() //something unexpected happened
* bad() //something unexpected and serious happened, and it can't be recovered

```txt
结束字符——状态为fail
格式错误——状态为fail
文件结尾——状态为eof
硬盘格式错误——状态为bad
错误状态是iostream中的对象，可以直接访问.

```

### I/O类型

* 单独值 
* 流
* 图形和GUI
* 文本（面向行，单独的字符，类型驱动、格式化）
* 数字（整数，浮点数，自定义类型）

hex——十六进制 oct——八进制

showbase显示输出的前缀

#### 输出浮点数

general：自动选择最佳的输出格式

scientific：尾数+指数表示

fixed：定点表示，没有指数

setprecision(n):设置精度

setw(n):设置输出宽度，输出不会进行截断以满足输出的域宽度

#### 文件

ifstream打开文件为读模式

ofstream打开文件为写模式

打开模式：

| 替代选项 ios_base:: | 语义                     |
| ------------------- | ------------------------ |
| app                 | append                   |
| ate                 | open and seek to the end |
| binary              | binary-mode              |
| in                  | reading                  |
| out                 | writing                  |
| trunc               | the file to 0-length     |

ifstream/ofstream name(filename,iosbase:open_mode)

fstream name(filename,iosbase:mode1|iosbase:mode2) 可以同时以不同打开方式打开

使用二进制I/O，不能使用>>和<<操作符

read or write method\

面向行的输入 使用>>而不是getline

## A Display model

### display model

* objects(many types of shapes) are attached to a windows
* Every object in the windows,display engine call the display command
* objects include many staffs
* buld the connection between object and screen graphics

### Graphics/GUI library





