.data
	a: .word -3
	b: .word 7
	c: .word 5
	d: .word -2
	e: .word 8
	x: .word 4
	y: .space 4

.text
	lui $t0, 0x1001
	
	# p(x) = -ax^4 +bx^3 -cx^2 +dx -e
	# p(x) = -e +dx -cx^2 +bx^3 -ax^4
	# rewriting using Horner's method:
	# p(x) = -e +x(d +x(-c +x(+b -ax)))
	
	# +b -ax
	lw $t1, 0($t0)  #a
	lw $t2, 4($t0)  #b
	lw $t7, 20($t0) #x
	mult $t7, $t1
	mflo $t6
	sub $t6, $t2, $t6
	
	# -c +x(+b -ax)
	lw $t1, 8($t0)  #c
	mult $t7, $t6
	mflo $t6
	sub $t6, $t6, $t1
	
	# d +x(-c +x(+b -ax))
	lw $t1, 12($t0) #d
	mult $t7, $t6
	mflo $t6
	add $t6, $t6, $t1
	
	# -e +x(d +x(-c +x(+b -ax))) = 1120
	lw $t1, 16($t0) #e
	mult $t7, $t6
	mflo $t6
	sub $t6, $t6, $t1
	
	sw $t6, 24($t0)