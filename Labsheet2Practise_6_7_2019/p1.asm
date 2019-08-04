.data
message: .asciiz "1+2+..+100="
	
	.text
	.globl main
main:
	la $a0,message
	li $v0,4
	syscall
	#nop
	li $20,0
	move $17,$0
loop:	slti $18,$17,101
	beq $18,$0,end_lop
	add $20,$20,$17
	add $17,$17,1
	j loop
	nop
end_lop:
	move $4,$20
	li $v0,1
	syscall
_exit:
	li $v0,10
	syscall
	nop