.data

.text
	ori $t1, $0, 63
	loop:
		beq $t1, $zero, exit
		srl $t1, $t1, 1
		addi $t2, $t2, 1
		j loop
		
	exit:
		sll $0, $0, 0