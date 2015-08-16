	.file	"test.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.globl	rot13
	.type	rot13, @function
rot13:
.LFB0:
	.cfi_startproc
	movb	$-101, %dl
	movb	$-37, %cl
.L2:
	movb	(%rdi), %al
	testb	%al, %al
	je	.L8
	leal	-97(%rax), %esi
	cmpb	$25, %sil
	ja	.L3
	movb	%cl, %sil
	jmp	.L6
.L3:
	leal	-65(%rax), %esi
	cmpb	$25, %sil
	ja	.L4
	movb	%dl, %sil
.L6:
	subl	%eax, %esi
	movb	%sil, (%rdi)
.L4:
	incq	%rdi
	jmp	.L2
.L8:
	ret
	.cfi_endproc
.LFE0:
	.size	rot13, .-rot13
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"ovg nv ZC blf z jfvhgrlm\n"
	.section	.text.unlikely
.LCOLDB2:
	.section	.text.startup,"ax",@progbits
.LHOTB2:
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movl	$.LC1, %esi
	movl	$26, %ecx
	leaq	6(%rsp), %rdi
	rep movsb
	leaq	6(%rsp), %rdi
	call	rot13
	leaq	6(%rsp), %rdi
	movl	$26, %esi
	call	asm_write
	movl	$3, %eax
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE2:
	.section	.text.startup
.LHOTE2:
	.ident	"GCC: (GNU) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
