	.data
n: .word 1234
space: .asciiz " "
.text
.globl main
main:	la $t0,n
	lw $t1,($t0)
	li $t2,10

loop:	div $t1,$t2
	mflo $t1
	mfhi $t4
	move $t5,$t4
	andi $t4,$t4,1
	beq $t4,0,skip
	move $a0,$t5
	li $v0,1
	syscall
	
	la $a0,space
	li $v0,4
	syscall
skip:	bgt $t1,0,loop
	li $v0,10
	syscall