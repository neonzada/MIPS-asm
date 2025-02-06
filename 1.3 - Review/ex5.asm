.data
	arr: .space 128
.text
	# fazendo o vetor
	addi $s4, $zero, 32 #32 1-byte elements
	lui $s3, 0x1001
	populateArr:
		beq $t2, $s4, main
		sll $t3, $t2, 2 #i*4
		add $t4, $t3, $s3
		sw $t2, 0($t4)
		addi $t2, $t2, 1
		j populateArr
	
	main:
		addi $s0, $zero, 5
		addi $s1, $zero, 10
		
		ori $t2, $zero, 0 #i
		ori $t7, $zero, 0 #counter
		loop:
			beq $t2, $s4, exit
			sll $t3, $t2, 2
			add $t4, $t3, $s3
			lw $t5, 0($t4)
			#lowerbound check
			sub $t6, $s0, $t5
			bgtz $t6, notInRange
			sub $t6, $s1, $t5
			bltz $t6, notInRange
			#if in range, count
			addi $t7, $t7, 1
		notInRange:
			addi $t2, $t2, 1
			j loop
			
	exit:
		sll $0, $0, 0