# Ali Altaf Salemwala
# Lab 3
# Part 1 - d
# Part 2 - f

.globl FastSort
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
	jal FastSort
	move $a1, $s0
	move $t0, $s1
	li $t1, 0
	j print
quit:
	li $v0, 10
	syscall

FastSort:
	ble $a1, 1, return
	addi $sp, $sp, -32
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $a1, 8($sp)
	sw $s0, 12($sp)
	sw $s1, 16($sp)
	sw $s2, 20($sp)
	sw $t0, 24($sp)
	sw $t1, 28($sp)
	sll $s0, $a1, 2
	add $s0, $a0, $s0
	lw $s1, ($a0)		# $s1 contains the pivot
	addi $s2, $a0, 4	# $s2 contains beginning of less than pivot portion
sortPartition:
	addi $a0, $a0, 4
	beq $a0, $s0, done
	lw $t0, ($a0)
	bgt $t0, $s1, gTPivot
	j sortPartition
gTPivot:
	lw $t1, ($s2)
	sw $t0, ($s2)
	sw $t1, ($a0)
	addi $s2, $s2, 4
	j sortPartition
done:
	addi $s2, $s2, -4
	lw $s0, ($s2)
	lw $a0, 4($sp)
	sw $s1, ($s2)
	sw $s0, ($a0)
	srl $a1, $a1, 1
	jal FastSort
	sll $t0, $a1, 2
	add $a0, $a0, $t0
	lw $a1, 8($sp)
	srl $t0, $t0, 2
	sub $a1, $a1, $t0
	jal FastSort
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	lw $s0, 12($sp)
	lw $s1, 16($sp)
	lw $s2, 20($sp)
	lw $t0, 24($sp)
	lw $t1, 28($sp)
	addi $sp, $sp, 32
return:
	jr $ra