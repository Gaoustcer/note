# x86汇编（AT&T标准汇编）入门

## 一段汇编（demo.s)

```x86
.section .data
.section .text
.globl _start
_start:
movl $1, %eax
movl $4, %ebx
int $0x80
```

汇编器as将汇编程序中的注记符号翻译为机器指令，生成demo.o，连接器ld将demo.o链接成可执行文件demo，程序的作用是退出程序，退出状态为4

### interpret of symbol

以.开头的名称不会被翻译为机器指令，而是给汇编器一些特殊的指示

.section将代码划分为若干段，程序被OS加载进内存的时候，每个段被加载进不同的地址，有不同的读写权限

.data存放全局变量，没定义数据可以将这一段置为空

.text保存代码,read-only

_start是一个symbol,symbol是汇编程序中的一个地址,处理后被替换为地址

.globl指示汇编器_start记号要被链接器用到,需要在目标文件符号表中给特殊标记

start是整段程序的入口,连接器链接程序时查找目标文件中的start符号代表的地址,并设置为目标地址

_start下面一条指令的地址代表start的地址

### interpret of x86 instructions

```x86
movl $1,%eax//数据传输指令,CPU产生一个常数1,传送给eax寄存器,movl中的l表示32位传输指令,CPU产生的是立即数,表示在前面加上$,寄存器加上%
int $0x80//int 成为软中断指令,可以通过这个指令产生一个异常,CPU从user-mode切换到kernel-mode,处理出现的异常,0x80是一个立即数,这是异常处理程序决定如何处理异常的依据

```

eax寄存器为传给系统调用的参数,表示系统调用号,1表示exit,ebx为传给_exit系统调用的参数,位退出状态

## x86寄存器

### 通用寄存器

eax,ebx,ecx,edx,edi,esi

### 特殊寄存器

ebp,esp,eip,eflags

eip:程序计数器

eflags:计算结果标志位

ebp/esp:维护函数调用的栈帧,esp指向栈顶,esp为帧指针,指向当前活动记录的底部