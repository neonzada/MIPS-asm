.data
	n: .word 5
	x: .space 4
.text
# 5! = 5 * 4 * 3 * 2 * 1 = 120
# multiply 1 and 2, save result, multiply this by 3
	lui $t0, 0x1001
	lw $t1, 0($t0) #n, upperbound
	addi $t5, $zero, 1 #temp pra multiplicar duas bagaca
	addi $t2, $zero, 0 #counter
	loop:
		beq $t2, $t1, exit
		addi $t2, $t2, 1
		mult $t5, $t2 #tudo * counter
		mflo $t5
		j loop
	exit:
		sw $t5, 4($t0)
		sll $zero, $zero, 0