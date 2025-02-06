.data
	vec: .word 0, 1, 2, 3, 4, 4, 6, 7, 8, 9

.text
	la $t1, vec
	addi $t0, $zero, 1
	#loop until null term
	loop:
		lw $t2, 0($t1) #$t2 = actual
		lw $t3, 4($t1) #$t3 = next
		beq $t3, $zero, quit
		#if (actual > next){ordered = !ordered; return false}
		sle $t0, $t2, $t3
		beq $t0, 0, quit
		addi $t1, $t1, 4
		j loop
	quit:
		sll $0, $0, 0
