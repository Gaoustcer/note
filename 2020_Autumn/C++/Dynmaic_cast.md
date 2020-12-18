## Dynmaic_cast

### Question 1

运行逻辑：初始化两个变量，unary_cnt和binary_cnt用于计数

对于list容器内的每个成员

调用RTTI机制转换，如果可以转换成UnaryInst*类型，则将计数变量unzry_cnt+1;如果可以转换BinaryInstr*类型,则将计数变量Binary_cnt计数变量+1

### Question 2

在value基类中定义一个变量标志，tag，我们默认tag=1的时候表示这是指向UnaryInst的指针，tag=2表示这是指向BinaryInst的指针，在print函数中判断tag的值即可

### Question 3

同理，在value中的增加的变量标志增加几个赋值选项，对于不同的指令赋给不同的值，再在print中对于多种变量的取值情况进行判断，当然，也需要在print中定义多个计数变量对输入的指令进行计数，这样就不会产生需要RTTI进行强制类型转换的情况

## Typeid

### Question 1

![image-20201031110034451](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201031110034451.png)

* 第27行，输出的是指针v的类型
* 第28行，输出的是指针v指向对象的类型
* 第29行，输出的是指针inst的类型
* 第30行，输出的是inst指向对象的类型