# Ali Altaf Salemwala
# Lab 1
# Problem 1

# Create an array of maximum size 20 elements that:
# Asks the user first the number of elements and then enters the elements one by one.
# Then displays the array contents.
# Then reverses the array contents.
# Then displays the reversed array.

.data
	maxSize:	.word 20
	array:		.space 80
	sizeReqStr: 	.asciiz "Please enter the number of elements (less than 20): "
	elReqStr:	.asciiz "Please enter an element for your array: "
	arrayDispStr:	.asciiz "The array contents are: "
	revStr:		.asciiz "Reversing..."
	space:		.asciiz " "
	newLine:	.asciiz "\n"

.text
	la $s0, array		# $s0 array address (beginning)
	lw $s1, maxSize		# $s1 maxSize allowed, later changes to chosen size
sizeReq:
	la $a0, sizeReqStr
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	bgt $v0, $s1, sizeReq
	addi $s1, $v0, 0	# $s1 now chosen size
	li $t0, 0
elReq:
	bge $t0, $s1, begrev
	la $a0, elReqStr
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	sll $t1, $t0, 2
	sw $v0, array($t1)
	addi $t0, $t0, 1
	j elReq
begrev:
	jal begdisp
	li $t0, 0
	addi $t1, $s1, -1
	sll $t1, $t1, 2
	la $a0, revStr
	li $v0, 4
	syscall
	la $a0, newLine
	syscall
rev:
	bge $t0, $t1, dispQuit
	lw $t2, array($t0)
	lw $t3, array($t1)
	sw $t2, array($t1)
	sw $t3, array($t0)
	addi $t0, $t0, 4
	addi $t1, $t1, -4
	j rev
begdisp:
	la $a0, arrayDispStr
	li $v0, 4
	syscall
	li $t0, 0
disp:
	bge $t0, $s1, enddisp
	sll $t1, $t0, 2
	addi $t0, $t0, 1
	lw $a0, array($t1)
	li $v0, 1
	syscall
	la $a0, space
	li $v0, 4
	syscall
	j disp
enddisp:
	la $a0, newLine
	syscall
	jr $ra
dispQuit:
	jal begdisp
	li $v0, 10
	syscall