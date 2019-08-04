.data
list: .word 2, 3, 5, 7, 11, 13, 17, 19, 23, 29
size: .word 10
NL:	.asciiz "\n"
.text
.globl main
main:
lw $t3, size
la $t1, list
li $t2,0
prnlp:
	beq $t2,$t3,prndn
	lw $a0,($t1)
 	li $v0,1
	syscall
	la $a0,NL
	li $v0,4
	syscall
	addi $t2,$t2,1
	addi $t1,$t1,4
	b prnlp
	prndn:
	li $v0,10
	syscall