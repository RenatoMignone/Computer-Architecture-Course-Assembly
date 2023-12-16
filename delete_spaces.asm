.data
 print1:	.asciz		"inserisci una frase da cui inserire gli spazi:	"
 space:		.asciz		" "
 print2:	.asciz		"la parola inserita non presenta spazi"
 
 .text
 .globl main
 main:
 	addi	sp,sp,-100
 	la	a0,print1
 	li	a7,4
 	ecall
 	
 	mv	a0,sp
 	li	a1,100
 	li	a7,8
 	ecall
 	
 	jal	togli_spazi
 	
 	mv	a0,sp
 	li	a7,4
 	ecall
 	
 	li	a7,10
 	ecall
 	
 togli_spazi:
 	mv	t0,sp
 	mv	t1,sp
	la	t3,space
	lb	t3,(t3)
 	li	a0,0
 	
 togli_spazi_loop:
 	lb	t2,(t1)
 	beqz 	t2,controllo
 	
 	addi	t1,t1,1
 	beq 	t2,t3,incrementa
 	
 	sb	t2,(t0)
 	addi	t0,t0,1
 	
 	j	togli_spazi_loop
 	
 incrementa:
 	addi	a0,a0,1
 	j	togli_spazi_loop
 	
 	
 controllo:
 	bnez  	a0,exit
 	la	a0,print2
 	li	a7,4
 	ecall
 	
 	li	a7,10
 	ecall
 	
 exit:
 	ret