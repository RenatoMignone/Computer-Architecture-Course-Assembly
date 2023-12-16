.data
stringa:	.asciz	"inserisci una stringa: "
sottostringa:	.asciz	"inserisci una sottostringa: "
sottos:		.space 	10

.text
.globl main
main:
	la	a0,stringa
	li	a7,4
	ecall
	
	addi	sp,sp,-20
	mv	a0,sp
	li	a1,20
	li	a7,8
	ecall
	
	la	a0,sottostringa
	li	a7,4
	ecall
	
	la	a2,sottos
	mv	a0,a2
	li	a1,10
	li	a7,8
	ecall
	
	jal	conta_sottostringa
	
	mv	a0,a3
	li	a7,1
	ecall
	
	li	a7,10
	ecall
	
conta_sottostringa:
	mv	a0,sp
	mv	a4,a2
	li	t4,10
conta_sottostringa_loop:
	lb	t1,(a0)
	beqz	t1,exit
	lb	t2,(a4)
	beq	t2,t4,incrementa
	addi	a0,a0,1
	beq 	t1,t2,avanti
	
	j	conta_sottostringa_loop
	
avanti:
	addi	a4,a4,1
	j	conta_sottostringa_loop
	
incrementa:
	addi	a3,a3,1
	mv	a4,a2
	j	conta_sottostringa_loop
exit:
	ret	