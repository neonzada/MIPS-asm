# Escreva um programa equivalente ao código C abaixo com o assembly do MIPS.
# Assim como no exemplo em C, utilize duas subrotinas (soma3n e soma). Armazene
# os valores em $t0, $t1, $t2 e $t3, para X, Y, Z e R, respectivamente.
# main(){
# int X=150;
# int Y=230;
# int Z=991;
# int R=0;
# R = soma3n(X, Y, Z);
# }
# int soma3n(int n1, int n2, int n3){
# return( soma(n3, soma(n1, n2)));
# }
# int soma(int A, int B){
# return( A+B );
# }

.macro PUSHW(%w)
	addi $sp, $sp, -4
  sw %w, ($sp)
.end_macro

.macro POPW(%w)
	lw %w, ($sp)
	addi $sp, $sp, 4
.end_macro

.data

.text
	.globl main
	
main:
  li $t0, 150     
  li $t1, 230     
  li $t2, 991     
  li $t3, 0       

  move $a0, $t0   
  move $a1, $t1   
  move $a2, $t2   

	# Push temp regs (not really necessary)
	PUSHW($t0)
	PUSHW($t1)
	PUSHW($t2)
	PUSHW($t3)
	
  jal soma3n

	POPW($t3)
	POPW($t2)
	POPW($t1)
	POPW($t0)

  move $t3, $v0   

  li $v0, 10      
  syscall

soma3n:
	# Push $ra as another subroutine call occurs after
  PUSHW($ra)

  move $a0, $a0   
  move $a1, $a1
  jal soma

  move $a0, $a2
  move $a1, $v0
  jal soma

  POPW($ra)
  jr $ra

soma:
  add $v0, $a0, $a1
  jr $ra