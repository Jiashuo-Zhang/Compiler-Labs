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
				la $v0 Fac_ComputeFac
				la $s0 Fac_ComputeFac
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
				move $s2 $s0
				lw $s0 0($s2)
				lw $s0 0($s0)
				li $v1 10
				move $s1 $v1
				move $a0 $s2
				move $a1 $s1
				jalr $s0
				move $s0 $v0
				move $a0 $s0
				jal _print
				lw $ra -4($fp)
				lw $fp -8($fp)
				addu $sp $sp 8
				li $v0, 10
				syscall
				jr $ra

				.text
				.globl Fac_ComputeFac
Fac_ComputeFac:
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
				li $v1 1
				move $s0 $v1
				move $v1 $s3
				move $a0 $s0
				slt $t8 $v1 $a0
				move $s0 $t8
				beqz $s0 label_1
				li $v1 1
				move $s0 $v1
				move $s0 $s0
				j label_2
				la $v0 label_1
label_1:
				move $s2 $s1
				lw $s0 0($s2)
				lw $s1 0($s0)
				li $v1 1
				move $s0 $v1
				move $v1 $s3
				move $a0 $s0
				sub $t8 $v1 $a0
				move $s0 $t8
				move $a0 $s2
				move $a1 $s0
				jalr $s1
				move $s0 $v0
				move $v1 $s3
				move $a0 $s0
				mul $t8 $v1 $a0
				move $s0 $t8
				move $s0 $s0
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