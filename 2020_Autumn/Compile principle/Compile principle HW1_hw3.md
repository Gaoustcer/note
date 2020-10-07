# Compile principle hw3 

## PB18030980

### 代码注释

命令 gcc -S -m32 sort.c sort.s

```x86
        .file   "sort.c"  #The file name
        .section        .rodata
.LC0:
        .string "%d" #scanf("%d",&n);
.LC1:
        .string "%d "#scanf("%d",array+i)
        .text
        .globl  main
        .type   main, @function
main:
.LFB0: #esp:stack pointer,ebp:stack base pointer
        .cfi_startproc
        leal    4(%esp), %ecx #load effective address to the ecx
        .cfi_def_cfa 1, 0
        andl    $-16, %esp #clear the lowest 4 bits to 0
        pushl   -4(%ecx) #add a number to the top of stack and the stack top pointer will be moved to extend the stack memory,the value is original esp
        pushl   %ebp #push the register ebp(stack base)to the stack
        .cfi_escape 0x10,0x5,0x2,0x75,0
        movl    %esp, %ebp #store the esp value to the register ebp
        pushl   %ecx #push the effective address to the stack
        .cfi_escape 0xf,0x3,0x75,0x7c,0x6 
        subl    $40036, %esp #40036=10000*4+36
        movl    %gs:20, %eax 
        movl    %eax, -12(%ebp) 
        xorl    %eax, %eax #eax=0
        subl    $8, %esp
        leal    -40032(%ebp), %eax
        pushl   %eax #push eax-40032 to the stack
        pushl   $.LC0 #push the string to the stack
        call    __isoc99_scanf #sacnf("%d",&n)
        addl    $16, %esp #move the stack pointer
        call    getchar #system call
        movb    %al, -40033(%ebp) #move byte
        movl    $0, -40020(%ebp)
        jmp     .L2
.L5:
        movl    -40020(%ebp), %eax
        leal    0(,%eax,4), %edx #load effective address
        leal    -40012(%ebp), %eax
        addl    %edx, %eax
        subl    $8, %esp #move the esp stack pointer
        pushl   %eax
        pushl   $.LC0
        call    __isoc99_scanf #system call scanf
        addl    $16, %esp
        call    getchar #system call c=getchar
        movb    %al, -40033(%ebp) #move the return value of getchar to the char c
        cmpb    $10, -40033(%ebp) #if c=='\n' jump to L15
        je      .L15
        addl    $1, -40020(%ebp)
.L2:
        movl    -40032(%ebp), %eax
        cmpl    %eax, -40020(%ebp)
        jl      .L5 #小于转移
        jmp     .L4
.L15:
        nop #delay slot?
.L4:
        movl    $0, -40028(%ebp) #i=0
        jmp     .L6
.L10:
        movl    -40028(%ebp), %eax
        addl    $1, %eax #i++
        movl    %eax, -40024(%ebp)
        jmp     .L7
.L9: #scanf("%d",array+k)
        movl    -40024(%ebp), %eax
        movl    -40012(%ebp,%eax,4), %edx
        movl    -40028(%ebp), %eax
        movl    -40012(%ebp,%eax,4), %eax
        cmpl    %eax, %edx
        jge     .L8 #k<n,then jump to k+1
        movl    -40024(%ebp), %eax
        movl    -40012(%ebp,%eax,4), %eax
        movl    %eax, -40016(%ebp)
        movl    -40028(%ebp), %eax
        movl    -40012(%ebp,%eax,4), %edx
        movl    -40024(%ebp), %eax
        movl    %edx, -40012(%ebp,%eax,4)
        movl    -40028(%ebp), %eax
        movl    -40016(%ebp), %edx
        movl    %edx, -40012(%ebp,%eax,4)
.L8:
        addl    $1, -40024(%ebp) #k+1
.L7:
        movl    -40032(%ebp), %eax
        cmpl    %eax, -40024(%ebp)
        jl      .L9 #circuit
        addl    $1, -40028(%ebp)
.L6:
        movl    -40032(%ebp), %eax
        cmpl    %eax, -40028(%ebp) #i<n
        jl      .L10
        movl    $0, -40020(%ebp) #else j=0
        jmp     .L11
.L12:
        movl    -40020(%ebp), %eax
        movl    -40012(%ebp,%eax,4), %eax
        subl    $8, %esp
        pushl   %eax
        pushl   $.LC1
        call    printf
        addl    $16, %esp
        addl    $1, -40020(%ebp)
.L11: #printf the sorted array
        movl    -40032(%ebp), %eax
        subl    $1, %eax
        cmpl    -40020(%ebp), %eax
        jg      .L12
        movl    -40020(%ebp), %eax
        movl    -40012(%ebp,%eax,4), %eax
        subl    $8, %esp
        pushl   %eax
        pushl   $.LC0
        call    printf
        addl    $16, %esp
        movl    $0, %eax
        movl    -12(%ebp), %ecx
        xorl    %gs:20, %ecx
        je      .L14
        call    __stack_chk_fail
.L14:
        movl    -4(%ebp), %ecx
        .cfi_def_cfa 1, 0
        leave
        .cfi_restore 5
        leal    -4(%ecx), %esp
        .cfi_def_cfa 4, 4
        ret #return and exit the process
        .cfi_endproc
.LFE0:
        .size   main, .-main
        .ident  "GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.12) 5.4.0 20160609"
        .section        .note.GNU-stack,"",@progbits
# variable and Memory allocate
# var_name Mem_allocate($x(%%ebp))
#       n       -40032
#       c       -40033
#       k       -40020
#       i       -40028
#       j       -40024
```

### 对比

#### gcc && clang

clang中，变量保存在寄存器中，寄存器放不下再从栈中取变量加入寄存器，R-type指令对寄存器中的值进行操作

gcc中，用户定义的变量存在内存中，R-type指令直接对内存操作

#### -m32 && -m64

主要是操作数长的问题，在AT&T汇编中，用l表示双字，q表示4字，pushq表示操作数为64位，pushl表示操作数为32位