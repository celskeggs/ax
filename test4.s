.text
.LC1:
	.string	"ovg nv ZC blf z jfvhgrlm\n"
.globl _start
_start:
.LFB1:
	subq	$40, %rsp
	movl	$.LC1, %esi
	movl	$26, %ecx
	leaq	6(%rsp), %rdi
	rep movsb
	leaq	6(%rsp), %rdi
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
	leaq	6(%rsp), %rsi
	mov $0x1, %rax
	mov $26, %edx
	mov $0x1, %rdi
	syscall
	mov $60, %rax
	xor %rdi, %rdi
	syscall
