# Ali Altaf Salemwala
# Lab 2
# Part 1 - 1. b

__start:
.data
	result:	.asciiz "Your input, converted to decimal form, is: "
.text
	jal   interactWithUser
	addi $v1, $v0, 0
	la $a0, result
	li $v0, 4
	syscall
	addi $a0, $v1, 0
	li $v0, 1
	syscall
	li $v0, 10
	syscall

interactWithUser:
.data
	octReqStr:	.asciiz "Please enter an octal number: "
	octErrStr:	.asciiz "Your number was not an octal. Please enter an octal: "
	octal:		.space 100
.text
	li $s2, 48	# min ascii val in hex
	li $s3, 56	# max ascii val in hex
octReq:
	# requests and stores octal string
	la $a0, octReqStr
	li $v0, 4
	syscall
takeOct:	
	la $a0, octal
	li $a1, 101
	li $v0, 8
	syscall
	addi $sp, $sp, -4
	sw $ra, ($sp)
	jal convertToDec
	lw $ra, ($sp)
	addi $sp, $sp, 4
	bgez $v0, norm
error:
	la $a0, octErrStr
	li $v0, 4
	syscall
	j takeOct
norm:
	jr $ra