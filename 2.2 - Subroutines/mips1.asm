# Escreva uma subrotina que retorne a média entre três valores. A subrotina deve
# receber como argumentos três inteiros e retornar a média entre eles. Escreva um
# programa para testar a subrotina que leia três valores do usuário e imprima o
# resultado. Importante: Utilize os registradores convencionados para a passagem de
# argumentos e valor de retorno! Armazene o retorno da subrotina (média entre os três
# valores) no registrador $t5.
# Exemplo:
# Entrada Saída
# 51
# 42
# 39 44 -- 44 também deve ser armazenado em $t5

.macro READ_INT(%t)
	li $v0, 5
	syscall
	move %t, $v0
.end_macro

.macro PRINT_STR(%s)
	li $v0, 4
  la $a0, %s
  syscall
.end_macro

.data
	greet1: .asciiz "Digite o primeiro valor: "
	greet2: .asciiz "Digite o segundo valor: "
	greet3: .asciiz "Digite o terceiro valor: "
	result: .asciiz "\nMedia dos tres valores: "
.text
	.globl main
	
main:
	PRINT_STR(greet1)
	READ_INT($a1)
	PRINT_STR(greet2)
	READ_INT($a2)
	PRINT_STR(greet3)
	READ_INT($a3)
	jal media
	move $t5, $v0
	
	PRINT_STR(result)
	li $v0, 1
	move $a0, $t5
	syscall
	
	li $v0, 10
	syscall
	
media:
	add $t0, $a1, $a2
  add $t0, $t0, $a3
  li $t1, 3
  div $t0, $t1
  mflo $v0
  jr $ra
