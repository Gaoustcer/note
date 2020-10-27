# Computer Network-Application layer

## 网络核心的功能

### Routing

确定分组要走的路径，生成转发表

### forwarding

按照转发表，将分组从输入链路移动到输出链路

## 分组交换

### 主机将应用报文划分成分组

* 报文的发送变为分组从一个设备发送到下一个部分
* 存储-转发：交换机接收整个分组之后开始转发

### 存储-转发机制引入延迟

* 排队延迟：到达速率高于输出速率，导致排队
* 队列过长，导致分组被丢弃，即丢包
* 动态路由，出错交给端系统处理

## 电路交换

* 电话网
* 通信前预留好端-端资源
* 资源独占：保证性能，资源被限制

## 分组延迟的来源

### 节点处理

* 检查比特错误
* 确定输出链路

### 排队

* 在输出缓存等待传输
* 时间长短取决于链路拥塞程度

### 传输延迟&&传播延迟

### 节点延迟公式

d<sub>nodal</sub>=d<sub>proc</sub>+d<sub>queue</sub>+d<sub>trans</sub>+d<sub>prop</sub>

d<sub>proc</sub>：处理延迟

d<sub>queue</sub>：排队延迟

d<sub>trans</sub>：传输延迟

d<sub>prop</sub>：传播延迟，和链路长度有关

流量强度：$$traffic indensity=L\times a\div R$$

R-Link bandwidth

L-packet length

a-average packet arrival rate

trafficindensity>1 cause infinite average delay

端到端吞吐量：发送端-接收端之间的比特传输速率（瞬时&&平均）

## Protocol  “layer”

### Application：FTP,HTTP支持各种网络应用

### Transport：进程-进程分组传输

### Network：源主机-目的主机分组传输

### Link：相邻网络设备之间分组传输

### Physical：物理媒体上的传输

## 应用层协议原理

### 网络应用程序体系结构

#### 客户-服务器体系结构

服务器：总是开启的主机，数据中心

客户之间不直接通信

服务器地址固定

Web,FTP

#### 对等P2P体系结构

对于专有服务器几乎没有依赖

### 进程通信

#### 客户和服务器进程

发起通信：客户 会话开始等待联系：服务器

#### 进程和计算机网络之间的接口-socket

进程通过socket软件接口向网络发送报文和从网络接收报文

socket是应用层和传输层的接口

#### 进程寻址

定义：（1）主机的地址-IP地址 （2）定义在目的主机中接收进程的标识符-端口号

### 可供应用程序使用的运输服务-应用服务使用要求

* 可靠数据传输-容忍丢失
* 吞吐量-带宽敏感
* 定时-延迟
* 安全性

### 互联网提供的运输服务

#### TCP

* 面向连接的服务：应用层数据报文流动之前，client-server交换传输层控制信息(握手)，握手结束后，TCP连接在两个进程的socket之间建立
* 可靠的数据传输服务
* 有序传输，流量控制
* 资源预置，需要全局信息
* 拥塞控制，可以在发生拥塞的时候抑制client或server

#### UDP

* 无需知道全局信息或只用知道局部网络状态
* 不确定性，不可靠传输，不提供连接建立、可靠传输、流量控制、及时性、最低带宽保证

### 应用层协议定义的内容

* 交换的报文类型
* 各种报文类型的语法，各个字段如何描述
* 字段的语义
* when and how send message, and how to respond to the message

## Web && HTTP

### HTTP(HyperText Transfer Protocol)

#### 术语

Web页面--由若干对象组成--每个对象是一个文件

URL=主机名+主机上路径名

TCP作为传输层协议，首先发起一个与服务器的TCP连接

HTTP是无状态协议，表示该协议不会在服务器存储客户端的信息

### 概述

#### 使用TCP作为传输层协议

* 客户发起到服务器80端口的TCP连接，客户端创建一个socket
* 服务器接收来自客户的TCP连接
* 交换HTTP报文
* 关闭TCP连接

#### HTTP无状态

* 服务器不保存有关客户请求的任何信息

#### 持续连接和非持续连接

连接通过单独的TCP连接发送，还是通过多个TCP发送

##### 采用非持续连接的HTTP

* HTTP客户进程在端口号80发送一个到服务器的TCP连接，客户和服务器上有一个套接字与该连接相关联
* HTTP客户经套接字向服务器发送一个HTTP请求报文
* HTTP服务器从套接字接收请求报文，读出对象，在一个HTTP报文中封装对象，通过套接字向客户端发送响应报文
* 服务器进程通知TCP断开连接
* 客户端响应报文，TCP被实际关闭
* 客户端解析获得的HTML，得到其他对象的引用
* 对每个引用对象重复上述过程

每个TCP在服务器发送一个对象后被关闭

提高效率的方法，增加并行TCP传输连接

往返时间（RTT）一个段分组从客户到服务器再返回客户的时间

三次握手：

* 客户发起TCP连接-服务器返回一个报文段响应连接
* 客户请求文件-服务器传输文件
* 服务器传输文件-客户接收文件

##### 持续连接的HTTP

发送响应后保持改TCP连接打开

流水线/非流水线

#### HTTP报文格式

##### HTTP请求报文

```http
GET /somefir/page.html HTTP/1.1
HOST: www.someschool.edu
Connection: close
User-agent: Mozilla/5.0
Accept-language: fr
```

请求报文=请求行+首部行

请求行=方法字段(GET/PSOT/HEAD/PUT/DELETE)+URL字段(request object identification)+HTTP版本字段

POST：输入的表单内容放在报文体中上传到服务器

HEAD：服务器只返回一个报文头，作为故障追踪的方法

HOST:Web代高速缓存

Connnection:close表示不希望使用持续连接

User-Agent:服务器为不同的用户代理提供不同版本

```http
request line
header line
whitespace
entity body
```

When you use GET,entity body is empty

##### HTTP响应报文

```http
HTTP/1.1 200 OK
Connection: close
Data: Tue, 09 Aug 2011 15:44:04 GMT
Server: Apache/2.2.3 (CentOS)
Last_Modified: Tue, 09 Aug 2011 15:11:03 GMT
Context_Length: 6821
Context-Type: text/html

data....
```

响应报文=状态初始行+首部行+实体体

实体体：请求的对象本身，数据

状态行=协议版本字段+状态码+相应状态信息

Connection: close 传递完报文后关闭TCP连接

Date: 服务器产生并发送相应报文需要的时间

Server：指示该报文由一台服务器产生

Last-modified: 对象创建或修改的最近时间

Context-length：被发送对象的字节数

Context-Type：实体对象种类

**常见的状态码**

* 200 OK请求成功
* 301 Moved Permanently:请求的对象被永久转移，新的URL定义在响应报文的Location首部行中，客户软件自动获得新的URL
* 400 Bad request：通用差错代码，指示该请求不能被服务器理解
* 401 Not found：请求的文档不在服务器上
* 505 HTTP Version Not Supported：服务器不支持报文使用的HTTP协议版本

##### cookies

cookies包含：

* 响应报文中cookie首部行
* 请求报文中cookie首部行
* 用户端含有一个cookie文件，由用户的浏览器管理
* Web站点的后端数据库

cookie状态保存：

server：信息保存作为一个表项存储在服务器，返回ID给客户

user：信息返回客户端，保存在cookie文件中，随请求报文发送给服务器

##### Web缓存（代理服务器）

基本原理：Web服务器保存最近请求过的对象的副本

user：让浏览器所有HTTP请求先指向Web缓存器，每个对某对象的请求被重定向到Web缓存器

工作流程：

* 浏览器建立到Web缓存器的TCP连接，并向Web缓存器的对象发送一个HTTP请求
* Web缓存器进行检查，查看本地是否存储该对象的副本，有的话，Web缓存器就向客户浏览器使用HTTP响应报文返回该对象
* Web服务器没有该对象，打开一个1与该对象的初始服务器的TCP连接，Web缓存器在缓存器到服务器的TCP连接上发送对该对象的HTTP请求，收到该请求后，初始服务器向该缓存器发送具有该对象的HTTP相应
* Web缓存器收到该对象后，在本地存储空间存储一份副本，并向该用户的浏览器用HTTP响应报文发送该副本

Web缓存器：一台？多台？

def:流量强度 L$\times$a$\div$R

R-传输速率 L-每个分组大小 a-分组到达的平均速率

网络缓存的意义：使得分布的大流量分散化

##### 条件的Get方法-缓存是否最新？

使用条件GET方法：（1）请求报文中使用GET方法 （2）请求报文中包含If-Modified_since首部行

代理服务器向Web服务器发送一个请求报文

```http
GET /fruit/kiwi.gif HTTP/1.1
Host: www.exotuquecuisine.com
```

Web服务器向缓存器发送包含该请求的对象的响应报文

```http
HTTP/1.1 200 OK
Date: Sat, 8 Oct 2011 15:39:29
Last-Modified: Wed, 7 Sep 2011 09:23:24
Content-Type: image/gif

data data
```

缓存器在本地缓存该对象，也缓存了该对象的最后修改日期

浏览器向缓存器发送请求请求该对象，缓存器需要发送一个条件GET进行最新检查

```http
GET /fruit/kiwi.gif HTTP/1.1
Host: ww.exotiquecuisine.com
If-Modified-Since: Wed, 7 Sep 2011 09:23:24
```

条件GET(If-Modified-Since)告诉服务器，仅当自指定日期之后该对象被修改过，才会发送该对象

## FTP：文件传输协议

* 用户通过FTP用户代理，从远程主机下载文件或向远程主机上传文件
* 客户-服务器模式
* TCP
* 端口21，20

### 控制连接-数据连接分离

#### 控制连接：

* 端口21，传送客户命令和服务器响应
* 控制连接在会话期间一直保持

#### 数据连接

* 端口20，传输文件
* 每个数据连接只传输一个文件，发送方关闭连接表示一个文件传输结束

## 电子邮件系统

### 用户代理

* 邮件操作
* 外发的邮件发送到用户的邮件服务器
* 从用户邮箱取邮件

### 电子信箱

* 计算机上的存储区域
* 唯一的电子邮件地址：用户邮箱标识+服务器名

### 传输协议-SMTP

TCP传输层协议

发送服务器和接收服务器之间直接传输文件

#### 邮件传输阶段：

* 连接与握手
  * 客户和服务器在端口25建立TCP连接
  * 服务器发送服务就绪报文
  * 客户发送HELO报文，用域名标识自己
  * 服务器响应
* 结束传输
  * 客户发送QUIT报文
  * 服务器响应
  * 释放TCP连接

#### 邮件访问

设计一个新的协议从服务器获取邮件POP

## DNS-Internet's Directory Service

* hostname:Indentifier for a host
* hosts are identified by IP address

### Consist of DNS-system that translate the hostnames to IP address

* distributed databases implemented in a hierarchy of DNS servers
* application-layer protocol that allows hosts to query the distributed database

### The process to implement hostname to IP addess

* user machine runs the client side of the DNS application
* browser extracts the hostname from the URL and passes the hostname to the client side of the DNS application
* DNS send a query containing the hostname to a DNS server
* the DNS client eventually receives a reply, which includes the IP address for the hostname
* the browser receive the IP address from DNS, it can initiate a TCP connnection to the HTTP server process located at port 80 at that IP address

### Other service provided by DNS

* host alasing:复杂主机名的主机拥有一个或者多个别名，存在一个规范主机名
* mail server aliasing:
* load distribution:在冗余的服务器之间进行负载分配，繁忙的站点被冗余分配在多台服务器上

### Overview of How DNS works-host to IP transalation service

#### Distributed,Herarchical Database

Three classes of DNS server---organized in a hierarchy

* root DNS servers 13 root DNS servers. The server is actually a network of replicated servers for security and reliability purpose
* top-level DNS servers responsible for top-level domains such as com,org,net,edu
* authoritative DNS server
* local DNS server-default DNS server each ISP has one local DNS server--相当于代理

#### DNS caching

for some hostnames which are visited for many times in a short period





