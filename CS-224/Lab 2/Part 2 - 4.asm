# Ali Altaf Salemwala
# Lab 2
# Part 2 - 4

.globl median
median:
	# $a0 has address of array
	# $a1 has # integers in 
	andi $v0, $a1, 0x01
	beqz $v0, even
odd:
	addi $v0, $a1, 1
	sll $v0, $v0, 1		# div by 2 then mul by 4 == mul by 2
	add $v0, $a0, $v0
	addi $v0, $v0, -4
	lw $v0, ($v0)
	jr $ra
even:
	addi $v0, $a1, 0
	sll $v0, $v0, 1		# div by 2 then mul by 4 == mul by 2
	addi $sp, $sp, -4
	sw $t0, ($sp)
	add $t0, $a0, $v0
	lw $v0, ($t0)
	lw $t0, -4($t0)
	add $v0, $v0, $t0
	sra $v0, $v0, 1
	add $v0, $t0, $v0
	lw $t0, ($sp)
	addi $sp, $sp, 4
	jr $ra
