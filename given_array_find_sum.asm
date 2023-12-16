.data
print1:	.asciz	"inserisci 5 numeri da inserire in un array: "
array:	.word	1,8,5,7,3
esiste:	.asciz	"esiste"
nones:	.asciz	"non esiste"

.text
.globl main
main:
	li	a7,5
	ecall
	
	mv	s1,a0
	la	a0,array
	la	a2,array
	li	a4,4
	li	t3,0
	li	t4,0
	
	jal	loop_esterno
	
	
	
loop_esterno:
	lw	t0,(a0)
	jal	loop_interno
	addi	t4,t4,-4
	
	addi	a2,a2,-16
	beq	t3,a4,none
	addi	t3,t3,1
	addi	a0,a0,4
	j	loop_esterno
	
	
loop_interno:
	lw	t1,(a2)
	beq 	t1,t0,skip
	add	t2,t0,t1
	beq	s1,t2,esistee	
	
skip:	
	beq 	t4,a4,exit
	addi	t4,t4,1
	addi	a2,a2,4
	j	loop_interno
	
none:
	la	a0,nones
	li	a7,4
	ecall
	
	li	a7,10
	ecall
	
esistee:
	la	a0,esiste
	li	a7,4
	ecall
	
	li	a7,10
	ecall
	
exit:
	ret