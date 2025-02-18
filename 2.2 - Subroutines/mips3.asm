.data

.text
.globl main
main:
	li $t0, 5
	move $a0, $t0
	
	jal factorial
	
	move $t1, $v0
	
	li $v0, 10
	syscall

factorial:
	beq $a0, $zero, base #stop condition for recursion
	
	# saves one addi operation lol
	addi $sp, $sp, -8
  sw $ra, 4($sp)
  sw $a0, ($sp)
  
  addi $a0, $a0, -1
  jal factorial
  
  lw $a0, ($sp)
  lw $ra, 4($sp)
  addi $sp, $sp, 8
  
  mul $v0, $a0, $v0
  
	jr $ra

base:
	li $v0, 1
	jr $ra