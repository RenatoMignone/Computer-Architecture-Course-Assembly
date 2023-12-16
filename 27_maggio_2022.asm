.data 
print:		.asciz	"Inserisci 6 numeri: \n"
media_pari:	.asciz 	"La media dei numeri nelle posizioni 0 2 4 è: \n"
media_dispari:	.asciz 	" La media dei numeri nelle posizioni 1 3 6 è: "

.text
.globl main
main:
	addi	sp,sp,-24
	mv	a0,sp
	jal	riempi_array
	
	jal	trova_media_pari
	li	t0,3
	
	la	a0,media_pari
	li	a7,4
	ecall
	fmv.s.x	ft0,a2
	fmv.s.x	ft1,t0
	fdiv.s	fa0,ft0,ft1

	li	a7,2
	ecall
	
	la	a0,media_dispari
	li	a7,4
	ecall
	fmv.s.x	ft0,a3
	fmv.s.x	ft1,t0
	fdiv.s	fa0,ft0,ft1

	li	a7,2
	ecall
	
	li	a7,10
	ecall
	
riempi_array:
	la	a0,print
	li	a7,4
	ecall
	mv	t0,sp
	li	t1,0
	li	t2,6
	
riempi_array_loop:
	beq 	t1,t2,exit
	li	a7,5
	ecall
	sw	a0,(t0)
	addi	t0,t0,4
	addi	t1,t1,1
	j	riempi_array_loop
	
trova_media_pari:
	mv	a0,sp
	li	t1,0
	li	t0,1
	
trova_media_pari_loop:
	and	t5,t1,t0
	lw	t2,(a0)
	beqz 	t2,exit
	bnez 	t5,trova_media_dispari_loop

	addi	a0,a0,4
	
	addi	t1,t1,1
	add	a2,a2,t2
	j	trova_media_pari_loop
	
trova_media_dispari_loop:
	add	a3,a3,t2
	addi	t1,t1,-1
	addi	a0,a0,4
	j	trova_media_pari_loop
exit:
	ret