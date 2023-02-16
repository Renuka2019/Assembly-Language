	.file	"clang.c"
	.text
	.globl	obj1
	.data
	.align 4
	.type	obj1, @object
	.size	obj1, 12
obj1:
	.byte	65
	.zero	3
	.long	10
	.value	20
	.zero	2
	.section	.rodata
.LC0:
	.string	"obj1 is "
	.align 4
.LC1:
	.string	"chChar = %c, iNo = %d,shiNo = %hd\n\n"
.LC2:
	.string	"obj2 is "
.LC3:
	.string	"obj3 is "
.LC4:
	.string	"obj3 & obj2 comparision is "
.LC5:
	.string	"equal"
.LC6:
	.string	"not equal"
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
	subl	$32, %esp
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	movb	$66, -32(%ebp)
	movl	$30, -28(%ebp)
	movw	$40, -24(%ebp)
	movb	$66, -20(%ebp)
	movl	$30, -16(%ebp)
	movw	$40, -12(%ebp)
	subl	$12, %esp
	leal	.LC0@GOTOFF(%ebx), %eax
	pushl	%eax
	call	puts@PLT
	addl	$16, %esp
	movzwl	8+obj1@GOTOFF(%ebx), %eax
	movswl	%ax, %ecx
	movl	4+obj1@GOTOFF(%ebx), %edx
	movzbl	obj1@GOTOFF(%ebx), %eax
	movsbl	%al, %eax
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	subl	$12, %esp
	leal	.LC2@GOTOFF(%ebx), %eax
	pushl	%eax
	call	puts@PLT
	addl	$16, %esp
	movzwl	-24(%ebp), %eax
	movswl	%ax, %ecx
	movl	-28(%ebp), %edx
	movzbl	-32(%ebp), %eax
	movsbl	%al, %eax
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	subl	$12, %esp
	leal	.LC3@GOTOFF(%ebx), %eax
	pushl	%eax
	call	puts@PLT
	addl	$16, %esp
	movzwl	-12(%ebp), %eax
	movswl	%ax, %ecx
	movl	-16(%ebp), %edx
	movzbl	-20(%ebp), %eax
	movsbl	%al, %eax
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	subl	$12, %esp
	leal	.LC4@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	movzbl	-20(%ebp), %edx
	movzbl	-32(%ebp), %eax
	cmpb	%al, %dl
	jne	.L2
	movl	-16(%ebp), %edx
	movl	-28(%ebp), %eax
	cmpl	%eax, %edx
	jne	.L2
	movzwl	-12(%ebp), %edx
	movzwl	-24(%ebp), %eax
	cmpw	%ax, %dx
	jne	.L2
	subl	$12, %esp
	leal	.LC5@GOTOFF(%ebx), %eax
	pushl	%eax
	call	puts@PLT
	addl	$16, %esp
	jmp	.L3
.L2:
	subl	$12, %esp
	leal	.LC6@GOTOFF(%ebx), %eax
	pushl	%eax
	call	puts@PLT
	addl	$16, %esp
.L3:
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
