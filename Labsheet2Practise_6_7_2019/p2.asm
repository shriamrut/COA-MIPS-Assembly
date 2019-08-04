	.data
str:	.asciiz "\n The sum of i^2 from 1 .. 4="

newl:	.asciiz "\n"
	
	.text
	.globl main

main:	subu $sp,$sp,4
	sw $ra,0($sp)
	move $s0,$zero
	move $s1,$zero
loop:
	mul $t0,$s0,$s0
	addu $s1,$s1,$t0
	addiu $s0,$s0,1
	ble $s0,4,loop

	li $v0,4
	la $a0,str
	syscall
	
	li $v0,1
	move $a0,$s1
	syscall
	
	li $v0,4
	la $a0,newl
	syscall
	
	lw $ra,0($sp)
	addu $sp,$sp,4
	jr $ra