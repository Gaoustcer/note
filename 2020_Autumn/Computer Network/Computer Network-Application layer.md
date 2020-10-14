# Computer Network-Application layer

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
* 有序传输
* 资源预置，需要全局信息
* 拥塞控制，可以在发生拥塞的时候抑制client或server

#### UDP

* 无需知道全局信息或只用知道局部网络状态
* 不确定性

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

* 相应报文中cookie首部行
* 请求报文中cookie首部行
* 用户端含有一个cookie文件，由用户的浏览器管理
* Web站点的后端数据库

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

