.data 
print:		.asciz	"inserisci un numero: "
print2:		.asciz	"\nNel numero ci sono questo numero di byte nulli: "
.text
.globl main
main:
	la	a0,print
	li	a7,4
	ecall
	li	a7,5
	ecall
	li	a7,35
	ecall
	jal	conta_byte_nulli
	la	a0,print2
	li	a7,4
	ecall
	mv	a0,t3
	li	a7,1
	ecall
	li	a7,10
	ecall
conta_byte_nulli:
	mv	t0,a0
	li	t1,255
	li	t3,0
	li	t4,4
conta_byte_nulli_loop:
	beqz	t4,exit
	and	t2,t0,t1
	addi	t4,t4,-1
	bnez	t2,skip
	addi	t3,t3,1
skip:
	srli	t0,t0,8
	j	conta_byte_nulli_loop
exit:
	ret