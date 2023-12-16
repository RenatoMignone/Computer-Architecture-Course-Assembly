.data
numero: .asciz "inserisci un numero di cui fare il fattoriale: "
risultato: .asciz "il risultato del fattoriale è: "

.text
.globl main
main: 
	la	a0,numero
	li	a7,4
	ecall

	li	a7,5
	ecall
	li	t3,0
	jal	fattoriale
	
	mv	a0,t3
	li	a7,1
	ecall
	
	li	a7,10
	ecall
	
fattoriale:
	mv	t0,a0
	add	t3,t3,t0
fattoriale_loop:
	addi	t1,t0,-1
	beqz 	t1,exit

	mul	t3,t3,t1
	addi	t0,t0,-1
	j	fattoriale_loop
	
exit:
	jr	ra