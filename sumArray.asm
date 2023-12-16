#array di 5 numeri, e sum, return boolean

.data
array:	.word	1, 8, 5, 7, 3
e:	.asciz	"ESISTE"
ne:	.asciz 	"NON ESISTE"
.text
.globl main
main:	
	li	a7, 5
	ecall
	
	mv	s1, a0
	la 	a0, array
	la	a2, array
	li	a4, 4
	li	t4, 0
	li	t3, 0
		
loop_esterno:
	lw	t0, (a0)
	beq	t3, a4, none
	li	t4, 0
	addi	t3, t3, 1

loop_interno:
	lw	t1,(a2)
	beq	t1, t0, skip
	add	t2, t1, t0
	beq	s1, t2, esiste
skip:
	beq 	a4, t4, plus_loop
	addi	t4, t4, 1
	addi	a2, a2, 4
	j	loop_interno
plus_loop:
	addi	a0, a0, 4
	addi	a2, a2, -16
	j	loop_esterno
	
esiste:
	la	a0, e
	li	a7, 4
	ecall
	j	end
none:
	la	a0, ne
	li	a7, 4	
	ecall
	j	end
end:	
	li	a7, 10
	ecall
	
