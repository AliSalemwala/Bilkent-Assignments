# Ali Altaf Salemwala
# Lab 1
# Problem 2

# Implement the following expression without using div: x = (c-d)%2 

.data
	exp:	.asciiz "x = (c-d) % 2\n"
	cReq:	.asciiz "Please enter your c: "
	dReq:	.asciiz "Please enter your d: "
	xIsStr:	.asciiz "x is: "
.text
	la $a0, exp
	li $v0, 4
	syscall
	la $a0, cReq
	syscall
	li $v0, 5
	syscall
	addi $t0, $v0, 0	# $t0 is c
	la $a0, dReq
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	sub $t0, $t0, $v0	# $t0 is c - d
	la $a0, xIsStr
	li $v0, 4
	syscall
	andi $a0, $t0, 0x1
	li $v0, 1
	syscall
	li $v0, 10
	syscall