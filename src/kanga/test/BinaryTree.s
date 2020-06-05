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
					li $v1 4
					move $s0 $v1
					move $a0 $s0
					jal _halloc
					move $t8 $v0
					move $s0 $t8
					move $s1 $s0
					la $v0 BT_Start
					la $s0 BT_Start
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
					.globl BT_Start
BT_Start:
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
					li $v1 80
					move $s0 $v1
					move $a0 $s0
					jal _halloc
					move $t8 $v0
					move $s0 $t8
					move $s1 $s0
					la $v0 Tree_Delete
					la $s0 Tree_Delete
					move $v1 $s1
					sw $s0 0($v1)
					la $v0 Tree_SetHas_Left
					la $s0 Tree_SetHas_Left
					move $v1 $s1
					sw $s0 4($v1)
					la $v0 Tree_RemoveLeft
					la $s0 Tree_RemoveLeft
					move $v1 $s1
					sw $s0 8($v1)
					la $v0 Tree_GetKey
					la $s0 Tree_GetKey
					move $v1 $s1
					sw $s0 12($v1)
					la $v0 Tree_SetRight
					la $s0 Tree_SetRight
					move $v1 $s1
					sw $s0 16($v1)
					la $v0 Tree_GetLeft
					la $s0 Tree_GetLeft
					move $v1 $s1
					sw $s0 20($v1)
					la $v0 Tree_GetRight
					la $s0 Tree_GetRight
					move $v1 $s1
					sw $s0 24($v1)
					la $v0 Tree_Remove
					la $s0 Tree_Remove
					move $v1 $s1
					sw $s0 28($v1)
					la $v0 Tree_SetLeft
					la $s0 Tree_SetLeft
					move $v1 $s1
					sw $s0 32($v1)
					la $v0 Tree_Insert
					la $s0 Tree_Insert
					move $v1 $s1
					sw $s0 36($v1)
					la $v0 Tree_Print
					la $s0 Tree_Print
					move $v1 $s1
					sw $s0 40($v1)
					la $v0 Tree_Init
					la $s0 Tree_Init
					move $v1 $s1
					sw $s0 44($v1)
					la $v0 Tree_GetHas_Right
					la $s0 Tree_GetHas_Right
					move $v1 $s1
					sw $s0 48($v1)
					la $v0 Tree_GetHas_Left
					la $s0 Tree_GetHas_Left
					move $v1 $s1
					sw $s0 52($v1)
					la $v0 Tree_RemoveRight
					la $s0 Tree_RemoveRight
					move $v1 $s1
					sw $s0 56($v1)
					la $v0 Tree_Search
					la $s0 Tree_Search
					move $v1 $s1
					sw $s0 60($v1)
					la $v0 Tree_SetKey
					la $s0 Tree_SetKey
					move $v1 $s1
					sw $s0 64($v1)
					la $v0 Tree_Compare
					la $s0 Tree_Compare
					move $v1 $s1
					sw $s0 68($v1)
					la $v0 Tree_SetHas_Right
					la $s0 Tree_SetHas_Right
					move $v1 $s1
					sw $s0 72($v1)
					la $v0 Tree_RecPrint
					la $s0 Tree_RecPrint
					move $v1 $s1
					sw $s0 76($v1)
					li $v1 28
					move $s0 $v1
					move $a0 $s0
					jal _halloc
					move $t8 $v0
					move $s0 $t8
					move $s2 $s0
					li $v1 0
					move $s0 $v1
					move $v1 $s2
					sw $s0 4($v1)
					li $v1 0
					move $s0 $v1
					move $v1 $s2
					sw $s0 8($v1)
					li $v1 0
					move $s0 $v1
					move $v1 $s2
					sw $s0 12($v1)
					li $v1 0
					move $s0 $v1
					move $v1 $s2
					sw $s0 16($v1)
					li $v1 0
					move $s0 $v1
					move $v1 $s2
					sw $s0 20($v1)
					li $v1 0
					move $s0 $v1
					move $v1 $s2
					sw $s0 24($v1)
					move $v1 $s2
					sw $s1 0($v1)
					move $s1 $s2
					move $s3 $s1
					lw $s0 0($s3)
					lw $s2 44($s0)
					li $v1 16
					move $s0 $v1
					move $a0 $s3
					move $a1 $s0
					jalr $s2
					move $s0 $v0
					move $s0 $s0
					move $s2 $s1
					lw $s0 0($s2)
					lw $s0 40($s0)
					move $a0 $s2
					jalr $s0
					move $s0 $v0
					move $s0 $s0
					li $v1 100000000
					move $s0 $v1
					move $a0 $s0
					jal _print
					move $s3 $s1
					lw $s0 0($s3)
					lw $s2 36($s0)
					li $v1 8
					move $s0 $v1
					move $a0 $s3
					move $a1 $s0
					jalr $s2
					move $s0 $v0
					move $s0 $s0
					move $s2 $s1
					lw $s0 0($s2)
					lw $s0 40($s0)
					move $a0 $s2
					jalr $s0
					move $s0 $v0
					move $s0 $s0
					move $s3 $s1
					lw $s0 0($s3)
					lw $s2 36($s0)
					li $v1 24
					move $s0 $v1
					move $a0 $s3
					move $a1 $s0
					jalr $s2
					move $s0 $v0
					move $s0 $s0
					move $s3 $s1
					lw $s0 0($s3)
					lw $s2 36($s0)
					li $v1 4
					move $s0 $v1
					move $a0 $s3
					move $a1 $s0
					jalr $s2
					move $s0 $v0
					move $s0 $s0
					move $s3 $s1
					lw $s0 0($s3)
					lw $s2 36($s0)
					li $v1 12
					move $s0 $v1
					move $a0 $s3
					move $a1 $s0
					jalr $s2
					move $s0 $v0
					move $s0 $s0
					move $s3 $s1
					lw $s0 0($s3)
					lw $s2 36($s0)
					li $v1 20
					move $s0 $v1
					move $a0 $s3
					move $a1 $s0
					jalr $s2
					move $s0 $v0
					move $s0 $s0
					move $s3 $s1
					lw $s0 0($s3)
					lw $s2 36($s0)
					li $v1 28
					move $s0 $v1
					move $a0 $s3
					move $a1 $s0
					jalr $s2
					move $s0 $v0
					move $s0 $s0
					move $s3 $s1
					lw $s0 0($s3)
					lw $s2 36($s0)
					li $v1 14
					move $s0 $v1
					move $a0 $s3
					move $a1 $s0
					jalr $s2
					move $s0 $v0
					move $s0 $s0
					move $s2 $s1
					lw $s0 0($s2)
					lw $s0 40($s0)
					move $a0 $s2
					jalr $s0
					move $s0 $v0
					move $s0 $s0
					move $s3 $s1
					lw $s0 0($s3)
					lw $s2 60($s0)
					li $v1 24
					move $s0 $v1
					move $a0 $s3
					move $a1 $s0
					jalr $s2
					move $s0 $v0
					move $a0 $s0
					jal _print
					move $s3 $s1
					lw $s0 0($s3)
					lw $s2 60($s0)
					li $v1 12
					move $s0 $v1
					move $a0 $s3
					move $a1 $s0
					jalr $s2
					move $s0 $v0
					move $a0 $s0
					jal _print
					move $s3 $s1
					lw $s0 0($s3)
					lw $s2 60($s0)
					li $v1 16
					move $s0 $v1
					move $a0 $s3
					move $a1 $s0
					jalr $s2
					move $s0 $v0
					move $a0 $s0
					jal _print
					move $s3 $s1
					lw $s0 0($s3)
					lw $s2 60($s0)
					li $v1 50
					move $s0 $v1
					move $a0 $s3
					move $a1 $s0
					jalr $s2
					move $s0 $v0
					move $a0 $s0
					jal _print
					move $s3 $s1
					lw $s0 0($s3)
					lw $s2 60($s0)
					li $v1 12
					move $s0 $v1
					move $a0 $s3
					move $a1 $s0
					jalr $s2
					move $s0 $v0
					move $a0 $s0
					jal _print
					move $s3 $s1
					lw $s0 0($s3)
					lw $s2 0($s0)
					li $v1 12
					move $s0 $v1
					move $a0 $s3
					move $a1 $s0
					jalr $s2
					move $s0 $v0
					move $s0 $s0
					move $s2 $s1
					lw $s0 0($s2)
					lw $s0 40($s0)
					move $a0 $s2
					jalr $s0
					move $s0 $v0
					move $s0 $s0
					move $s2 $s1
					lw $s0 0($s2)
					lw $s1 60($s0)
					li $v1 12
					move $s0 $v1
					move $a0 $s2
					move $a1 $s0
					jalr $s1
					move $s0 $v0
					move $a0 $s0
					jal _print
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
					.globl Tree_Init
Tree_Init:
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
					sw $s0 24($v1)
					li $v1 0
					move $s0 $v1
					move $v1 $s1
					sw $s0 20($v1)
					li $v1 0
					move $s0 $v1
					move $v1 $s1
					sw $s0 8($v1)
					li $v1 1
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
					.globl Tree_SetRight
Tree_SetRight:
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
					sw $s0 16($v1)
					li $v1 1
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
					.globl Tree_SetLeft
Tree_SetLeft:
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
					sw $s0 4($v1)
					li $v1 1
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
					.globl Tree_GetRight
Tree_GetRight:
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
					lw $s0 16($s0)
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
					.globl Tree_GetLeft
Tree_GetLeft:
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
					.globl Tree_GetKey
Tree_GetKey:
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
					lw $s0 24($s0)
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
					.globl Tree_SetKey
Tree_SetKey:
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
					sw $s0 24($v1)
					li $v1 1
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
					.globl Tree_GetHas_Right
Tree_GetHas_Right:
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
					.globl Tree_GetHas_Left
Tree_GetHas_Left:
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
					lw $s0 20($s0)
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
					.globl Tree_SetHas_Left
Tree_SetHas_Left:
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
					sw $s0 20($v1)
					li $v1 1
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
					.globl Tree_SetHas_Right
Tree_SetHas_Right:
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
					li $v1 1
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
					.globl Tree_Compare
Tree_Compare:
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
					li $v1 0
					move $s0 $v1
					move $s0 $s0
					li $v1 1
					move $s0 $v1
					move $v1 $s1
					move $a0 $s0
					add $t8 $v1 $a0
					move $s0 $t8
					move $s0 $s0
					move $v1 $s2
					move $a0 $s1
					slt $t8 $v1 $a0
					move $s1 $t8
					beqz $s1 label_1
					li $v1 0
					move $s0 $v1
					move $s0 $s0
					j label_2
					la $v0 label_1
label_1:
					li $v1 1
					move $s1 $v1
					move $v1 $s2
					move $a0 $s0
					slt $t8 $v1 $a0
					move $s0 $t8
					move $v1 $s1
					move $a0 $s0
					sub $t8 $v1 $a0
					move $s0 $t8
					beqz $s0 label_3
					li $v1 0
					move $s0 $v1
					move $s0 $s0
					j label_4
					la $v0 label_3
label_3:
					li $v1 1
					move $s0 $v1
					move $s0 $s0
					la $v0 label_4
label_4:
					nop
					la $v0 label_2
label_2:
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
					.globl Tree_Insert
Tree_Insert:
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
					move $s1 $a1
					li $v1 80
					move $s0 $v1
					move $a0 $s0
					jal _halloc
					move $t8 $v0
					move $s0 $t8
					move $s2 $s0
					la $v0 Tree_Delete
					la $s0 Tree_Delete
					move $v1 $s2
					sw $s0 0($v1)
					la $v0 Tree_SetHas_Left
					la $s0 Tree_SetHas_Left
					move $v1 $s2
					sw $s0 4($v1)
					la $v0 Tree_RemoveLeft
					la $s0 Tree_RemoveLeft
					move $v1 $s2
					sw $s0 8($v1)
					la $v0 Tree_GetKey
					la $s0 Tree_GetKey
					move $v1 $s2
					sw $s0 12($v1)
					la $v0 Tree_SetRight
					la $s0 Tree_SetRight
					move $v1 $s2
					sw $s0 16($v1)
					la $v0 Tree_GetLeft
					la $s0 Tree_GetLeft
					move $v1 $s2
					sw $s0 20($v1)
					la $v0 Tree_GetRight
					la $s0 Tree_GetRight
					move $v1 $s2
					sw $s0 24($v1)
					la $v0 Tree_Remove
					la $s0 Tree_Remove
					move $v1 $s2
					sw $s0 28($v1)
					la $v0 Tree_SetLeft
					la $s0 Tree_SetLeft
					move $v1 $s2
					sw $s0 32($v1)
					la $v0 Tree_Insert
					la $s0 Tree_Insert
					move $v1 $s2
					sw $s0 36($v1)
					la $v0 Tree_Print
					la $s0 Tree_Print
					move $v1 $s2
					sw $s0 40($v1)
					la $v0 Tree_Init
					la $s0 Tree_Init
					move $v1 $s2
					sw $s0 44($v1)
					la $v0 Tree_GetHas_Right
					la $s0 Tree_GetHas_Right
					move $v1 $s2
					sw $s0 48($v1)
					la $v0 Tree_GetHas_Left
					la $s0 Tree_GetHas_Left
					move $v1 $s2
					sw $s0 52($v1)
					la $v0 Tree_RemoveRight
					la $s0 Tree_RemoveRight
					move $v1 $s2
					sw $s0 56($v1)
					la $v0 Tree_Search
					la $s0 Tree_Search
					move $v1 $s2
					sw $s0 60($v1)
					la $v0 Tree_SetKey
					la $s0 Tree_SetKey
					move $v1 $s2
					sw $s0 64($v1)
					la $v0 Tree_Compare
					la $s0 Tree_Compare
					move $v1 $s2
					sw $s0 68($v1)
					la $v0 Tree_SetHas_Right
					la $s0 Tree_SetHas_Right
					move $v1 $s2
					sw $s0 72($v1)
					la $v0 Tree_RecPrint
					la $s0 Tree_RecPrint
					move $v1 $s2
					sw $s0 76($v1)
					li $v1 28
					move $s0 $v1
					move $a0 $s0
					jal _halloc
					move $t8 $v0
					move $s0 $t8
					move $s4 $s0
					li $v1 0
					move $s0 $v1
					move $v1 $s4
					sw $s0 4($v1)
					li $v1 0
					move $s0 $v1
					move $v1 $s4
					sw $s0 8($v1)
					li $v1 0
					move $s0 $v1
					move $v1 $s4
					sw $s0 12($v1)
					li $v1 0
					move $s0 $v1
					move $v1 $s4
					sw $s0 16($v1)
					li $v1 0
					move $s0 $v1
					move $v1 $s4
					sw $s0 20($v1)
					li $v1 0
					move $s0 $v1
					move $v1 $s4
					sw $s0 24($v1)
					move $v1 $s4
					sw $s2 0($v1)
					move $s2 $s4
					move $s4 $s2
					lw $s0 0($s4)
					lw $s0 44($s0)
					move $a0 $s4
					move $a1 $s1
					jalr $s0
					move $s0 $v0
					move $s0 $s0
					move $s4 $s3
					li $v1 1
					move $s0 $v1
					move $s3 $s0
					la $v0 label_5
label_5:
					beqz $s3 label_6
					move $s5 $s4
					lw $s0 0($s5)
					lw $s0 12($s0)
					move $a0 $s5
					jalr $s0
					move $s0 $v0
					move $s0 $s0
					move $v1 $s1
					move $a0 $s0
					slt $t8 $v1 $a0
					move $s0 $t8
					beqz $s0 label_7
					move $s5 $s4
					lw $s0 0($s5)
					lw $s0 52($s0)
					move $a0 $s5
					jalr $s0
					move $s0 $v0
					beqz $s0 label_8
					move $s4 $s4
					lw $s0 0($s4)
					lw $s0 20($s0)
					move $a0 $s4
					jalr $s0
					move $s0 $v0
					move $s4 $s0
					j label_9
					la $v0 label_8
label_8:
					li $v1 0
					move $s0 $v1
					move $s3 $s0
					move $s6 $s4
					lw $s0 0($s6)
					lw $s5 4($s0)
					li $v1 1
					move $s0 $v1
					move $a0 $s6
					move $a1 $s0
					jalr $s5
					move $s0 $v0
					move $s0 $s0
					move $s5 $s4
					lw $s0 0($s5)
					lw $s0 32($s0)
					move $a0 $s5
					move $a1 $s2
					jalr $s0
					move $s0 $v0
					move $s0 $s0
					la $v0 label_9
label_9:
					nop
					j label_10
					la $v0 label_7
label_7:
					move $s5 $s4
					lw $s0 0($s5)
					lw $s0 48($s0)
					move $a0 $s5
					jalr $s0
					move $s0 $v0
					beqz $s0 label_11
					move $s4 $s4
					lw $s0 0($s4)
					lw $s0 24($s0)
					move $a0 $s4
					jalr $s0
					move $s0 $v0
					move $s4 $s0
					j label_12
					la $v0 label_11
label_11:
					li $v1 0
					move $s0 $v1
					move $s3 $s0
					move $s6 $s4
					lw $s0 0($s6)
					lw $s5 72($s0)
					li $v1 1
					move $s0 $v1
					move $a0 $s6
					move $a1 $s0
					jalr $s5
					move $s0 $v0
					move $s0 $s0
					move $s5 $s4
					lw $s0 0($s5)
					lw $s0 16($s0)
					move $a0 $s5
					move $a1 $s2
					jalr $s0
					move $s0 $v0
					move $s0 $s0
					la $v0 label_12
label_12:
					nop
					la $v0 label_10
label_10:
					nop
					j label_5
					la $v0 label_6
label_6:
					nop
					li $v1 1
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
					.globl Tree_Delete
Tree_Delete:
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
					move $s4 $s3
					move $s1 $s3
					li $v1 1
					move $s0 $v1
					move $s6 $s0
					li $v1 0
					move $s0 $v1
					move $s5 $s0
					li $v1 1
					move $s0 $v1
					move $t0 $s0
					la $v0 label_13
label_13:
					beqz $s6 label_14
					move $s7 $s4
					lw $s0 0($s7)
					lw $s0 12($s0)
					move $a0 $s7
					jalr $s0
					move $s0 $v0
					move $s7 $s0
					move $v1 $s2
					move $a0 $s7
					slt $t8 $v1 $a0
					move $s0 $t8
					beqz $s0 label_15
					move $s7 $s4
					lw $s0 0($s7)
					lw $s0 52($s0)
					move $a0 $s7
					jalr $s0
					move $s0 $v0
					beqz $s0 label_16
					move $s1 $s4
					move $s4 $s4
					lw $s0 0($s4)
					lw $s0 20($s0)
					move $a0 $s4
					jalr $s0
					move $s0 $v0
					move $s4 $s0
					j label_17
					la $v0 label_16
label_16:
					li $v1 0
					move $s0 $v1
					move $s6 $s0
					la $v0 label_17
label_17:
					nop
					j label_18
					la $v0 label_15
label_15:
					move $v1 $s7
					move $a0 $s2
					slt $t8 $v1 $a0
					move $s0 $t8
					beqz $s0 label_19
					move $s7 $s4
					lw $s0 0($s7)
					lw $s0 48($s0)
					move $a0 $s7
					jalr $s0
					move $s0 $v0
					beqz $s0 label_20
					move $s1 $s4
					move $s4 $s4
					lw $s0 0($s4)
					lw $s0 24($s0)
					move $a0 $s4
					jalr $s0
					move $s0 $v0
					move $s4 $s0
					j label_21
					la $v0 label_20
label_20:
					li $v1 0
					move $s0 $v1
					move $s6 $s0
					la $v0 label_21
label_21:
					nop
					j label_22
					la $v0 label_19
label_19:
					beqz $t0 label_23
					li $v1 1
					move $s6 $v1
					move $s5 $s4
					lw $s0 0($s5)
					lw $s0 48($s0)
					move $a0 $s5
					jalr $s0
					move $s0 $v0
					move $v1 $s6
					move $a0 $s0
					sub $t8 $v1 $a0
					move $s0 $t8
					move $s0 $s0
					beqz $s0 label_24
					li $v1 1
					move $s6 $v1
					move $s5 $s4
					lw $s0 0($s5)
					lw $s0 52($s0)
					move $a0 $s5
					jalr $s0
					move $s0 $v0
					move $v1 $s6
					move $a0 $s0
					sub $t8 $v1 $a0
					move $s0 $t8
					move $s0 $s0
					beqz $s0 label_24
					li $v1 1
					move $s0 $v1
					move $s0 $s0
					j label_25
					la $v0 label_24
label_24:
					li $v1 0
					move $s0 $v1
					move $s0 $s0
					la $v0 label_25
label_25:
					nop
					beqz $s0 label_26
					li $v1 1
					move $s0 $v1
					move $s0 $s0
					j label_27
					la $v0 label_26
label_26:
					move $s5 $s3
					lw $s0 0($s5)
					lw $s0 28($s0)
					move $a0 $s5
					move $a1 $s1
					move $a2 $s4
					jalr $s0
					move $s0 $v0
					move $s0 $s0
					la $v0 label_27
label_27:
					nop
					j label_28
					la $v0 label_23
label_23:
					move $s5 $s3
					lw $s0 0($s5)
					lw $s0 28($s0)
					move $a0 $s5
					move $a1 $s1
					move $a2 $s4
					jalr $s0
					move $s0 $v0
					move $s0 $s0
					la $v0 label_28
label_28:
					nop
					li $v1 1
					move $s0 $v1
					move $s5 $s0
					li $v1 0
					move $s0 $v1
					move $s6 $s0
					la $v0 label_22
label_22:
					nop
					la $v0 label_18
label_18:
					nop
					li $v1 0
					move $s0 $v1
					move $t0 $s0
					j label_13
					la $v0 label_14
label_14:
					nop
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
					.globl Tree_Remove
Tree_Remove:
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
					move $s4 $a2
					move $s3 $s4
					lw $s0 0($s3)
					lw $s0 52($s0)
					move $a0 $s3
					jalr $s0
					move $s0 $v0
					beqz $s0 label_29
					move $s2 $s2
					lw $s0 0($s2)
					lw $s0 8($s0)
					move $a0 $s2
					move $a1 $s1
					move $a2 $s4
					jalr $s0
					move $s0 $v0
					move $s0 $s0
					j label_30
					la $v0 label_29
label_29:
					move $s3 $s4
					lw $s0 0($s3)
					lw $s0 48($s0)
					move $a0 $s3
					jalr $s0
					move $s0 $v0
					beqz $s0 label_31
					move $s2 $s2
					lw $s0 0($s2)
					lw $s0 56($s0)
					move $a0 $s2
					move $a1 $s1
					move $a2 $s4
					jalr $s0
					move $s0 $v0
					move $s0 $s0
					j label_32
					la $v0 label_31
label_31:
					move $s3 $s4
					lw $s0 0($s3)
					lw $s0 12($s0)
					move $a0 $s3
					jalr $s0
					move $s0 $v0
					move $s5 $s0
					move $s3 $s1
					lw $s0 0($s3)
					lw $s0 20($s0)
					move $a0 $s3
					jalr $s0
					move $s0 $v0
					move $s3 $s0
					lw $s0 0($s3)
					lw $s0 12($s0)
					move $a0 $s3
					jalr $s0
					move $s0 $v0
					move $s4 $s0
					move $s3 $s2
					lw $s0 0($s3)
					lw $s0 68($s0)
					move $a0 $s3
					move $a1 $s5
					move $a2 $s4
					jalr $s0
					move $s0 $v0
					beqz $s0 label_33
					move $s4 $s1
					lw $s0 0($s4)
					lw $s3 32($s0)
					lw $s0 12($s2)
					move $a0 $s4
					move $a1 $s0
					jalr $s3
					move $s0 $v0
					move $s0 $s0
					move $s2 $s1
					lw $s0 0($s2)
					lw $s1 4($s0)
					li $v1 0
					move $s0 $v1
					move $a0 $s2
					move $a1 $s0
					jalr $s1
					move $s0 $v0
					move $s0 $s0
					j label_34
					la $v0 label_33
label_33:
					move $s4 $s1
					lw $s0 0($s4)
					lw $s3 16($s0)
					lw $s0 12($s2)
					move $a0 $s4
					move $a1 $s0
					jalr $s3
					move $s0 $v0
					move $s0 $s0
					move $s2 $s1
					lw $s0 0($s2)
					lw $s1 72($s0)
					li $v1 0
					move $s0 $v1
					move $a0 $s2
					move $a1 $s0
					jalr $s1
					move $s0 $v0
					move $s0 $s0
					la $v0 label_34
label_34:
					nop
					la $v0 label_32
label_32:
					nop
					la $v0 label_30
label_30:
					nop
					li $v1 1
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
					.globl Tree_RemoveRight
Tree_RemoveRight:
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
					move $s4 $a1
					move $s3 $a2
					la $v0 label_35
label_35:
					move $s2 $s3
					lw $s0 0($s2)
					lw $s0 48($s0)
					move $a0 $s2
					jalr $s0
					move $s0 $v0
					beqz $s0 label_36
					move $s5 $s3
					lw $s0 0($s5)
					lw $s4 64($s0)
					move $s2 $s3
					lw $s0 0($s2)
					lw $s0 24($s0)
					move $a0 $s2
					jalr $s0
					move $s0 $v0
					move $s2 $s0
					lw $s0 0($s2)
					lw $s0 12($s0)
					move $a0 $s2
					jalr $s0
					move $s0 $v0
					move $a0 $s5
					move $a1 $s0
					jalr $s4
					move $s0 $v0
					move $s0 $s0
					move $s4 $s3
					move $s2 $s3
					lw $s0 0($s2)
					lw $s0 24($s0)
					move $a0 $s2
					jalr $s0
					move $s0 $v0
					move $s3 $s0
					j label_35
					la $v0 label_36
label_36:
					nop
					move $s3 $s4
					lw $s0 0($s3)
					lw $s2 16($s0)
					lw $s0 12($s1)
					move $a0 $s3
					move $a1 $s0
					jalr $s2
					move $s0 $v0
					move $s0 $s0
					move $s2 $s4
					lw $s0 0($s2)
					lw $s0 72($s0)
					li $v1 0
					move $s1 $v1
					move $a0 $s2
					move $a1 $s1
					jalr $s0
					move $s0 $v0
					move $s0 $s0
					li $v1 1
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
					.globl Tree_RemoveLeft
Tree_RemoveLeft:
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
					move $s4 $a1
					move $s3 $a2
					la $v0 label_37
label_37:
					move $s2 $s3
					lw $s0 0($s2)
					lw $s0 52($s0)
					move $a0 $s2
					jalr $s0
					move $s0 $v0
					beqz $s0 label_38
					move $s5 $s3
					lw $s0 0($s5)
					lw $s4 64($s0)
					move $s2 $s3
					lw $s0 0($s2)
					lw $s0 20($s0)
					move $a0 $s2
					jalr $s0
					move $s0 $v0
					move $s2 $s0
					lw $s0 0($s2)
					lw $s0 12($s0)
					move $a0 $s2
					jalr $s0
					move $s0 $v0
					move $a0 $s5
					move $a1 $s0
					jalr $s4
					move $s0 $v0
					move $s0 $s0
					move $s4 $s3
					move $s2 $s3
					lw $s0 0($s2)
					lw $s0 20($s0)
					move $a0 $s2
					jalr $s0
					move $s0 $v0
					move $s3 $s0
					j label_37
					la $v0 label_38
label_38:
					nop
					move $s3 $s4
					lw $s0 0($s3)
					lw $s2 32($s0)
					lw $s0 12($s1)
					move $a0 $s3
					move $a1 $s0
					jalr $s2
					move $s0 $v0
					move $s0 $s0
					move $s2 $s4
					lw $s0 0($s2)
					lw $s1 4($s0)
					li $v1 0
					move $s0 $v1
					move $a0 $s2
					move $a1 $s0
					jalr $s1
					move $s0 $v0
					move $s0 $s0
					li $v1 1
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
					.globl Tree_Search
Tree_Search:
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
					move $s4 $s0
					li $v1 1
					move $s0 $v1
					move $s3 $s0
					li $v1 0
					move $s0 $v1
					move $s2 $s0
					la $v0 label_39
label_39:
					beqz $s3 label_40
					move $s5 $s4
					lw $s0 0($s5)
					lw $s0 12($s0)
					move $a0 $s5
					jalr $s0
					move $s0 $v0
					move $s5 $s0
					move $v1 $s1
					move $a0 $s5
					slt $t8 $v1 $a0
					move $s0 $t8
					beqz $s0 label_41
					move $s5 $s4
					lw $s0 0($s5)
					lw $s0 52($s0)
					move $a0 $s5
					jalr $s0
					move $s0 $v0
					beqz $s0 label_42
					move $s4 $s4
					lw $s0 0($s4)
					lw $s0 20($s0)
					move $a0 $s4
					jalr $s0
					move $s0 $v0
					move $s4 $s0
					j label_43
					la $v0 label_42
label_42:
					li $v1 0
					move $s0 $v1
					move $s3 $s0
					la $v0 label_43
label_43:
					nop
					j label_44
					la $v0 label_41
label_41:
					move $v1 $s5
					move $a0 $s1
					slt $t8 $v1 $a0
					move $s0 $t8
					beqz $s0 label_45
					move $s5 $s4
					lw $s0 0($s5)
					lw $s0 48($s0)
					move $a0 $s5
					jalr $s0
					move $s0 $v0
					beqz $s0 label_46
					move $s4 $s4
					lw $s0 0($s4)
					lw $s0 24($s0)
					move $a0 $s4
					jalr $s0
					move $s0 $v0
					move $s4 $s0
					j label_47
					la $v0 label_46
label_46:
					li $v1 0
					move $s0 $v1
					move $s3 $s0
					la $v0 label_47
label_47:
					nop
					j label_48
					la $v0 label_45
label_45:
					li $v1 1
					move $s0 $v1
					move $s2 $s0
					li $v1 0
					move $s0 $v1
					move $s3 $s0
					la $v0 label_48
label_48:
					nop
					la $v0 label_44
label_44:
					nop
					j label_39
					la $v0 label_40
label_40:
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
					.globl Tree_Print
Tree_Print:
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
					move $s2 $s0
					move $s1 $s0
					lw $s0 0($s1)
					lw $s0 76($s0)
					move $a0 $s1
					move $a1 $s2
					jalr $s0
					move $s0 $v0
					move $s0 $s0
					li $v1 1
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
					.globl Tree_RecPrint
Tree_RecPrint:
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
					move $s3 $s1
					lw $s0 0($s3)
					lw $s0 52($s0)
					move $a0 $s3
					jalr $s0
					move $s0 $v0
					beqz $s0 label_49
					move $s5 $s2
					lw $s0 0($s5)
					lw $s4 76($s0)
					move $s3 $s1
					lw $s0 0($s3)
					lw $s0 20($s0)
					move $a0 $s3
					jalr $s0
					move $s0 $v0
					move $a0 $s5
					move $a1 $s0
					jalr $s4
					move $s0 $v0
					move $s0 $s0
					j label_50
					la $v0 label_49
label_49:
					li $v1 1
					move $s0 $v1
					move $s0 $s0
					la $v0 label_50
label_50:
					nop
					move $s3 $s1
					lw $s0 0($s3)
					lw $s0 12($s0)
					move $a0 $s3
					jalr $s0
					move $s0 $v0
					move $a0 $s0
					jal _print
					move $s3 $s1
					lw $s0 0($s3)
					lw $s0 48($s0)
					move $a0 $s3
					jalr $s0
					move $s0 $v0
					beqz $s0 label_51
					move $s3 $s2
					lw $s0 0($s3)
					lw $s2 76($s0)
					move $s1 $s1
					lw $s0 0($s1)
					lw $s0 24($s0)
					move $a0 $s1
					jalr $s0
					move $s0 $v0
					move $a0 $s3
					move $a1 $s0
					jalr $s2
					move $s0 $v0
					move $s0 $s0
					j label_52
					la $v0 label_51
label_51:
					li $v1 1
					move $s0 $v1
					move $s0 $s0
					la $v0 label_52
label_52:
					nop
					li $v1 1
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


