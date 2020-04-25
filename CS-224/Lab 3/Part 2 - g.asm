# Ali Altaf Salemwala
# Lab 3
# Part 1 - d
# Part 2 - g

Lab3:
.data
	welcomeStr:	.asciiz "Welcome! This program will take from you a positive integer, and make an array of that size containing\nIEEE 754 single-precision non-special-case random values. It will also report the time taken to do this task.\nIt will also allow you to sort this array using a sorting algorithm of your choice, and will present the time taken by\nthe algorithm. You can do these tasks as many times as you want. Have fun!\n"
	NReqStr:	.asciiz "Enter the desired positive size of your array: "
	timeStr:	.asciiz "The time taken to do the above tasks in milliseconds was: "
	sortReqStr:	.asciiz "Sorting your array is now possible! Do you want to use an N^2 (enter 1) sorting method or NlogN (enter 0)? "
	againStr:	.asciiz "Do you want to do the above tasks again (enter 1) or quit (enter 0)? "
	newLine:	.asciiz "\n"
.text
	la $a0, welcomeStr
	li $v0, 4
	syscall
NReq:
	la $a0 NReqStr
	syscall
	li $v0, 5
	syscall
	bltz $v0, NReq
	move $s1, $v0		# $s1 contains number of elements in array
	jal getTime
	move $a0, $s1
	jal fillArray
	move $s0, $v0		# $s0 contains beginning address of array
	jal calcTime
	jal presentTime
sortReq:
	la $a0, sortReqStr
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $t2, $v0
	jal getTime
	move $a0, $s0
	move $a1, $s1
	beqz $t2, nLogN
	bnez $t2, n2
	j sortReq
sortDone:
	jal presentTime
again:
	la $a0, againStr
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	beq $v0, 1 Lab3
	bnez $v0, again
	li $v0, 10
	syscall
nLogN:
	move $a0, $s0
	move $a1, $s1
	jal SlowSort
	move $s0, $a0
	move $s1, $a1
	j sortDone
n2:
	move $a0, $s0
	move $a1, $s1
	jal FastSort
	move $s0, $a0
	move $s1, $a1
	j sortDone
getTime:
	li $v0, 30		# $a0 and $a1 together contain system time
	syscall
	move $t0, $a0		# $t0 contains low-order 32 bits
	move $t1, $a1		# $t1 contains high-order 32 bits
	not $t0, $t0
	not $t1, $t1
	li $t3, 1
	add $t0, $t0, $t3
	slt $t3, $t0, $t3
	add $t1, $t1, $t3
	jr $ra
calcTime:
	li $v0, 30
	syscall
	addu $t0, $a0, $t0
	sltu $a0, $t0, $a0
	add $t1, $a1, $t1
	add $t1, $t1, $a0
	jr $ra
presentTime:
	li $t5, 1
	li $t6, 4294967296
	li $t2, 0x00000001
	move $a0, $t0
	li $v0, 1
	syscall
	la $a0, newLine
	li $v0, 4
	syscall
	jr $ra
	
####
getDecimal:
	and $t3, $t2, $t0
	and $t4, $t2, $t1
	mul $t3, $t3, $t5
	mul $t4, $t4, $t6
	add $t7, $t3, $t4
	sll $t2, $t2, 1
	mul $t5, $t5, 2
	bnez $t2, getDecimal
	la $a0, timeStr
	li $v0, 4
	syscall
	move $a0, $t7
	li $v0, 1
	syscall