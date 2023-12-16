# Title: PrintString
################# Data segment #####################
.data
#data goes here
.data
str: .space 	10 	#alloca 10 bytes di memoria per l'array str
################# Code segment #####################
.text 
.globl main
main: 
	la a0, str
	li a1, 10
	li a7, 8
	ecall
	
	li a7, 4
	ecall
	
	li a7, 10
	ecall