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
			li $v1 16
			move $s0 $v1
			move $a0 $s0
			jal _halloc
			move $t8 $v0
			move $s0 $t8
			move $s2 $s0
			la $v0 QS_Print
			la $s0 QS_Print
			move $v1 $s2
			sw $s0 0($v1)
			la $v0 QS_Init
			la $s0 QS_Init
			move $v1 $s2
			sw $s0 4($v1)
			la $v0 QS_Start
			la $s0 QS_Start
			move $v1 $s2
			sw $s0 8($v1)
			la $v0 QS_Sort
			la $s0 QS_Sort
			move $v1 $s2
			sw $s0 12($v1)
			li $v1 12
			move $s0 $v1
			move $a0 $s0
			jal _halloc
			move $t8 $v0
			move $s0 $t8
			move $s1 $s0
			li $v1 0
			move $s0 $v1
			move $v1 $s1
			sw $s0 4($v1)
			li $v1 0
			move $s0 $v1
			move $v1 $s1
			sw $s0 8($v1)
			move $v1 $s1
			sw $s2 0($v1)
			move $s2 $s1
			lw $s0 0($s2)
			lw $s1 8($s0)
			li $v1 10
			move $s0 $v1
			move $a0 $s2
			move $a1 $s0
			jalr $s1
			move $s0 $v0
			move $a0 $s0
			jal _print
			lw $ra -4($fp)
			lw $fp -8($fp)
			addu $sp $sp 8
			jr $ra

			.text
			.globl QS_Start
QS_Start:
			sw $fp -8($sp)
			sw $ra -4($sp)
			move $fp $sp
			subu $sp $sp 72
			sw $s0 -12($fp)
			sw $s1 -16($fp)
			sw $s2 -20($fp)
			sw $s3 -24($fp)
			sw $s4 -28($fp)
			sw $s5 -32($fp)
			sw $s6 -36($fp)
			sw $s7 -40($fp)
			sw $t0 -44($fp)
			sw $t1 -48($fp)
			sw $t2 -52($fp)
			sw $t3 -56($fp)
			sw $t4 -60($fp)
			sw $t5 -64($fp)
			sw $t6 -68($fp)
			sw $t7 -72($fp)
			move $s2 $a0
			move $s3 $a1
			move $s1 $s2
			lw $s0 0($s1)
			lw $s0 4($s0)
			move $a0 $s1
			move $a1 $s3
			jalr $s0
			move $s0 $v0
			move $s4 $s0
			move $s1 $s2
			lw $s0 0($s1)
			lw $s0 0($s0)
			move $a0 $s1
			jalr $s0
			move $s0 $v0
			move $s4 $s0
			li $v1 9999
			move $s0 $v1
			move $a0 $s0
			jal _print
			lw $s0 8($s2)
			li $v1 1
			move $s1 $v1
			move $v1 $s0
			move $a0 $s1
			sub $t8 $v1 $a0
			move $s0 $t8
			move $s4 $s0
			move $s3 $s2
			lw $s0 0($s3)
			lw $s0 12($s0)
			li $v1 0
			move $s1 $v1
			move $a0 $s3
			move $a1 $s1
			move $a2 $s4
			jalr $s0
			move $s0 $v0
			move $s4 $s0
			move $s1 $s2
			lw $s0 0($s1)
			lw $s0 0($s0)
			move $a0 $s1
			jalr $s0
			move $s0 $v0
			move $s4 $s0
			li $v1 0
			move $s0 $v1
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
			addu $sp $sp 72
			jr $ra

			.text
			.globl QS_Sort
QS_Sort:
			sw $fp -8($sp)
			sw $ra -4($sp)
			move $fp $sp
			subu $sp $sp 72
			sw $s0 -12($fp)
			sw $s1 -16($fp)
			sw $s2 -20($fp)
			sw $s3 -24($fp)
			sw $s4 -28($fp)
			sw $s5 -32($fp)
			sw $s6 -36($fp)
			sw $s7 -40($fp)
			sw $t0 -44($fp)
			sw $t1 -48($fp)
			sw $t2 -52($fp)
			sw $t3 -56($fp)
			sw $t4 -60($fp)
			sw $t5 -64($fp)
			sw $t6 -68($fp)
			sw $t7 -72($fp)
			move $s2 $a0
			move $s3 $a1
			move $s1 $a2
			li $v1 0
			move $s0 $v1
			move $s5 $s0
			move $v1 $s3
			move $a0 $s1
			slt $t8 $v1 $a0
			move $s0 $t8
			beqz $s0 label_1
			lw $s0 4($s2)
			move $s6 $s0
			li $v1 4
			move $s4 $v1
			li $v1 4
			move $s0 $v1
			move $v1 $s0
			move $a0 $s1
			mul $t8 $v1 $a0
			move $s0 $t8
			move $v1 $s4
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s0 $s0
			move $v1 $s6
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s6 $s0
			lw $s0 0($s6)
			move $s6 $s0
			li $v1 1
			move $s0 $v1
			move $v1 $s3
			move $a0 $s0
			sub $t8 $v1 $a0
			move $s0 $t8
			move $s4 $s0
			move $s7 $s1
			li $v1 1
			move $s0 $v1
			move $s0 $s0
			la $v0 label_2
label_2:
			beqz $s0 label_3
			li $v1 1
			move $s0 $v1
			move $s0 $s0
			la $v0 label_4
label_4:
			beqz $s0 label_5
			li $v1 1
			move $s0 $v1
			move $v1 $s4
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s4 $s0
			lw $s0 4($s2)
			move $t0 $s0
			li $v1 4
			move $s5 $v1
			li $v1 4
			move $s0 $v1
			move $v1 $s0
			move $a0 $s4
			mul $t8 $v1 $a0
			move $s0 $t8
			move $v1 $s5
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s0 $s0
			move $v1 $t0
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $t0 $s0
			lw $s0 0($t0)
			move $s0 $s0
			li $v1 1
			move $s5 $v1
			move $v1 $s0
			move $a0 $s6
			slt $t8 $v1 $a0
			move $s0 $t8
			move $v1 $s5
			move $a0 $s0
			sub $t8 $v1 $a0
			move $s0 $t8
			beqz $s0 label_6
			li $v1 0
			move $s0 $v1
			move $s0 $s0
			j label_7
			la $v0 label_6
label_6:
			li $v1 1
			move $s0 $v1
			move $s0 $s0
			la $v0 label_7
label_7:
			nop
			j label_4
			la $v0 label_5
label_5:
			nop
			li $v1 1
			move $s0 $v1
			move $s0 $s0
			la $v0 label_8
label_8:
			beqz $s0 label_9
			li $v1 1
			move $s0 $v1
			move $v1 $s7
			move $a0 $s0
			sub $t8 $v1 $a0
			move $s0 $t8
			move $s7 $s0
			lw $s0 4($s2)
			move $t0 $s0
			li $v1 4
			move $s5 $v1
			li $v1 4
			move $s0 $v1
			move $v1 $s0
			move $a0 $s7
			mul $t8 $v1 $a0
			move $s0 $t8
			move $v1 $s5
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s0 $s0
			move $v1 $t0
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $t0 $s0
			lw $s0 0($t0)
			move $s0 $s0
			li $v1 1
			move $s5 $v1
			move $v1 $s6
			move $a0 $s0
			slt $t8 $v1 $a0
			move $s0 $t8
			move $v1 $s5
			move $a0 $s0
			sub $t8 $v1 $a0
			move $s0 $t8
			beqz $s0 label_10
			li $v1 0
			move $s0 $v1
			move $s0 $s0
			j label_11
			la $v0 label_10
label_10:
			li $v1 1
			move $s0 $v1
			move $s0 $s0
			la $v0 label_11
label_11:
			nop
			j label_8
			la $v0 label_9
label_9:
			nop
			lw $s0 4($s2)
			move $t0 $s0
			li $v1 4
			move $s5 $v1
			li $v1 4
			move $s0 $v1
			move $v1 $s0
			move $a0 $s4
			mul $t8 $v1 $a0
			move $s0 $t8
			move $v1 $s5
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s0 $s0
			move $v1 $t0
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $t0 $s0
			lw $s0 0($t0)
			move $s5 $s0
			lw $s0 4($s2)
			move $t0 $s0
			li $v1 4
			move $t1 $v1
			li $v1 4
			move $s0 $v1
			move $v1 $s0
			move $a0 $s4
			mul $t8 $v1 $a0
			move $s0 $t8
			move $v1 $t1
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s0 $s0
			move $v1 $t0
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $t0 $s0
			lw $s0 4($s2)
			move $t2 $s0
			li $v1 4
			move $t1 $v1
			li $v1 4
			move $s0 $v1
			move $v1 $s0
			move $a0 $s7
			mul $t8 $v1 $a0
			move $s0 $t8
			move $v1 $t1
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s0 $s0
			move $v1 $t2
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $t2 $s0
			lw $s0 0($t2)
			move $v1 $t0
			sw $s0 0($v1)
			lw $s0 4($s2)
			move $t1 $s0
			li $v1 4
			move $t0 $v1
			li $v1 4
			move $s0 $v1
			move $v1 $s0
			move $a0 $s7
			mul $t8 $v1 $a0
			move $s0 $t8
			move $v1 $t0
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s0 $s0
			move $v1 $t1
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $t1 $s0
			move $v1 $t1
			sw $s5 0($v1)
			li $v1 1
			move $s0 $v1
			move $v1 $s4
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $v1 $s7
			move $a0 $s0
			slt $t8 $v1 $a0
			move $s0 $t8
			beqz $s0 label_12
			li $v1 0
			move $s0 $v1
			move $s0 $s0
			j label_13
			la $v0 label_12
label_12:
			li $v1 1
			move $s0 $v1
			move $s0 $s0
			la $v0 label_13
label_13:
			nop
			j label_2
			la $v0 label_3
label_3:
			nop
			lw $s0 4($s2)
			move $s6 $s0
			li $v1 4
			move $t0 $v1
			li $v1 4
			move $s0 $v1
			move $v1 $s0
			move $a0 $s7
			mul $t8 $v1 $a0
			move $s0 $t8
			move $v1 $t0
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s0 $s0
			move $v1 $s6
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s6 $s0
			lw $s0 4($s2)
			move $t0 $s0
			li $v1 4
			move $s7 $v1
			li $v1 4
			move $s0 $v1
			move $v1 $s0
			move $a0 $s4
			mul $t8 $v1 $a0
			move $s0 $t8
			move $v1 $s7
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s0 $s0
			move $v1 $t0
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $t0 $s0
			lw $s0 0($t0)
			move $v1 $s6
			sw $s0 0($v1)
			lw $s0 4($s2)
			move $s6 $s0
			li $v1 4
			move $s7 $v1
			li $v1 4
			move $s0 $v1
			move $v1 $s0
			move $a0 $s4
			mul $t8 $v1 $a0
			move $s0 $t8
			move $v1 $s7
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s0 $s0
			move $v1 $s6
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s6 $s0
			lw $s0 4($s2)
			move $t0 $s0
			li $v1 4
			move $s7 $v1
			li $v1 4
			move $s0 $v1
			move $v1 $s0
			move $a0 $s1
			mul $t8 $v1 $a0
			move $s0 $t8
			move $v1 $s7
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s0 $s0
			move $v1 $t0
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $t0 $s0
			lw $s0 0($t0)
			move $v1 $s6
			sw $s0 0($v1)
			lw $s0 4($s2)
			move $s7 $s0
			li $v1 4
			move $s6 $v1
			li $v1 4
			move $s0 $v1
			move $v1 $s0
			move $a0 $s1
			mul $t8 $v1 $a0
			move $s0 $t8
			move $v1 $s6
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s0 $s0
			move $v1 $s7
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s7 $s0
			move $v1 $s7
			sw $s5 0($v1)
			move $s6 $s2
			lw $s0 0($s6)
			lw $s5 12($s0)
			li $v1 1
			move $s0 $v1
			move $v1 $s4
			move $a0 $s0
			sub $t8 $v1 $a0
			move $s0 $t8
			move $a0 $s6
			move $a1 $s3
			move $a2 $s0
			jalr $s5
			move $s0 $v0
			move $s0 $s0
			move $s3 $s2
			lw $s0 0($s3)
			lw $s2 12($s0)
			li $v1 1
			move $s0 $v1
			move $v1 $s4
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $a0 $s3
			move $a1 $s0
			move $a2 $s1
			jalr $s2
			move $s0 $v0
			move $s0 $s0
			j label_14
			la $v0 label_1
label_1:
			li $v1 0
			move $s0 $v1
			move $s0 $s0
			la $v0 label_14
label_14:
			nop
			li $v1 0
			move $s0 $v1
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
			addu $sp $sp 72
			jr $ra

			.text
			.globl QS_Print
QS_Print:
			sw $fp -8($sp)
			sw $ra -4($sp)
			move $fp $sp
			subu $sp $sp 72
			sw $s0 -12($fp)
			sw $s1 -16($fp)
			sw $s2 -20($fp)
			sw $s3 -24($fp)
			sw $s4 -28($fp)
			sw $s5 -32($fp)
			sw $s6 -36($fp)
			sw $s7 -40($fp)
			sw $t0 -44($fp)
			sw $t1 -48($fp)
			sw $t2 -52($fp)
			sw $t3 -56($fp)
			sw $t4 -60($fp)
			sw $t5 -64($fp)
			sw $t6 -68($fp)
			sw $t7 -72($fp)
			move $s4 $a0
			li $v1 0
			move $s0 $v1
			move $s3 $s0
			la $v0 label_15
label_15:
			lw $s0 8($s4)
			move $v1 $s3
			move $a0 $s0
			slt $t8 $v1 $a0
			move $s0 $t8
			beqz $s0 label_16
			lw $s0 4($s4)
			move $s2 $s0
			li $v1 4
			move $s1 $v1
			li $v1 4
			move $s0 $v1
			move $v1 $s0
			move $a0 $s3
			mul $t8 $v1 $a0
			move $s0 $t8
			move $v1 $s1
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s0 $s0
			move $v1 $s2
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s2 $s0
			lw $s0 0($s2)
			move $a0 $s0
			jal _print
			li $v1 1
			move $s0 $v1
			move $v1 $s3
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s3 $s0
			j label_15
			la $v0 label_16
label_16:
			nop
			li $v1 0
			move $s0 $v1
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
			addu $sp $sp 72
			jr $ra

			.text
			.globl QS_Init
QS_Init:
			sw $fp -8($sp)
			sw $ra -4($sp)
			move $fp $sp
			subu $sp $sp 72
			sw $s0 -12($fp)
			sw $s1 -16($fp)
			sw $s2 -20($fp)
			sw $s3 -24($fp)
			sw $s4 -28($fp)
			sw $s5 -32($fp)
			sw $s6 -36($fp)
			sw $s7 -40($fp)
			sw $t0 -44($fp)
			sw $t1 -48($fp)
			sw $t2 -52($fp)
			sw $t3 -56($fp)
			sw $t4 -60($fp)
			sw $t5 -64($fp)
			sw $t6 -68($fp)
			sw $t7 -72($fp)
			move $s1 $a0
			move $s0 $a1
			move $v1 $s1
			sw $s0 8($v1)
			move $s3 $s0
			li $v1 4
			move $s2 $v1
			li $v1 4
			move $s0 $v1
			move $v1 $s0
			move $a0 $s3
			mul $t8 $v1 $a0
			move $s0 $t8
			move $v1 $s2
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s0 $s0
			move $a0 $s0
			jal _halloc
			move $t8 $v0
			move $s0 $t8
			move $s0 $s0
			move $v1 $s0
			sw $s3 0($v1)
			move $v1 $s1
			sw $s0 4($v1)
			lw $s0 4($s1)
			move $s4 $s0
			li $v1 4
			move $s3 $v1
			li $v1 4
			move $s2 $v1
			li $v1 0
			move $s0 $v1
			move $v1 $s2
			move $a0 $s0
			mul $t8 $v1 $a0
			move $s0 $t8
			move $v1 $s3
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s0 $s0
			move $v1 $s4
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s4 $s0
			li $v1 20
			move $s0 $v1
			move $v1 $s4
			sw $s0 0($v1)
			lw $s0 4($s1)
			move $s4 $s0
			li $v1 4
			move $s3 $v1
			li $v1 4
			move $s2 $v1
			li $v1 1
			move $s0 $v1
			move $v1 $s2
			move $a0 $s0
			mul $t8 $v1 $a0
			move $s0 $t8
			move $v1 $s3
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s0 $s0
			move $v1 $s4
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s4 $s0
			li $v1 7
			move $s0 $v1
			move $v1 $s4
			sw $s0 0($v1)
			lw $s0 4($s1)
			move $s4 $s0
			li $v1 4
			move $s3 $v1
			li $v1 4
			move $s2 $v1
			li $v1 2
			move $s0 $v1
			move $v1 $s2
			move $a0 $s0
			mul $t8 $v1 $a0
			move $s0 $t8
			move $v1 $s3
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s0 $s0
			move $v1 $s4
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s4 $s0
			li $v1 12
			move $s0 $v1
			move $v1 $s4
			sw $s0 0($v1)
			lw $s0 4($s1)
			move $s4 $s0
			li $v1 4
			move $s3 $v1
			li $v1 4
			move $s2 $v1
			li $v1 3
			move $s0 $v1
			move $v1 $s2
			move $a0 $s0
			mul $t8 $v1 $a0
			move $s0 $t8
			move $v1 $s3
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s0 $s0
			move $v1 $s4
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s4 $s0
			li $v1 18
			move $s0 $v1
			move $v1 $s4
			sw $s0 0($v1)
			lw $s0 4($s1)
			move $s4 $s0
			li $v1 4
			move $s3 $v1
			li $v1 4
			move $s2 $v1
			li $v1 4
			move $s0 $v1
			move $v1 $s2
			move $a0 $s0
			mul $t8 $v1 $a0
			move $s0 $t8
			move $v1 $s3
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s0 $s0
			move $v1 $s4
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s4 $s0
			li $v1 2
			move $s0 $v1
			move $v1 $s4
			sw $s0 0($v1)
			lw $s0 4($s1)
			move $s4 $s0
			li $v1 4
			move $s3 $v1
			li $v1 4
			move $s2 $v1
			li $v1 5
			move $s0 $v1
			move $v1 $s2
			move $a0 $s0
			mul $t8 $v1 $a0
			move $s0 $t8
			move $v1 $s3
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s0 $s0
			move $v1 $s4
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s4 $s0
			li $v1 11
			move $s0 $v1
			move $v1 $s4
			sw $s0 0($v1)
			lw $s0 4($s1)
			move $s4 $s0
			li $v1 4
			move $s3 $v1
			li $v1 4
			move $s2 $v1
			li $v1 6
			move $s0 $v1
			move $v1 $s2
			move $a0 $s0
			mul $t8 $v1 $a0
			move $s0 $t8
			move $v1 $s3
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s0 $s0
			move $v1 $s4
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s4 $s0
			li $v1 6
			move $s0 $v1
			move $v1 $s4
			sw $s0 0($v1)
			lw $s0 4($s1)
			move $s4 $s0
			li $v1 4
			move $s3 $v1
			li $v1 4
			move $s2 $v1
			li $v1 7
			move $s0 $v1
			move $v1 $s2
			move $a0 $s0
			mul $t8 $v1 $a0
			move $s0 $t8
			move $v1 $s3
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s0 $s0
			move $v1 $s4
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s4 $s0
			li $v1 9
			move $s0 $v1
			move $v1 $s4
			sw $s0 0($v1)
			lw $s0 4($s1)
			move $s4 $s0
			li $v1 4
			move $s3 $v1
			li $v1 4
			move $s2 $v1
			li $v1 8
			move $s0 $v1
			move $v1 $s2
			move $a0 $s0
			mul $t8 $v1 $a0
			move $s0 $t8
			move $v1 $s3
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s0 $s0
			move $v1 $s4
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s4 $s0
			li $v1 19
			move $s0 $v1
			move $v1 $s4
			sw $s0 0($v1)
			lw $s0 4($s1)
			move $s3 $s0
			li $v1 4
			move $s2 $v1
			li $v1 4
			move $s1 $v1
			li $v1 9
			move $s0 $v1
			move $v1 $s1
			move $a0 $s0
			mul $t8 $v1 $a0
			move $s0 $t8
			move $v1 $s2
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s0 $s0
			move $v1 $s3
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s3 $s0
			li $v1 5
			move $s0 $v1
			move $v1 $s3
			sw $s0 0($v1)
			li $v1 0
			move $s0 $v1
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
			addu $sp $sp 72
			jr $ra


