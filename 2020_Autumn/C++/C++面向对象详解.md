# C++面向对象详解

## created by Haihan Gao

## 面向对象的基本概念

### C++类定义和定义C++对象

### C++数据成员的访问

### 其他基本概念

#### 类成员函数

成员函数定义在类定义内部，成为内联函数

成员函数定义在类的外部，使用范围解析运算符::

```C++
return_value_type classname::function_name(parameter table){
    function body;
    return xxx;
}
```

成员函数的调用直接使用.运算符

#### 类访问修饰符

##### public

在类的外部可以访问，不需要使用任何成员函数来设置和获取public变量的值

##### private

私有成员变量在类的外部不能访问与查看，只有类和友元函数可以访问私有成员

在私有区域定义数据，在共有区域定义相关的函数

##### protected

保护成员在派生类中可以访问

##### 三种继承方式

#### 类的构造函数与析构函数

##### 构造函数

构造函数在创建类的新对象时执行

构造函数与类的名称完全相同，没有返回值

初始化列表代替赋值

##### 析构函数

在跳出函数之前释放空间

#### 拷贝构造函数

作用：特殊的构造函数，创建对象利用同一类中之前创建的对象来初始化新创建的变量

作用场景：

* 使用该函数复制某个对象
* 复制对象作为参数传递
* 复制对象，并从函数返回对象

```C++
classname (const classname &obj){
    //body of copy function
}
```

#### 友元函数

类的友元函数定义在类外部，但是有权访问所有的private和protected成员

友元函数 && 友元类

### C++继承

什么是继承？

继承是利用已定义的类定义未知类

#### 基类和派生类

一个类可以派生自多个类，从多个类继承数据和函数。定义一个派生类，使用一个派生类列表指定基类，基类是father，派生类是son

命名形式

```C++
class derived_class: access_specifier base_class
```

access_specifier:private public protected

未使用access-specifier则默认为private

* public:

  | base_member | derived_class |
  | ----------- | ------------- |
  | public      | public        |
  | privated    | privated      |
  | protected   | protected     |

* protected

  | base_member | derived_class |
  | ----------- | ------------- |
  | public      | protected     |
  | protected   | protected     |
  | private     | private       |

* private

  | base_member              | derived_class |
  | ------------------------ | ------------- |
  | public protected private | private       |

  派生类可以访问基类中所有非私有成员，基类成员如果不想被派生类的成员函数访问，应当在基类中声明为private
  
  派生类继承了所有继承的基类方法，除了：
  
  * 基类的构造函数，析构函数，和拷贝构造函数
  * 基类的重载运算符
  * 基类的友元函数
  
  
  
  ##### 继承类型
  
  一个类派生自基类，该基类可以被继承为public，protected或private几种类型，继承类型通过访问修饰符access-specifier实现
  
  * 公有继承：一个类派生自公有基类时，基类的公有成员也是派生类的公有成员，基类的保护成员也是派生类的保护成员，基类的私有成员不能被派生类直接访问，但是可以通过调用基类的公有和保护成员来访问
  * 保护继承：当一个类派生自保护基类时，基类的公有和保护成员将成为派生类的保护成员
  * 当一个类派生自私有基类时，基类的公有和保护成员将成为派生类的私有成员
  * ps：protect类型，与私有类型类似，但是保护类型在派生类中可以访问
  
  