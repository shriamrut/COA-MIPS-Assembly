.data	
y:	.space 32
sol:	.asciiz "Final: "
	.text
	.globl main
main:
	li $a0,5
	jal procedure

	move $a0,$v0
	li $v0,1
	syscall

	li $v0,10
	syscall
procedure:
	mul $a0,$a0,3
	addi $a0,$a0,5
	move $v0,$a0
	jr $ra
	