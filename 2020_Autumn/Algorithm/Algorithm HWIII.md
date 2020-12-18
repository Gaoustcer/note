# Algorithm HWIII

## Question 1

### Stable:

Insert sorting,Merge sorting,Count sort

### Unstable

Quick sort

### Methods to make sure the Algorithm is stable

Given the element two properities:value and location in the array. Use both of these properties when sorting

## Question 2

9 8 7 6 5 4 3 2 1 0

## Question

对二叉树进行中序遍历，可以知道，已经加入二叉树的节点按照中序遍历是一个有序序列，设一共有n个节点（数据）待排序，而在树上的已经有m个节点，现在构造一个长度为n的序列，前m个数据是在BST上按照中序遍历得到的序列，n-m个序列是尚未排序的结点数据。

则构造排序二叉树的过程可以等价为以下过程，在n-m个数据中选取下标最靠前的数据，加入到前面m个有序序列中，形成的m+1序列仍然是有序序列。

由所学知识可知，排序的时间复杂的是$\Omega$(n$log_2(n)$),所以构造排序二叉树的时间复杂度是$\Omega$(n$log_2(n)$)

## Question 4

第一次调用tree-successor的时间是O(h),随后调用tree-successor的时间均是O(1),所以总时间是O(h+k)