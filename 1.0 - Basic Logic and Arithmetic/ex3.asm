.data

.text
# Only using R-type instructions, write 0xFFFFFFFF in $t1
# or, and, xor, sll, srl
	ori $t1, $zero, 0x01
	
	#não pode usar nor
	#or $t2, $t1, $zero #Store 0x00000001 in aux register
	#nor $t1, $t1, $zero #Bit-wise nor between 0x00000001 and 0x00000000
	#xor $t1, $t1, $t2 #Adds previous 0x00000001 to $t1
	
	#using stack pointer lol
	srl $t1, $sp, 20
	
	sll $t2, $t1, 8
	or $t1, $t2, $t1
	
	sll $t2, $t1, 16
	or $t1, $t2, $t1