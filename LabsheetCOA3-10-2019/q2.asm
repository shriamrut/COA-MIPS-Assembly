.data
n: .word 153
space: .asciiz " "
yes: .asciiz "YES"
endl: .asciiz "\n"
no: .asciiz "NO"
.text
.globl main
main:	la $t0,n
	lw $t1,($t0)
	move $s0,$t1
	addi $t3,$t1,0
	li $t6,0
	li $t2,10
loop:	div $t1,$t2
	mflo $t1
	mfhi $t4
	move $t5,$t4
	mul $t5,$t4,$t4
	mul $t5,$t5,$t4
	add $t6,$t6,$t5
	bgt $t1,0,loop
	
	move $a0,$t6
	li $v0,1
	syscall
	
	la $a0,endl
	li $v0,4
	syscall 

	beq $s0,$t6,pyes
	la $a0,no
	li $v0,4
	syscall
	jal exit
pyes:	la $a0,yes
	li $v0,4
	syscall
exit:	li $v0,10
	syscall

