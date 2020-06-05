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
			subu $sp $sp 8
			li $v1 8
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
			la $v0 Start_calc
			la $s0 Start_calc
			move $v1 $s1
			sw $s0 4($v1)
			li $v1 4
			move $s0 $v1
			move $a0 $s0
			jal _halloc
			move $t8 $v0
			move $s0 $t8
			move $s0 $s0
			move $v1 $s0
			sw $s1 0($v1)
			move $s1 $s0
			lw $s0 0($s1)
			lw $s0 0($s0)
			move $a0 $s1
			jalr $s0
			move $s0 $v0
			move $a0 $s0
			jal _print
			lw $ra -4($fp)
			lw $fp -8($fp)
			addu $sp $sp 8
			jr $ra

			.text
			.globl Start_calc
Start_calc:
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

			.text
			.globl Start_start
Start_start:
			sw $fp -8($sp)
			sw $ra -4($sp)
			move $fp $sp
			subu $sp $sp 180
			sw $s0 -120($fp)
			sw $s1 -124($fp)
			sw $s2 -128($fp)
			sw $s3 -132($fp)
			sw $s4 -136($fp)
			sw $s5 -140($fp)
			sw $s6 -144($fp)
			sw $s7 -148($fp)
			sw $t0 -152($fp)
			sw $t1 -156($fp)
			sw $t2 -160($fp)
			sw $t3 -164($fp)
			sw $t4 -168($fp)
			sw $t5 -172($fp)
			sw $t6 -176($fp)
			sw $t7 -180($fp)
			move $s1 $a0
			sw $s1 -12($fp)
			lw $t8 -12($fp)
			lw $s0 0($t8)
			lw $t9 4($s0)
			sw $t9 -16($fp)
			li $v1 1
			sw $v1 -20($fp)
			li $v1 2
			sw $v1 -24($fp)
			li $v1 3
			sw $v1 -28($fp)
			li $v1 4
			sw $v1 -32($fp)
			li $v1 5
			sw $v1 -48($fp)
			li $v1 6
			sw $v1 -52($fp)
			li $v1 7
			sw $v1 -56($fp)
			li $v1 8
			sw $v1 -60($fp)
			li $v1 9
			sw $v1 -64($fp)
			li $v1 10
			sw $v1 -68($fp)
			li $v1 11
			sw $v1 -72($fp)
			li $v1 12
			sw $v1 -76($fp)
			li $v1 13
			sw $v1 -80($fp)
			li $v1 14
			sw $v1 -84($fp)
			li $v1 15
			sw $v1 -88($fp)
			li $v1 16
			sw $v1 -92($fp)
			li $v1 17
			sw $v1 -96($fp)
			li $v1 18
			sw $v1 -100($fp)
			li $v1 12
			move $s0 $v1
			move $a0 $s0
			jal _halloc
			move $t8 $v0
			move $s0 $t8
			sw $s0 -36($fp)
			li $v1 19
			move $s0 $v1
			lw $t8 -36($fp)
			move $v1 $t8
			sw $s0 0($v1)
			li $v1 20
			move $s0 $v1
			lw $t8 -36($fp)
			move $v1 $t8
			sw $s0 4($v1)
			sw $s1 -40($fp)
			lw $t8 -40($fp)
			lw $s0 0($t8)
			lw $t9 4($s0)
			sw $t9 -44($fp)
			li $v1 21
			sw $v1 -104($fp)
			li $v1 22
			sw $v1 -108($fp)
			li $v1 23
			sw $v1 -112($fp)
			li $v1 24
			move $t7 $v1
			li $v1 25
			move $t6 $v1
			li $v1 26
			move $t5 $v1
			li $v1 27
			move $t4 $v1
			li $v1 28
			move $t3 $v1
			li $v1 29
			move $t2 $v1
			li $v1 30
			move $t1 $v1
			li $v1 31
			move $t0 $v1
			li $v1 32
			move $s7 $v1
			li $v1 33
			move $s6 $v1
			li $v1 34
			move $s5 $v1
			li $v1 35
			move $s4 $v1
			li $v1 36
			move $s3 $v1
			li $v1 37
			move $s2 $v1
			li $v1 38
			move $s1 $v1
			li $v1 12
			move $s0 $v1
			move $a0 $s0
			jal _halloc
			move $t8 $v0
			move $s0 $t8
			sw $s0 -116($fp)
			li $v1 39
			move $s0 $v1
			lw $t8 -116($fp)
			move $v1 $t8
			sw $s0 0($v1)
			li $v1 40
			move $s0 $v1
			lw $t8 -116($fp)
			move $v1 $t8
			sw $s0 4($v1)
			li $v1 41
			move $s0 $v1
			lw $t8 -116($fp)
			move $v1 $t8
			sw $s0 8($v1)
			lw $a0 -40($fp)
			lw $a1 -104($fp)
			lw $a2 -108($fp)
			lw $a3 -112($fp)
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
			lw $v0 -116($fp)
			sw $v0 -72($sp)
			lw $t8 -44($fp)
			jalr $t8
			move $s0 $v0
			lw $t8 -36($fp)
			move $v1 $t8
			sw $s0 8($v1)
			lw $a0 -12($fp)
			lw $a1 -20($fp)
			lw $a2 -24($fp)
			lw $a3 -28($fp)
			lw $v0 -32($fp)
			sw $v0 -12($sp)
			lw $v0 -48($fp)
			sw $v0 -16($sp)
			lw $v0 -52($fp)
			sw $v0 -20($sp)
			lw $v0 -56($fp)
			sw $v0 -24($sp)
			lw $v0 -60($fp)
			sw $v0 -28($sp)
			lw $v0 -64($fp)
			sw $v0 -32($sp)
			lw $v0 -68($fp)
			sw $v0 -36($sp)
			lw $v0 -72($fp)
			sw $v0 -40($sp)
			lw $v0 -76($fp)
			sw $v0 -44($sp)
			lw $v0 -80($fp)
			sw $v0 -48($sp)
			lw $v0 -84($fp)
			sw $v0 -52($sp)
			lw $v0 -88($fp)
			sw $v0 -56($sp)
			lw $v0 -92($fp)
			sw $v0 -60($sp)
			lw $v0 -96($fp)
			sw $v0 -64($sp)
			lw $v0 -100($fp)
			sw $v0 -68($sp)
			lw $v0 -36($fp)
			sw $v0 -72($sp)
			lw $t8 -16($fp)
			jalr $t8
			move $s0 $v0
			move $v0 $s0
			lw $s0 -12($fp)
			lw $s1 -16($fp)
			lw $s2 -20($fp)
			lw $s3 -24($fp)
			lw $s4 -28($fp)
			lw $s5 -32($fp)
			lw $s6 -36($fp)
			lw $s7 -40($fp)
			lw $t0 -44($fp)
			lw $t1 -48($fp)
			lw $t2 -52($fp)
			lw $t3 -56($fp)
			lw $t4 -60($fp)
			lw $t5 -64($fp)
			lw $t6 -68($fp)
			lw $t7 -72($fp)
			lw $ra -4($fp)
			lw $fp -8($fp)
			addu $sp $sp 180
			jr $ra


