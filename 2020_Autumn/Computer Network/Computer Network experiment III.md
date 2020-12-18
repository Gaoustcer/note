# Computer Network experiment III

## Author PB18030980

## Name Haihan Gao

## Question 1 The IP and port of  the client computer

![image-20201128112326395](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201128112326395.png)

IP  192.168.1.102

Port 1161

## Question 2 The IP address and  TCP port used server computer

IP address is 128.119.254.12

Port is 80

![image-20201127170654741](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201127170654741.png)



## Question 3 IP and port of client

![image-20201127172619808](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201127172619808.png)

IP address 114.214.229.191

Port 57032

## Question4

![image-20201128185659849](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201128185659849.png)

Initial sequence number is 0 and it sets the SYN tag bit 1'b1 to indicate the TCP segment is made to build the connection

## Question 5

![image-20201128185842596](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201128185842596.png)

* sequence of SYN ack segment is 0
* Acknowledge number is 1
* set the flag SYN to 1 to indicate it is the ACK SYN segment

## Question  6

![image-20201128190301883](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201128190301883.png)

We can find the TCP segment contain POST command has the sequence number 1

## Question 7

first

![image-20201128190837194](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201128190837194.png)

The sequence number is 1

second

![image-20201128190912555](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201128190912555.png)

The sequence number is 266

Third

![image-20201128190957067](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201128190957067.png)

The sequence number is 2026

4th

![image-20201128191109540](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201128191109540.png)

3486

5th

![image-20201128191139747](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201128191139747.png)

4946

6th

![image-20201128191216086](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201128191216086.png)

6406

$EstimatedRTT=\alpha \times Last_EstimatedRTT+(1-\alpha)\times SampleRTT$

$\alpha=0.875$

| sequence of segment | sequence number | send time | Ack time | RTT    | Estiamted RTT | TCP segment length |
| ------------------- | --------------- | --------- | -------- | ------ | ------------- | ------------------ |
| 1                   | 1               | 0.026     | 0.0539   | 0.027  | 0.027         | 565                |
| 2                   | 566             | 0.041     | 0.0772   | 0.0355 | 0.0028        | 1460               |
| 3                   | 2026            | 0.054     | 0.124    | 0.07   | 0.033         | 1460               |
| 4                   | 3486            | 0.054     | 0.169    | 0.114  | 0.043         | 1460               |
| 5                   | 4946            | 0.077     | 0.217    | 0.139  | 0.055         | 1460               |
| 6                   | 6406            | 0.078     | 0.267    | 0.189  | 0.072         | 1460               |

## Question 8

See the table above

## Question 9

![image-20201128192504015](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201128192504015.png)

Windows size is 5840

## Question 10

![image-20201128193521922](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201128193521922.png)

There is no retransmitted segment in the trace and we can find this through no duplicated segment number when we check the segment number of different segment shown in the Wireshark

## Question 11

![image-20201128193628648](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201128193628648.png)

122segments

## Question 12

Total=164090 Bytes in 5.29s

Throughput=31019 Bytes/s

## Question 13

![image-20201128194910255](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201128194910255.png)

From this Graph ,we can find the process of slow start. The basic principle of TCP behavior is that TCP sender wants to send more data and when it gets ACK which means the requirement of sending more data through Network will not cause congestion in the whole Network. But when TCP sender miss the ACK segment or detect a Timeout issue, the sender will decrease the data it sends through Network.

## Question 14

This is time analyze between my computer to the host computer and we can find the process of slow start

![image-20201128195546988](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201128195546988.png)

The initial sequence number is very low and the sequence number sent by the sender will be doubled between some time. This is how the network incease the utility of the network from the start point 

You can also find the throughout - time Graph to indicate the view

![image-20201128195830193](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201128195830193.png)

The throughout doubled after certain time period