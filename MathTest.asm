.data
mt: 	.asciz	"Ciao benvenuto in Math!\n"

####################CODE#####################
.text
.globl main
	main:
	la 	a0, mt
	li	a7, 4
	ecall 
	
	li a7, 5
	ecall
	mv t0, a0
	ecall
	
	li a0, 1
	ecall
	
	
	li 	a7, 10
	ecall
	
