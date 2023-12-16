#################  Code  segment  #####################
.text
.globl  main
main:                           	#  main  program  entry
	li          a7,  5    		#  Read  integer
	ecall                    	#  a0  =  value  read	
					#  a0  =  value  to  print
	li          a7,  1		#  Print  integer
	ecall			
	li          a7,  10		#  Exit  program
	ecall
