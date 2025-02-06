.data
	a: .word 3
	y: .space 4

.text
	lui $t0, 0x1001
	lw $t1, 0($t0)
	addi $t2, $zero, 9
	
	# p(a) = 9a^3 -5a^2 +7a +15
	# p(3) = 9*27 -5*9 + 7*3 + 15
	# p(3) = 243 - 45 + 21 + 15
	# p(3) = 234
	# Horner's method: rewriting p(a):
	# 15 + 7a -5a^2 +9a^3, refactor:
	# 15 +a(7 +a(-5 +9a))
	# This leads to less multiplications (from 6 to 3)
	# 15 + 3(7 + 3(-5 + 9*3))
	# 15+3(7+3(22))
	# 15+3(73)
	# 234
	
	
	# -5 +9a
	mult $t2, $t1
	mflo $t5
	addi $t5, $t5, -5
	
	# 7 +a(-5 +9a)
	mult $t5, $t1
	mflo $t5
	addi $t5, $t5, 7
	
	# 15 +a(7 +a(-5 +9a))
	mult $t5, $t1
	mflo $t5
	addi $t5, $t5, 15
	
	sw $t5, 4($t0)