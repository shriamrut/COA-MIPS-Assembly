	.data
message: .asciiz "1+2+..+100="
m1     : .asciiz "Enter n: "

m2     : .asciiz "\nSum: "
	
	.text
	.globl main
main:
	la $a0,m1
	li $v0,4
	syscall
	
	li $v0,5
	syscall 
	
	add $v0,$v0,1
	move $21,$v0
	#nop
	li $20,0
	move $17,$0
loop:	slt $18,$17,$21
	beq $18,$0,end_lop
	add $20,$20,$17
	add $17,$17,1
	j loop
	nop
end_lop:
	la $a0,m2
	li $v0,4
	syscall

	move $4,$20
	li $v0,1
	syscall
_exit:
	li $v0,10
	syscall
	nop