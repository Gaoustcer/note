# Embebed System assignment 

## PB18030980

## Question1

### Nand Flash

配置1G大小闪存，用于存储内核代码，应用程序，文件系统等，可以扩展存储容量，增加一个片选信号，以下是Nand Flash的接口电路

![image-20201026170838070](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201026170838070.png)

data[0:15]提供数据和Flash之间的接口 csn2 csn3为片选使能信号，因为可能用户会扩展存储器

### LCD液晶屏和触摸屏

![image-20201026172120474](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201026172120474.png)

### 100M网口

集成一个100M网口，用于连接上位机下载操作系统镜像或者挂载网络操作系统，需要通过交叉网线直接连接PC

与处理器：网口与处理器的交互视作一种处理器中断，因此，网口占据一个处理器中断信号，这个信号是Eint7信号

![image-20201026172428132](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201026172428132.png)

## Question 2: Nand Flash and Nor Flash

Flash写入之前需要执行擦除，Nand擦除是很简单的，Nor执行擦除之前需要将所有位置为0，擦除Nor的块大小是64-128kb，Nand是8-32kb，执行相同的擦除Nand比Nor时间少很多，因此Nand写性能优于Nor，Nor一个擦除需要5s，而Nand需要4ms

Nor和Nand对外接口不一样，Nor带有SRAM接口，可以按照地址寻址，类似SRAM Nand通过I/O接口串行存取数据，可以类似硬盘和其他块设备

在读方面，Nand和Nor连接和编址不同， NAND 型 FLASH 各存 储单元之间是串联的，而 NOR 型 FLASH 各单元之间是并联的，这是导致Nor读性能优于Nand的原因