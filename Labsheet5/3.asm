.data
arr: .word 11, 22, 33, 44
end: 
.text
.globl main
main:
la $s0, arr
la $s1, end
sub $s1,$s1,$s0
srl $s1,$s1, 2 #endptr - startptr gives the size of array in bits,since each location is 4,dividing it by 4 gives the array length
li $t0,0
li $t1,0
for: 	bge $t1,$s1,exit
     	lw $t2,($s0)
     	andi $t3,$t2,1    #and it by 1,we check whether that last bit is zero,if so then its an even number 
     	beq $t3,$zero,addc
back:	addi $t1,$t1,1
     	addi $s0,$s0,4 
     	j for

addc:   add $t0,$t0,$t2
        j back

exit: 	move $a0,$t0	
	li $v0,1
	syscall

	li $v0,10
	syscall