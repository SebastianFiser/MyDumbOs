.global _start
.extern kernel_main

.section .text
_start:
    ; Nastavení stacku
    mov $stack_top, %rsp        ; %rsp = ukazatel na vrchol vyhrazeného stacku

    ; Zavoláme kernel
    call kernel_main

hang:
    hlt          ; uspí CPU dokud nepřijde přerušení
    jmp hang         ; skočí zpět a čeká donekonečna

.section .bss
.align 16
stack_bottom:
    .space 8192         ; vyhrazení 8 KB pro stack
stack_top:           ; adresa vrcholu stacku
