# Introduction to Algorithm---Comparison based sorting Algorithm

## date:2020-9-29

## basic concept

### Stability

If two numbers are equal, their order should be kept after sorting

### Time Complexity

determined by the times of comparison

### In-space sorting (原址)

The extra space needed for sorting has no relation with the number of element we input

## Insert sorting

maintain a sorted array,move and compare

best O(n) 

worst and average O($n^2$)

stable

## Select sorting 

move the smallest element to the top from unsorted array

Best,worst,average O($n^2$),always compare

not stable:might change  the original order--->move 

eg 5,3,5,2

## bubble sort

best:O(n)

stable

## Shellsort

* divide the array into several groups according to intervals
* sort different groups

not stable

## 已知数列递推公式为x<sub>n+1</sub>=x<sub>n</sub>+a$\div$x<sub>n</sub>  x<sub>0</sub>>0

## 求证$$\lim\limits_{n\rightarrow\infty}$$x<sub>n</sub>=$\sqrt a$

