#Palindromo

.data
txt1:	.asciz	"Digita una stringa di max 16 caratteri: "
np:	.asciz 	"Non Palindroma"
p:	.asciz	"Palindroma"

.text
.globl main
main:
	la 	a0, txt1
	li	a7, 4
	ecall
	
	addi	sp, sp, -17
	mv 	a0, sp
	li	a1, 16
	li	a7, 8
	ecall
	
	mv	a0, sp
	jal	conta
	
	jal	inverti
	
	jal	controllo
	
	la	a0, p
	li	a7, 4
	ecall
	
	li	a7, 10
	ecall
	
conta:
	lb	t0, (a0)
	beqz	t0, exit
	addi	a0, a0, 1
	addi	t1, t1, 1
	j	conta

inverti: 
	addi	sp, sp, -17
	addi	t1, t1, 1
	mv	a0, sp
	add	a0, a0, t1
	addi	sp, sp, 16
inverti_loop:	
	addi	sp, sp, 1
	lb	t0, (sp)
	
	beqz 	t0, exit
	sb	t0, (a0)
	addi	a0, a0, -1
	
	j 	inverti_loop
	
controllo:
	lb	t0, (a0)
	beqz	t0, exit
	lb	t1, 17(a0)
	beqz	t1, exit
	
	bne	t0,t1, nonp
	
	addi	a0, a0, 1

nonp:
	la	a0, np
	li	a7, 4
	ecall
	li 	a7, 10
	ecall 
	
exit:
	ret
