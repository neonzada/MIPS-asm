.macro PRINT_STR(%x)
	li $v0, 4
	la $a0, %x
	syscall
.end_macro

.data
	greet: 	.asciiz "Digite um nome (0<50 caracteres) ou \"Sair\" para sair:\n"
	buffer: .space 1
.text
.globl main
main:
loop:
	PRINT_STR(buffer)
	PRINT_STR(greet)
	
	# Read a 50char string
	li $v0, 8
	la $a0, buffer
	addi $a1, $zero, 50
	syscall
	
	la $t1, buffer
	addi $t1, $t1, -1
	
	lb $t4, buffer
	la $t2, buffer
	
	#Check if Sair
	beq $t4, 83, sair
	bgt $t4, 96, cap
	
	strLoop:
		addi $t1, $t1, 1 #adjust prev pointer
		addi $t2, $t1, 1 #actual pointer
		
		lb $t3, ($t1) #$t3 = prev
		lb $t4, ($t2) #$t4 = actual
		
		#check if nullterm
		beq $t4, 0, quit
		
		#check if LF
		beq $t4, 10, loop
		
		#if space before and uncapitalized letter after -> capitalize letter after
		beq $t3, ' ', spaceCheck

		#otherwise, if capitalize -> uncap
		blt $t4, 91, uncap
		j strLoop

	spaceCheck:
		bgt $t4, 96, cap
		j strLoop

	uncap:
		beq $t4, ' ', strLoop
		addi $t4, $t4, 32
		sb $t4, ($t2)
		j strLoop
		
	cap:
		addi $t4, $t4, -32
		sb $t4, ($t2)
		j strLoop
	
	sair:
		lb $t4, 1($t2)
		bne $t4, 97, strLoop
		lb $t4, 2($t2)
		bne $t4, 105, strLoop
		lb $t4, 3($t2)
		bne $t4, 114, strLoop
		lb $t4, 4($t2)
		bne $t4, 10, strLoop
	
	quit:
		li $v0, 10
		syscall