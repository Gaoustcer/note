# RISCV编译器和仿真器安装教程

## 简介

RISCV交叉编译工具链包含编译器和模拟器两个部分，编译器可以将高级语言编译生成为指定机器目标平台上的二进制可执行文件，模拟器可以在我们的x86平台上模拟运行这个二进制文件，这对于我们调试运行软件代码是必要的

## 硬件和软件平台

* Intel酷睿I51035G1
* Ubuntu20.04 Vmware workstation Pro15
* 编译工具链源代码来自安虹老师主页`http://acsa.ustc.edu.cn/ics/download/riscv-gnu-toolchain.tar.gz`
* 科大镜像源，配置方法只需要将`/etc/profile`中的内容替换为如下即可

```shell
deb https://mirrors.ustc.edu.cn/ubuntu/ focal main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ focal main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/ focal-security main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ focal-security main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/ focal-proposed main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ focal-proposed main restricted universe multiverse
```

## 安装交叉编译工具链的步骤

* 下载交叉编译工具链源代码
* 安装以下依赖

```shell
sudo apt-get install autoconf automake autotools-dev curl python3 libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev
```

* 将下载的压缩包解压到一个目录下，然后建立一个目录用于存放编译产生的文件，日后这个目录将会被添加到环境变量中
* 安装tree-compiler

```shell
sudo apt install device-tree-compiler
```

* 设置环境变量

```shell
export RISCV=/path/from/home/to/RISCV (YourownRISCVpath)
export PATH=$PATH:$RISCV/bin
```

RISCV是你自己设定的安装路径

PATH含有可执行文件

建议直接在`/etc/profile`中添加，然后重启

* 进入源码根目录，执行以下命令，编译交叉编译工具链

```shell
cd riscv-gnu-toolchain
mkdir build
cd build
../configure --prefix=$RISCV --with-arch=rv32i
sudo make -j8
```

重启操作系统

* 接下来，我们来检验以下是否安装成功

![image-20201230000814506](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201230000814506.png)

![image-20201230001340444](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201230001340444.png)

## 自定义交叉编译工具链

### 下载riscv-tools，这是一个生成自定义指令Match-code和Mask-code的工具

