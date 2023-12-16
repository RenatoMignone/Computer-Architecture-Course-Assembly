.data
txt1: 	.asciz		"Inserisci numero:"
txt2:	.asciz		"\nbin:"
txt3: 	.asciz		"\nNumero di uni:"
.text

.globl main
main:
	addi	sp, sp, -100
	la	a0, txt1
	li	a7, 4
	ecall
	
	li 	a7, 5
	ecall
	
	mv	t0, a0
	mv 	t1, sp
	li	t2, 0x1
	
	la	a0, txt3
	li	a7, 4
	ecall
	
	li	a0, 0
	jal	stampa_bin
	li	a7, 1
	ecall
	
	jal	print
	
	li 	a7, 10
	ecall

stampa_bin:
	beq	t0, zero, exit
	and	t3, t0, t2
	srli	t0, t0, 1
	sw	t3, (t1)
	addi	t1, t1, 4
	addi	a1, a1, 1
	beq	t3, t2, conta_uni	
	j	stampa_bin
conta_uni:
	addi	a0, a0, 1
	j	stampa_bin
print:
	la	a0, txt2
	li	a7, 4
	ecall
	
	li 	t0, 0
	
print_loop:
	lw	a0, (t1)
	li 	a7, 1
	ecall
	addi	t1, t1, -4
	beqz	a1, exit
	addi	a1, a1, -1
	
	j	print_loop
	
exit: 
	ret
