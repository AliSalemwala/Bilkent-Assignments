# Ali Altaf Salemwala
# Lab 3
# Part 1 - d
# Part 2 - e

.globl SlowSort
main:
.data
	newLine:	.asciiz "\n"
	space:		.asciiz " "
.text
	li $a0, 5
	jal fillArray
	move $t0, $a0		# $t0 contains number of elements in array
	move $a1, $v0		# $a1 contains beginning address of array
	move $s0, $a1
	move $s1, $a0
	li $t1, 1
print:
	lw $a0, ($a1)
	li $v0, 34
	syscall
	la $a0, space
	li $v0, 4
	syscall
	addi $t0, $t0, -1
	addi $a1, $a1, 4
	bnez $t0, print
	beqz $t1, quit
	la $a0, newLine
	li $v0, 4
	syscall
	move $a0, $s0
	move $a1, $s1
	jal SlowSort
	move $a1, $s0
	move $t0, $s1
	li $t1, 0
	j print
quit:
	li $v0, 10
	syscall

SlowSort:			# uses BubbleSort algorithm
	addi $sp, $sp, -24
	sw $ra, 20($sp)
	sw $a0, 16($sp)		# $a0 contains beginning address of array
	sw $a1, 12($sp)		# $a1 contains number of elements in array
	sw $t0, 8($sp)
	sw $t1, 4($sp)
	sw $t2, 0($sp)
	sll $t0, $a1, 2
	addi $t0, $t0, -4
	add $t0, $a0, $t0	# $t0 contains address of last element in array
start:
	move $t1, $a0		# $t1 contains address of beginning of array
	li $t2, 1		# $t2 contains flag to stop sorting
sort:
	bge $t1, $t0, done
	lw $a0, ($t1)
	lw $a1, 4($t1)
	jal CompareFP
	bne $v0, $a0, exchange
fixed:
	addi $t1, $t1, 4
	j sort
exchange:
	li $t2, 0		# $t2 set to flag value showing array was changed
	sw $v0, ($t1)
	sw $v1, 4($t1)
	j fixed
done:
	lw $a0, 16($sp)		# $a1 contains beginning address of array
	beqz $t2, start
	lw $ra, 20($sp)
	lw $a1, 12($sp)		# $a1 contains number of elements in array
	lw $t0, 8($sp)
	lw $t1, 4($sp)
	lw $t2, 0($sp)
	addi $sp, $sp, 24
	jr $ra