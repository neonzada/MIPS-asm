.data

.text
# Escreva um programa que calcule o valor de 4x - 2y + 3z (armazene os valores de x, y e z em
# $t1, $t2 e $t3, respectivamente) e coloque o resultado em $t7.

	ori $t1, $zero, 5
	ori $t2, $zero, 3
	ori $t3, $zero, 2
	
	ori $t4, $zero, 4
	ori $t5, $zero, 2
	ori $t6, $zero, 3
	
	multu $t4, $t1
	mflo $t7
	mult $t5, $t2
	mflo $t0
	sub $t7, $t7, $t0
	multu $t6, $t3
	mflo $t0
	add $t7, $t7, $t0
	
