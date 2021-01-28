# Group2 Readme

## 选题

数据流分析

## 测试

### 使用助教的框架

可以采取助教文档中给出的教程编译运行

### g++ && opt 工具

首先，编写一个pass，比如命名为`MyPass.cpp`，注册名为`MyPass`

进入这个文件的文件夹下，运行以下命令，将其编译为一个动态链接库.so文件

```shell
g++ MyPass.cpp -fPIC -g -Wall -Wextra -std=c++11 `llvm-config --cxxflags ` -shared -o MyPass.so
```

你可以看到目录下多了一个生成的MyPass.so文件

如果是优化pass，执行以下命令，将Pass作用于提前编写的.ll文件

```
opt -load ./MyPass.so -MyPass demo.ll -o demo.bc
```

注意，-后面的名字可能要换成你的pass注册的名字，`demo.ll`是编写好的测试LLVM IR文件

生成了一个bitcode文件，接下来我们将这个bitcode文件反汇编成LLVM IR即可

## 基础部分

在`basic task`文件夹下，含有基础部分所有的文档和代码

`Thinking.md`是基础部分思考题的文档

`LoopSearchPass.hpp`下有我们设计的查找循环和深度的代码实现

`LoopSearchPass.md`是我们设计的循环信息统计代码的总体设计报告

## 扩展部分

扩展部分的代码、测试样例和文档，请到`Extended_Task`文件夹下查找，其中，代码和测试样例的位置在`Extended_Task\code`下，文档的位置在`Extend_Task\report`下

### 设计实现的功能

* 死代码删除
* 循环不变式外提
* 函数调用分析
* 向量化
* 常量传播

下面，分别介绍我们实现的优化的基本内容，具体代码实现和设计的报告请参考`Extend_Task\report`目录下的报告

**请注意，扩展部分我们有一些优化没有使用助教的代码框架，测试方法会加以说明**

### 基础部分代码和问答题

基础部分代码参见`Extend_Task\code\Mypass.hpp`

基础部分代码设计文档以及问答题参见`Extend_Task\code\MyPass.md`

### 死代码删除

由于对Deadcode有不同的定义，我们这里先对Deadcode加以说明

我们认为的死代码就是永远无法被执行到的代码

#### 代码和文档

代码参见(`Extend_Task\code\Deadcode.cpp`)[]

设计文档参见(`Extend_Task\report\Deadcode.md`)[]

### 循环不变式外提

**采用opt运行**

* 对于SSA形式的IR，我们判断每条指令用到的操作数是否在循环内部被赋值
* 如果一个指令的所有操作数在循环之外被赋值，那么这说明这条指令执行的结果在各个循环中不会发生变化
* 对于读取内存的指令，不能这样简单地处理，因为内存单元的值可能在循环中被修改

#### 代码和文档

代码参见(`Extend_Task\code\Loopconstant.cpp`)[]

设计文档参见(`Extend_Task\report\Loopconstant.md`)[]

### 向量化

**采用opt运行**

有一段实例代码

```c
int a[10];
return a[0]+a[1]+a[2]+...+a[9]
```

如果按照正常翻译，那么出现的循环可能会多次执行某一类结构相似的指令，我们可以用向量化简化生成的目标代码，比如循环可以优化为

```assembly
vercotadd c,a,10
```

这是一个向量加法，利用硬件内部的优化，比如访存局部性等可以优化指令的执行

#### 代码和文档

代码参见(`Extend_Task\code\Vectorize.cpp`)[]

设计文档参见(`Extend_Task\report\Vectorize.md`)[]

### 函数调用分析

* 我们将函数调用关系建成一张图，每个出现的函数作为程序中的一个结点，如果函数A调用了函数B，那么从A到B添加一条边
* 一般而言，函数调用中出现了环可能导致问题，如果出现了环，我们报一个warning
* 这是一个分析pass，使用助教的代码框架运行

#### 代码和文档

代码参见(`Extend_Task\code\Functioncall.cpp`)[]

设计文档参见(`Extend_Task\report\Functioncall.md`)[]

