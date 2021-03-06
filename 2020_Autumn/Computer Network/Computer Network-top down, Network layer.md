# Computer Network-top down, Network layer

## Author PB18030980

## 基本功能：转发+路由选择

## 概述

### 基本概念

转发：单一的路由器从一条入链路到一条出链路的传送

路由选择：所有路由器，路由选择协议，决定目的主机到源主机的路径

数据报：网络层的分组

报文段：传输层的分组

选路：计算转发表

转发：根据转发表转运分组

### From different components of the Internet

#### 下一跳方法

路由表只保留吓一跳的地址

路由器保持一致

#### 发送方

* 网络层从运输层获取数据报
* 向相邻路由器发送

#### 接收方

* 网络层接收来自临近路由器的数据报
* 提取出运输层报文段
* 向上交付给目的主机的运输层

#### 路由器

* 数据报从输入链路转发到输出链路
* 路由器的协议栈是截断的，没有网络层以上的部分
* 分组交换机：根据分组首字段的值，从输入链路接口到输出链路接口转移分组
  * 链路层交换机：基于链路层首部字段分组
  * 路由器：根据网络层字段判断

### 转发与路由选择-网络层的基本功能

* 转发：输入链路到适当的输出链路
* 路由选择：分组从发送方流向接收方，网络层通过**路由选择算法**计算分区采用的路径/路由
* 转发指的是单个路由器的行为
* 路由选择是整个网络的行为
* 转发通过查阅转发表和分组首部字段实现
* 分组交换机：链路层交换机（根据链路层的值做决定）路由器（基于网络层的值做决定）

#### 连接建立

源主机到目的主机沿着选择的路径彼此握手

传输分组之前，两个**段系统**之间建立连接

网络层连接：主机-主机，连接状态保存在端系统和所有中间路由器上

### 网络服务模型

#### 网络层可以提供的基本服务

##### 对单个分组

* 保证交付
* 具有上界时延的保证交付

##### 可对分组流提供的服务

* 有序交付
* 保证最小带宽
* 保证最大时延抖动，时延差异尽量小

* 确保交付：确保分组到达目的地
  * 具有时延上界的确保交付，不仅要确保交付，而且要在时延之内交付
  * 有序分组交付
  * 确保最小带宽
* 确保最大时延抖动
* 安全性服务

#### Internet网络层提供的单一服务

尽力而为交付

#### ATM网络

* 多重服务模型：为不同的连接提供不同类型的服务
* 恒定比特率ATM服务：发送方和接收方之间存在一条专用的、固定带宽的传输链路，使用性质相同的虚拟管道提供分组
* 可用比特率ATM服务

## 虚电路和数据报网络

网络层的连接服务：需要握手 虚电路网络

网络层的非连接服务：不需要握手 数据报网络

### 虚电路网络

#### 网络中的面向连接和无连接服务

| 网络体系结构层次 | 面向连接 | 无连接 |
| ---------------- | -------- | ------ |
| 网络层           | 虚电路   | 数据报 |
| 传输层           | TCP      | UDP    |

**网络层的面向连接和无连接主要体现在做出转发决定时使用的信息**

#### 组成

* 源主机到目的主机的路径
* VC号，沿着该路径的每段链路的一个号码
* 沿着该路径每台路由器中的转发表表项，分组首部携带VC号
* 分组在首部增加VC号，每个路由器替换传输分组的VC号，新的VC号来自转发表

#### 路由器

* 转发表包含
  * 入接口
  * 出接口
  * 入VC号
  * 出VC号

**经过同一个入接口流入路由器的分组VC号不一定一样，这是入接口的复用**

* 创建一条新的虚电路，增加一个表项，删除一条虚电路，沿着路径删除所有表项
* 为何每条链路选择不同的VC号
  * 减少了首部段VC号的长度
  * 简化了虚电路的建立
* 连接状态信息

#### 虚电路三个阶段

* 虚电路建立：网络层确定路径，为每个链路确定一个VC号，在每个中间路由器转发表上增加一个表项，在虚电路建立期间，网络层要预留虚电路路径上的带宽
* 数据传输
* 虚电路拆除，发送方通知网络层终止虚电路，网络层通知端系统，更新转发表

指令报文：端系统向网络发送终止、启动连接的报文

### 数据报网络

最长前缀匹配原则减少转发表开销

### 数据报&&虚电路

## 路由器工作原理

### 硬件组成

* 输入端口：物理层物理链路和路由器相连
* 交换结构：在路由器中的网络
* 输出端口
* 处理器

### 输入端口

* 实现了输入端口的物理层和链路层
* 中央处理器只负责更新和推送转发表到输入输出端口

### 交换链路

* 经内存交换
* 经总线交换
* 经互联网络交换

### 输出端口

排队电路

### 排队与丢包

* 分组调度程度
* 放弃尾部

## 网际协议IP

### 数据报格式

* 版本号
* 首部长度：确定数据报从哪里开始
* 服务类型：确定服务等级
* 数据报长度：首部+数据**总长度**
* 标识、标志、片偏移：IP分片
* 寿命TTL
* 协议：上层的协议
* **首部**校验和：将受不住每两个字节当作一个数
* 源和目的IP地址
* 选项、数据和有效载荷

#### IP数据报分配

* MTU限制，导致网络层数据报不能太长
* 生成一个数据报，数据报的标识+1
* 分片的数据报标识相同
* 标志flag：出了分片的最后一个数据报为0，其他的分片的数据报标志位1
* 偏移值以**8**字节为单位，出了最后一个分片，其余分片是8的倍数

### IPv4的编址

* 每个路由器接口连接一个子网，采用子网地址/子网掩码的方式
* 无差别域间路由选择CIDR
* 组织内部的网络用相同的prefix

#### 路由聚合

* 单个网络前缀通告为多个网络能力
* 地址聚合，路由聚合，路由摘要
* 不满足层次分配

#### 分类编址和无差别域间路由选择

分类编址不够灵活，导致地址浪费和地址不够用

#### 获取一块地址

* 从ISP中获取一块地址
* ISP地址分配由ICANN组织

#### 获取主机地址，动态主机配置协议

* DHCP协议使得主机获得
  * 临时的IP地址
  * 子网掩码
  * 第一跳路由器地址(默认网关)
  * 本地DNS服务器的地址
* 即插即用协议
* 客户机-服务器协议
  * 子网有DHCP服务器和DHCP中继代理
  * DHCP服务器发现：广播子网内DHCP发现报文
  * DHCP服务器提供报文：广播告诉接入主机地址等信息
  * DHCP请求：从一个或多个服务器中选择一个，向选中的服务器提供一个DHCP请求报文响应
  * DHCP ACK报文

#### 网络地址转换NAT

NAT转换表(WAN，端口号-LAN，端口号)

## 路由选择算法

* 默认路由器(第一跳路由器)：路由器为主机直接连接的路由器
* 主机发送一个分组，分组被传递给默认路由器，主机的默认路由器称为源路由器，目的主机的默认路由器称为目的路由器

### 分类

#### 全局式&&分散式

* 全局式路由选择算法
* 分散式路由选择算法:只掌握相邻的邻居以及链路费用

#### 静态&&动态

* 动态算法根据网络负载改变路由(路由敏感算法)
  * 周期定期更新
  * 及时响应链路费用和拓扑变化
* 负载迟钝算法
* 静态路由：人工配置，优先级高

### 链路状态算法

* 获取完整的图的拓扑信息和路由费用
  * 链路状态分组并且广播：相邻的IP以及链路开销
  * 所有节点相同信息
* 计算从一个结点开始到达所有其它节点的最短路径
  * 获取转发表
  * 在每个路由器上运行Dijisktra算法
    * 初始化
    * 迭代求解，更新邻居
    * 时间复杂度$O(n^2),O(Nlog_2{n})$
* 最终得到最短路径树

#### 震荡现象

* 链路费用是链路承载的通信量
* 改变路由导致链路开销变化

链路状态广播，使得每个结点拥有完整的视图

### 距离向量选择算法

Bellman-Ford $d_x(y)=minc(x,z)+d_v(y))$

#### 结点x

* 维护其所有邻居的距离向量，最小费用估计
* 已知到达每个邻居的费用
* 每个结点讲自身的DV估计发送给邻居
* 自身根据邻居的新的dv估计，更新自身的距离向量估计

#### 特点

* 异步迭代
  * 局部费用发生变化，邻居DV更新导致局部迭代
* 分布式算法
  * 每个结点只当DV变化时才通告给邻居

#### 计算步骤

* 等待
* 重新计算DV估计
* 通告给邻居

#### 链路费用变化对距离向量的影响

* 结点检测本地链路费用变化
* 更新路由信息，重新计算距离向量
* DV改变，通告所有邻居
* 好消息传播快
* 无穷计数问题 
* 坏消息传播慢

增加毒性逆转，增加坏消息的传播速度

#### 毒性逆转

* 结点Z到达目的X的最小费用路径是通过某个邻居Y
  * 通告给Y邻居结点Z到达该目的节点X的距离为无穷大
* 定义最大度量
  * 定义最大有效费用值

### 算法比较

* 报文复杂性
* 收敛速度
* 健壮性-路由器发生故障

### 层次路由

* 规模
* 管理自治-自治系统AS与自治系统内路由选择协议，网关路由器
  * 自治系统内部路由协议
* 网关路由器
  * 自治系统边缘
  * 通过物理链路与其它自治系统连接
* 转发表由AS内部路由算法与AS间路由算法共同配置

#### 自治系统间路由任务

* 内部的路由器收到目的地址在自治系统外的数据报
  * 路由器将数据转发给哪个网关路由器
  * 转发到目的网关路由器的路径-自治系统内路由协议
* 学习目的网络通过哪些网关路由器可达
* 转发给哪个子网-多个网关进行选择

#### 热土豆路由

* 一个数据报，目的地址在自治系统外，可以通过多个网关到达
* 转发到最近的网关路由器，通过自治系统内路由协议选择到达每个网关费用最小