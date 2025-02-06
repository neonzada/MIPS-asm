# Simple MIPS code for generating a 512x512 Brazil flag bitmap made with the MARS 4.5 software
# HOWTO:
# Turn on pseudo-instructions, connect the bitmap display (Tools -> Bitmap Display) and run the code!
# Bitmap display settings:
# unit width/height: 32
# display width: 512
# display height: 512
# base address for display: 0x10010000 (static data)

.data
display: .space 1024

.text
li $t0, 0x009739
li $t1, 0

# Green background
loop:
  sw $t0, display($t1)
  addi $t1, $t1, 4
  beq $t1, 1024, resetCounter
  j loop
 
resetCounter:
  li $t0, 0xFEDD00
  addi $t2, $zero, 2
  addi $t3, $zero, 12
  addi $t7, $zero, 2
  addi $t1, $zero, 92