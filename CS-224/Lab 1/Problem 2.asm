# Ali Altaf Salemwala
# Lab 1
# Problem 1

# Get an input string and check if it is a palindrome. 
	
.data
	string:		.space 100
	strDetStr:	.asciiz "How many characters will your input string contain? (Cannot be more than 100). "
	reqStrStr:	.asciiz "Please enter your string: "
	newLine:	.asciiz "\n"
	isStr:		.asciiz "It is a palindrome."
	notStr:		.asciiz "It is not a palindrome."
	
.text
	# requests and stores number of characters in input string
	la $a0, strDetStr
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	addi $s0, $v0, 0

	# requests and stores input string (up till 100 characters)
	la $a0, reqStrStr
	li $v0, 4
	syscall
	la $a0, string
	addi $a1, $s0, 1
	li $v0, 8
	syscall
	la $a0, newLine
	li $v0, 4
	syscall

	la $s1, string
	add $s2, $s1, $s0
	addi $s2, $s2, -1

checkPal:
	bgt $s1, $s2, isPal
	lb $t0, ($s1)
	lb $t1, ($s2)
	addi $s1, $s1, 1
	addi $s2, $s2, -1
	bne $t0, $t1, notPal
	beq $t0, $t1, checkPal
isPal:
	la $a0, isStr
	j quit
notPal:
	la $a0, notStr
	j quit
quit:
	li $v0, 4
	syscall
	li $v0, 10
	syscall