# NASM.

ORG 0x040000
BITS 64

elf_magic:
	db 0x7F, "ELF"
elf_opts:
	db 2, 1, 1, 0x03
elf_pad:
	dq 0
elf_type:
	dw 2, 0x3E
elf_ver:
	dd 1
elf_ptrs:
	dq _start, elf_phoff-elf_magic, 0
elf_flags:
	dd 0
elf_sizes:
	dw 56, 56
elf_phoff:
	dd 1, 0x5
	dq 0x000000, elf_magic, elf_magic
	dq textend-textsection, textend-textsection, 0

textsection:
str:
	db "gsrh dzh z girfnks.", 10, 0
strend:
_start:
.LFB1:
    sub rsp, 40
    mov esi, str
    mov ecx, strend-str
    lea rdi, [6+rsp]
    rep movsb
    lea rdi, [6+rsp]
    mov dl, -101
    mov cl, -37
.L2:
    mov al, [rdi]
    test al, al
    je .L8
    lea esi, [rax-97]
    cmp sil, 25
    ja .L3
    mov sil, cl
    jmp .L6
.L3:
    lea esi, [rax-65]
    cmp sil, 25
    ja .L4
    mov sil, dl
.L6:
    sub esi, eax
    mov [rdi], sil
.L4:
    inc rdi
    jmp .L2
.L8:
    lea rsi, [6+rsp]
    mov rax, 0x1
    mov edx, 26
    mov rdi, 0x1
    syscall
    mov rax, 60
    xor rdi, rdi
    syscall
textend:
