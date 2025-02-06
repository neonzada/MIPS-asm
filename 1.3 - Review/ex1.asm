.data
	arr: .space 32
.text
	lui $t0, 0x1001
	addi $t2, $zero, 0 #i
	addi $t3, $zero, 8
	addi $t4, $zero, 2
	loop:
		beq $t2, $t3, exit
		
		div $t2, $t4
		mfhi $t1
		beq $t1, $zero, arrMult
		
		sll $t5, $t2, 2 #i*4 to access vec
		add $t6, $t5, $t0 #calc next pos
		lw $t7, 0($t6) #arr[i]
		
		addi $t5, $t2, -1
		sll $t5, $t5, 2 #(i-1) * 4
		add $t6, $t5, $t0
		lw $t6, 0($t6) #arr[i-1]
		
		add $t7, $t6, $t7 #add both of them
		sll $t5, $t2, 2 #arr[i]
		add $t6, $t5, $t0
		sw $t7, 0($t6)
		
		addi $t2, $t2, 1
		j loop
	arrMult:
		mult $t2, $t4
		mflo $t6
		sll $t5, $t2, 2
		add $t5, $t5, $t0
		sw $t6, 0($t5)
		
		addi $t2, $t2, 1
		j loop
	exit:
		sll $zero, $zero, 0