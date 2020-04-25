# Ali Altaf Salemwala
# Lab 1
# Problem 4

# Create an array of maximum size 100 elements. Ask the user the number of elements and enter them one by one.
# Try to do the above with an array with size determined at execution time.
# Let the user perform the following operations with a textual menu.
# Find the sum of all numbers in the array greater than an input number.
# Find the sum of even and odd numbers and display them.
# Display the number of occurences of array elements greater than an input number.

.data
	maxsize:	.word 100
	array:		.space 400
	numElStr:	.asciiz "Enter the number of elements for your array (less than 100): "
	elStr:		.asciiz "Enter an element for your array: "
	
	sumStr:		.asciiz "1. Find the sum of all numbers greater than i.\n"
	sumDecStr:	.asciiz "The sum of all numbers greater than "
	
	evenOddStr:	.asciiz "2. Find the sum of all even numbers and all odd numbers.\n"
	evenDecStr:	.asciiz "The sum of all even numbers is: "
	oddDecStr:	.asciiz "The sum of all odd numbers is: "

	divStr:		.asciiz "3. Find number of occurences of array elements divisible by i.\n"
	divDecStr:	.asciiz "The number of occurences of array elements divisible by "
	
	isStr:		.asciiz " is: "
	
	quitStr:	.asciiz "4. Quit.\n"
	iStr:		.asciiz "Enter your value of i: "
	newLine:	.asciiz "\n"

.text
	lw $s0, maxsize		# $s0 is maxSize, later chosen size
	la $s2, array
numEl:
	# request and store number of elements
	la $a0, numElStr
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	bgt $v0, $s0, numEl
	addi $s0, $v0, 0
	sll $s1, $s0, 2
	# request and store all individual elements of array
	li $t0, 0
el:
	bge $t0, $s1, menu
	la $a0, elStr
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	sw $v0, array($t0)
	addi $t0, $t0, 4
	j el
	# print the menu and process the response
menu:
	la $a0, sumStr
	li $v0, 4
	syscall
	la $a0, evenOddStr
	syscall
	la $a0, divStr
	syscall
	la $a0, quitStr
	syscall
	li $v0, 5
	syscall
	# move to the appropriate branch
	beq $v0, 1, sum
	beq $v0, 2, evenOdd
	beq $v0, 3, divi
	bne $v0, 4, menu
	# or quit
	li $v0, 10
	syscall
	
sum:
	la $a0, iStr
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	li $t0, 0
	addi $t1, $v0, 0
	li $t2, 0
summer:
	bge $t0, $s1, printSum
	lw $t3, array($t0)
	addi $t0, $t0, 4
	ble $t3, $t1, summer
	add $t2, $t2, $t3
	j summer
printSum:
	la $a0, sumDecStr
	li $v0, 4
	syscall
	addi $a0, $t3, 0
	li $v0, 1
	syscall
	la $a0, isStr
	li $v0, 4
	syscall
	addi $a0, $t2, 0
	li $v0, 1
	syscall
	la $a0, newLine
	li $v0, 4
	syscall	
	j menu

evenOdd:
	move $t0, $0
	move $t1, $0	# even sum
	move $t2, $0	# odd sum
eOCalc:
	bge $t0, $s1, printEvenOdd
	lw $t3, array($t0)
	addi $t0, $t0, 4
	andi $t4, $t3, 0x1
	beq $t4, $0, even
	add $t2, $t2, $t3
	j eOCalc
even:
	add $t1, $t1, $t3
	j eOCalc
printEvenOdd:
	la $a0, evenDecStr
	li $v0, 4
	syscall
	addi $a0, $t1, 0
	li $v0, 1
	syscall
	la $a0, newLine
	li $v0, 4
	syscall
	la $a0, oddDecStr
	li $v0, 4
	syscall
	addi $a0, $t2, 0
	li $v0, 1
	syscall
	la $a0, newLine
	li $v0, 4
	syscall
	j menu
divi:
	la $a0, iStr
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	move $t1, $0
	move $t2, $0
diviCalc:
	bge $t1, $s1, printDivisCalc
	lw $t3, array($t1)
	addi $t1, $t1, 4
	div $t3, $t0
	mfhi $t3
	bne $t3, $0, diviCalc
	addi $t2, $t2, 1
	j diviCalc
printDivisCalc:
	la $a0, divDecStr
	li $v0, 4
	syscall
	addi $a0, $t0, 0
	li $v0, 1
	syscall
	la $a0, isStr
	li $v0, 4
	syscall
	addi $a0, $t2, 0
	li $v0, 1
	syscall
	la $a0, newLine
	li $v0, 4
	syscall
	j menu