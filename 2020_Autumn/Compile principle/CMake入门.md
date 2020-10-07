# CMake入门

## What is CMake

An open source,cross platform,automatically construction system

CMakeList.txt write once and run everywhere

```cmake
cmake_minimum_required(VERSION 3.10.2) #CMake 最低版本号要求
project(CMakeDemo C) #项目信息，表示该项目的名称为CMakeDemo
set(CMAKE_X_STANDARD 99) #设置C语言标准
add_executable(CMakeDemo,file.c/cpp) #指定生成目标
```

Linux下手动编译

* cmake .得到Makefile
* 执行make命令，生成可执行文件CMakeDemo

### 多个源文件

增加命令 aux_source_directory

```cmake
aux_source_directory(<dir> <variable>) ##aux_source_directory(. DIR_SRCS)
add_executable(CMakeDemo $(DIR_SRCS))
```

cmake将当前目录下所有源文件的文件名赋值给变量DIR_SRCS，再指示变量DIR_SRCS中的源文件需要编译生成一个名称为CMakeDemo的可执行文件