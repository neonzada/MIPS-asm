.data
	# Uma temperatura, armazenada em $t0, pode ficar em dois intervalos:
	# 20 ≤ temp ≤ 40 e
	# 60 ≤ temp ≤ 80.
	# Escreva um programa que coloque uma flag (registrador $t1) para 1 se a temperatura está
	# entre os valores permitidos e para 0 caso contrário.
	# Inicie o código com a instrução: ori $t0, $zero, temperatura, substituindo
	# temperatura por um valor qualquer.
.text
	ori $t0, $zero, 70
	addi $t2, $t0, -20
	bltz $t2, notSafe

	addi $t2, $t0, -80
	bgtz $t2, notSafe
	
	addi $t2, $t0, -40
	bgtz $t2, maybeSafe
	ori $t1, $zero, 1
	j exit
	maybeSafe:
		addi $t2, $t0, -60
		bltz $t2, notSafe
		ori $t1, $zero, 1
		j exit
	notSafe:
		ori $t1, $zero, 0
	exit: