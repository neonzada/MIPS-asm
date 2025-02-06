.data
	x: .word 7
	y: .space 4

.text
	# $t0: counter
	# $t1: first num
	# $t2: second number
	# $t3: sum
	# $t4: x
	# 1, 1, 2, 3, 5, 7, 13, 21, 34
	ori $t2, $zero, 1
	lui $t7, 0x1001
	lw $t4, 0($t7)
	loop:
		add $t3, $t2, $t1
		add $t5, $zero, $t2
		add $t2, $zero, $t3
		add $t1, $zero, $t5
		
		addi $t0, $t0, 1
		beq $t0, $t4, exit
		j loop
	
	exit:
		sw $t5, 4($t7)