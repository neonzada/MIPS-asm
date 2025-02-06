.data
	a: .word 10
	b: .word 2
	c: .word 4
	#Mediana = 3
	# abc, cba, bac, cab, bca, acb
.text
  lui $t0, 0x1001
  lw $t1, 0($t0) #a
  lw $t2, 4($t0) #b
  lw $t3, 8($t0) #c

  slt $t4, $t2, $t1 #b<a 
  beq $t4, $zero, check_t2_t3
    
  slt $t4, $t3, $t1 #c<a
  beq $t4, $zero, save_t1
  j save_t3 #b<a<c

	check_t2_t3:
    slt $t4, $t3, $t2 #b<a && c<b -> c<b<a
    beq $t4, $zero, save_t2
    j save_t3 #b<a && c>b -> b<c<a

	save_t1:
    sw $t1, 12($t0)
    j exit

	save_t2:
    sw $t2, 12($t0)
    j exit

	save_t3:
    sw $t3, 12($t0)
    j exit
	exit:
		sll $0, $0, 0