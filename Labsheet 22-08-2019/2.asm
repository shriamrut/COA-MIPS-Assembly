.data
x: .word 0
y: .word 0
newl: .asciiz "\n"
.text
.globl main
main:
	la $t0,x
	lw $t3,0($t0)
	la $t2,y
	lw $t4,0($t2)
	bne $t3,$zero,elseif
	addi $t4,$t4,1
	j exit
elseif: bne $t3,1,else
	addi $t4,$t4,-1
	j exit
else:
	li $t4,100
exit:	move $a0,$t3
	li $v0,1
	syscall
	la $a0,newl
	li $v0,4
	syscall
	move $a0,$t4
	li $v0,1
	syscall
	li $v0,10
	syscall 