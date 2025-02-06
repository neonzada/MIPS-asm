.data

.text
  
  # X value
  addi $t1, $zero, -4
  
  # $t4 Dividendo (9x + 7)
  ori $t0, $zero, 9
  mult $t0, $t1
  mflo $t4
  addi $t4, $t4, 7
  
  # $t5 Divisor (2x + 8)
  sll $t5, $t1, 1
  addi $t5, $t5, 8
  
  # Divide $t4 by $t5
  div $t4, $t5
  mflo $t2
  mfhi $t3
  
# Quando x = -4: não é computada a divisão, logo os valores anteriores armazenados nos registradores
# hi e lo são utilizados.