# Ali Altaf Salemwala
# Lab 3
# Part 1 - d
# Part 2 - a

.globl special_case
main:
	li $a0, 0x007FF9FF	# 0x008FF9FF
	jal special_case
	add $a0, $v0, $0
	li $v0, 1
	syscall
	li $v0, 10
	syscall

	# S EEEEEEEE FFFFFFFFFFFFFFFFFFFFFFF	--	format of IEEE 754 32-bit floating-point number
special_case:				# $a0 is IEEE 754 32-bit floating-point number
	andi $v0, $a0, 0x7F800000	# checks if all 1's (masks the other bits)
	seq $v0, $v0, $0
	bnez $v0, done
	ori $v0, $a0, 0x807FFFFF	# checks if all 0's (masks the other bits)
	seq $v0, $v0, 0xFFFFFFFF
done:
	jr $ra				# $v0 is 0 if normal and 1 the bits in the E positions are all 0 or all 1
