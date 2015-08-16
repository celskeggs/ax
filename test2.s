.section .text
.globl asm_write
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
.extern main
.globl _start
_start:
	call main
