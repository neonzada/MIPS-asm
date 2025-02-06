.macro PRINT_STR(%x)
	li $v0, 4
	la $a0, %x
	syscall
.end_macro

.macro READ_INT(%t)
	li $v0, 5
	syscall
	move %t, $v0
.end_macro

.data
	greet1: .asciiz "\nDigite o numero de km viajados\n"
	greet2: .asciiz "\nDigite o numero de litros de gasolina consumidos\n"
	result: .asciiz "km/l: "

.text
.globl main
main:
	lui $t7, 0x1001
	add $t7, $t7, 0x60
	while:
		PRINT_STR(greet1)
		READ_INT($t0)
		
		beq $t0, 0, quit
		
		PRINT_STR(greet2)
		READ_INT($t1)
		
		beq $t1, 0, quit
		
		div $t0, $t1
		mflo $t2
		
		# store result starting at 0x10010060
		sw $t2, ($t7)
		addi $t7, $t7, 4
		
		PRINT_STR(result)
		
		# print integer
		li $v0, 1
		move $a0, $t2
		syscall
		
		j while

	quit:
		li $v0, 10
		syscall