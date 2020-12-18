# ICS hw 03

## Author PB18030980

## Question 1

(a) The number of state is $$100\times 100 \times 4\times 4 \times 50 \times 51 \times 2 \times (15\times 60 +1)=2912032000000$$

We need 42 bits to store the state

(b)

| Element          | bits number                               |
| ---------------- | ----------------------------------------- |
| Scores           | 7*2                                       |
| Down and Quarter | 2*2                                       |
| Yards to gain    | 7                                         |
| Yardlines        | 7                                         |
| Possesion        | 1                                         |
| Time             | 2 bits for minutes and 6 bits for seconds |
| Total            | 43 bits                                   |

(c) Different parts will be decoded in an easier way

## Question 2

(1) from left to right,the state will be encoded with 0,1,2,3,4

| current state | input | next state | Output |
| ------------- | ----- | ---------- | ------ |
| 0             | T     | 0          | 0      |
| 0             | H     | 1          | 0      |
| 1             | T     | 2          | 0      |
| 1             | H     | 1          | 0      |
| 2             | T     | 0          | 0      |
| 2             | H     | 3          | 0      |
| 3             | T     | 2          | 0      |
| 3             | H     | 4          | 0      |
| 4             | T     | 2          | 1      |
| 4             | H     | 1          | 1      |

(2) $2^3>5$ 3 bits

## Question 3

Number of bits=$2^4\times 2^3=2^7$

## Question 4

| state | input    | nest state |
| ----- | -------- | ---------- |
| 0     | 00,01    | 0          |
| 0     | 10       | 1          |
| 0     | 11       | 2          |
| 1     | 01,10,11 | 1          |
| 1     | 00       | 0          |
| 2     | 10,11    | 2          |
| 2     | 01       | 2          |
| 2     | 00       | 0          |
| 3     | 00,01,10 | 3          |
| 3     | 11       | 2          |

## Question 5

(a) A[1:0]=2'b11 We=1'b0

(b) Address line is 6 bits and Addressability is 3 bits

(c) 3 bits

## Question 6

(a) 4

(b) 16 bits

(c) 8 bytes

(d) 

| We   | A    | Di   | D    | read/write |
| ---- | ---- | ---- | ---- | ---------- |
| 0    | 01   | FADE | 4567 | READ       |
| 1    | 10   | DEAD | DEAD | WRITE      |
| 0    | 00   | BEEF | 0123 | READ       |
| 1    | 11   | FEED | FEED | WRITE      |

## Question 7

|                  | PC   | IR=62BE | MAR  | MDR  | Ri(modified) |
| ---------------- | ---- | ------- | ---- | ---- | ------------ |
| Fetch            | 3004 |         | 3003 | 62BE | BOTH 3000    |
| Decode           | 3004 |         | 3003 | 62BE | R2=3002      |
| Evaluate address | 3004 |         | 3003 | 62BE |              |
| Fetch Operands   | 3004 |         | 3000 | 62BF |              |
| Execute          | 3004 |         | 3000 | 62BF |              |
| Store result     | 3004 |         | 3000 | 62BF | R1=62BF      |

## Question 8

(a) $2^8>225$

(b) $2^7>120$

(c) 32-2*7+8=3

## Question 9

## Question 11

(R2>=R1)?R4=1:R4=0

## Question 12

(R1%2==0)?R0=1:R0=0