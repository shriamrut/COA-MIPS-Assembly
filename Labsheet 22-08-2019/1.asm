.data
endl: .asciiz " "
.text
.globl main
main:
	li $t0,20
	li $t1,0
	addi $t1,$t0,5
	ori $t1,$t1,2
	move $a0,$t0
	li $v0,1
	syscall

	la $a0,endl
	li $v0,4
	syscall
	
	move $a0,$t1
	li $v0,1
	syscall
exit:	li $v0,10
	syscall
	