


.text
.globl main
main:
	li	t0,60
	li	t1,0x03
	
	and	t2,t0,t1
	
	mv	a0,t2
	li	a7,1
	ecall
	
	li	a7,10
	ecall
	
	andi