# Escreva um programa que inverta a ordem dos elementos de um vetor (.word) com 5
# posições. Por exemplo, a entrada: 1, 2, 3, 4, 5 deve produzir 5, 4, 3, 2, 1.
# A resposta deve ser o vetor de entrada modificado, e não um novo vetor na memória,
# ou seja, iniciando no endereço de memória 0x10010000.

# ^ - - - ^    ->  swap
# - ^ - ^ -    ->  swap (cute kaomoji)
# - - ^ - -    ->  quit

.macro END
	li $v0, 10
	syscall
.end_macro

.macro SWAP(%reg1, %reg2, %temp1, %temp2)
	lw %temp1, (%reg1)
	lw %temp2, (%reg2)
	sw %temp1, (%reg2)
	sw %temp2, (%reg1)
.end_macro

.eqv	LOWER			$t0
.eqv	HIGHER		$t1
.eqv  TEMPLOW		$t6
.eqv 	TEMPHIGH	$t7

.data
	vec: .word 1,2,3,4,5

.text
	la LOWER, vec
	addi HIGHER, LOWER, 16
	
	loopVec:
		SWAP(LOWER, HIGHER, TEMPLOW, TEMPHIGH)
		
		#adjust pointers
		addi LOWER, LOWER, 4
		addi HIGHER, HIGHER, -4
		
		#if both pointers in the middle, quit
		beq LOWER, HIGHER, quit
		j loopVec
	
	quit:
		END