	.file	"clang.c"
	.text
	.section	.rodata
	.align 4
.LC0:
	.string	"Enter the vales of rows and column(< %d)\n"
.LC1:
	.string	"%d%d"
.LC2:
	.string	"Mempey Allocation FAILED"
.LC3:
	.string	"Enter[%d][%d]value\t"
.LC4:
	.string	"%d"
.LC5:
	.string	"Entered value are"
.LC6:
	.string	"iArr[%d][%d]= %d\t"
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
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x74,0x6
	.cfi_escape 0x10,0x6,0x2,0x75,0x7c
	.cfi_escape 0x10,0x3,0x2,0x75,0x78
	subl	$44, %esp
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	movl	%gs:20, %eax
	movl	%eax, -28(%ebp)
	xorl	%eax, %eax
	movl	$0, -32(%ebp)
	subl	$8, %esp
	pushl	$50
	leal	.LC0@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	subl	$4, %esp
	leal	-44(%ebp), %eax
	pushl	%eax
	leal	-48(%ebp), %eax
	pushl	%eax
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	%eax
	call	__isoc99_scanf@PLT
	addl	$16, %esp
	movl	-48(%ebp), %eax
	sall	$2, %eax
	subl	$12, %esp
	pushl	%eax
	call	malloc@PLT
	addl	$16, %esp
	movl	%eax, -32(%ebp)
	cmpl	$0, -32(%ebp)
	jne	.L2
	subl	$12, %esp
	leal	.LC2@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	subl	$12, %esp
	pushl	$-1
	call	exit@PLT
.L2:
	movl	$0, -40(%ebp)
	jmp	.L3
.L5:
	movl	-44(%ebp), %eax
	sall	$2, %eax
	movl	-40(%ebp), %edx
	leal	0(,%edx,4), %ecx
	movl	-32(%ebp), %edx
	leal	(%ecx,%edx), %esi
	subl	$12, %esp
	pushl	%eax
	call	malloc@PLT
	addl	$16, %esp
	movl	%eax, (%esi)
	movl	-40(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	.L4
	subl	$12, %esp
	leal	.LC2@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	subl	$12, %esp
	pushl	$-1
	call	exit@PLT
.L4:
	addl	$1, -40(%ebp)
.L3:
	movl	-48(%ebp), %eax
	cmpl	%eax, -40(%ebp)
	jl	.L5
	movl	$0, -40(%ebp)
	jmp	.L6
.L9:
	movl	$0, -36(%ebp)
	jmp	.L7
.L8:
	subl	$4, %esp
	pushl	-36(%ebp)
	pushl	-40(%ebp)
	leal	.LC3@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	movl	-40(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	-36(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	subl	$8, %esp
	pushl	%eax
	leal	.LC4@GOTOFF(%ebx), %eax
	pushl	%eax
	call	__isoc99_scanf@PLT
	addl	$16, %esp
	addl	$1, -36(%ebp)
.L7:
	movl	-44(%ebp), %eax
	cmpl	%eax, -36(%ebp)
	jl	.L8
	addl	$1, -40(%ebp)
.L6:
	movl	-48(%ebp), %eax
	cmpl	%eax, -40(%ebp)
	jl	.L9
	subl	$12, %esp
	leal	.LC5@GOTOFF(%ebx), %eax
	pushl	%eax
	call	puts@PLT
	addl	$16, %esp
	movl	$0, -40(%ebp)
	jmp	.L10
.L13:
	movl	$0, -36(%ebp)
	jmp	.L11
.L12:
	movl	-40(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	-36(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	pushl	%eax
	pushl	-36(%ebp)
	pushl	-40(%ebp)
	leal	.LC6@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	addl	$1, -36(%ebp)
.L11:
	movl	-44(%ebp), %eax
	cmpl	%eax, -36(%ebp)
	jl	.L12
	addl	$1, -40(%ebp)
.L10:
	movl	-48(%ebp), %eax
	cmpl	%eax, -40(%ebp)
	jl	.L13
	movl	$0, -40(%ebp)
	jmp	.L14
.L15:
	movl	-40(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	free@PLT
	addl	$16, %esp
	movl	-40(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	movl	$0, (%eax)
	addl	$1, -40(%ebp)
.L14:
	movl	-48(%ebp), %eax
	cmpl	%eax, -40(%ebp)
	jl	.L15
	subl	$12, %esp
	pushl	-32(%ebp)
	call	free@PLT
	addl	$16, %esp
	movl	$0, -32(%ebp)
	subl	$12, %esp
	pushl	$0
	call	exit@PLT
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB6:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE6:
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
