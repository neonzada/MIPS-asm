.macro PRINTSTR(%s)
  li $v0, 4
  la $a0, %s
  syscall
.end_macro

.macro READFLOAT(%f)
  li $v0, 6
  syscall
  mov.s %f, $f0
.end_macro

.data
  greet:          .asciiz "Escolha a forma geométrica (0: Sair, 1: Circunferência, 2: Triângulo, 3: Retângulo): "
  invalid:	  .asciiz "Escolha invalida!"
  prompt_raio:    .asciiz "Digite o raio da circunferência: "
  prompt_base:    .asciiz "Digite a base: "
  prompt_altura:  .asciiz "Digite a altura: "
  resultado:      .asciiz "A área é: "
  pi:             .float 3.1416

.text
.globl main

main:
  PRINTSTR(greet)

  li $v0, 5
  syscall
  move $t0, $v0

try:
  beq $t0, 0, done
  beq $t0, 1, circle
  beq $t0, 2, triangle
  beq $t0, 3, rectangle
	
  PRINTSTR(invalid)
  j try
	
  j done #failsafe, just to be sure

circle:
  PRINTSTR(prompt_raio)
  READFLOAT($f1)

  jal circleArea

  j printResult

triangle:
  PRINTSTR(prompt_base)
  READFLOAT($f1)

  PRINTSTR(prompt_altura)
  READFLOAT($f2)

  jal triangleArea

  j printResult

rectangle:
  PRINTSTR(prompt_base)
  READFLOAT($f1)

  PRINTSTR(prompt_altura)
  READFLOAT($f2)

  jal rectangleArea

printResult:
  PRINTSTR(resultado)

  li $v0, 2
  mov.s $f12, $f0
  syscall

done:
  li $v0, 10
  syscall

circleArea:
  l.s $f3, pi
  mul.s $f0, $f1, $f1
  mul.s $f0, $f0, $f3
  jr $ra

triangleArea:
  mul.s $f0, $f1, $f2
  l.s $f3, 2
  div.s $f0, $f0, $f3
  jr $ra

rectangleArea:
  mul.s $f0, $f1, $f2
  jr $ra
