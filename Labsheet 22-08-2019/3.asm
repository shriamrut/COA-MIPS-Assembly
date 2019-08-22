.data
n: .word 4
space: .asciiz " "
endl:  .asciiz "\n"
at:    .asciiz " at location "
.text
.globl main
main:
	li $t0,0x10010000
	li $t1,3 
	sw $t1,($t0)
	addiu $t2,$t0,12
	lw $t1,0($t0)
	addi $t1,$t1,-1
	sw $t1,($t2)

	li $t3,0
	la $t4,n
	lw $t5,($t4)

printa: lw $t4,($t0)
	move $a0,$t4
	li $v0,1
	syscall

	la $a0,at
	li $v0,4
	syscall
	
	move $a0,$t0
	li $v0,1
	syscall

	la $a0,endl
	li $v0,4
	syscall
	
	
	lw $t4,($t2)
	move $a0,$t4
	li $v0,1
	syscall
	
	la $a0,at
	li $v0,4
	syscall
	
	move $a0,$t2
	li $v0,1
	syscall
	

exit:   li $v0,10
	syscall