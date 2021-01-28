# ICS实验报告-lab5

## PB18030980 高海涵

## 实验要求

使用中断驱动响应键盘输入，编写键盘输入的服务例程，并在主控程序中输出ICS 2020

## 汇编语言程序设计

### 中断服务程序

```assembly
.ORIG 0x1000
		ST R0 saveR0	
		ST R1 saveR1
		ST R2 saveR2
		ST R3 saveR3

		LD R1 KBDR
		LDR R0 R1 #0	

		LD R2 ZERO
		NOT R2 R2
		ADD R2 R0 R2
		ADD R2 R2 #1
		BRzp JUDGEDEC
		BRn NOTDEC
JUDGEDEC	LD R2 NINE
		NOT R2 R2
		ADD R2 R0 R2
		ADD R2 R2 #1
		BRnz DEC
		BRp NOTDEC
DEC		OUT
		LEA R4 isdec
		ADD R0 R4 #0
		PUTS
		BRnzp RETURN
NOTDEC		OUT
		LEA R0 notadec
		PUTS
		BRnzp RETURN
RETURN		LD R0 saveR0	
		LD R1 saveR1
		LD R2 saveR2	
		LD R3 saveR3 
		RTI				
		
ZERO	.FILL x30  ;store the value of '0'
NINE	.FIll x39  ;store the value of '9'
KBSR	.FILL 0xfe00 ;address of Keyboard Status Register in Memory mapping
KBDR	.FILL 0xfe02 ;address of Keyboard Data Register in Memory mapping
saveR0	.FILL 0x0000
saveR1	.FILL 0x0000
saveR2	.FILL 0x0000
saveR3	.FILL 0x0000
isdec  .STRINGZ "is a decimal digit\n "
notadec  .STRINGZ "is not a decimal digit\n "
```

这里仅仅设计了键盘输入的中断服务程序，对于屏幕输出，采用的是系统调用实现的

#### 对程序中各个标号的说明

| 标号名称 | 作用                                 |
| -------- | ------------------------------------ |
| JUDGEDEC | 已知输入的数字大于0，判断其是否小于9 |
| DEC      | 对于数字输入的输出                   |
| NOTDEC   | 对于非数字输入的输出                 |
| RETURN   | 保存现场以及返回调用程序             |

#### 对程序的几点说明

* 调用中断服务程序，说明中断已经发生，所以不需要对键盘控制寄存器中存储的值进行判断
* 调用中断服务程序，首先需要保存现场，这里为需要保存的寄存器开辟了内存存储空间saveR0-saveR3就是为了保护和恢复现场
* 最后通过不断地LD，恢复现场
* 判断输入是否为数字

### 主程序设计

```assembly
.ORIG x3000

		LD R0 itptr
		LD R1 itfunc
		STR R1 R0 #0	

		LD R0 kbsr
		LD R1 x_4000
		STR R1 R0 #0	

		LD R6 stptr		

mloop	LEA R0 str1		
		TRAP x22
		AND R0 R0 #0
		ADD R0 R0 #13	
		TRAP x21
		AND R0 R0 #0
		LD R0 lpcnt
wait1	ADD R0 R0 #-1
		BRp wait1

		LEA R0 str2		
		TRAP x22
		AND R0 R0 #0
		ADD R0 R0 #13	
		TRAP x21
		AND R0 R0 #0
		LD R0 lpcnt
wait2	ADD R0 R0 #-1
		BRp wait2
		BRnzp mloop

itptr	.FILL 0x180
itfunc	.FILL 0x1000
stptr	.FILL 0x3000
lpcnt	.FILL 0x7fff
str1	.STRINGZ "ICS2020 "
str2	.STRINGZ " ICS2020 "
kbsr	.FILL 0xfe00
x_4000	.FILL x4000

.END
```

#### 主程序的主要任务是

* 设置中断向量入口地址为0x1000，中断向量入口地址存储于内存x180的内存单元
* 设置栈帧指针R6
* 输出ICS2020，以较慢的速度

#### 实现思路

* 对于，第一个任务，我们直接ld内存x180的内容为x1000即可
* 设置栈帧指针直接ld r6寄存器
* 延迟输出使用计数器，倒计时为0是输出

## 输出结果

![image-20210120092908394](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20210120092908394.png)

![image-20210120092929105](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20210120092929105.png)