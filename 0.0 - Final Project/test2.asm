.macro PUSH.B(%byte)
	sb %byte, ($sp)
	addi $sp, $sp, 1
.end_macro 

.macro POP.B(%reg)
	subi $sp, $sp, 1
	lbu %reg, 0($sp)
.end_macro

.macro PUSH.H(%half)
	sh %half, ($sp)
	addi $sp, $sp, 2
.end_macro 

.macro POP.H(%reg)
	subi $sp, $sp, 2
	lh %reg, 0($sp)
.end_macro 

.macro PUSH.W(%word)
	sw %word, ($sp)
	addi $sp, $sp, 4
.end_macro 

.macro POP.W(%reg)
	subi $sp, $sp, 4
	lw %reg, 0($sp)
.end_macro

.macro PUSHI.B(%byte)
	li $at, %byte
	PUSH.B($at)
.end_macro 

.macro PUSHI.H(%half)
	li $at, %half
	PUSH.H($at)
.end_macro 

.macro PUSHI.W(%word)
	li $at, %word
	PUSH.W($at)
.end_macro 

.macro printCharI(%char)
	li $v0, 11
	li $a0, %char
	syscall
.end_macro

.macro printInt(%int)
	li $v0, 1
	move $a0, %int
	syscall
.end_macro

.macro setPixelOptions(%h1, %h2, %h3, %h4, %word)
	PUSHI.H(%h1)
	PUSHI.H(%h2)
	PUSHI.H(%h3)
	PUSHI.H(%h4)
	PUSHI.W(%word)
.end_macro

.macro createPixel()
	POP.W($t4)		# color
	POP.H($t3)    # height
	POP.H($t2)    # width
	POP.H($t1)    # y
	POP.H($t0)    # x
.end_macro

.eqv SCREEN_WIDTH 512
.eqv SCREEN_HEIGHT 512

.text
main:
	li $t0, 0
	
	setPixelOptions(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, 0x0000ff)
	
	jal drawBG
	
	jal drawReimu
	
	li $v0, 10
	syscall
			
drawBG:
	createPixel() #Operate with $t0, $t1, $t2, $t3 and $t4

	lui $t7, 0x1001
	li $t5, SCREEN_WIDTH
	sll $t5, $t5, 2
	
yLoop:
	beq $t1, $t3, yLoopEnd
  move $t6, $t0
  
xLoop:
	beq $t6, $t2, xLoopEnd
	
	sll $t9, $t6, 2
	add $t8, $t7, $t9
	sw $t4, ($t8)
	
	addi $t6, $t6, 1
	j xLoop
	
xLoopEnd:
	addi $t1, $t1, 1
	add $t7, $t7, $t5
	j yLoop
	
yLoopEnd:
	jr $ra


drawReimu:
	setPixelOptions(100, 200, 19, 20, 0x000000)
	createPixel()
	lui $t7, 0x1001
	li $t5, SCREEN_WIDTH
	
	jr $ra
	