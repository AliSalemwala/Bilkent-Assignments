# Ali Altaf Salemwala
# Lab 2
# Part 2 - 3

.globl minMax
minMax:
	# $a0 has address of array
	# $a1 has # integers in array
	addi $sp, $sp, -12
	sw $t0, 8($sp)
	sw $t1, 4($sp)
	sw $s0, 0($sp)
	li $s0, 1	# $s0 is counter
	lw $v0, ($a0)	# $v0 is min
	lw $v1, ($a0)	# $v1 is max
	addi $a0, $a0, 4
find:
	bge $s0, $a1, done
	addi $s0, $s0, 1
	lw $t0, ($a0)
	addi $a0, $a0, 4
	blt $t0, $v0, lt
	bgt $t0, $v1, gt
	j find
lt:
	addi $v0, $t0, 0
	j find
gt:
	addi $v1, $t0, 0
	j find
done:
	sll $t0, $a1, 2
	sub $a0, $a0, $t0
	lw $t0, 8($sp)
	lw $t1, 4($sp)
	lw $s0, 0($sp)
	addi $sp, $sp, 12
	jr $ra
