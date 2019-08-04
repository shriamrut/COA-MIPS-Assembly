	.data
msg1: .asciiz "Enter n: "
end:  .asciiz "\n"
msg2: .asciiz "nth fibonacci number: "
	.text
	.globl main
main:
	li $v0,4
	la $a0,msg1
	syscall

	li $v0,5	 #read int
	syscall 	#call sys call
	move $t4,$v0	 #set t4 as read values 
	
	li $v0,4 
	la $a0,end #printing new line
	syscall

	li $t0,1 	#first
	li $t1,1 	#second
	li $t3,2 	#counter
loop:	add $t2,$t0,$t1 	#here t2 is third
	move $t0,$t1 		#set first=second
	move $t1,$t2 		#set second=third
	addi $t3,$t3,1 		#increment counter
	bne $t3,$t4,loop
	
	li $v0,4	#system call to print_string
	la $a0,msg2	#message
	syscall

	li $v0,1 	#system call for printing integer
	move $a0,$t2
	syscall
	jr $ra