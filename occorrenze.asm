.data
	input:	.asciz	"Inserisci stringa: "
	key:	.asciz	"Inserisci key: "
.text
.globl main
main:
	addi	sp, sp, -100
	
	la	a0, input
	li	a7, 4
	ecall
	
	mv	sp, a0
	
	li	a1, 100
	li	a7, 8
	ecall
	
	la	a0, key
	li	a7, 4
	ecall

	li	a7, 8
	ecall
	
	mv	t0, a0
	
	jal	occ
	
	mv	a0, a2
	li	a7, 1
	ecall
	
	li	a7, 10
	ecall
	
occ:
	mv	t1, sp
	li	a2, 0
	lb	t0, (t0)
occ_loop:
	lb	t2, (t1)
	beqz	t2, exit
	bne 	t2, t0, jump
	addi	a2, a2, 1	
jump:
	addi	t1, t1, 1
	
	j	occ_loop

exit:
	ret