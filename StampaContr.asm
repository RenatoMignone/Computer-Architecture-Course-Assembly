#stampa al contrario

.data 
txt1:	.asciz	"Digita un stringa: "
array1:	.space	31

.text
.globl main
main:
	la	a0, txt1
	li	a7, 4
	ecall
	
	la	a0, array1
	li	a1, 30
	li	a7, 8
	ecall	
	
	mv 	t3, a0
	jal 	counter
	
	addi	t1, t1,-1
	mv	a0, t1
	
#	li	a7, 1
#	ecall
	
	jal	contr
	
	li	a7, 10
	ecall
	
counter:
	lb	t0, (t3)
	addi	t3, t3, 1
	
	addi	t1, t1, 1
	bnez	t0, counter
	ret

contr: 
	la	t0, array1
	addi	t1, t1, -1
	add	t0, t0, t1
	
	lb	a0, (t0)
	
	li	a7, 11
	ecall
	
	beqz 	t1, exit
	j	contr
	
exit:
	ret