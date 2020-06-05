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
					li $s0 4
					move $a0 $s0
					jal _halloc
					move $t8 $v0
					move $s0 $t8
					move $s1 $s0
					la $s0 LL_Start
					move $v1 $s1
					sw $s0 0($v1)
					li $s0 4
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
					.globl Element_Init
Element_Init:
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
					move $s3 $a0
					move $s2 $a1
					move $s1 $a2
					move $s0 $a3
					move $v1 $s3
					sw $s2 12($v1)
					move $v1 $s3
					sw $s1 4($v1)
					move $v1 $s3
					sw $s0 8($v1)
					li $s0 1
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
					.globl Element_GetAge
Element_GetAge:
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
					move $s0 $a0
					lw $s0 12($s0)
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
					.globl Element_GetSalary
Element_GetSalary:
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
					move $s0 $a0
					lw $s0 4($s0)
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
					.globl Element_GetMarried
Element_GetMarried:
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
					move $s0 $a0
					lw $s0 8($s0)
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
					.globl Element_Equal
Element_Equal:
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
					move $s3 $a0
					move $s2 $a1
					li $s0 1
					move $s1 $s0
					move $s4 $s2
					lw $s0 0($s4)
					lw $s0 8($s0)
					move $a0 $s4
					jalr $s0
					move $s0 $v0
					move $s6 $s0
					li $s7 1
					move $s5 $s3
					lw $s0 0($s5)
					lw $s4 20($s0)
					lw $s0 12($s3)
					move $a0 $s5
					move $a1 $s6
					move $a2 $s0
					jalr $s4
					move $s0 $v0
					move $v1 $s7
					move $a0 $s0
					sub $t8 $v1 $a0
					move $s0 $t8
					beqz $s0 label_1
					li $s0 0
					move $s1 $s0
					j label_2
label_1:
					move $s4 $s2
					lw $s0 0($s4)
					lw $s0 0($s0)
					move $a0 $s4
					jalr $s0
					move $s0 $v0
					move $s5 $s0
					li $s7 1
					move $s6 $s3
					lw $s0 0($s6)
					lw $s4 20($s0)
					lw $s0 4($s3)
					move $a0 $s6
					move $a1 $s5
					move $a2 $s0
					jalr $s4
					move $s0 $v0
					move $v1 $s7
					move $a0 $s0
					sub $t8 $v1 $a0
					move $s0 $t8
					beqz $s0 label_3
					li $s0 0
					move $s1 $s0
					j label_4
label_3:
					lw $s0 8($s3)
					beqz $s0 label_5
					li $s3 1
					move $s2 $s2
					lw $s0 0($s2)
					lw $s0 16($s0)
					move $a0 $s2
					jalr $s0
					move $s0 $v0
					move $v1 $s3
					move $a0 $s0
					sub $t8 $v1 $a0
					move $s0 $t8
					beqz $s0 label_6
					li $s0 0
					move $s1 $s0
					j label_7
label_6:
					li $s0 0
					move $s0 $s0
label_7:
					nop
					j label_8
label_5:
					move $s2 $s2
					lw $s0 0($s2)
					lw $s0 16($s0)
					move $a0 $s2
					jalr $s0
					move $s0 $v0
					beqz $s0 label_9
					li $s0 0
					move $s1 $s0
					j label_10
label_9:
					li $s0 0
					move $s0 $s0
label_10:
					nop
label_8:
					nop
label_4:
					nop
label_2:
					nop
					move $v0 $s1
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
					.globl Element_Compare
Element_Compare:
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
					move $s2 $a1
					move $s1 $a2
					li $s0 0
					move $s0 $s0
					li $s0 1
					move $v1 $s1
					move $a0 $s0
					add $t8 $v1 $a0
					move $s0 $t8
					move $s0 $s0
					move $v1 $s2
					move $a0 $s1
					slt $t8 $v1 $a0
					move $s1 $t8
					beqz $s1 label_11
					li $s0 0
					move $s0 $s0
					j label_12
label_11:
					li $s1 1
					move $v1 $s2
					move $a0 $s0
					slt $t8 $v1 $a0
					move $s0 $t8
					move $v1 $s1
					move $a0 $s0
					sub $t8 $v1 $a0
					move $s0 $t8
					beqz $s0 label_13
					li $s0 0
					move $s0 $s0
					j label_14
label_13:
					li $s0 1
					move $s0 $s0
label_14:
					nop
label_12:
					nop
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
					.globl List_Init
List_Init:
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
					li $s0 1
					move $v1 $s1
					sw $s0 12($v1)
					li $s0 1
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
					.globl List_InitNew
List_InitNew:
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
					move $s3 $a0
					move $s2 $a1
					move $s1 $a2
					move $s0 $a3
					move $v1 $s3
					sw $s0 12($v1)
					move $v1 $s3
					sw $s2 4($v1)
					move $v1 $s3
					sw $s1 8($v1)
					li $s0 1
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
					.globl List_Insert
List_Insert:
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
					move $s0 $a0
					move $s1 $a1
					move $s2 $s0
					li $s0 40
					move $a0 $s0
					jal _halloc
					move $t8 $v0
					move $s0 $t8
					move $s3 $s0
					la $s0 List_Delete
					move $v1 $s3
					sw $s0 0($v1)
					la $s0 List_Print
					move $v1 $s3
					sw $s0 4($v1)
					la $s0 List_Init
					move $v1 $s3
					sw $s0 8($v1)
					la $s0 List_GetElem
					move $v1 $s3
					sw $s0 12($v1)
					la $s0 List_GetNext
					move $v1 $s3
					sw $s0 16($v1)
					la $s0 List_SetNext
					move $v1 $s3
					sw $s0 20($v1)
					la $s0 List_Search
					move $v1 $s3
					sw $s0 24($v1)
					la $s0 List_GetEnd
					move $v1 $s3
					sw $s0 28($v1)
					la $s0 List_InitNew
					move $v1 $s3
					sw $s0 32($v1)
					la $s0 List_Insert
					move $v1 $s3
					sw $s0 36($v1)
					li $s0 16
					move $a0 $s0
					jal _halloc
					move $t8 $v0
					move $s0 $t8
					move $s4 $s0
					li $s0 0
					move $v1 $s4
					sw $s0 4($v1)
					li $s0 0
					move $v1 $s4
					sw $s0 8($v1)
					li $s0 0
					move $v1 $s4
					sw $s0 12($v1)
					move $v1 $s4
					sw $s3 0($v1)
					move $s5 $s4
					move $s4 $s5
					lw $s0 0($s4)
					lw $s3 32($s0)
					li $s0 0
					move $a0 $s4
					move $a1 $s1
					move $a2 $s2
					move $a3 $s0
					jalr $s3
					move $s0 $v0
					move $s0 $s0
					move $v0 $s5
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
					.globl List_SetNext
List_SetNext:
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
					li $s0 1
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
					.globl List_Delete
List_Delete:
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
					move $t0 $a0
					move $s1 $a1
					move $s2 $t0
					li $s0 0
					move $s3 $s0
					li $s4 0
					li $s0 1
					move $v1 $s4
					move $a0 $s0
					sub $t8 $v1 $a0
					move $s0 $t8
					move $s7 $s0
					move $s5 $t0
					move $s4 $t0
					lw $s0 12($t0)
					move $s6 $s0
					lw $s0 4($t0)
					move $t0 $s0
label_15:
					li $s0 1
					move $v1 $s0
					move $a0 $s6
					sub $t8 $v1 $a0
					move $s0 $t8
					move $s0 $s0
					beqz $s0 label_16
					li $s0 1
					move $v1 $s0
					move $a0 $s3
					sub $t8 $v1 $a0
					move $s0 $t8
					move $s0 $s0
					beqz $s0 label_16
					li $s0 1
					move $s0 $s0
					j label_17
label_16:
					li $s0 0
					move $s0 $s0
label_17:
					nop
					beqz $s0 label_18
					move $t1 $s1
					lw $s0 0($t1)
					lw $s0 12($s0)
					move $a0 $t1
					move $a1 $t0
					jalr $s0
					move $s0 $v0
					beqz $s0 label_19
					li $s0 1
					move $s3 $s0
					li $s0 0
					move $v1 $s7
					move $a0 $s0
					slt $t8 $v1 $a0
					move $s0 $t8
					beqz $s0 label_20
					move $s2 $s5
					lw $s0 0($s2)
					lw $s0 16($s0)
					move $a0 $s2
					jalr $s0
					move $s0 $v0
					move $s2 $s0
					j label_21
label_20:
					li $t1 0
					li $s0 555
					move $v1 $t1
					move $a0 $s0
					sub $t8 $v1 $a0
					move $s0 $t8
					move $a0 $s0
					jal _print
					move $t3 $s4
					lw $s0 0($t3)
					lw $t2 20($s0)
					move $t1 $s5
					lw $s0 0($t1)
					lw $s0 16($s0)
					move $a0 $t1
					jalr $s0
					move $s0 $v0
					move $a0 $t3
					move $a1 $s0
					jalr $t2
					move $s0 $v0
					move $s0 $s0
					li $t1 0
					li $s0 555
					move $v1 $t1
					move $a0 $s0
					sub $t8 $v1 $a0
					move $s0 $t8
					move $a0 $s0
					jal _print
label_21:
					nop
					j label_22
label_19:
					li $s0 0
					move $s0 $s0
label_22:
					nop
					li $s0 1
					move $v1 $s0
					move $a0 $s3
					sub $t8 $v1 $a0
					move $s0 $t8
					beqz $s0 label_23
					move $s4 $s5
					move $s5 $s5
					lw $s0 0($s5)
					lw $s0 16($s0)
					move $a0 $s5
					jalr $s0
					move $s0 $v0
					move $s5 $s0
					move $s6 $s5
					lw $s0 0($s6)
					lw $s0 28($s0)
					move $a0 $s6
					jalr $s0
					move $s0 $v0
					move $s6 $s0
					move $s7 $s5
					lw $s0 0($s7)
					lw $s0 12($s0)
					move $a0 $s7
					jalr $s0
					move $s0 $v0
					move $t0 $s0
					li $s0 1
					move $s7 $s0
					j label_24
label_23:
					li $s0 0
					move $s0 $s0
label_24:
					nop
					j label_15
label_18:
					nop
					move $v0 $s2
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
					.globl List_Search
List_Search:
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
					move $s1 $a1
					li $s0 0
					move $s2 $s0
					move $s3 $s4
					lw $s0 12($s4)
					move $s6 $s0
					lw $s0 4($s4)
					move $s5 $s0
label_25:
					li $s0 1
					move $v1 $s0
					move $a0 $s6
					sub $t8 $v1 $a0
					move $s0 $t8
					beqz $s0 label_26
					move $s4 $s1
					lw $s0 0($s4)
					lw $s0 12($s0)
					move $a0 $s4
					move $a1 $s5
					jalr $s0
					move $s0 $v0
					beqz $s0 label_27
					li $s0 1
					move $s2 $s0
					j label_28
label_27:
					li $s0 0
					move $s0 $s0
label_28:
					nop
					move $s3 $s3
					lw $s0 0($s3)
					lw $s0 16($s0)
					move $a0 $s3
					jalr $s0
					move $s0 $v0
					move $s3 $s0
					move $s4 $s3
					lw $s0 0($s4)
					lw $s0 28($s0)
					move $a0 $s4
					jalr $s0
					move $s0 $v0
					move $s6 $s0
					move $s4 $s3
					lw $s0 0($s4)
					lw $s0 12($s0)
					move $a0 $s4
					jalr $s0
					move $s0 $v0
					move $s5 $s0
					j label_25
label_26:
					nop
					move $v0 $s2
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
					.globl List_GetEnd
List_GetEnd:
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
					move $s0 $a0
					lw $s0 12($s0)
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
					.globl List_GetElem
List_GetElem:
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
					move $s0 $a0
					lw $s0 4($s0)
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
					.globl List_GetNext
List_GetNext:
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
					move $s0 $a0
					lw $s0 8($s0)
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
					.globl List_Print
List_Print:
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
					move $s2 $s1
					lw $s0 12($s1)
					move $s3 $s0
					lw $s0 4($s1)
					move $s1 $s0
label_29:
					li $s0 1
					move $v1 $s0
					move $a0 $s3
					sub $t8 $v1 $a0
					move $s0 $t8
					beqz $s0 label_30
					move $s1 $s1
					lw $s0 0($s1)
					lw $s0 8($s0)
					move $a0 $s1
					jalr $s0
					move $s0 $v0
					move $a0 $s0
					jal _print
					move $s1 $s2
					lw $s0 0($s1)
					lw $s0 16($s0)
					move $a0 $s1
					jalr $s0
					move $s0 $v0
					move $s2 $s0
					move $s1 $s2
					lw $s0 0($s1)
					lw $s0 28($s0)
					move $a0 $s1
					jalr $s0
					move $s0 $v0
					move $s3 $s0
					move $s1 $s2
					lw $s0 0($s1)
					lw $s0 12($s0)
					move $a0 $s1
					jalr $s0
					move $s0 $v0
					move $s1 $s0
					j label_29
label_30:
					nop
					li $s0 1
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
					.globl LL_Start
LL_Start:
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
					li $s0 40
					move $a0 $s0
					jal _halloc
					move $t8 $v0
					move $s0 $t8
					move $s1 $s0
					la $s0 List_Delete
					move $v1 $s1
					sw $s0 0($v1)
					la $s0 List_Print
					move $v1 $s1
					sw $s0 4($v1)
					la $s0 List_Init
					move $v1 $s1
					sw $s0 8($v1)
					la $s0 List_GetElem
					move $v1 $s1
					sw $s0 12($v1)
					la $s0 List_GetNext
					move $v1 $s1
					sw $s0 16($v1)
					la $s0 List_SetNext
					move $v1 $s1
					sw $s0 20($v1)
					la $s0 List_Search
					move $v1 $s1
					sw $s0 24($v1)
					la $s0 List_GetEnd
					move $v1 $s1
					sw $s0 28($v1)
					la $s0 List_InitNew
					move $v1 $s1
					sw $s0 32($v1)
					la $s0 List_Insert
					move $v1 $s1
					sw $s0 36($v1)
					li $s0 16
					move $a0 $s0
					jal _halloc
					move $t8 $v0
					move $s0 $t8
					move $s2 $s0
					li $s0 0
					move $v1 $s2
					sw $s0 4($v1)
					li $s0 0
					move $v1 $s2
					sw $s0 8($v1)
					li $s0 0
					move $v1 $s2
					sw $s0 12($v1)
					move $v1 $s2
					sw $s1 0($v1)
					move $s2 $s2
					move $s1 $s2
					lw $s0 0($s1)
					lw $s0 8($s0)
					move $a0 $s1
					jalr $s0
					move $s0 $v0
					move $s0 $s0
					move $s1 $s2
					move $s2 $s1
					lw $s0 0($s2)
					lw $s0 8($s0)
					move $a0 $s2
					jalr $s0
					move $s0 $v0
					move $s0 $s0
					move $s2 $s1
					lw $s0 0($s2)
					lw $s0 4($s0)
					move $a0 $s2
					jalr $s0
					move $s0 $v0
					move $s0 $s0
					li $s0 24
					move $a0 $s0
					jal _halloc
					move $t8 $v0
					move $s0 $t8
					move $s3 $s0
					la $s0 Element_GetSalary
					move $v1 $s3
					sw $s0 0($v1)
					la $s0 Element_Init
					move $v1 $s3
					sw $s0 4($v1)
					la $s0 Element_GetAge
					move $v1 $s3
					sw $s0 8($v1)
					la $s0 Element_Equal
					move $v1 $s3
					sw $s0 12($v1)
					la $s0 Element_GetMarried
					move $v1 $s3
					sw $s0 16($v1)
					la $s0 Element_Compare
					move $v1 $s3
					sw $s0 20($v1)
					li $s0 16
					move $a0 $s0
					jal _halloc
					move $t8 $v0
					move $s0 $t8
					move $s2 $s0
					li $s0 0
					move $v1 $s2
					sw $s0 4($v1)
					li $s0 0
					move $v1 $s2
					sw $s0 8($v1)
					li $s0 0
					move $v1 $s2
					sw $s0 12($v1)
					move $v1 $s2
					sw $s3 0($v1)
					move $s3 $s2
					move $s6 $s3
					lw $s0 0($s6)
					lw $s5 4($s0)
					li $s4 25
					li $s2 37000
					li $s0 0
					move $a0 $s6
					move $a1 $s4
					move $a2 $s2
					move $a3 $s0
					jalr $s5
					move $s0 $v0
					move $s0 $s0
					move $s1 $s1
					lw $s0 0($s1)
					lw $s0 36($s0)
					move $a0 $s1
					move $a1 $s3
					jalr $s0
					move $s0 $v0
					move $s1 $s0
					move $s2 $s1
					lw $s0 0($s2)
					lw $s0 4($s0)
					move $a0 $s2
					jalr $s0
					move $s0 $v0
					move $s0 $s0
					li $s0 10000000
					move $a0 $s0
					jal _print
					li $s0 24
					move $a0 $s0
					jal _halloc
					move $t8 $v0
					move $s0 $t8
					move $s3 $s0
					la $s0 Element_GetSalary
					move $v1 $s3
					sw $s0 0($v1)
					la $s0 Element_Init
					move $v1 $s3
					sw $s0 4($v1)
					la $s0 Element_GetAge
					move $v1 $s3
					sw $s0 8($v1)
					la $s0 Element_Equal
					move $v1 $s3
					sw $s0 12($v1)
					la $s0 Element_GetMarried
					move $v1 $s3
					sw $s0 16($v1)
					la $s0 Element_Compare
					move $v1 $s3
					sw $s0 20($v1)
					li $s0 16
					move $a0 $s0
					jal _halloc
					move $t8 $v0
					move $s0 $t8
					move $s2 $s0
					li $s0 0
					move $v1 $s2
					sw $s0 4($v1)
					li $s0 0
					move $v1 $s2
					sw $s0 8($v1)
					li $s0 0
					move $v1 $s2
					sw $s0 12($v1)
					move $v1 $s2
					sw $s3 0($v1)
					move $s3 $s2
					move $s6 $s3
					lw $s0 0($s6)
					lw $s5 4($s0)
					li $s4 39
					li $s2 42000
					li $s0 1
					move $a0 $s6
					move $a1 $s4
					move $a2 $s2
					move $a3 $s0
					jalr $s5
					move $s0 $v0
					move $s0 $s0
					move $s2 $s3
					move $s1 $s1
					lw $s0 0($s1)
					lw $s0 36($s0)
					move $a0 $s1
					move $a1 $s3
					jalr $s0
					move $s0 $v0
					move $s1 $s0
					move $s3 $s1
					lw $s0 0($s3)
					lw $s0 4($s0)
					move $a0 $s3
					jalr $s0
					move $s0 $v0
					move $s0 $s0
					li $s0 10000000
					move $a0 $s0
					jal _print
					li $s0 24
					move $a0 $s0
					jal _halloc
					move $t8 $v0
					move $s0 $t8
					move $s4 $s0
					la $s0 Element_GetSalary
					move $v1 $s4
					sw $s0 0($v1)
					la $s0 Element_Init
					move $v1 $s4
					sw $s0 4($v1)
					la $s0 Element_GetAge
					move $v1 $s4
					sw $s0 8($v1)
					la $s0 Element_Equal
					move $v1 $s4
					sw $s0 12($v1)
					la $s0 Element_GetMarried
					move $v1 $s4
					sw $s0 16($v1)
					la $s0 Element_Compare
					move $v1 $s4
					sw $s0 20($v1)
					li $s0 16
					move $a0 $s0
					jal _halloc
					move $t8 $v0
					move $s0 $t8
					move $s3 $s0
					li $s0 0
					move $v1 $s3
					sw $s0 4($v1)
					li $s0 0
					move $v1 $s3
					sw $s0 8($v1)
					li $s0 0
					move $v1 $s3
					sw $s0 12($v1)
					move $v1 $s3
					sw $s4 0($v1)
					move $s3 $s3
					move $s7 $s3
					lw $s0 0($s7)
					lw $s6 4($s0)
					li $s5 22
					li $s4 34000
					li $s0 0
					move $a0 $s7
					move $a1 $s5
					move $a2 $s4
					move $a3 $s0
					jalr $s6
					move $s0 $v0
					move $s0 $s0
					move $s1 $s1
					lw $s0 0($s1)
					lw $s0 36($s0)
					move $a0 $s1
					move $a1 $s3
					jalr $s0
					move $s0 $v0
					move $s1 $s0
					move $s3 $s1
					lw $s0 0($s3)
					lw $s0 4($s0)
					move $a0 $s3
					jalr $s0
					move $s0 $v0
					move $s0 $s0
					li $s0 24
					move $a0 $s0
					jal _halloc
					move $t8 $v0
					move $s0 $t8
					move $s4 $s0
					la $s0 Element_GetSalary
					move $v1 $s4
					sw $s0 0($v1)
					la $s0 Element_Init
					move $v1 $s4
					sw $s0 4($v1)
					la $s0 Element_GetAge
					move $v1 $s4
					sw $s0 8($v1)
					la $s0 Element_Equal
					move $v1 $s4
					sw $s0 12($v1)
					la $s0 Element_GetMarried
					move $v1 $s4
					sw $s0 16($v1)
					la $s0 Element_Compare
					move $v1 $s4
					sw $s0 20($v1)
					li $s0 16
					move $a0 $s0
					jal _halloc
					move $t8 $v0
					move $s0 $t8
					move $s3 $s0
					li $s0 0
					move $v1 $s3
					sw $s0 4($v1)
					li $s0 0
					move $v1 $s3
					sw $s0 8($v1)
					li $s0 0
					move $v1 $s3
					sw $s0 12($v1)
					move $v1 $s3
					sw $s4 0($v1)
					move $s5 $s3
					move $s7 $s5
					lw $s0 0($s7)
					lw $s6 4($s0)
					li $s4 27
					li $s3 34000
					li $s0 0
					move $a0 $s7
					move $a1 $s4
					move $a2 $s3
					move $a3 $s0
					jalr $s6
					move $s0 $v0
					move $s0 $s0
					move $s3 $s1
					lw $s0 0($s3)
					lw $s0 24($s0)
					move $a0 $s3
					move $a1 $s2
					jalr $s0
					move $s0 $v0
					move $a0 $s0
					jal _print
					move $s3 $s1
					lw $s0 0($s3)
					lw $s0 24($s0)
					move $a0 $s3
					move $a1 $s5
					jalr $s0
					move $s0 $v0
					move $a0 $s0
					jal _print
					li $s0 10000000
					move $a0 $s0
					jal _print
					li $s0 24
					move $a0 $s0
					jal _halloc
					move $t8 $v0
					move $s0 $t8
					move $s4 $s0
					la $s0 Element_GetSalary
					move $v1 $s4
					sw $s0 0($v1)
					la $s0 Element_Init
					move $v1 $s4
					sw $s0 4($v1)
					la $s0 Element_GetAge
					move $v1 $s4
					sw $s0 8($v1)
					la $s0 Element_Equal
					move $v1 $s4
					sw $s0 12($v1)
					la $s0 Element_GetMarried
					move $v1 $s4
					sw $s0 16($v1)
					la $s0 Element_Compare
					move $v1 $s4
					sw $s0 20($v1)
					li $s0 16
					move $a0 $s0
					jal _halloc
					move $t8 $v0
					move $s0 $t8
					move $s3 $s0
					li $s0 0
					move $v1 $s3
					sw $s0 4($v1)
					li $s0 0
					move $v1 $s3
					sw $s0 8($v1)
					li $s0 0
					move $v1 $s3
					sw $s0 12($v1)
					move $v1 $s3
					sw $s4 0($v1)
					move $s3 $s3
					move $s7 $s3
					lw $s0 0($s7)
					lw $s6 4($s0)
					li $s5 28
					li $s4 35000
					li $s0 0
					move $a0 $s7
					move $a1 $s5
					move $a2 $s4
					move $a3 $s0
					jalr $s6
					move $s0 $v0
					move $s0 $s0
					move $s1 $s1
					lw $s0 0($s1)
					lw $s0 36($s0)
					move $a0 $s1
					move $a1 $s3
					jalr $s0
					move $s0 $v0
					move $s1 $s0
					move $s4 $s1
					lw $s0 0($s4)
					lw $s0 4($s0)
					move $a0 $s4
					jalr $s0
					move $s0 $v0
					move $s0 $s0
					li $s0 2220000
					move $a0 $s0
					jal _print
					move $s1 $s1
					lw $s0 0($s1)
					lw $s0 0($s0)
					move $a0 $s1
					move $a1 $s2
					jalr $s0
					move $s0 $v0
					move $s1 $s0
					move $s2 $s1
					lw $s0 0($s2)
					lw $s0 4($s0)
					move $a0 $s2
					jalr $s0
					move $s0 $v0
					move $s0 $s0
					li $s0 33300000
					move $a0 $s0
					jal _print
					move $s1 $s1
					lw $s0 0($s1)
					lw $s0 0($s0)
					move $a0 $s1
					move $a1 $s3
					jalr $s0
					move $s0 $v0
					move $s1 $s0
					move $s1 $s1
					lw $s0 0($s1)
					lw $s0 4($s0)
					move $a0 $s1
					jalr $s0
					move $s0 $v0
					move $s0 $s0
					li $s0 44440000
					move $a0 $s0
					jal _print
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


