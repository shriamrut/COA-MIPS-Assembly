.data
.text
.globl main
main:
	li $t6,2
	li $t7,10
	li $t0,0
loop:	ble $t6,0,exit
	add $t0,$t0,$t7
	addi $t6,$t6,-1
	j loop
exit:	move $a0,$t0
	li $v0,1
	syscall
	
	li $v0,10
	syscall