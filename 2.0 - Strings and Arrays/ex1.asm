.data
	goat: .asciiz "meu goat segue intacto"

.text
	la $t0, goat
	li $t1, ' ' #32 = space
	loop: #loop until i find a space
		lb $t5, 0($t0) #get char
		beq $t5, $zero, quit
		beq $t5, $t1, remove
		addi $t0, $t0, 1
		j loop
	remove: #shift characters until i find a null term
		ori $t2, $t0, 0
		looprem:
			addi $t3, $t2, 1 #read next
			lb $t4, ($t3) #get char
			beq $t4, $zero, replaceLoop #if zero, loop, and check if quit
			sb $t4, 0($t2)
			addi $t2, $t2, 1
			j looprem
		replaceLoop:
			sb $zero, 0($t2)
			j loop
	quit:
		sll $0, $0, 0