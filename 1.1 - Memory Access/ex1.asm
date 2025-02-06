.data
	a: .word 3
	b: .word 5
	y: .space 4
.text
	j main

main:
	addi $t1, $zero, -3
	addi $t2, $zero, 7
	
	lui $t0, 0x1001
	lw $t6, 0($t0)
	lw $t7, 4($t0)
	
	# 32ab
	mult $t6, $t7
	mflo $t5
	sll $t5, $t5, 5
	
	#32ab -3a
	mult $t1, $t6
	mflo $t4
	add $t5, $t5, $t4
	
	
	#32ab -3a +7b
	mult $t2, $t7
	mflo $t4
	add $t5, $t5, $t4
	
	#32ab -3a +7b -13
	addi $t5, $t5, -13
	
	sw $t5, 8($t0)
