.data 
n: .word 10
spa: .asciiz " "	
msg: .asciiz "\nBlock Transfer is Successfull"
A: .word 11, 12, 14, 15, 6, 1, 2, 3, 4, 5
Block: .space 400
.text

.globl main
main:	li $t0,0 	#counter
	li $t2,0 	#start index
	lw $t4,n 	#size
	loop1:	lw $t3,A($t2)
		sw $t3,Block($t2)	#loop1 comprises of copying elements in a array to a new block  
		addi $t2,$t2,4 		 	
		addi $t0,$t0,1 	
		blt $t0,$t4,loop1
	li $t2,0
	li $t0,0
	loop2:	lw $t3,Block($t2) #loop 2 is for printing the new block block
		move $a0,$t3  	
     		li $v0,1	#printing integer 
		syscall

		li $v0,4
		la $a0,spa 	#printing whitespace
		syscall 

		addi $t2,$t2,4 	#goto next element 	
		addi $t0,$t0,1 	
		blt $t0,$t4,loop2
     	li $v0,4
	la $a0,msg	#print final msg
	syscall 
	jr $ra 

	li $v0,10
	syscall