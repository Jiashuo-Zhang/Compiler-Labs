			.text
			.globl _halloc
_halloc:
			li $v0 9
			syscall
			jr $ra

			.text
			.globl _print
_print:
			li $v0 1
			syscall
			la $a0 newl
			li $v0 4
			syscall
			jr $ra

			.text
			.globl _abort
_abort:
			la $a0 str_er
			li $v0 4
			syscall
			li $v0 10
			syscall

			.data
			.align 0
newl:
			.asciiz "\n"

			.data
			.align 0
str_er:
			.asciiz "ERROR: abnormal termination\n"

			.text
			.globl main
main:
			sw $fp -8($sp)
			sw $ra -4($sp)
			move $fp $sp
			subu $sp $sp 32
			li $v1 4
			move $s0 $v1
			move $a0 $s0
			jal _halloc
			move $t8 $v0
			move $s0 $t8
			move $s1 $s0
			la $v0 Start_start
			la $s0 Start_start
			move $v1 $s1
			sw $s0 0($v1)
			li $v1 4
			move $s0 $v1
			move $a0 $s0
			jal _halloc
			move $t8 $v0
			move $s0 $t8
			move $s0 $s0
			move $v1 $s0
			sw $s1 0($v1)
			sw $s0 -12($fp)
			lw $t8 -12($fp)
			lw $s0 0($t8)
			lw $t9 0($s0)
			sw $t9 -16($fp)
			li $v1 1
			sw $v1 -20($fp)
			li $v1 2
			sw $v1 -24($fp)
			li $v1 3
			sw $v1 -28($fp)
			li $v1 4
			move $t7 $v1
			li $v1 5
			move $t6 $v1
			li $v1 6
			move $t5 $v1
			li $v1 7
			move $t4 $v1
			li $v1 8
			move $t3 $v1
			li $v1 9
			move $t2 $v1
			li $v1 10
			move $t1 $v1
			li $v1 11
			move $t0 $v1
			li $v1 12
			move $s7 $v1
			li $v1 13
			move $s6 $v1
			li $v1 14
			move $s5 $v1
			li $v1 15
			move $s4 $v1
			li $v1 16
			move $s3 $v1
			li $v1 17
			move $s2 $v1
			li $v1 18
			move $s1 $v1
			li $v1 12
			move $s0 $v1
			move $a0 $s0
			jal _halloc
			move $t8 $v0
			move $s0 $t8
			sw $s0 -32($fp)
			li $v1 19
			move $s0 $v1
			lw $t8 -32($fp)
			move $v1 $t8
			sw $s0 0($v1)
			li $v1 20
			move $s0 $v1
			lw $t8 -32($fp)
			move $v1 $t8
			sw $s0 4($v1)
			li $v1 21
			move $s0 $v1
			lw $t8 -32($fp)
			move $v1 $t8
			sw $s0 8($v1)
			lw $a0 -12($fp)
			lw $a1 -20($fp)
			lw $a2 -24($fp)
			lw $a3 -28($fp)
			sw $t7 -12($sp)
			sw $t6 -16($sp)
			sw $t5 -20($sp)
			sw $t4 -24($sp)
			sw $t3 -28($sp)
			sw $t2 -32($sp)
			sw $t1 -36($sp)
			sw $t0 -40($sp)
			sw $s7 -44($sp)
			sw $s6 -48($sp)
			sw $s5 -52($sp)
			sw $s4 -56($sp)
			sw $s3 -60($sp)
			sw $s2 -64($sp)
			sw $s1 -68($sp)
			lw $v0 -32($fp)
			sw $v0 -72($sp)
			lw $t8 -16($fp)
			jalr $t8
			move $s0 $v0
			move $a0 $s0
			jal _print
			lw $ra -4($fp)
			lw $fp -8($fp)
			addu $sp $sp 32
			jr $ra

			.text
			.globl Start_start
Start_start:
			sw $fp -8($sp)
			sw $ra -4($sp)
			move $fp $sp
			subu $sp $sp 136
			sw $s0 -76($fp)
			sw $s1 -80($fp)
			sw $s2 -84($fp)
			sw $s3 -88($fp)
			sw $s4 -92($fp)
			sw $s5 -96($fp)
			sw $s6 -100($fp)
			sw $s7 -104($fp)
			sw $t0 -108($fp)
			sw $t1 -112($fp)
			sw $t2 -116($fp)
			sw $t3 -120($fp)
			sw $t4 -124($fp)
			sw $t5 -128($fp)
			sw $t6 -132($fp)
			sw $t7 -136($fp)
			lw $t8 -72($fp)
			lw $s1 4($t8)
			lw $t8 -72($fp)
			lw $s0 8($t8)
			move $v1 $s1
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $v0 $s0
			lw $s0 -76($fp)
			lw $s1 -80($fp)
			lw $s2 -84($fp)
			lw $s3 -88($fp)
			lw $s4 -92($fp)
			lw $s5 -96($fp)
			lw $s6 -100($fp)
			lw $s7 -104($fp)
			lw $t0 -108($fp)
			lw $t1 -112($fp)
			lw $t2 -116($fp)
			lw $t3 -120($fp)
			lw $t4 -124($fp)
			lw $t5 -128($fp)
			lw $t6 -132($fp)
			lw $t7 -136($fp)
			lw $ra -4($fp)
			lw $fp -8($fp)
			addu $sp $sp 136
			jr $ra


