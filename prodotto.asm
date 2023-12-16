.data
print1: .asciz "inserisci il primo numero: "
print2: .asciz "inserisci il secondo numero: "
risultato: .asciz "il risultato della moltiplicazione è: "

.text
.globl main
main: 
	la	a0,print1
	li	a7,4
	ecall
	
	li	a7,5
	ecall
	
	mv	t0,a0
	la	a0,print2
	li	a7,4
	ecall
	
	li	a7,5
	ecall
	
	mv	t1,a0
	
	la	a0,risultato
	li	a7,4
	ecall
	
	mul	a0,t1,t0
	li	a7,1
	ecall
	
	li	a7,10
	ecall