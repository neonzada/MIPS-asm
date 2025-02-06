.macro READ_INT(%t)
	li $v0, 5
	syscall
	move %t, $v0
.end_macro

.data

.text
.globl main
main:
	READ_INT($t1) #a
	READ_INT($t2) #b
	
	 loop:
	 li $v0, 1
	 move $a0, $t0
	 syscall
	 
	 beq $t0, $t1, quit
	 
	 addi $t0, $t0, 1
	 
	 li $v0, 32
	 move $a0, $t2
	 syscall
	 j loop 	 
quit:
	li $v0, 10
	syscall