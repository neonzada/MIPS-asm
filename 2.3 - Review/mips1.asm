.macro READ_STR(%str, %size)
	la $a0, %str
	li $a1, %size
	li $v0, 8
	syscall
.end_macro

.macro PRINT_STR(%str)
	li $v0, 4
  la $a0, %str
  syscall
.end_macro

.data
	buff: .space 50
.text
	READ_STR(buff, 50)
	
	la $t0, buff
	loop:
		lb $t1, ($t0)
		beq $t1, '\n', done
		bne $t1, ' ', upar
		addi $t0, $t0, 1
		j loop

	upar:
		addi $t1, $t1, -32
		sb $t1, ($t0)
		addi $t0, $t0, 1
		j loop	
	
	done:
		PRINT_STR(buff)
		li $v0, 10
		syscall