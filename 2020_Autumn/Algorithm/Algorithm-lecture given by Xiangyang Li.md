# Algorithm-lecture given by Xiangyang Li

data:2020-10-16

## Introduction

### question: optimize the mult of a and b(both of them consists of n digists)

n$\times$n->$\Theta$($n^2$)

n=2$\times$k

divide and conquer

$$k\times k$$

$$f(n)=4f(n/2)+\Theta (n),f(n)=af(n/b)+\Theta (n)$$

a=x<sub>1</sub>$\times$$10^k$+x<sub>2</sub>

b=y<sub>1</sub>$\times$$10^k$+y<sub>2</sub>

a$\times$b=(x<sub>1</sub>$\times$y<sub>2</sub>)$\times$$10^k$+(x<sub>2</sub>$\times$y<sub>1</sub>)$\times$$10^k$+(x<sub>2</sub>y<sub>2</sub>)+(x<sub>1</sub>y<sub>1</sub>)$\times$$10^{2k}$

(x<sub>1</sub>+y<sub>1</sub>)$\times$(x<sub>2</sub>+y<sub>2</sub>)=(x<sub>1</sub>x<sub>2</sub>)+(y<sub>1</sub>y<sub>2</sub>)+(x<sub>1</sub>y<sub>2</sub>+x<sub>2</sub>y<sub>1</sub>)

$$T(n)=T(3\div 10)+O(n)$$

Media算法 $\Theta$(n) select(i)算法

划分->在n/2里面找或者n/2~n里找 $$T(n)=\alpha(n)+\alpha(n/2)+\alpha(n/2^2)+\alpha(n/2^3)+\alpha(n/2^4)+...=\alpha(2)$$





