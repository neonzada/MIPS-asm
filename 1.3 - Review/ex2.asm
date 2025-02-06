.data
	n: .word 5
	a: .space 4
.text
	lui $t0, 0x1001
	lw $t1, 0($t0) #n, upperbound
	addi $t7, $zero, 1 #temp pra multiplicar duas bagaca
	loop:
		beq $t2, $t1, exit
		srl $t3, $t2, 1 #i/2
		add $t4, $t1, $t3 #n+i/2
		mult $t4, $t7
		mflo $t5 #res final
		add $t7, $zero, $t5 #move res to temp for further multiplication
		addi $t2, $t2, 1 #increment counter
		j loop
	exit:
		sll $zero, $zero, 0

# 5 + 0 = 5
# 5 + 0 = 25
# 5 + 1 = 150
# 5 + 1 = 900
# 5 + 2 = 6300