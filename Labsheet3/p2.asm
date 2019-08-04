.data
char: .byte 'b'
string:	.asciiz "abcdef"
.text
.globl main
main:
	li $s0,0 #counter
	la $t1,string
	lb $t3,char
	li $t5,-1 #index to be returned
loop:	lb $t0,($t1)
	beq $t0,0,end_loop
	seq $t4,$t3,$t0
	beq $t4,1,found
	addi $s0,$s0,1# index increment
	addi $t1,$t1,1
	b loop
found:
	move $t5,$s0#found
end_loop:
	move $a0,$t5
	li $v0,1
	syscall
	li $v0,10 #exit syscall
	syscall 
	