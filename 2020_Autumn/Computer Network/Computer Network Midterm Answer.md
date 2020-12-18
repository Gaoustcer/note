## Computer Network Midterm Answer

### Author Haihan Gao

### 单选题

1-5 DABBC 6-10 CCBB(什么是段号。。)D



### 简答题

#### 1 

sender行为

| Action       | 序号 |
| ------------ | ---- |
| send pkt0    | 1    |
| send pkt1    | 2    |
| send pkt2    | 3    |
| receive ACK0 | 4    |
| send pkt3    | 5    |
| pkt1 timeout | 6    |
| resend pkt1  | 7    |
| resend pkt2  | 8    |
| resend pkt3  | 9    |

receiver 行为

| Action                   | 序号 |
| ------------------------ | ---- |
| Deliver pkt0,send ACK0   | 1    |
| receive pkt2,ignore pkt1 | 2    |
| receive pkt1,send ACK1   | 3    |
| receive pkt2,send ACK2   | 4    |
| receive pkt3,send ACK3   | 5    |

#### 3

(1)电路交换：连接时资源即时并未被占用也不会释放，连接时系统负责维护端系统到端系统之前真实存在的物理连接

分组交换：连接时只要没有发送分组就不会占用传输资源，连接时维护的是端系统到端系统之间的逻辑连接

#### 4

#### 5

不正确，TCP连接是端到端连接，一个服务器之所以能够响应多个TCP连接在一个端口，是通过fork多个进程产生多个socket实现的

#### 6

确认已收到的报文 ACKn n为收到的报文的序列号

调整超时定时器的设置 一旦超时，更改超时定时器触发时钟中断的时间

流量控制 在报文头部增加接收缓存剩余的大小

拥塞控制 逐渐增加发送速率，同时利用慢启动尽量地利用网络资源

### 计算题

#### 1

非持久HTTP：2nRTT

非流水线持久HTTP: n+1 RTT

流水线持久HTTP：1 RTT

#### 2

#### 3

（1）5/505

（2） 50/550

（3）选择的发送窗口数为100