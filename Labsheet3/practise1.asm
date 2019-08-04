.data
list: .word 3, 2, 1, 0, 1, 2
result:	.asciiz "\nThe sum is "
.text
.globl main
main:
	li $s0,0
	li $a0,0
	li $t0,0
forsum:
	bge $s0,6,end_forsum
	lw $t1,list($t0)
	addu $a0,$a0,$t1
	move $t1,$a0
	addi $t0,$t0,4
	addi $s0,$s0,1
	j forsum
end_forsum:
	li $v0,4
	la $a0,result
	syscall
 	move $a0,$t1
	li $v0,1
	syscall
	li $v0,10
	syscall