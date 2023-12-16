.data
print1: .asciz "Inserisci una stringa: "
print2: .asciz "I caratteri della stringa inserita sono: "
stringa: .space 31

.text
.globl main
main: 
	la 	a0,print1
	li	 a7,4
	ecall
	
	la 	a0,stringa
	li	 a1,31
	li	 a7,8
	ecall
	
	la	 a0,print2
	li 	a7,4 
	ecall
	
	la 	t0,stringa
	li 	a1,0
	jal 	Loop
	
	mv 	a0,a1
	li 	a7,1
	ecall
	
	li 	a7,10
	ecall

Loop: 
	lb 	a0,(t0)
	bnez 	a0,counter
	addi 	a1,a1,-1
	ret
	
counter: 
	addi 	a1,a1,1
	addi 	t0,t0,1
	j 	Loop
