#################  Data  segment  #####################
.data
str:  	.space      10                         #  array  of  10  bytes
#################  Code  segment  #####################
.text
.globl  main
main:                                          #  main  program  entry
	la          a0,  str                   #  a0  =  address  of  str
	li          a1,  10                    #  a1  =  max  string  length
	li          a7,  8                     #  read  string
	ecall
	li          a7,  4                     #  Print  string  str
	ecall
	li          a7,  10                    #  Exit  program
	ecall

#Service 8 - Follows semantics of UNIX 'fgets'. For specified length n, string 
#can be no longer than n-1. If less than that, adds newline to end. In either case, 
#then pads with null byte If n = 1, input is ignored and null byte placed at buffer 
#address. If n < 1, input is ignored and nothing is written to the buffer.
