#stampare una stringa al contrario
.data
print1:		.asciz		"inserisci una stringa da girare: "
risultato:	.asciz		"la stringa al contrario è:"
array1:		.space		31	

.text
.globl main
main:
	la	a0,print1
	li	a7,4
	ecall
	
	la	a0,array1
	li	a1,30
	li	a7,8
	ecall
	
	mv	t2,a0
	jal	size
	
	addi	t1,t1,-1
	jal	stampa
	
	li	a7,10
	ecall

stampa:
	la	t0,array1
	add	t0,t0,t1

stampa_loop:
	addi	t0,t0,-1
	lb	a0,(t0)
	
	li	a7,11
	ecall
	
	bnez 	a0,stampa_loop
	j	exit
	

size:
	lb	t0,(t2)
	addi	t2,t2,1
	
	beqz    t0,exit
	addi	t1,t1,1
	j	size


exit:
	ret
