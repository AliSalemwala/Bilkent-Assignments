# Ali Altaf Salemwala
# Lab 3
# Part 1 - d
# Part 2 - b

.globl get_rand_FP
.data
	space:	.asciiz " "
.text
main:
	li $t0, 10		# array of $t0 normal values of IEEE 754 32-bit floating-point numbers
loop:
	li $a0, 0xFE95AB23	# $a0 contains seed for random hex (randomly chosen seed)
	jal get_rand_FP
	move $a0, $v0
	addi $t0, $t0, -1
	li $v0, 34
	syscall			# display FP value
	la $a0, space
	li $v0, 4
	syscall
	bnez $t0, loop
	li $v0, 10
	syscall

get_rand_FP:
	addi $sp, $sp, -8
	sw $ra, 4($sp)
	sw $a0, 0($sp)
find:
	li $v0, 41		# uses whatever intial value in $a0 as seed for random function
	syscall			# $a0 contains random hex value
	jal special_case	# make sure the number is normal
	bnez $v0, find		# if special case repeats until normal
	move $v0, $a0
	lw $ra, 4($sp)
	lw $a0, 0($sp)
	addi $sp, $sp, 8
	jr $ra			# $v0 contians normal IEEE 754 32-bit floating-point number