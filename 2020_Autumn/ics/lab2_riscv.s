addi x1,x0,7
addi x2,x0,3
loop: beq x2,x1,END
blt x2,x1,swap #if  x2<x1,then x1=x1-x2;else x2>x1
sub x2,x2,x1
j loop
END: ret
swap: sub x1,x1,x2
j loop