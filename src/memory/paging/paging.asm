[BITS 32]

section .asm

global paging_load_directory
global enable_paging

paging_load_directory:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8] ;move the page directory table into cr3 register
    mov cr3, eax
    pop ebp
    ret

enable_paging:
    push ebp
    mov ebp, esp
    mov eax, cr0
    or eax, 0x80000000 ;set the 32th bit in the CR0 register, the paging bit
    mov cr0, eax
    pop ebp
    ret

