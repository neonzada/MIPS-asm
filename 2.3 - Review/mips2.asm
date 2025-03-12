.macro PRINT_STR(%s)
	li $v0, 4
  la $a0, %s
  syscall
.end_macro

.macro READ_STR(%str, %t)
	la $a0, (%str)
	add $a1, $zero, %t
	li $v0, 8
	syscall
.end_macro

.macro READ_INT(%t)
	li $v0, 5
	syscall
	move %t, $v0
.end_macro

.data
	vecSize:  .asciiz "Digite o tamanho do primeiro vetor:\n"
	vec:      .asciiz "Digite o primeiro vetor:\n"
	vecSize2: .asciiz "\nDigite o tamanho do segundo vetor:\n"
	vec2:     .asciiz "Digite o segundo vetor:\n"
	concat:   .asciiz "\nVetores concatenados: "
	buff: 		.space 1
.text
	la $t7, buff
	
	PRINT_STR(vecSize)
	READ_INT($t0)
	sll $t0, $t0, 1 #for spaces
	PRINT_STR(vec)
	READ_STR($t7, $t0)
	
	add $t7, $t7, $t0
	li $t5, ' '
	sb $t5, -1($t7)
	
	PRINT_STR(vecSize2)
	READ_INT($t1)
	sll $t1, $t1, 1
	PRINT_STR(vec2)
	READ_STR($t7, $t1)
	
	PRINT_STR(concat)
	PRINT_STR(buff)
	
	li $v0, 10
	syscall