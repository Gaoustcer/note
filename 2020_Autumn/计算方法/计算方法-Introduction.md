# 计算方法

By Gaoustcer

课程群 869742921

jiangy@ustc.edu.cn

教材 《数值计算方法与算法》 第三版

Reference 《Numerical Analysis》

## 给分

平时 20%-30%

随堂测试 10%

期末考试 60%-70%

## course target

研究并求解数学问题并得到数值近似解

### 常用的数值计算方法

函数的近似和拟合：离散点构造近似函数

方程（组）数值求解

数值积分与微分

常微分方程近似求解

矩阵性质的求解

### 数值计算方法的基本原理

数学原理

收敛性分析

误差分析

稳定性分析

```C++
#include<stdio.h>
int main(){
    printf("Hello world\n");
}
```

## Chapter 0 Introduction

### def  误差

绝对误差：精确值-近似值

相对误差：绝对误差/精确解（近似解）

原始误差：模型误差

舍入误差：有限位数字保存无限位

截断误差：无穷级数

### def 有效位数

|x*-x|<0.5* 10^-p p为最大的非负整数

