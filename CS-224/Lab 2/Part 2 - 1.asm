# OPTIONAL CHALLENGE REMAINING
# Ali Altaf Salemwala
# Lab 2
# Part 2 - 1

.globl readArray
readArray:
.data
	sizeReq:	.asciiz "Please enter the number of integers you want to add: "
	elReq:		.asciiz "Please enter an element for your array: "
.text
	la $a0, sizeReq
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	bltz $v0, readArray
	addi $v1, $v0, 0	# $v1 has # integers in array
	sll $a0, $v1, 2
	li $v0, 9
	syscall
	addi $s1, $v0, 0	# $s1 has beginning address of array
	li $t0, 0		# $t0 counter for array
takeEl:
	bge $t0, $v1, done
	la $a0, elReq
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	sw $v0, ($s1)
	addi $s1, $s1, 4
	addi $t0, $t0, 1
	j takeEl
done:
	sll $t0, $t0, 2
	sub $v0, $s1, $t0
	jr $ra