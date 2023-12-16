.data
stringa:	.asciz		"inserisci una stringa: "
upped:		.asciz		"\nla stringa con le vocali upper è:"
vocalii:		.asciz		"aeiou"

.text
.globl main
main:
	la	a0,stringa
	li	a7,4
	ecall
	
	addi	sp,sp,-50
	li	a1,49
	mv	a0,sp
	li	a7,8
	ecall
	
	jal	verifica
	
	la	a0,upped
	li	a7,4
	ecall
	
	mv	a0,sp
	li	a7,4
	ecall
	
	li	a7,10
	ecall
	
verifica:
	mv	a0,sp
verifica_loop:
	lb	t0,(a0)
	beqz	t0,exit
	
	j	vocali

vocali:
	la	a2,vocalii
vocali_loop:
	lb	t1,(a2)
	beqz	t1,increm
	beq	t0,t1,uppercase
	addi	a2,a2,1
	j	vocali_loop

uppercase:
	addi	t0,t0,-32
	sb	t0,(a0)
	addi	a0,a0,1
	j	verifica_loop
	
increm:
	addi	a0,a0,1
	j	verifica_loop
	
exit:
	ret