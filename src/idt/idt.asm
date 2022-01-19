section .asm

extern int21h_handler
extern no_interrupt_handler

global int21h
global idt_load
global no_interrupt
global enable_interrupts
global disable_interrupts

enable_interrupts:
    sti                 ;start interrupts
    ret

disable_interrupts:
    cli                 ;clear interrupts
    ret


idt_load:
    push ebp
    mov ebp, esp

    mov ebx, [ebp+8]  ;loading the address of the IDTR into resgister
    lidt [ebx]        ; Loading the IDTR
    pop ebp    
    ret


int21h:
    cli                 ;clearing interrupts
    pushad
    call int21h_handler
    popad
    sti
    iret

no_interrupt:
    cli
    pushad
    call no_interrupt_handler
    popad
    sti
    iret

    