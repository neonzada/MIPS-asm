.data

.text
	# Writing 0x12345678 to $t1
	ori $t1, $zero, 0x1234
	sll $t1, $t1, 16
	xori $t1, $t1, 0x5678
	
	# Inverting the sequence
	sll $t2, $t1, 28
	
	# Gets rid of excess bits, adds the bit into the register
	srl $t3, $t1, 4
	sll $t3, $t3, 28
	srl $t3, $t3, 4
	or $t2, $t3, $t2
	
	srl $t3, $t1, 8
	sll $t3, $t3, 28
	srl $t3, $t3, 8
	or $t2, $t3, $t2
	
	srl $t3, $t1, 12
	sll $t3, $t3, 28
	srl $t3, $t3, 12
	or $t2, $t3, $t2
	
	srl $t3, $t1, 16
	sll $t3, $t3, 28
	srl $t3, $t3, 16
	or $t2, $t3, $t2
	
	srl $t3, $t1, 20
	sll $t3, $t3, 28
	srl $t3, $t3, 20
	or $t2, $t3, $t2
	
	srl $t3, $t1, 24
	sll $t3, $t3, 28
	srl $t3, $t3, 24
	or $t2, $t3, $t2
	
	srl $t3, $t1, 28
	sll $t3, $t3, 28
	srl $t3, $t3, 28
	or $t2, $t3, $t2