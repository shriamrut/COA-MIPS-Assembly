	.data
	.align 2
String:	.space 12
Input:	.asciiz "\n Enter an integer number between (0 and 10)="
Output: .asciiz "\n\nThe factorial of number entered is "
	.text
	.globl main
main:
	li $2,4
	la $4,Input
	syscall
	
	li $2,5
	syscall
	move $16,$2

	move $4,$2
	jal Check
Check:
	move $8,$4
	bltz $8,Exit
	nop
	bgt $8,10,Exit
	nop
	#jr $31
	addiu $17,$0,1
	move $15,$16
while:	beqz $15,Answer
	
	mul $17,$17,$15
	addi $15,$15,-1
	b while

Exit:	li $2,10
	syscall
Answer: 
	li $2,4
	la $4,Output
	syscall
	
	li $2,1
	move $4,$17
	syscall
	b Exit