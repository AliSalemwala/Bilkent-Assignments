# Ali Altaf Salemwala
# Lab 3
# Part 1 - d
# Part 2 - d

.globl CompareFP
main:
.data
	newLine:	.asciiz "\n"
	space:		.asciiz " "
.text
	li $a0, 4
	jal fillArray		# create array of $a0 size
	move $s0, $v0
	sll $a0, $a0, 2
	add $s1, $s0, $a0
	addi $s1, $s1, -4	# $s1 contains address of last position of array + 1
compareLoop:			# compare all values of array in order and print copmared and uncopmared orders
	lw $a0, ($s0)
	li $v0, 34
	syscall
	la $a0, space
	li $v0, 4
	syscall
	lw $a0, 4($s0)
	li $v0, 34
	syscall
	la $a0, newLine
	li $v0, 4
	syscall
	lw $a0, ($s0)
	lw $a1, 4($s0)
	jal CompareFP
	move $a0, $v0
	li $v0, 34
	syscall
	la $a0, space
	li $v0, 4
	syscall
	move $a0, $v1
	li $v0, 34
	syscall
	la $a0, newLine
	li $v0, 4
	syscall
	syscall
	addi $s0, $s0, 4
	blt $s0, $s1, compareLoop
	li $v0, 10
	syscall
	
CompareFP:				# $a0 contains first FP, $a1 contains second
	andi $v0, $a0, 0x80000000	# check first bit in $a0
	andi $v1, $a1, 0x80000000	# check first bit in $a0
	beq $v0, $v1, sameSign		# if both have same sign bit, check exponent, else the one with a 0 sign bit is greater
	beqz $v0, a0G
	j a1G
sameSign:
	sll $v0, $a0, 1			# remove sign bit from consideration
	sll $v1, $a1, 1			# remove sign bit from consideration
	andi $v0, $v0, 0xFF000000	# check which exponent bits are 1
	andi $v1, $v1, 0xFF000000	# check which exponent bits are 1
	beq $v0, $v1, sameExp		# if both have same exponent bits, check fraction, else the one with a greater (unsigned) exponent is greater
	bgtu $v0, $v1, a0G
	j a1G
sameExp:
	sll $v0, $a0, 9			# remove sign and exponent bits from consideration
	sll $v1, $a1, 9			# remove sign and exponent bits from consideration
	bgtu $v0, $v1, a0G		# compare unsigned bits, check which one is greater
	bgtu $v1, $v0, a1G
	jr $ra
a0G:					# $a0 is greater than $a1
	add $v0, $a0, $0
	add $v1, $a1, $0
	jr $ra
a1G:					# $a1 is greater than $a0
	add $v0, $a1, $0
	add $v1, $a0, $0
	jr $ra