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
			li $s0 16
			move $a0 $s0
			jal _halloc
			move $t8 $v0
			move $s0 $t8
			move $s2 $s0
			la $s0 LS_Print
			move $v1 $s2
			sw $s0 0($v1)
			la $s0 LS_Init
			move $v1 $s2
			sw $s0 4($v1)
			la $s0 LS_Start
			move $v1 $s2
			sw $s0 8($v1)
			la $s0 LS_Search
			move $v1 $s2
			sw $s0 12($v1)
			li $s0 12
			move $a0 $s0
			jal _halloc
			move $t8 $v0
			move $s0 $t8
			move $s1 $s0
			li $s0 0
			move $v1 $s1
			sw $s0 4($v1)
			li $s0 0
			move $v1 $s1
			sw $s0 8($v1)
			move $v1 $s1
			sw $s2 0($v1)
			move $s2 $s1
			lw $s0 0($s2)
			lw $s1 8($s0)
			li $s0 10
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
			.globl LS_Start
LS_Start:
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
			move $s3 $a1
			move $s2 $s1
			lw $s0 0($s2)
			lw $s0 4($s0)
			move $a0 $s2
			move $a1 $s3
			jalr $s0
			move $s0 $v0
			move $s0 $s0
			move $s2 $s1
			lw $s0 0($s2)
			lw $s0 0($s0)
			move $a0 $s2
			jalr $s0
			move $s0 $v0
			move $s0 $s0
			li $s0 9999
			move $a0 $s0
			jal _print
			move $s3 $s1
			lw $s0 0($s3)
			lw $s0 12($s0)
			li $s2 8
			move $a0 $s3
			move $a1 $s2
			jalr $s0
			move $s0 $v0
			move $a0 $s0
			jal _print
			move $s3 $s1
			lw $s0 0($s3)
			lw $s0 12($s0)
			li $s2 12
			move $a0 $s3
			move $a1 $s2
			jalr $s0
			move $s0 $v0
			move $a0 $s0
			jal _print
			move $s3 $s1
			lw $s0 0($s3)
			lw $s0 12($s0)
			li $s2 17
			move $a0 $s3
			move $a1 $s2
			jalr $s0
			move $s0 $v0
			move $a0 $s0
			jal _print
			move $s2 $s1
			lw $s0 0($s2)
			lw $s0 12($s0)
			li $s1 50
			move $a0 $s2
			move $a1 $s1
			jalr $s0
			move $s0 $v0
			move $a0 $s0
			jal _print
			li $s0 55
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
			.globl LS_Print
LS_Print:
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
			li $s0 1
			move $s3 $s0
label_1:
			lw $s0 8($s4)
			move $v1 $s3
			move $a0 $s0
			slt $t8 $v1 $a0
			move $s0 $t8
			beqz $s0 label_2
			lw $s0 4($s4)
			move $s2 $s0
			li $s1 4
			li $s0 4
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
			li $s0 1
			move $v1 $s3
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s3 $s0
			j label_1
label_2:
			nop
			li $s0 0
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
			.globl LS_Search
LS_Search:
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
			move $s1 $a1
			li $s0 1
			move $s3 $s0
			li $s0 0
			move $s0 $s0
			li $s0 0
			move $s4 $s0
label_3:
			lw $s0 8($s2)
			move $v1 $s3
			move $a0 $s0
			slt $t8 $v1 $a0
			move $s0 $t8
			beqz $s0 label_4
			lw $s0 4($s2)
			move $s6 $s0
			li $s5 4
			li $s0 4
			move $v1 $s0
			move $a0 $s3
			mul $t8 $v1 $a0
			move $s0 $t8
			move $v1 $s5
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
			move $s7 $s0
			li $s0 1
			move $v1 $s1
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s6 $s0
			move $v1 $s7
			move $a0 $s1
			slt $t8 $v1 $a0
			move $s0 $t8
			beqz $s0 label_5
			li $s0 0
			move $s0 $s0
			j label_6
label_5:
			li $s5 1
			move $v1 $s7
			move $a0 $s6
			slt $t8 $v1 $a0
			move $s0 $t8
			move $v1 $s5
			move $a0 $s0
			sub $t8 $v1 $a0
			move $s0 $t8
			beqz $s0 label_7
			li $s0 0
			move $s0 $s0
			j label_8
label_7:
			li $s0 1
			move $s0 $s0
			li $s0 1
			move $s4 $s0
			lw $s0 8($s2)
			move $s3 $s0
label_8:
			nop
label_6:
			nop
			li $s0 1
			move $v1 $s3
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s3 $s0
			j label_3
label_4:
			nop
			move $v0 $s4
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
			.globl LS_Init
LS_Init:
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
			li $s2 4
			li $s0 4
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
			li $s0 1
			move $s2 $s0
			lw $s3 8($s1)
			li $s0 1
			move $v1 $s3
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s3 $s0
label_9:
			lw $s0 8($s1)
			move $v1 $s2
			move $a0 $s0
			slt $t8 $v1 $a0
			move $s0 $t8
			beqz $s0 label_10
			li $s0 2
			move $v1 $s0
			move $a0 $s2
			mul $t8 $v1 $a0
			move $s0 $t8
			move $s7 $s0
			li $s0 3
			move $v1 $s3
			move $a0 $s0
			sub $t8 $v1 $a0
			move $s0 $t8
			move $s6 $s0
			lw $s0 4($s1)
			move $s5 $s0
			li $s4 4
			li $s0 4
			move $v1 $s0
			move $a0 $s2
			mul $t8 $v1 $a0
			move $s0 $t8
			move $v1 $s4
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s0 $s0
			move $v1 $s5
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s5 $s0
			move $v1 $s7
			move $a0 $s6
			add $t8 $v1 $a0
			move $s0 $t8
			move $v1 $s5
			sw $s0 0($v1)
			li $s0 1
			move $v1 $s2
			move $a0 $s0
			add $t8 $v1 $a0
			move $s0 $t8
			move $s2 $s0
			li $s0 1
			move $v1 $s3
			move $a0 $s0
			sub $t8 $v1 $a0
			move $s0 $t8
			move $s3 $s0
			j label_9
label_10:
			nop
			li $s0 0
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


