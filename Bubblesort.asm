.data
print1:	.asciz	"inserisci 5 numeri interi: "
print2:	.asciz	"i numeri in ordine: "

.text
.globl main
main:
	addi	sp,sp,-20
	
	la	a0,print1
	li	a7,4
	ecall
	
	jal	read
	
	
	jal	bubble
	
	
	
	jal	print

	li	a7,10
	ecall
	
read:
	mv	t0,sp
	li	t1,5
read_loop:
	beqz	t1,exit
	li	a7,5
	ecall
	
	sw	a0,(t0)
	addi	t0,t0,4
	addi	t1,t1,-1
	j	read_loop
	
bubble:
	mv	t0,sp
	
	li	t1,0
	li	t3,4
	li	t4,6
bubble_loop:
	lw	t1,(t0)
	addi	t4,t4,-1
	
	bnez 	t4,bub
	
	ret

bub_replace:
	li	t1,0
	add	t1,t1,t2
	addi	t3,t3,-1
bub:
	addi	t0,t0,4
	beqz 	t3,decrem
	lw	t2,(t0)
	ble  	t1,t2,bub_replace
	sw	t1,(t0)
	addi	t0,t0,-4
	sw	t2,(t0)
	
	addi	t0,t0,4
	addi	t3,t3,-1
	j	bub
	
decrem:
	li	t3,4
	addi	t0,t0,-20
	j	bubble_loop
print:
	mv	t0,sp
	li	t1,5

print_loop:
	lw	a0,(t0)
	li	a7,1
	ecall
	
	addi	t0,t0,4
	addi	t1,t1,-1
	bnez 	t1,print_loop
	
	ret 	

exit:
	ret
