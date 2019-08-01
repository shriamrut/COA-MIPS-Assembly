	.text
	.globl main
main: 
	la $a0,array
	addi $a1,$a0,0
	addi $sp,$sp,-4
	sw $ra,0($sp)
	jal swap
	lw $ra,0($sp)
	addi $sp,$sp,4

	la $t0,array

	lw $a0,0($t0)
	li $v0,1
	syscall
	
	la $a0,space
	li $v0,4
	syscall
	
	
	lw $a0,4($t0)
	li $v0,1
	syscall
	jr $ra

swap:	move $t1,$a0 #first location
	addi $t2,$t1,4 #second location
	lw $t0,0($a0)
	lw $t3,0($t2)
	sw $t0,0($t2)
	sw $t3,0($t1)
	jr $ra
	.data
array:  .word 5, 4, 3, 2 ,1
space:	.asciiz " "
size:	.word 5
