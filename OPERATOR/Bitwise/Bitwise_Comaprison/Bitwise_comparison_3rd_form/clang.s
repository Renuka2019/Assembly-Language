	.file	"clang.c"
	.text
	.section	.rodata
.LC0:
	.string	"Enter value of iNo1 and iNo2"
.LC1:
	.string	"%d%d"
.LC2:
	.string	"%d is less than %d \n"
.LC3:
	.string	"%d is less than equal to %d \n"
.LC4:
	.string	"%d is not equal to %d \n"
	.align 4
.LC5:
	.string	"%d is not greater than equal to %d \n"
.LC6:
	.string	"%d is not greater than %d \n"
.LC7:
	.string	"%d is not less than %d \n"
	.align 4
.LC8:
	.string	"%d is not less than equal to %d \n"
	.align 4
.LC9:
	.string	"%d is greater than equal to %d \n"
.LC10:
	.string	"%d is greater than %d \n"
	.align 4
.LC11:
	.string	"%d is less than equal to  %d \n"
.LC12:
	.string	"%d is equal to %d \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB5:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x78,0x6
	.cfi_escape 0x10,0x3,0x2,0x75,0x7c
	subl	$16, %esp
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	movl	%gs:20, %eax
	movl	%eax, -12(%ebp)
	xorl	%eax, %eax
	subl	$12, %esp
	leal	.LC0@GOTOFF(%ebx), %eax
	pushl	%eax
	call	puts@PLT
	addl	$16, %esp
	subl	$4, %esp
	leal	-16(%ebp), %eax
	pushl	%eax
	leal	-20(%ebp), %eax
	pushl	%eax
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	%eax
	call	__isoc99_scanf@PLT
	addl	$16, %esp
	movl	-16(%ebp), %edx
	movl	-20(%ebp), %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	Comparison
	addl	$16, %esp
	movb	%al, -21(%ebp)
	andb	$31, -21(%ebp)
	cmpb	$3, -21(%ebp)
	jne	.L2
	movl	-16(%ebp), %edx
	movl	-20(%ebp), %eax
	subl	$4, %esp
	pushl	%edx
	pushl	%eax
	leal	.LC2@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	movl	-16(%ebp), %edx
	movl	-20(%ebp), %eax
	subl	$4, %esp
	pushl	%edx
	pushl	%eax
	leal	.LC3@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	movl	-16(%ebp), %edx
	movl	-20(%ebp), %eax
	subl	$4, %esp
	pushl	%edx
	pushl	%eax
	leal	.LC4@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	movl	-16(%ebp), %edx
	movl	-20(%ebp), %eax
	subl	$4, %esp
	pushl	%edx
	pushl	%eax
	leal	.LC5@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	movl	-16(%ebp), %edx
	movl	-20(%ebp), %eax
	subl	$4, %esp
	pushl	%edx
	pushl	%eax
	leal	.LC6@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	jmp	.L3
.L2:
	cmpb	$22, -21(%ebp)
	jne	.L4
	movl	-16(%ebp), %edx
	movl	-20(%ebp), %eax
	subl	$4, %esp
	pushl	%edx
	pushl	%eax
	leal	.LC7@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	movl	-16(%ebp), %edx
	movl	-20(%ebp), %eax
	subl	$4, %esp
	pushl	%edx
	pushl	%eax
	leal	.LC8@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	movl	-16(%ebp), %edx
	movl	-20(%ebp), %eax
	subl	$4, %esp
	pushl	%edx
	pushl	%eax
	leal	.LC4@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	movl	-16(%ebp), %edx
	movl	-20(%ebp), %eax
	subl	$4, %esp
	pushl	%edx
	pushl	%eax
	leal	.LC9@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	movl	-16(%ebp), %edx
	movl	-20(%ebp), %eax
	subl	$4, %esp
	pushl	%edx
	pushl	%eax
	leal	.LC10@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	jmp	.L3
.L4:
	cmpb	$14, -21(%ebp)
	jne	.L3
	movl	-16(%ebp), %edx
	movl	-20(%ebp), %eax
	subl	$4, %esp
	pushl	%edx
	pushl	%eax
	leal	.LC7@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	movl	-16(%ebp), %edx
	movl	-20(%ebp), %eax
	subl	$4, %esp
	pushl	%edx
	pushl	%eax
	leal	.LC11@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	movl	-16(%ebp), %edx
	movl	-20(%ebp), %eax
	subl	$4, %esp
	pushl	%edx
	pushl	%eax
	leal	.LC12@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	movl	-16(%ebp), %edx
	movl	-20(%ebp), %eax
	subl	$4, %esp
	pushl	%edx
	pushl	%eax
	leal	.LC9@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	movl	-16(%ebp), %edx
	movl	-20(%ebp), %eax
	subl	$4, %esp
	pushl	%edx
	pushl	%eax
	leal	.LC6@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
.L3:
	subl	$12, %esp
	pushl	$0
	call	exit@PLT
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.globl	Comparison
	.type	Comparison, @function
Comparison:
.LFB6:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	movb	$0, -1(%ebp)
	movl	8(%ebp), %eax
	cmpl	12(%ebp), %eax
	jne	.L7
	orb	$14, -1(%ebp)
	jmp	.L8
.L7:
	movl	8(%ebp), %eax
	cmpl	12(%ebp), %eax
	jge	.L9
	orb	$3, -1(%ebp)
	jmp	.L8
.L9:
	movl	8(%ebp), %eax
	cmpl	12(%ebp), %eax
	jle	.L8
	orb	$22, -1(%ebp)
.L8:
	movzbl	-1(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	Comparison, .-Comparison
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
.LFB7:
	.cfi_startproc
	movl	(%esp), %eax
	ret
	.cfi_endproc
.LFE7:
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB8:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE8:
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
