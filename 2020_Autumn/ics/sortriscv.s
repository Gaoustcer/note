	.text
	.align	2
main:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	lw	a5,-36(s0)
	sw	a5,-20(s0)
	lw	a5,-36(s0)
	lw	a5,0(a5)
	sw	a5,-24(s0)
	j	.OUTLOOP
.swap:
	lw	a5,-20(s0)
	lw	a4,4(a5)
	lw	a5,-24(s0)
	lw	a5,4(a5)
	bge	a4,a5,.p2next
	lw	a5,-20(s0)
	lw	a5,4(a5)
	sw	a5,-28(s0)
	lw	a5,-24(s0)
	lw	a4,4(a5)
	lw	a5,-20(s0)
	sw	a4,4(a5)
	lw	a5,-24(s0)
	lw	a4,-28(s0)
	sw	a4,4(a5)
.p2next:
	lw	a5,-24(s0)
	lw	a5,0(a5)
	sw	a5,-24(s0)
.INLOOP:
	lw	a5,-24(s0)
	bne	a5,zero,.swap
	lw	a5,-20(s0)
	lw	a5,0(a5)
	sw	a5,-20(s0)
.OUTLOOP:
	lw	a5,-20(s0)
	bne	a5,zero,.INLOOP
	nop
	nop
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
