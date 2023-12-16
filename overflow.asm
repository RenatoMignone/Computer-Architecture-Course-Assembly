.data     
msg:  .asciz "\ninserisci 2 interi\n"
msg2:  .asciz "\n somma:\n"
msg3:  .asciz "\n differenza:\n"
msg4:  .asciz "\n overflow nella somma\n"
msg5:  .asciz "\n overflow nella sottrazione\n"
msg6:  .asciz "\n non si e' verificato overflow\n"

.text
.globl main
main:

la a0,msg
li  a7,4
ecall

li  a7,5
ecall
mv s0,a0

li  a7,5
ecall
mv s1,a0

mv a0,s0
mv a1,s1
jal ra,somma
mv s2,a0

la a0,msg2
li  a7,4
ecall

mv a0,s2
li  a7,1
ecall

mv a0,s0
mv a1,s1
jal ra,differenza
mv s3,a0

la a0,msg3
li  a7,4
ecall

mv a0,s3 
li  a7,1
ecall

li t0, 0x80000000
mv	t1,s0
mv	t2,s1
srli t1,t1,31                          #0 pos    1 neg
srli t2,t2,31


and t3,t0,s2
srli t3,t3,31                  #segno somma   
# t3 = 0 se la somma s2 è positiva        

and t4,t0,s3
srli t4,t4,31                  #segno differenza
#t4 = 1 se la differenza è negativa

beq t1,t2,concordi                     #devo verificare la somma
j discordi                             #devo verificare la differenza 

#t1 segno del primo numero
#t2 segno del secondo numero

concordi:
beqz t1 entpos
j entneg

entpos:
beqz t3,noof
j ofs

entneg:
beq t3,t1,noof
j ofs

discordi:
bgeu s0,s1, primog
j primomin

primog:
beq t1,t4,noof
j ofd

primomin:
beq t2,t4,ofd
j noof

ofd:
la a0,msg5
li  a7,4
ecall
li a7,10
ecall

ofs:
la a0,msg4
li  a7,4
ecall
li a7,10
ecall

noof:
la a0,msg6
li  a7,4
ecall
li a7,10
ecall

differenza:
mv t5,a0
mv t6,a1
sub t5,t5,t6
mv a0,t5
jr ra

somma:
mv t5,a0
mv t6,a1
add t5,t5,t6
mv a0,t5
jr ra