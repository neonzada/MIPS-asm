.macro READ_INT(%t)
	li $v0, 5
	syscall
	move %t, $v0
.end_macro

.macro PRINT_STR(%x)
	li $v0, 4
	la $a0, %x
	syscall
.end_macro


.data
	greet:		.asciiz "Digite dois numeros:\n"
	menu: 		.asciiz "1.Soma\n2.Subtracao\n3.Multiplicação\n4.Divisão\n"
	resposta: .asciiz "Resposta = "

.text
.globl main
main:
	PRINT_STR(greet)
	
	READ_INT($t0) #a
	READ_INT($t1) #b
	
	PRINT_STR(menu)
	
	READ_INT($t2)
	
	beq $t2, 1, soma
	beq $t2, 2, subtrai
	beq $t2, 3, multiplica
	beq $t2, 4, divide
	j quit
	
	soma:
		add $t2, $t0, $t1
		j quit
		
	subtrai:
		sub $t2, $t0, $t1
		j quit
		
	multiplica:
		mult $t0, $t1
		mflo $t2
		j quit
		
	divide:
		div $t0, $t1
		mflo $t2

	quit:
		PRINT_STR(resposta)
	
		li $v0, 1
		move $a0, $t2
		syscall
		
		li $v0, 10
		syscall