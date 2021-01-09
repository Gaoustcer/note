.ORIG x3000
AND R0,R0,#0 ;clear R0
AND R1,R1,#0 ;clear R1
ADD R0,R0,#3 ;load a number in R0
ADD R1,R1,#7 ;load a number in R1
GCD: AND R2,R2,#0 ;clear R2
ADD R2,R2,R1 ;R2=R1
NOT R2,R2 ;R2=!R2
ADD R2,R0,R2 
ADD R2,R2,#1 ;R2=R0-R1
BRZ STOP ;R0=R1
BRN SWAP ;change the value store in R0 and R1
ADD R0,R2,#0 ;else R0=R0-R1
BRNZP GCD ;call the gcd function until R0=R1
STOP: HALT
SWAP: ADD R2,R0,#0
ADD R0,R1,#0
ADD R1,R2,#0 ;swap the value between R0 and R1
BRNZP GCD
.end