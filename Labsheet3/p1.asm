.data
array: .word 1, 2, 3, 4, 5, 0
.text
.globl main
main:
	li $s1,0 
	la $t1,array
loop:   lw $t0,($t1) #current element
	beq $t0,$zero,end_loop
	addi $t1,$t1,4
	addi $s1,$s1,1
	b loop
end_loop:
	move $a0,$s1
	li $v0,1
	syscall
	li $v0,10 #exit syscall
	syscall 
	
	