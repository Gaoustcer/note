# ICS hw4

## Question 1

The instruction add Register 5 with 0x3333 and it can't be showed by immediate number

it should the ADD R5,R5,R3

x1000 0001_1011_0100_0011

## Question 2

a) 将存储在R0中的数字左移一定次数，这个次数根据x3007内存单元存储的内容决定

b)

| PC   | x3006 |
| ---- | ----- |
| R0   | x0050 |
| R1   | x0000 |
| R2   | x0000 |
| R3   | x0000 |
| R4   | x0000 |
| R5   | x0000 |
| R6   | x0000 |
| R7   | x0000 |
| N    | false |
| Z    | true  |
| P    | false |

c)

| Memory location | Total cycle |
| --------------- | ----------- |
| x3000           | 10          |
| x3001           | 10          |
| x3002           | 17          |
| x3003           | 40          |
| x3004           | 40          |
| x3005           | 43          |

Total Cycle=160

## Question 3

统计存放在内存单元x3100一个程序字的1的个数

## Question 4

| Memory location | Value               |
| --------------- | ------------------- |
| x3001           | 0110_0010_0000_0000 |
| x3002           | 0000_1000_0000_0010 |



## Question 5

因为存在LDI和STI指令直接对立即数操作

## Question 6

PC增量相对寻址，相对于增量PC是-1

LD R1,#-1

## Question 7

error：立即数太大了

可以将加30分成三十条+1

## Question 8

R1=R1-3*N

N=4 R1=R1-12<0 and R1=E1-9>=0 9<=R1<12

## Question 9

a)

| Symbol  | location |
| ------- | -------- |
| Loop    | x3003    |
| L1      | x300A    |
| NEXT    | x300B    |
| DONE    | x300D    |
| NUMBERS | x300E    |

b)

从存储在内存x4000的数字开始遍历整个数组，直到遇到-1结束

R4是这个数组中偶数的个数，R3是奇数的个数

## Question 10

这个程序的功能是找到一个整数n，满足以下两个条件

$2^n\geq R1$ and $2^{n-1}<R1$

## Question 11

a) LDR R3,R1,#0

b) NOT R4,R4

c) ADD R4,R4,#1

## Question 12

Add an Instruction between BRp CHECK and STR R0,R2,#1

LD R2,VECTOR

## Question 13

a)

| Register | Value |
| -------- | ----- |
| R0       | X300B |
| R1       | X300D |
| R2       | X000A |
| R3       | X1263 |
| R4       | X300B |

b)

| Address | Value |
| ------- | ----- |
| Addr1   | x300B |
| Addr2   | x000A |
| Addr3   | x000A |
| Addr4   | x300B |
| Addr5   | x300D |

