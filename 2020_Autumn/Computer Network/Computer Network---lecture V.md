# Computer Network---lecture V

## Application layer

date:2020-9-30

## Concepts of Application layer

### Conceptual implement aspects of network apllication protocols

* transport-layer service models
* client-server paradigm
* peer-to-peer paradigm

### protocols

* HTTP
* FTP

### server-client paradigm

#### server:

* 一台永远在运行的主机
* 永久IP
* 主机集群 or 数据中心

#### client：

* communicate with server when need
* dynamic IP
* 不与其他client直接通讯

### 进程通讯

同一个主机：进程间通信

不同主机：交换报文

客户进程：发起通信的进程

### 进程与网络的接口-socket

* 套接字是应用层和传输层的接口，是应用程序和网络的API

* 进程通过socket发送和接收报文

* int socket(int domain,int type,int protocol)

  | domain       | type       | protocol           |
  | ------------ | ---------- | ------------------ |
  | 使用的协议族 | 通信的语义 | 通信用到的通信协议 |

### TCP && UDP

#### TCP：

* 面向连接：客户进程和服务器进程需要建立链接
* 可靠传输
* 流量控制
* 拥塞控制
* 不提供：及时性，最低带宽保证

#### UDP:

* 发送进程和接收进程之间不可靠传输
* 不提供：连接建立，可靠传输，流量控制，拥塞控制，及时性，最低带宽保证

## principles of network

### 应用层协议

### 术语

web page consists of several objects

#### 超文本传输协议--HTTP

* Web采取客户-服务器模式
* 定义浏览器和服务器之间的通信规则

使用TCP作为传输层协议：

* 客户发起服务器80端口的TCP连接，client create a socket
* server receive the TCP connection from client,server create a socket
* server and web application exchange HTTP information with their own sockets
* close TCP connection

round-Trip time: 

response time:

lasting/no lasting HTTP

### HTTP报文格式

cookies保存状态

### Web缓存

代理服务器：代表原始服务器满足HTTP请求的网络实体

