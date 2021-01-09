# 这是中国科学技术大学计算机系统概论2020秋季学期课程

## 老师：安虹

**office hour and Discussion:**

*(1) 4 TAs,fellow students*

*(2) Face to face help*

Questions to answer:(1)What can computer do

(2)How are they done

(3)What can't computer do

什么是计算思维

实际问题——计算系统实现

bool（true&&false）：== != && || ! < > >= <=

## Great Idea in Computer System

**Great idea0:0 and 1**

**Great idea1:Turning Computering model**:turning machines are universal

Universal Turing Machine 计算模型：Turning 结构模型：Von Neummann

theory——Practice：time cost power

ENIAC：with a Turing machine but without a Von Neummann Archeticture

## chapter 7

### 常用伪操作

.ORIG程序的开始位置

.BLKW开始占用一连串的地址空间

.STRINGZ初始化n+1个内存单元

### 汇编过程

#### 两遍扫描

* 第一遍扫描：得到符号表
* 第二遍扫描：生成机器语言程序

#### 可执行映像

##### 多目标文件

* 一个可执行映像由国歌模块文件组成
* .EXTERNAL start，表示若本文件中没有发现这个标号，则可能在另一个外部模块中定义
* 链接阶段，补充生成完整的符号表

## chapter 7

### 基本概念

#### 设备寄存器

* 保存需要和计算机传输的数据
* 设备当前状态：是否空闲，最近处理的I/O任务

#### 内存映射I/O和专用I/O指令

* 专用I/O指令：直接对目标寄存器操作
* 内存指令I/O

#### 异步I/O和同步I/O

* 处理I/O设备与处理器频率不一致
* I/O设备与处理器处理节奏不一致，则I/O和CPU是异步的