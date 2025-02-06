.data

.text
  # X Value
  ori $t5, $zero, 2
  
  # Aux values
  addi $t0, $zero, 3
  addi $t1, $zero, -5
  
  # x^2
  mult $t5, $t5
  mflo $t6
  
  # 3x^2
  mult $t6, $t0
  mflo $t6
  
  # -5x
  mult $t5, $t1
  mflo $t2
  
  # 3x^2 -5x
  add $t6, $t6, $t2
  
  # 3x^2 -5x + 13
  addi $t6, $t6, 13


# A instrução ori e a addi não possuem diferenças quando se trata de números positivos. Porém, não é possível realizar
# um ori diretamente com um número negativo.