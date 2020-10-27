# C++:Vector,Array,Template,Exceptions,Containers,Lterators,Algorithms and Maps 

## Vector

### A usually used container

* simple
* store the elements with given type one by one 
* efficent visit way
* extendable to any size
* edge check

### A vector

* contain any number of element
* change the number of element by push_back()
* 下标从0开始

### 动态内存分配

* 动态分配内存的时候可以初始化
* 动态分配数组
* 指针不知道指向元素的个数
* 指针只知道指向元素的类型
* 指针取值，可以作为左值
* vector可以避免访问越界的问题

### 内存泄漏

* 在函数体内声明指针变量并分配内存空间，函数返回后变量分配到空间仍然会保留，但是指针变量会消失，导致内存中存在某一段不存在指针指向
* 对某个指针重复分配内存空间
* 垃圾收集器跟踪所有的内存分配
* 在析构函数中释放资源
* delete用于删除独立的指针指向的对象，delete[ ]删除数组空间

### vector拷贝实现

* 不能拷贝初始化，即拷贝内存单元stack的所有元素
* 导致指针变量被delete两次

vector.set(int i,int k),将向量第i位置为k，假设这是整数vector

### #include<vector>

### vector 初始化

```C++
vector <int> v1; //empty vector
vecotr <int> v2(10);//create a vector and allocate the space for 10 elements

```





