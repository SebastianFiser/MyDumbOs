global _start
extern kernel_main

section .bss
    align 16
stack_bottom:
    resb 8192      ; 8 KB stack
stack_top:

section .text
_start:
    mov rsp, stack_top  ; nastavíme stack pointer na vrchol stacku
    call kernel_main    ; zavoláme kernel_main

hang:
    hlt
    jmp hang
