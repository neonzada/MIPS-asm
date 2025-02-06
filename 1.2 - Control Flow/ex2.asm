.data
	y: .space 4

.text
	ori $t0, $zero, 0
	ori $t1, $zero, 333
	
	loop:
		addi $t0, $t0, 1
		add $t3, $t3, $t0
		bne $t0, $t1, loop

	lui $t7, 0x1001
	sw $t3, 0($t7)