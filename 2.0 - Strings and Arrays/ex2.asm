.data
	megu: .asciiz "my name is  megumin"

.text
	la $t0, megu
	li $t1, ' '
	#read first char, if NULL quit, if not space then capitalize
	lb $t3, 0($t0)
	beq $t3, $zero, quit
	bne $t3, $t1, cap
	
	loop:
		addi $t0, $t0, 1
		lb $t2, 0($t0) #$t2 = actual
		lb $t3, 1($t0) #$t3 = next 
		
		#if next == NULL, end
		beq $t3, $zero, quit
		
		#if actual == ' ' && next != ' ', capitalize next
		beq $t2, ' ', checkSpace

		j loop
	
	checkSpace:
		bne $t3, ' ', capNext
		j loop
	
	cap: 
		addi $t3, $t3, -32
		sb $t3, 0($t0)
		addi $t0, $t0, 1
		j loop
	
	capNext:
		addi $t3, $t3, -32
		sb $t3, 1($t0)
		addi $t0, $t0, 1
		j loop
	
	quit:
		li $v0, 4
		la $a0, megu
		syscall
		sll $0, $0, 0