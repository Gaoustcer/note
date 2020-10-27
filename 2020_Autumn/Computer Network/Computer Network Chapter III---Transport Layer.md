# Computer Network Chapter III---Transport Layer

## General and Service by Transport Layer

报文段segment从发送应用程序进程接收到的报文转换成传输层分组，该分组成为运输层的报文段

实现：应用报文划分成较小的块，并未每块加上一个运输层首部生成运输层报文段

运输层协议：TCP UDP

### 运输层&&网络层

网络层：提供了主机之间的逻辑通信

传输层：不同主机进程间的逻辑通信

传输层协议工作在端系统中，在应用层和网络层之间提供通信

传输层协议工作在网络层之上，提供的服务受制于底层网络协议的服务模型，比如带宽和时延保证

但是，底层网络协议同意不能在网络层提供相应的服务，运输层服务也能提供某些服务，底层网络协议不可靠，运输协议也能提供可靠的数据传输服务，另外的例子是加密

对网络层服务进行可能的增强，TCP和UDP不做延迟和带宽保障

### Internet运输层概述

#### IP网际协议

服务模型：尽力而为交付服务，但不确保，称为不可靠服务

UDP,TCP基本责任

### 多路复用和多路分解

#### 多路复用

传输层从网络层获得数据，但是可能存在多个进程，此时需要决定将数据发送给那个进程

每个套接字存在单独的标识符，标识符的格式决定了这是TCP还是UDP套接字

报文段包含域，在接收结尾，传输层检查这些域判断接收套接字并且将这些报文引导至特定的套接字，这一过程称为**多路分解**

依据头部信息交给正确的套接字-多路复用

从多个套接字接收数据并交给网络层-多路分用

#### 多路分解

从源主机不同套接字中收集数据，并为每个数据做封装首部信息，生成报文段，并将报文段传递至网络层，这一过程称为**多路复用**

报文定向到确定的进程-->通过定向到特定进程的套接字实现

#### 在计算机系统中的实际工作

要求：套接字存在唯一标识符 每个报文段存在特殊的字段指示报文段交付的套接字

源端口号字段 目的端口号字段 每个数据报带源IP地址，目的IP地址

网络层不会关心端口号信息

0-1023 周知端口号：HTTP（80）FTP(21)

#### 无连接的多路复用和多路分解

UDP socket（目的IP地址，目的端口号）

客户端：自动分配端口号 服务器端：分配特定的端口号

源端口号的作用：作为返回地址的一部分，源端口号和目的端口号可能反转

#### 面向连接的多路复用和多路分解

TCP socket=源IP地址+源端口号+目的IP地址+目的端口号

接收端利用四个值将segment导向socket

支持多个socket在同个端口号上，或者多线程的Web服务器