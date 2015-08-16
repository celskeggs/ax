.text
rot13:
.LFB0:
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
.LFE0:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"ovg nv ZC blf z jfvhgrlm\n"
.text
main:
.LFB1:
	subq	$40, %rsp
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
	ret
.text
asm_write:
	push %rbp
	mov %rsp, %rbp
	push %rdi
	push %rsi
	push %rdx
	mov $0x1, %rax
	mov %rsi, %rdx
	mov %rdi, %rsi
	mov $0x1, %rdi
	syscall
	pop %rdx
	pop %rsi
	pop %rdi
	mov %rbp, %rsp
	pop %rbp
	mov $60, %rax
	xor %rdi, %rdi
	syscall
.globl _start
_start:
	call main
