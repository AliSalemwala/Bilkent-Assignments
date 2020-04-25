# Ali Altaf Salemwala
# Lab 2
# Part 2 - 2

.globl bubbleSort
bubbleSort:
	# $a0 has beginning address of array
	# $a1 has # integers in array
	addi $sp, $sp, -20
	sw $s0, 16($sp)
	sw $s1, 12($sp)
	sw $s2, 8($sp)
	sw $t0, 4($sp)
	sw $t1, 0($sp)
start:
	addi $s0, $a0, 0	# $s0 has array address
	li $s1, 1		# $s1 has counter
	li $s2, 1		# $s2 has flag to check if sorting done
compare:
	bge $s1, $a1, done
	addi $s1, $s1, 1
	lw $t0, ($s0)
	lw $t1, 4($s0)
	bgt $t0, $t1, exchange
fixed:
	addi $s0, $s0, 4
	j compare
exchange:
	li $s2, 0
	sw $t1, ($s0)
	sw $t0, 4($s0)
	j fixed
done:
	beqz $s2, start
	lw $s0, 16($sp)
	lw $s1, 12($sp)
	lw $s2, 8($sp)
	lw $t0, 4($sp)
	lw $t1, 0($sp)
	addi $sp, $sp, 20
	jr $ra