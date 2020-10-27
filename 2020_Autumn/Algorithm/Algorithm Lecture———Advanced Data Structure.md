# Algorithm Lecture———Advanced Data Structure

## By XiangYang Li

## Data 2020-10-27

## Merge Heap

### Operation 

* Make_Heap()
* Insert(H,x)
* Min(H)
* Extract_Min(H)
* Union(H<sub>1</sub>,H<sub>2</sub>)->create a new Heap contain the elements of H<sub>1</sub> and H<sub>2</sub>

### Time complexity and Data Structure

| Operation  | Link list | Binary Heap | Binomial   | Fibonacci | Relaxed |
| ---------- | --------- | ----------- | ---------- | --------- | ------- |
| make heap  | 1         | 1           | 1          |           |         |
| insert     | 1         | $log_2(n)$  | $log_2(n)$ |           |         |
| find min   | N         | 1           | $log_2(n)$ |           |         |
| delete min | N         | $log_2(n)$  | $log_2(n)$ |           |         |
| union      | 1         | N           | $log_2(n)$ |           |         |
| decrease   | 1         | $log_2(n)$  | $log_2(n)$ |           |         |
| delete     | N         | $log_2(n)$  | $log_2(n)$ |           |         |
| is-empty   | 1         | 1           | 1          |           |         |



## Binomial Heaps

### Def of Binomial Tree

a node is a Binomial. Tree if B<sub>k</sub> is Binomial Tree and we Link their root together it will form another Binomial Tree B<sub>k+1</sub>

The degree of root of B<sub>k</sub> is k and it has $2^n$ nodes and the height is k

Delete the root of B<sub>k</sub> and it will create a forest consisted with Binomial B<sub>0</sub>,B<sub>1</sub>,B<sub>2</sub>...B<sub>k</sub>

For B<sub>k</sub>, at the Deepth i has $C{i}_{k}$

### Def of Binomial Heap

Consist of Binomial Tree Will not have two same Binomial Tree

The Binomial Tree is a min-Heap

### Union

Similar to add 

merge means the smaller Node become the son of larger Node

### Delete the root

Delete and Merge

### Delete any root

Decrease the node to -$nifty$

delete root

### Decrease

* still large than Father:Nothing to do
* smaller than father:move upward until meet the first situation

### Insert

Make-Heap and Union

## Fibonacci Heap

### Def

Set of Min-heap ordered Tree whose roots are linked together

### Potiential Function

Give the Node Some color

### Insert

create a new single Node Tree

Add to **left** of min pointer-constant time

update the min pointer

### union

choose the smallest node from two Heap

add to the circular link

### Delete Min

Delete min and concatenate its Children into root list

Consolidate tree so that no two roots have same degree(Merge the root has the same degree)

