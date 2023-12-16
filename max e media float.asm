.data
input: .asciz "Inserire intero: "
output1: .asciz "Il max Ë: "
output2: .asciz "\nla media Ë:"

.text
.globl main
main:
     addi sp,sp,-24
     #sw s0,20(sp)
     
     mv a0,sp
     jal riempiarray
     
     mv a0,sp
     jal maxmedia
     mv t0,a0
     
     la a0,output1
     li a7,4
     ecall
     
     
     mv a0,t0
     li a7,1
     ecall
     
     la a0,output2
     li a7,4
     ecall
     
     li a7,2
     ecall
     
     #lw s0,(sp)
     addi sp,sp,20
     li a7,10
     ecall
     
###################
riempiarray:
     mv t0,a0
     li t1,5
     li t2,0
     
     read_loop:
     la a0,input
     li a7,4
     ecall
     
     li a7,5
     ecall
     sw a0,(t0)
     
     addi t2,t2,1
     addi t0,t0,4
     blt t2,t1,read_loop
     jr ra
 
###################################‡‡
maxmedia:
     mv t0,a0
     li t1,0
     li t2,4
     lw t3,(t0)
     add t6,t6,t3
   
     loop_max:
     addi t0,t0,4
     addi t1,t1,1
     lw t4,(t0)
     add t6,t6,t4
     bge t3,t4,no_change_max
     mv t3,t4
     
     no_change_max:
     blt t1,t2,loop_max
     mv a0,t3 #salvo il massimo
     
     media_float:
     li t2,5
     fmv.s.x ft0,t6
     fmv.s.x ft1,t2
     fdiv.s fa0,ft0,ft1

     jr ra
 