.data

.text

# Writing 0xAAAAAAAA to $t1
	ori $t1, $zero, 0xAAAA
	sll $t1, $t1, 16
	xori $t1, $t1, 0xAAAA

# Bit-shift right (0x55555555) and storing to $t2
	srl $t2, $t1, 1
	or $t3, $t1, $t2
	and $t4, $t1, $t2
	xor $t5, $t1, $t2
	
# OR  (0xFFFFFFFF, -1 em complemento de 2): todas as comparações bit a bit retornam verdadeiro, logo todos os bits são setados.
# AND (0x00000000, 0): todas as comparações bit a bit retornam falso, logo todos os bits são setados para 0.
# XOR (0xFFFFFFFF, -1 em complemento de 2): todas as comparações bit a bit retornam verdadeiro, logo todos os bits são setados.