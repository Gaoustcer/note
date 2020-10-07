# 32位RISC-V指令集阅读报告

## 寄存器

（暂时略去程序员可见的寄存器功能）

## Base Instruction Formats

### 指令种类

R func[21:25]+rs2[24:20]+rs1[19:15]+funct3[14:12]+rd[11:7]+opcode[6:0]

I Imm[31:20]+rs1[19:15]+funct3[14:12]+rd[11:7]+opcode[6:0]

S Imm[31:25]+rs2[24:20]+rs1[19:15]+funct3[14:12]+Imm[11:7]+opcode[6:0]

U Imm[31:12]+rd[11:7]+opcode[6:0]

所有指令都是32位，在IF段可能产生因为非对齐访问导致的异常（非正常顺序执行）

rs，rt，rd三个寄存器操作数，立即数要做带符号扩展

处理立即数存在两种变体

### RISC-V中的跳转指令

没有延迟槽

page fault在取指是发生，则page fault视为跳转指令目标指令引发的异常

question：立即数的存放为什么有5种类型？

为了让逻辑电路设计时结构比较简单

question：为什么RISC-V没有延迟槽？

RISC-V采用成熟的分支预测技术的，分支预测出错的概率很小，分支预测出错的损失很小

但是这里我有一点疑问，处理器延迟槽的产生应该和处理器的结构有关，主要在于跳转指令在哪个流水段进行跳转，而分支预测似乎不能消除延迟槽？只能减少延迟槽带来的损失

## Code reading

### instruction _aligner

* input signal

  | signal name   | signal function                        | width |
  | ------------- | -------------------------------------- | ----- |
  | fetch_valid_i | to indicate whether the fetch is valid | 1     |
  | if_valid_i    |                                        | 1     |
  | fetch_rdata_i |                                        |       |
  |               |                                        |       |
  |               |                                        |       |

* output signal

### alu_div

