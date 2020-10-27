# C++ RTTI学习

## RTTI机制学习

**问题 const&&volatile 虚函数**

### 基本概念

运行时类型信息，程序在运行时获取对象的实际类型，类型可以是简单的类型和class，C++两种获取对象的实际类型的机制：

* typeid 用于获取对象的实际类型
* dynamic_cast 用于安全的进行类型转换

### Typeid运算符

查询类型信息，在头文件<typeinfo>中声明，语法形式

```C++
typeid(type)//传入变量或对象的运行时类型信息
typeid(expression)//传入表达式类型信息，表达式需要求值
```

返回值是给定参数的运行时类型信息，一个对std::type_info对象的引用，这个对象的生命期直到程序结束。使用std::type_info::name()方法可以获得类型的名称，一个字符串

### Statis_cast强制类型转换

用于良性转换

* 原有的自动类型转换
* void和其他具体类型指针之间的转换
* 有转换构造函数或者类型转换函数的类和其他类型之间的转换

不能用于无关类型之间的转换，因为这些转换是有风险的

* 不同类型指针之间的转换，导致严重的问题
* int和指针的转换，导致segmentation_fault

静态转换，指的是编译期间转换

### Dynamic_cast强制类型转换

动态转换，程序运行时借助RTTI进行类型转换，要求基类必须包含虚函数，派生类可以重写虚函数,语法：

```C++
dynamic_cast <new_type> (expression)
```

new_type和expression 同时是指针类型或者是引用类型 指针转换失败返回NULL，引用类型转换失败返回std::bad_cast