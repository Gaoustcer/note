# Introduction to Algorithm---lecture II

## Date: 2020-9-22

## Analysis of Algorithms

### performance standard

* correctness
* functionality
* reliability
* modularity
* maintainability
* robustness
* user-freiendness
* programmer time
* simplicity
* extensibility

##### example:sorting

(1) understand the problem

* Input: a sequence of numbers without strict order
* output:a permutation of numbers

(2) understand the current solution

* key idea
* details

(3) analyze and make it reality

eg:insert sorting(move the elements in the array)

idea:A[1,j-1] is sorted

Analyze: The running type is determined by the size of input

*Question:Input size and different input sequence,worst case,seek upper bound*

**worst case && average case**

average case: statistical disribution of input

**smooth analyze:linear analyze(simplex method)**

Asymptotic Analysis: assume n-> unlimited number

### Three Notation

based on compare,the fastest is O(nlog(n))

### Expected  Analysis

random data(uniform,different from arbitary):random input data

### case2: merge sort

#### key issue:[divide] [conquer] [merge]

divide and conquer example

Divider:divide the problem into smaller groups

Conquer:solve each sub-problem

Merge:merge the solution from sub-problems to form a solution for the problem

#### Merge sort

```txt
Mergesort(array A,int p,int r){
	if(p<r){
		Mergesort(array,p,[(p+r)/2])
		Mergesort(array,[(p+r)/2],r)
		Merge two sorted list
	}
}
```

Sentinel Card:avoid checking the end and start,insert a virtual number

#### Time complexity

T(n)=2*T(n/2)+$/theta$(n)

T(n)=nlog(n)

*question: input size*:伪多项式

compare with a and b,which is bigger?

each is n bits

## 算法常用记号

$$f(n)=\Theta(g(n))\exists $$c<sub>1</sub> c<sub>2</sub> c<sub>1</sub>g(n)$\leq$f(n)$\leq$c<sub>2</sub>g(n)

f(n)=O(g(n)) $\exists$c f(n)$\leq$c$\times$g(n) f(n)=o(g(n))  $$\lim\limits_{n\rightarrow\infty}f(n)\div g(n)=0$$

