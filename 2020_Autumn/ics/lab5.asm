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