#5 numeri interi trovare media in float max min 
.data
print1:		.asciz	"inserisci 5 numeri interi: "
maggiore:	.asciz	"il maggiore tra i numeri inseriti è: "
minore:		.asciz	"\nil minore tra i numeri inseriti è: "
media:		.asciz	"\nla media in float tra i numeri inseriti è: "

.text
.globl main
main:
	addi	sp,sp,-20
	la	a0,print1
	li	a7,4
	ecall
	
	jal 	riempi_array
	
	jal	minore_maggiore
	
	
	la	a0,maggiore
	li	a7,4
	ecall
	
	mv	a0,a3
	li	a7,1
	ecall
	
	la	a0,minore
	li	a7,4
	ecall
	
	mv	a0,a2
	li	a7,1
	ecall
	
	la	a0,media
	li	a7,4
	ecall
	
	fmv.s.x	ft0,a4
	li	t0,5
	fmv.s.x	ft1,t0
	fdiv.s	fa0,ft0,ft1
	
	li	a7,2
	ecall
	
	li	a7,10
	ecall
	
riempi_array:
	mv	t0,sp
	li	t1,5
	li	a4,0
riempi_array_loop:
	beqz	t1,exit
	li	a7,5
	ecall	
	
	add	a4,a4,a0
	
	sw	a0,(t0)
	
	addi	t0,t0,4
	addi	t1,t1,-1
	j	riempi_array_loop
	
minore_maggiore:
	mv	a0,sp
	li	a2,0
	li	a3,0
minore_maggiore_loop:
	lw	t0,(a0)
	beqz 	t0,exit
continua:
	beqz	a2,riempi
	bgt 	t0,a3,riempi_maggiore
	blt	t0,a2,riempi_minore
	addi	a0,a0,4
	j	minore_maggiore_loop

riempi:
	mv	a2,t0
	j	continua
	
riempi_minore:
	mv	a2,t0
	j	continua
	
riempi_maggiore:
	mv	a3,t0
	j	continua
	
	
exit:
	ret