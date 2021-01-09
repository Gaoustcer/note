.ORIG X3000
 ;r1 points to the fisr node r1=HEAD
LD R1,mem ;load the head address into R1
LDR R2,R1,#0; R2=HEAD->next
C1:BRZ STOP
ADD R2,R2,#0
C2:BRZ ADDHEAD
LDR R3,R1,#1 ;R3 store the header's value
LDR R4,R2,#1 ;R4 store the header->next's value
NOT R5,R3
ADD R6,R4,R5
ADD R6,R6,#1
BRP SWAP
CON: LDR R2,R2,#0
BRNZP C2
ADDHEAD: LDR R1,R1,#0
LDR R2,R1,#0
BRNZP C1
STOP HALT
SWAP: STR R3,R2,#1
STR R4,R1,#1
BRNZP CON
; 0 STORE THE ADDR AND 1 STORE THE VALUE
mem: .FILL #12544
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
.FILL #12546
.FILL #10
.FILL #12548
.FILL #15
.FILL #12550
.FILL #20
.FILL #12555
.FILL #7
NOP
NOP
NOP
.FILL #0
.FILL #8

.end