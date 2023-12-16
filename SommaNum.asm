.data
st1:	.asciz "Inserisci un numero: "
st2:	.asciz "\nIl risultato è "

.text
.globl main
main:
	la 	a0, st1
	li 	a7, 4
	ecall
	
	li 	a7, 5
	ecall
	
	bgez  	a0, continua
	li	t1, -1
	mul  	a0, a0, t1

continua:	
	jal	somma
	
	mv 	a0, t3
	li 	a7, 1
	ecall
	
	li	a7, 10
	ecall
	
somma:
	mv 	t2, a0
	li	t1, 10
	beqz 	t2, exit
	
somma_loop:
	rem	t0, t2, t1				#	modulo salvato
	div  	t2, t2, t1				# 	divisione
	add	t3, t3, t0
	
	beqz 	t2, exit
	j 	somma_loop
	
exit:
	ret
