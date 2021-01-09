.ORIG x3000
CHECK:LD R1,ROWA
LD R2,ROWB
LD R3,ROWC
ADD R4,R2,R1
ADD R4,R4,R3
NOT R4,R4
ADD R4,R4,#1
BRZ GAMESTOP
JSR PRINTROWA
JSR PRINTROWB
JSR PRINTROWC
LEA R0,PLAYER
PUTS
LD R0,CURRENTPALYER
OUT
LEA R0,CHOOSE
PUTS
GETC
OUT
ADD R1,R0,#0
GETC
OUT
ADD R2,R0,#0
LD R0,HUOCHE
OUT
OUT
LEA R0,A
LDR R0,R0,#0
NOT R0,R0
LD R3,ROWA
AND R0,R1,R0
BRZ JUDGEA
LEA R0,B
LDR R0,R0,#0
NOT R0,R0
LD R3,ROWB
AND R0,R1,R0
BRZ JUDGEB
LEA R0,C
LDR R0,R0,#0
NOT R0,R0
LD R3,ROWC
AND R0,R1,R0
BRZ JUDGEC
LEA R0,ERROR
PUTS
BRNZP CHECK

JUDGEA:LD R0,ZERO
ADD R3,R3,R0
ADD R4,R2,#0;R3,STORE HAVE O AND R2 STORE REQUIRE O,R1 STORE REQUEST
NOT R4,R4
ADD R4,R3,R4
ADD R4,R4,#1
BRZP RIGHT
LEA R0,ERROR
PUTS 
BRNZP CHECK
RIGHT: ST R4,ROWA
LD R0,CURRENTPALYER
ADD R0,R0,#1
ST R0,CURRENTPALYER
BRNZP CHECK

JUDGEB:LD R0,ZERO
ADD R3,R3,R0
ADD R4,R2,#0;R3,STORE HAVE O AND R2 STORE REQUIRE O,R1 STORE REQUEST
NOT R4,R4
ADD R4,R3,R4
ADD R4,R4,#1
BRZP RIGHTB
LEA R0,ERROR
PUTS 
BRNZP CHECK
RIGHTB: ST R4,ROWB
LD R0,CURRENTPALYER
ADD R0,R0,#1
ST R0,CURRENTPALYER
BRNZP CHECK


JUDGEC:LD R0,ZERO
ADD R3,R3,R0
ADD R4,R2,#0;R3,STORE HAVE O AND R2 STORE REQUIRE O,R1 STORE REQUEST
NOT R4,R4
ADD R4,R3,R4
ADD R4,R4,#1
BRZP RIGHTC
LEA R0,ERROR
PUTS 
BRNZP CHECK
RIGHTC: ST R4,ROWC
LD R0,CURRENTPALYER
ADD R0,R0,#1
ADD R0,R0,#-3
ST R0,CURRENTPALYER
BRNZP CHECK


GAMESTOP:LD R0,CURRENTPALYER
OUT
LEA R0 WIN
PUTS
HALT

PRINTROWA: ST R7,RETURNADDR1
LEA R0,hello
PUTS
LEA R0,A
PUTS
LD R2,ROWA
AND R3,R3,#0
CONA: NOT R4,R3
ADD R5,R2,R4
ADD R5,R5,#1
BRP PRINTOA
LD R0,HUOCHE
OUT
LD R7,RETURNADDR1
RET
PRINTOA: LD R0,O
OUT
ADD R3,R3,#1
BRNZP CONA

PRINTROWB:ST R7,RETURNADDR1
LEA R0,hello
PUTS
LEA R0,B
PUTS
LD R2,ROWB
AND R3,R3,#0
CONB: NOT R4,R3
ADD R5,R2,R4
ADD R5,R5,#1
BRP PRINTOB
LD R0,HUOCHE
OUT
LD R7,RETURNADDR1
RET
PRINTOB: LD R0,O
OUT
ADD R3,R3,#1
BRNZP CONB

PRINTROWC:ST R7,RETURNADDR1
LEA R0,hello
PUTS
LEA R0,C
PUTS
LD R2,ROWC
AND R3,R3,#0
CONC: NOT R4,R3
ADD R5,R2,R4
ADD R5,R5,#1
BRP PRINTOC
LD R0,HUOCHE
OUT
LD R7,RETURNADDR1
RET
PRINTOC: LD R0,O
OUT
ADD R3,R3,#1
BRNZP CONC

RETURNADDR1: .FILL #10
RETURNADDR2: .FILL #10
RETURNADDR3: .FILL #10
ROWA: .FILL #2
ROWB: .FILL #5
ROWC: .FILL #8
CURRENTPALYER: .STRINGZ "1\n"
O: .STRINGZ "o"
num1: .STRINGZ "1"
num2: .STRINGZ "2"
num3: .STRINGZ "3"
A: .STRINGZ "A:"
B: .STRINGZ "B:"
C: .STRINGZ "C:"
ZERO: .STRINGZ "0"
hello: .STRINGZ "ROW "
HUOCHE: .STRINGZ "\n"
PLAYER: .STRINGZ "player"
WIN: .STRINGZ "WIN\n"
CHOOSE: .STRINGZ " choose a row and number of rocks: "
ERROR: .STRINGZ "Invalid move. Try again.\n"
.END