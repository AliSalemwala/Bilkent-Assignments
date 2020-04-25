# Ali Altaf Salemwala
# Lab 2
# Part 1 - 1. a

.globl convertToDec
convertToDec:
.text
	addi $sp, $sp, -20
	sw $s0, 16($sp)
	sw $s1, 12($sp)
	sw $s2, 8($sp)
	sw $s3, 4($sp)
	sw $s4, 0($sp)
	li $s0, 48		# $s0 contains lower end of ASCII decimal numbers (in hex)
	li $s1, 55		# $s1 contains upper end of ASCII decimal numbers (in hex)
	li $s2, 0		# $s2 contains counter of string characters
	li $s3, 1		# $s3 contians level of 8 (8^0, 8^1, ...)
	li $v0, 0		# $v0 contains actual decimal number
loopToEnd:
	lb $s4, ($a0)
	addi $a0, $a0, 1
	addi $s2, $s2, 1
	bne $s4, $0, loopToEnd
	addi $s2, $s2, -2
	addi $a0, $a0, -3
converter:
	beqz $s2, oct
	addi $s2, $s2, -1
	lb $s4, ($a0)
	addi $a0, $a0, -1
	blt $s4, $s0, notOct
	bgt $s4, $s1, notOct
	sub $s4, $s4, $s0
	mul $s4, $s4, $s3
	sll $s3, $s3, 3
	add $v0, $v0, $s4
	j converter
notOct:
	li $v0, -1
oct:
	lw $s0, 16($sp)
	lw $s1, 12($sp)
	lw $s2, 8($sp)
	lw $s3, 4($sp)
	lw $s4, 0($sp)
	addi $sp, $sp, 20
	jr $ra