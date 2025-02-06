.data
	a: .half 30
	b: .half 5
	y: .space 4

.text
	lui $t0, 0x1001
	lh $t1, 0($t0)
	lh $t2, 2($t0)
	
	beq $t1, $t2, multiply
	
	div $t1, $t2
	j exit
	
	multiply:
		mult $t1, $t2
	
	exit:
		mflo $t3
		sw $t3, 4($t0)