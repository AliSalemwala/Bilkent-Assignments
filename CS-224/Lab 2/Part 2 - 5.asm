# Ali Altaf Salemwala
# Lab 2
# Part 2 - 5

main:
.data
	read:	.asciiz "1. Begin reading your array.\n"
	sort:	.asciiz "2. Begin sorting your array.\n"
	mM:	.asciiz "3. Find minimum and maximum of your array.\n"
	med:	.asciiz "4. Find median of your array (works only if sorted).\n"
	print:	.asciiz "5. Print.\n"
	quit:	.asciiz "6. Quit.\n"
	space:	.asciiz " " 
	newLine: .asciiz "\n"
.text
menu:
	la $a0, newLine
	li $v0, 4
	syscall
	la $a0, read
	syscall
	la $a0, sort
	syscall
	la $a0, mM
	syscall
	la $a0, med
	syscall
	la $a0, print
	syscall
	la $a0, quit
	syscall
	li $v0, 5
	syscall
	# move to the appropriate branch
	addi $a0, $s0, 0
	beq $v0, 1, reader
	beq $v0, 2, sorter
	beq $v0, 3, minMaxer
	beq $v0, 4, medianer
	beq $v0, 5, printer
	bne $v0, 6, menu
	# or quit
	li $v0, 10
	syscall

reader:
	jal readArray
	addi $s0, $v0, 0
	addi $a1, $v1, 0
	j menu
sorter:
	jal bubbleSort
	j menu
minMaxer:
	jal minMax
	addi $a0, $v0, 0
	li $v0, 1
	syscall
	la $a0, space
	li $v0, 4
	syscall
	addi $a0, $v1, 0
	li $v0, 1
	syscall
	j menu
medianer:
	jal median
	addi $a0, $v0, 0
	li $v0, 1
	syscall
	j menu
printer:
	li $s1, 0
	addi $t0, $s0, 0
do:
	bge $s1, $a1, menu
	addi $s1, $s1, 1
	lw $a0, ($t0)
	addi $t0, $t0, 4
	li $v0, 1
	syscall
	la $a0, space
	li $v0, 4
	syscall
	j do
