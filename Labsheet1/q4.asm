.data
n: .word 10
msg: .asciiz "Max value: "
A: .word 11, 12, 14, 15, 6, 1, 2, 3, 4, 5
.text

.globl main
main:	li $t0,1 	#counter
	li $t2,0 	#start index
	lw $t4,n 	#size of the array
	lw $t1,A($t2) 	#intialize max value($t1) as a[0]
	loop:	addi $t2,$t2,4 		#goto next item
		lw $t3,A($t2) 		#load current item to register t3
		bgt $t3,$t1,swap 	#if $t3 > max value set max value as $t3 
		incr:addi $t0,$t0,1 	#increment counter by 1
		blt $t0,$t4,loop 
	li $v0,4
	la $a0,msg
	syscall 

	move $a0,$t1  	#store max value in $a0 for printing
     	li $v0,1 	#to print integer
     	syscall
     	li $v0,10
	syscall
swap:	move $t1,$t3 #set new max value
	jal incr

