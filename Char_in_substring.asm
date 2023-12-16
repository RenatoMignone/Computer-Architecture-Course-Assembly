.data
	ins:	.asciz		"inserisci una stringa:	"
	tok:	.asciz		"inserisci un carattere da trovare nella stringa: "
.text
.globl main
main:
	addi	sp,sp,-100
	la	a0,ins
	li	a7,4
	ecall
	
	mv	a0,sp
	li	a1,99
	li	a7,8
	ecall
	
	mv	sp,a0
	
	la	a0,tok
	li	a7,4
	ecall
	
	li	a7,8
	ecall
	
	jal	occorrenze
	
	mv	a0,a2
	li	a7,1
	ecall
	
	li	a7,10
	ecall
	
occorrenze:
	mv	t1,sp
	lb	t0,(a0)
	li	a2,0
occorrenze_loop:
	lb	t2,(t1)
	beqz 	t2,exit
	beq 	t2,t0,increm
	addi	t1,t1,1
	j	occorrenze_loop
	
increm:
	addi	t1,t1,1
	addi	a2,a2,1
	j	occorrenze_loop
	
exit:
	ret