.data

.text

  # Base
  addi $t1, $zero, 160
  
  # Height
  addi $t2, $zero, 120
  
  # const 2
  addi $t0, $zero, 2
  
  # b * h / 2
  mult $t1, $t2
  mflo $t3
  
  #srl $t3, $t3, 1
  div $t3, $t0
  mflo $t3